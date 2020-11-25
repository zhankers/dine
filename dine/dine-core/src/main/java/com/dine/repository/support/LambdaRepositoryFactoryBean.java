package com.dine.repository.support;

import com.dine.repository.support.impl.SimpleLambdaJpaRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactoryBean;
import org.springframework.data.repository.core.RepositoryMetadata;
import org.springframework.data.repository.core.support.RepositoryFactorySupport;

import javax.persistence.EntityManager;
import java.io.Serializable;

/**
 * 3. 扩展jpaRepository,让所有的repository共享起自定义的方法 \
 * 创建一个自定义的FactoryBean去替代默认的工厂类
 * @author: yaunde
 * @date: 2020-10-22 00:12
 */
public class LambdaRepositoryFactoryBean<R extends JpaRepository<T, I>, T, I extends Serializable>
        extends JpaRepositoryFactoryBean<R, T, I> {
    /**
     * Creates a new {@link JpaRepositoryFactoryBean} for the given repository interface.
     *
     * @param repositoryInterface must not be {@literal null}.
     */
    public LambdaRepositoryFactoryBean(Class<? extends R> repositoryInterface) {
        super(repositoryInterface);
    }

    /**
     *
     * @param em
     * @return
     */
    @Override
    protected RepositoryFactorySupport createRepositoryFactory(EntityManager em) {
        return new LambdaRepositoryFactory(em);
    }

    private static class LambdaRepositoryFactory<T, I extends Serializable>
            extends JpaRepositoryFactory {

        private final EntityManager em;

        LambdaRepositoryFactory(EntityManager em) {
            super(em);
            this.em = em;
        }

        @SuppressWarnings("unchecked")
        protected Object getTargetRepository(RepositoryMetadata metadata) {
            return new SimpleLambdaJpaRepository<T, I>(
                    (Class<T>) metadata.getDomainType(), em);
        }

        @Override
        protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
            return SimpleLambdaJpaRepository.class;
        }
    }


}
