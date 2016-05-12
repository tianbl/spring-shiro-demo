package com.es.building.common.entity;

import java.util.Date;

public class TusrProfileDetailEntity {
    private Long id;

    private Long profileId;

    private String deviceKey;

    private Integer channel;

    private String profileStatus;

    private String profileCommand;

    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProfileId() {
        return profileId;
    }

    public void setProfileId(Long profileId) {
        this.profileId = profileId;
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

    public String getProfileStatus() {
        return profileStatus;
    }

    public void setProfileStatus(String profileStatus) {
        this.profileStatus = profileStatus == null ? null : profileStatus.trim();
    }

    public String getProfileCommand() {
        return profileCommand;
    }

    public void setProfileCommand(String profileCommand) {
        this.profileCommand = profileCommand == null ? null : profileCommand.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}