package com.monkey.tenant;

public class ApplicationContext {

    private CurrentTenant current;
    public String getVersion() {
        return Version;
    }
    public void setVersion(String version) {
        Version = version;
    }

    public CurrentTenant getCurrent() {
        return current;
    }

    public void setCurrent(CurrentTenant current) {
        this.current = current;
    }

    private static class hold {
        private final static ApplicationContext sl3 = new ApplicationContext();

    }
    private ApplicationContext() {
    }
    public static ApplicationContext getInstance() {
        return hold.sl3;
    }
    private String Version;
}
