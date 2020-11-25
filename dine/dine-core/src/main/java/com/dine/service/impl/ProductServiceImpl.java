package com.dine.service.impl;

import com.dine.model.dto.CartDTO;
import com.dine.repository.entity.ProductInfo;
import com.dine.enums.ProductStatusEnum;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.repository.ProductInfoRepository;
import com.dine.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.Predicate;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 *
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductInfoRepository repository;

    @Override
    public Optional<ProductInfo> findOne(String productId) {

        return repository.findById(productId);
    }

    @Override
    public List<ProductInfo> findUpAll() {
        return repository.findByProductStatus(ProductStatusEnum.UP.getCode());
    }

    @Override
    public List<ProductInfo> findUpAllByConditions(String productName, String productPrice, Integer taste, Integer categoryType) {

        return repository.findAll((root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> predicatesList = new ArrayList<>();
            //name模糊查询 ,like语句
            if (!StringUtils.isEmpty(productName)) {
                predicatesList.add(
                        criteriaBuilder.and(
                                criteriaBuilder.like(
                                        root.get("productName"), "%" + productName + "%")));
            }
            // itemPrice 小于等于 <= 语句
            if (!StringUtils.isEmpty(productPrice)) {
                BigDecimal bigDecimal = new BigDecimal(productPrice);
                predicatesList.add(
                        criteriaBuilder.and(
                                criteriaBuilder.le(
                                        root.get("productPrice"), bigDecimal)));
            }
            //itemStock 大于等于 >= 语句
            if (taste != null) {
                predicatesList.add(
                        criteriaBuilder.and(
                                criteriaBuilder.equal(
                                        root.get("taste"), taste)));
            }

            //itemStock 大于等于 >= 语句·
            if (categoryType != null) {
                predicatesList.add(
                        criteriaBuilder.and(
                                criteriaBuilder.equal(
                                        root.get("categoryType"), categoryType)));
            }

            return criteriaBuilder.and(
                    predicatesList.toArray(new Predicate[predicatesList.size()]));

        }, Sort.by(Sort.Direction.ASC, "sales"));
    }

    @Override
    public Page<ProductInfo> findAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public ProductInfo save(ProductInfo productInfo) {
        return repository.save(productInfo);
    }

    @Override
    @Transactional
    public void increaseStock(List<CartDTO> cartDTOList) {
        for (CartDTO cartDTO: cartDTOList) {
            ProductInfo productInfo = new ProductInfo();
            productInfo.setProductId(cartDTO.getProductId());
            Optional<ProductInfo> opt = repository.findOne(Example.of(productInfo));
            if (!opt.isPresent()) {
                throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
            }
            Integer result = productInfo.getProductStock() + cartDTO.getProductQuantity();
            productInfo.setProductStock(result);

            repository.save(productInfo);
        }

    }

    @Override
    @Transactional
    public void decreaseStock(List<CartDTO> cartDTOList) {
        for (CartDTO cartDTO: cartDTOList) {
            Optional<ProductInfo> opt = repository.findById(cartDTO.getProductId());
            if (!opt.isPresent()) {
                throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
            }

            ProductInfo productInfo = opt.get();
            Integer productQuantity = cartDTO.getProductQuantity();
            Integer result = productInfo.getProductStock() - productQuantity;
            if (result < 0) {
                throw new SellException(ResultEnum.PRODUCT_STOCK_ERROR);
            }
            productInfo.setProductStock(result);
            // 增加销量
            productInfo.setSales(productInfo.getSales() + productQuantity);

            repository.save(productInfo);
        }
    }

    @Override
    public ProductInfo onSale(String productId) {
        ProductInfo productInfoExample = new ProductInfo();
        productInfoExample.setProductId(productId);
        Example<ProductInfo> example = Example.of(productInfoExample);
        Optional<ProductInfo> opt = repository.findOne(example);
        if (!opt.isPresent()) {
            throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
        }
        if (opt.get().getProductStatusEnum() == ProductStatusEnum.UP) {
            throw new SellException(ResultEnum.PRODUCT_STATUS_ERROR);
        }
        ProductInfo productInfo = opt.get();
        //更新
        productInfo.setProductStatus(ProductStatusEnum.UP.getCode());
        return repository.save(productInfo);
    }

    @Override
    public ProductInfo offSale(String productId) {
        ProductInfo productInfoExample = new ProductInfo();
        productInfoExample.setProductId(productId);
        Example<ProductInfo> example = Example.of(productInfoExample);
        Optional<ProductInfo> opt = repository.findOne(example);
        if (!opt.isPresent()) {
            throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
        }
        ProductInfo productInfo = opt.get();
        if (productInfo.getProductStatusEnum() == ProductStatusEnum.DOWN) {
            throw new SellException(ResultEnum.PRODUCT_STATUS_ERROR);
        }

        //更新
        productInfo.setProductStatus(ProductStatusEnum.DOWN.getCode());
        return repository.save(productInfo);
    }
}
