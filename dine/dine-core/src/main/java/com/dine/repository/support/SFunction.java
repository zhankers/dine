package com.dine.repository.support;

import java.io.Serializable;
import java.util.function.Function;

/**
 * @author: yaunde
 * @date: 2020-10-21 23:20
 */
@FunctionalInterface
public interface SFunction<T, R> extends Function<T, R>, Serializable {
}
