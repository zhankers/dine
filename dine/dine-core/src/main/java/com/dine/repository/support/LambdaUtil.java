package com.dine.repository.support;

import java.lang.invoke.SerializedLambda;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author: yaunde
 * @date: 2020-10-22 00:27
 */
public class LambdaUtil {
    public static <T> String resolve(SFunction<T, ?> property) {
        try {
            Method declaredMethod = property.getClass().getDeclaredMethod("writeReplace");
            declaredMethod.setAccessible(true);
            SerializedLambda serializedLambda = (SerializedLambda) declaredMethod.invoke(property);
            String methodName = serializedLambda.getImplMethodName();
            String fieldName;
            if (methodName.startsWith("get")) {
                fieldName = methodName.substring(3);
            } else {
                fieldName = methodName.substring(2);
            }
            return StringUtils.firstCharToLower(fieldName);

        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }
}
