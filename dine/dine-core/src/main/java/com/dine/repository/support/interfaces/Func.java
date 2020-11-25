package com.dine.repository.support.interfaces;

import java.io.Serializable;
import java.util.Collection;

/**
 * @author zhan zhiqiang
 * @date 2020-10-24 0:34
 */
public interface Func<Children, R> extends Serializable {

    Children isNull(boolean condition, R column);
    Children isNotNull(boolean condition, R column);

    Children in(boolean condition, R column, Collection<?> coll);
    Children notIn(boolean condition, R column, Collection<?> coll);

    /**
     * 字段 IN ( sql语句 )
     * <p>!! sql 注入方式的 in 方法 !!</p>
     * <p>例1: inSql("id", "1, 2, 3, 4, 5, 6")</p>
     * <p>例2: inSql("id", "select id from table where id &lt; 3")</p>
     */
    Children inSql(boolean condition, R column, String inValue);
    Children notInSql(boolean condition, R column, String inValue);

    Children groupBy(boolean condition, R... columns);

    Children orderBy(boolean condition, boolean isAsc, R... columns);

    Children having(boolean condition, String sqlHaving, Object... params);
}
