package com.es.building.managementportal.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by chao on 2015/12/19.
 */
public class CheckDescriptionInfo {
    private static Logger LOGGER = LoggerFactory.getLogger(CheckDescriptionInfo.class);

    public static boolean checkDescription(String description) {
        LOGGER.info("checkDescription begin description= {}", description);
        if (description == null) {
            return true;
        } else if (description.length() > 200) {
            LOGGER.info("=================description illegal length = {}",description.length());
            return false;
        } else {
            LOGGER.info("=================description  length = {}",description.length());
            return true;
        }

    }

}
