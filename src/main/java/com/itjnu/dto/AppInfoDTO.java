package com.itjnu.dto;

/**
 * 应用程序DTO对象
 */
public class AppInfoDTO {
    private String softwareName;

    private Long appStatus;

    private Long appFlatform;

    private Long levelOne;

    private Long levelTwo;

    private Long levelThree;

    private Integer pageNum;

    private Long devUserId;

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public Long getAppStatus() {
        return appStatus;
    }

    public void setAppStatus(Long appStatus) {
        this.appStatus = appStatus;
    }

    public Long getAppFlatform() {
        return appFlatform;
    }

    public void setAppFlatform(Long appFlatform) {
        this.appFlatform = appFlatform;
    }

    public Long getLevelOne() {
        return levelOne;
    }

    public void setLevelOne(Long levelOne) {
        this.levelOne = levelOne;
    }

    public Long getLevelTwo() {
        return levelTwo;
    }

    public void setLevelTwo(Long levelTwo) {
        this.levelTwo = levelTwo;
    }

    public Long getLevelThree() {
        return levelThree;
    }

    public void setLevelThree(Long levelThree) {
        this.levelThree = levelThree;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Long getDevUserId() {
        return devUserId;
    }

    public void setDevUserId(Long devUserId) {
        this.devUserId = devUserId;
    }

    @Override
    public String toString() {
        return "AppInfoDTO{" +
                "softwareName='" + softwareName + '\'' +
                ", appStatus=" + appStatus +
                ", appFlatform=" + appFlatform +
                ", levelOne=" + levelOne +
                ", levelTwo=" + levelTwo +
                ", levelThree=" + levelThree +
                ", pageNum=" + pageNum +
                '}';
    }
}
