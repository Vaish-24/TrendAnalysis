package com.bendthetrend.apparelbean;

public class ApparelBean {
	
	private int appId;
	private String appName;
	private float appPrice;
	private String appType;
	private String appCategory;
	private String appFabric;
	private String appColor;
	private String appDate;
	private String appWearDate;
	private int offerId;
	
	public ApparelBean()
	{
		
	}

	public ApparelBean(int appId, String appName, float appPrice, String appType, String appCategory, String appFabric,
			String appColor, String appDate) {
		super();
		this.appId = appId;
		this.appName = appName;
		this.appPrice = appPrice;
		this.appType = appType;
		this.appCategory = appCategory;
		this.appFabric = appFabric;
		this.appColor = appColor;
		this.appDate = appDate;
	}

	public int getAppId() {
		return appId;
	}

	public void setAppId(int appId) {
		this.appId = appId;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public float getAppPrice() {
		return appPrice;
	}

	public void setAppPrice(float appPrice) {
		this.appPrice = appPrice;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public String getAppCategory() {
		return appCategory;
	}

	public void setAppCategory(String appCategory) {
		this.appCategory = appCategory;
	}

	public String getAppFabric() {
		return appFabric;
	}

	public void setAppFabric(String appFabric) {
		this.appFabric = appFabric;
	}

	public String getAppColor() {
		return appColor;
	}

	public void setAppColor(String appColor) {
		this.appColor = appColor;
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public int getOfferId() {
		return offerId;
	}

	public void setOfferId(int offerId) {
		this.offerId = offerId;
	}

	public String getAppWearDate() {
		return appWearDate;
	}

	public void setAppWearDate(String appWearDate) {
		this.appWearDate = appWearDate;
	}

}
