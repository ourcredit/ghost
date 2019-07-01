package com.monkey.app.callback;

public interface IMListener<T> {
    void onSuccess(T response);

    void onFaild();

    void onTimeout();
}
