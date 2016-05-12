package com.es.building.common.security;

import org.apache.shiro.web.filter.mgt.FilterChainResolver;
import org.apache.shiro.web.mgt.WebSecurityManager;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CustomShiroFilter extends AbstractShiroFilter {

	Logger logger = LoggerFactory.getLogger(CustomShiroFilter.class);

	public CustomShiroFilter() {
		super();
	}

	protected CustomShiroFilter(WebSecurityManager webSecurityManager,
			FilterChainResolver resolver) {
		if (webSecurityManager == null) {
			throw new IllegalArgumentException();
		}
		setSecurityManager(webSecurityManager);
		if (resolver != null) {
			setFilterChainResolver(resolver);
		}
	}
}
