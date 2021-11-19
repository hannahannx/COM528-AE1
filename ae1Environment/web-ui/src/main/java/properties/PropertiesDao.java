/**
 * 
 * 
 */

package properties;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

/**
 *
 * @author Cristian Anton Frincu
 */
public class PropertiesDao {

    final static Logger LOG = LogManager.getLogger(PropertiesDao.class);

    private File propertiesFile;
    
    private Properties properties = new Properties();
    
    public PropertiesDao(){}
    
 //Below, I've done modification to face an issue with "null" exception
 //As "getParentFile()" would just show as null and interrupt the entire program
 //Even with this change, line 97, the "getabsolutepath" also shows null, as my config file supposdely, is not created.
    public PropertiesDao(String propertiesFileLocation) {
        try {
            File propertiesFile = new File("config.properties");
            if (!propertiesFile.exists()) {
                LOG.info("properties file does not exist: creating new file: " + propertiesFile.getAbsolutePath());
               if( propertiesFile.getParentFile()!= null){
                   propertiesFile.getParentFile().mkdirs();
                   propertiesFile.createNewFile();
                   saveProperties();
               }
               else{
                   //give current project path and .mkdirs() to test the other methods
                  propertiesFile = new File("resources\\config.properties");
                   propertiesFile.mkdirs();
                  propertiesFile.createNewFile();
                 
                  saveProperties();
               }
              }
             loadProperties();
            } 
             catch (IOException ex) {
                                        LOG.error("cannot load properties", ex);
                                    }
    }

    // synchronized ensures changes are not made by another thread while reading
    public synchronized String getProperty(String propertyName) {
        return properties.getProperty(propertyName);
    }

    public synchronized void setProperty(String propertyKey, String propertyValue) {
        properties.setProperty(propertyKey, propertyValue);
        saveProperties();
    }

    private void saveProperties() {
        OutputStream output = null;
        try {
            LOG.debug("saving properties to: " + propertiesFile.getAbsolutePath());

            output = new FileOutputStream(propertiesFile);
            String comments = "# properties file";
            properties.store(output, comments);

        } catch (IOException ex) {
            LOG.error("cannot save properties", ex);
        } finally {
            try {
                if (output != null) {
                    output.close();
                }
            } catch (IOException ex) {
                LOG.error("Closed Output");
            }
        }
    }

    private void loadProperties() {
        InputStream input = null;
        try {
            LOG.debug("loading properties from: " + propertiesFile.getAbsolutePath());
            input = new FileInputStream(propertiesFile);
            properties.load(input);
        } catch (IOException ex) {
            LOG.error("cannot load properties", ex);
        } finally {
            try {
                if (input != null) {
                    input.close();
                }
            } catch (IOException ex) {
                LOG.error("File is closed", ex);
            }
        }
    }
    
}

//Final note, it might be that either my imports don't work how they are supposed to
// Or the file is either, never created or deleted as soon as it reaches this stage
//I would have needed more time to figure this one out.