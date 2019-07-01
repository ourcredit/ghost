package com.monkey.app.entity;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import input.FilterInputDto;
import input.PageFilterInputDto;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class WrapperUtil {
    public static QueryWrapper toWrapper(PageFilterInputDto input) {
        QueryWrapper _wrapper=new QueryWrapper();
        Map<String,Object> where =input.getWhere();
        if (where != null && !where.isEmpty()) {
            Set<String> r = where.keySet();
            for (String key : r) {
                Object v = where.get(key);
                if (v instanceof Number) {
                    _wrapper.eq(key, v);
                } else if (v instanceof String) {
                    String s = (String) v;
                    s = s.trim();
                    if (!s.isEmpty()) {
                        _wrapper.like(key, s);
                    }
                } else if (v instanceof Boolean) {
                    Boolean b = (Boolean) v;
                    _wrapper.eq(key, b);
                } else if (v instanceof Date) {
                    Date d = (Date) v;
                    _wrapper.eq(key, d);
                } else if (v instanceof List) {
                    List a = (List) v;
                    if (!a.isEmpty() && a.size() == 2) {
                        String l = a.get(0).toString();
                        if (!l.isEmpty()) {
                            _wrapper.ge(key, l);
                        }
                        String rr = a.get(1).toString();
                        if (!rr.isEmpty()) {
                            _wrapper.le(key, rr);
                        }
                    }
                }
            }
        }
      //  _wrapper.orderBy(true, false, "creationTime");
        return _wrapper;
    }

    public static Page toPage(FilterInputDto input) {
        return new Page(input.getIndex(), input.getSize());
    }
}
