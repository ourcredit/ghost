package com.monkey.utility.models;

import java.io.Serializable;

public class BaseEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private T id;

    public T getId() {
        return id;
    }

    public void setId(T id) {
        this.id = id;
    }
}
