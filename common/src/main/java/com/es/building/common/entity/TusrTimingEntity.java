package com.es.building.common.entity;

import java.util.Date;

public class TusrTimingEntity {
    private Long id;

    private String timingName;

    private Date createTime;

    private String cron;

    private String timingOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTimingName() {
        return timingName;
    }

    public void setTimingName(String timingName) {
        this.timingName = timingName == null ? null : timingName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron == null ? null : cron.trim();
    }

    public String getTimingOrder() {
        return timingOrder;
    }

    public void setTimingOrder(String timingOrder) {
        this.timingOrder = timingOrder == null ? null : timingOrder.trim();
    }
}