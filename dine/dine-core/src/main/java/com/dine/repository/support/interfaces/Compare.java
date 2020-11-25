package com.dine.repository.support.interfaces;

import java.io.Serializable;
import java.util.Map;
import java.util.function.BiPredicate;

/**
 * 比较条件
 * @author yaunde
 * @param <Children>
 * @param <R>
 * @date
 */
public interface Compare<Children, R> extends Serializable {

    <V> Children allEq(boolean condition, Map<R, V> params, boolean null2IsNull);
    <V> Children allEq(boolean condition, BiPredicate<R, V> filter, Map<R, V> params, boolean null2IsNull);

    Children eq(boolean condition, R column, Object val);
    Children ne(boolean condition, R column, Object val);

    Children gt(boolean condition, R column, Object val);
    Children ge(boolean condition, R column, Object val);

    Children lt(boolean condition, R column, Object val);
    Children le(boolean condition, R column, Object val);

    Children between(boolean condition, R column, Object val1, Object val2);
    Children notBetween(boolean condition, R column, Object val1, Object val2);

    Children like(boolean condition, R column, Object val);
    Children notLike(boolean condition, R column, Object val);

    Children likeLeft(boolean condition, R column, Object val);
    Children likeRight(boolean condition, R column, Object val);
}
