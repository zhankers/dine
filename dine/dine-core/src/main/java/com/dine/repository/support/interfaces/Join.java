package com.dine.repository.support.interfaces;

import java.io.Serializable;

/**
 * @author zhan zhiqiang
 * @date 2020-10-24 0:39
 */
public interface Join<Children> extends Serializable {

    Children or(boolean condition);

    /**
     * 拼接 sql
     * <p>!! 会有 sql 注入风险 !!</p>
     * <p>例1: apply("id = 1")</p>
     * <p>例2: apply("date_format(dateColumn,'%Y-%m-%d') = '2008-08-08'")</p>
     * <p>例3: apply("date_format(dateColumn,'%Y-%m-%d') = {0}", LocalDate.now())</p>
     *
     */
    Children apply(boolean condition, String applySql, Object... value);

    /**
     * 无视优化规则直接拼接到 sql 的最后(有sql注入的风险,请谨慎使用)
     * <p>例: last("limit 1")</p>
     * <p>注意只能调用一次,多次调用以最后一次为准</p>
     */
    Children last(boolean condition, String lastSql);

    /**
     * sql 注释(会拼接在 sql 的最后面)
     */
    Children comment(boolean condition, String comment);

    Children exists(boolean condition, String existsSql);

    Children notExists(boolean condition, String notExistsSql);

}
