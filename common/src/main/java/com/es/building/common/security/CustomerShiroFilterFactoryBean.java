package com.es.building.common.security;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomerShiroFilterFactoryBean extends ShiroFilterFactoryBean {

	Logger logger = LoggerFactory.getLogger(CustomerShiroFilterFactoryBean.class);


	private CustomShiroFilter customShiroFilter;

	public CustomShiroFilter getCustomShiroFilter() {
		return customShiroFilter;
	}

	public void setCustomShiroFilter(CustomShiroFilter customShiroFilter) {
		this.customShiroFilter = customShiroFilter;
	}

	@Override
	protected AbstractShiroFilter createInstance() throws Exception {
		return customShiroFilter;
	}

}
