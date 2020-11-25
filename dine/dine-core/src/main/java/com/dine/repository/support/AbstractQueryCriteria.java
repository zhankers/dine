package com.dine.repository.support;

import com.dine.repository.support.interfaces.Compare;
import com.dine.repository.support.interfaces.Func;
import com.dine.repository.support.interfaces.Join;
import com.dine.repository.support.interfaces.Nested;

/**
=
 * @author: yaunde
 * @date: 2020-10-21 23:55
 */
public abstract class AbstractQueryCriteria<T, R, C extends AbstractQueryCriteria<T, R, C>> implements QueryCriteria<T>
, Func<C, R>, Join<C>, Nested<C, C>, Compare<C, R> {

    protected final C _this = (C) this;


}
