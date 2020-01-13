package com.dine.service.impl;

import com.dine.entiry.ProductInfo;
import com.dine.dto.CartDTO;
import com.dine.enums.ProductStatusEnum;
import com.dine.enums.ResultEnum;
import com.dine.exception.SellException;
import com.dine.repository.ProductInfoRepository;
import com.dine.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        ProductInfo productInfo = new ProductInfo();
        productInfo.setProductId(productId);
        Example<ProductInfo> example = Example.of(productInfo);
        return repository.findOne(example);
    }

    @Override
    public List<ProductInfo> findUpAll() {
        return repository.findByProductStatus(ProductStatusEnum.UP.getCode());
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

            ProductInfo productInfo = new ProductInfo();
            productInfo.setProductId(cartDTO.getProductId());
            Optional<ProductInfo> opt = repository.findOne(Example.of(productInfo));
            if (!opt.isPresent()) {
                throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
            }

            Integer result = productInfo.getProductStock() - cartDTO.getProductQuantity();
            if (result < 0) {
                throw new SellException(ResultEnum.PRODUCT_STOCK_ERROR);
            }

            productInfo.setProductStock(result);

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
