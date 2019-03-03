package ListCom;

/**
 * @Date:2015年4月16日
 * @Author: zhaojiwei
 * @Description:
 */

import tools.ComUtil;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/**
 * @author zhaojiwei YGCollectionHelper 2015年4月16日
 */
public class CollectionHelper {

    public static <T> T first(Collection<T> list) {
        if (ComUtil.isEmpty(list)) return null;
        int i = 0;
        for (T t : list) {
            if (i++ == 0) { return t; }
        }
        return null;
    }

    public static <T> boolean exists(Collection<T> list, IMatch<T> collectionInterface) {
        if (ComUtil.isEmpty(list)) { return false; }

        for (T t : list) {
            if (collectionInterface.match(t)) { return true; }
        }
        return false;
    }

    public static <T> boolean all(Collection<T> list, IMatch<T> collectionInterface) {
        if (ComUtil.isEmpty(list)) { return false; }

        for (T t : list) {
            if (!collectionInterface.match(t)) { return false; }
        }
        return true;
    }

    public static <T> boolean any(Collection<T> list, IMatch<T> collectionInterface) {
        return exists(list, collectionInterface);
    }

    public static <T> T find(Collection<T> list, IMatch<T> collectionInterface) {
        if (ComUtil.isEmpty(list)) { return null; }

        for (T t : list) {
            if (collectionInterface.match(t)) { return t; }
        }
        return null;
    }

    public static <T> List<T> findAll(Collection<T> list, IMatch<T> collectionInterface) {
        if (ComUtil.isEmpty(list)) { return null; }

        List<T> ts = new ArrayList<T>();
        for (T t : list) {
            if (t != null && collectionInterface.match(t)) {
                ts.add(t);
            }
        }
        return ts;
    }

    public static <T, E> List<E> select(Collection<T> list, ISingleMapping<T, E> singleMappingInterface) {
        if (ComUtil.isEmpty(list)) { return null; }
        List<E> result = new ArrayList<E>();
        for (T t : list) {
            E e = singleMappingInterface.func(t);
            if (e != null) {
                result.add(e);
            }
        }
        return result;
    }

    public static <T, E> List<E> selectMany(Collection<T> list, IManyMapping<T, E> manyMapping) {
        if (ComUtil.isEmpty(list)) { return null; }

        List<E> result = new ArrayList<E>();
        Collection<E> e = null;
        for (T t : list) {
            e = manyMapping.selectMany(t);
            if (e != null) {
                result.addAll(e);
            }
        }
        return result;
    }
}