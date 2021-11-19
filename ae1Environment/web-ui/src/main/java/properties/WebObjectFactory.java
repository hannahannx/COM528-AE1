package properties;

import java.io.File;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @author Cristian Anton Frincu
 */
public class WebObjectFactory {

    final static Logger LOG = LogManager.getLogger(WebObjectFactory.class);

    private static PropertiesDao propertiesDao = null;
    
    public static PropertiesDao getPropertiesDao() {
        synchronized (WebObjectFactory.class) {
            if (propertiesDao == null) {
                // creates a single instance of the dao
                String TEMP_DIR = System.getProperty("java.io.tmpdir");
                File propertiesFile = new File(TEMP_DIR + "/config.properties");
                LOG.debug("using system temp directory: " + TEMP_DIR);
                LOG.debug("using application properties file : " + propertiesFile.getAbsolutePath());
                propertiesDao = new PropertiesDao(propertiesFile.getAbsolutePath());
            }
        }
        return propertiesDao;
    }

}