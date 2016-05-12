package v1.com.hp.es.base;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;


@ContextConfiguration(locations = {"classpath:applicationContext-managementdb.xml"})
public abstract class BaseTest extends AbstractTransactionalTestNGSpringContextTests {
}
