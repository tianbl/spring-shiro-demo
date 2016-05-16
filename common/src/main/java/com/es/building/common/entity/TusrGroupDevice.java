package com.es.building.common.entity;

public class TusrGroupDevice {
    private Long id;

    private Long groupId;

    private String deviceKey;

    private Integer channel;

    private String command;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
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

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command == null ? null : command.trim();
    }
}