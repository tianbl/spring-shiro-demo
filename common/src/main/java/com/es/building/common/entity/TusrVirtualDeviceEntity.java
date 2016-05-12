package com.es.building.common.entity;

import java.util.Date;

public class TusrVirtualDeviceEntity {
    private Long id;

    private String masterDeviceKey;

    private String virtualDeviceName;

    private Integer channel;

    private String channelParam;

    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMasterDeviceKey() {
        return masterDeviceKey;
    }

    public void setMasterDeviceKey(String masterDeviceKey) {
        this.masterDeviceKey = masterDeviceKey == null ? null : masterDeviceKey.trim();
    }

    public String getVirtualDeviceName() {
        return virtualDeviceName;
    }

    public void setVirtualDeviceName(String virtualDeviceName) {
        this.virtualDeviceName = virtualDeviceName == null ? null : virtualDeviceName.trim();
    }

    public Integer getChannel() {
        return channel;
    }

    public void setChannel(Integer channel) {
        this.channel = channel;
    }

    public String getChannelParam() {
        return channelParam;
    }

    public void setChannelParam(String channelParam) {
        this.channelParam = channelParam == null ? null : channelParam.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}