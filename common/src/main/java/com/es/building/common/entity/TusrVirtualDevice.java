package com.es.building.common.entity;

import java.util.Date;

public class TusrVirtualDevice {
    private Long id;

    private String virtualDeviceName;

    private String deviceKey;

    private Integer channel;

    private String subDeviceAddr;

    private String typeCode;

    private Long areaId;

    private String channelParam;

    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getVirtualDeviceName() {
        return virtualDeviceName;
    }

    public void setVirtualDeviceName(String virtualDeviceName) {
        this.virtualDeviceName = virtualDeviceName == null ? null : virtualDeviceName.trim();
    }

    public String getDeviceKey() {
        return deviceKey;
    }

    public void setDeviceKey(String deviceKey) {
        this.deviceKey = deviceKey == null ? null : deviceKey.trim();
    }

    public Integer getChannel() {
        return channel;
    }

    public void setChannel(Integer channel) {
        this.channel = channel;
    }

    public String getSubDeviceAddr() {
        return subDeviceAddr;
    }

    public void setSubDeviceAddr(String subDeviceAddr) {
        this.subDeviceAddr = subDeviceAddr == null ? null : subDeviceAddr.trim();
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
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