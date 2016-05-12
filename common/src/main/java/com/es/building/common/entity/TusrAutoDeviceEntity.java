package com.es.building.common.entity;

public class TusrAutoDeviceEntity {
    private Long id;

    private Long autoId;

    private Long deviceKey;

    private Integer channel;

    private String autoState;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAutoId() {
        return autoId;
    }

    public void setAutoId(Long autoId) {
        this.autoId = autoId;
    }

    public Long getDeviceKey() {
        return deviceKey;
    }

    public void setDeviceKey(Long deviceKey) {
        this.deviceKey = deviceKey;
    }

    public Integer getChannel() {
        return channel;
    }

    public void setChannel(Integer channel) {
        this.channel = channel;
    }

    public String getAutoState() {
        return autoState;
    }

    public void setAutoState(String autoState) {
        this.autoState = autoState == null ? null : autoState.trim();
    }
}