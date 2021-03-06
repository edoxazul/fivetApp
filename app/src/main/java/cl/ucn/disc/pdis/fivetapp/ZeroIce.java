package cl.ucn.disc.pdis.fivetapp;

import cl.ucn.disc.pdis.fivetapp.zeroice.model.Contratos;
import cl.ucn.disc.pdis.fivetapp.zeroice.model.ContratosPrx;
import com.zeroc.Ice.Communicator;
import com.zeroc.Ice.InitializationData;
import com.zeroc.Ice.ObjectPrx;
import com.zeroc.Ice.Properties;
import com.zeroc.Ice.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The ZeroIce class.
 */
@SuppressWarnings("Singleton")
public final class ZeroIce {
  /**
   * The Logger.
   */
  private static final Logger log = LoggerFactory.getLogger(ZeroIce.class);

  /**
   * The Singleton.
   */
  private static final ZeroIce ZERO_ICE = new ZeroIce();

  /**
   * The ZeroIce communicator
   */
  private Communicator theCommunicator;

  /**
   * The Contratos implementation.
   */
  private ContratosPrx theContratos;

  /**
   * The Constructor
   */
  public ZeroIce ( ) {
  }

  /**
   * @return the ZeroIce.
   */
  public static ZeroIce getInstance(){
    return ZERO_ICE;
  }

  /**
   * @return the Contratos.
   */
  public ContratosPrx getContratos(){
    return this.theContratos;
  }

  /**
   * Start the Communications.
   */
  public void start(){
    if (this.theCommunicator != null)
    {
      log.warn("The Communicator was already initialized?");
      return;
    }

    this.theCommunicator = Util.initialize(getInitializationData(new String[1]));


    // The name
    String name = Contratos.class.getSimpleName();
    log.debug("Proxying <{}> ..",name);

    // The proxy 4 TheSystem
    ObjectPrx theProxy = this.theCommunicator.stringToProxy(name + ":tcp -z -t 15000 -p 8080");

    // Trying to cast the proxy
    this.theContratos = ContratosPrx.checkedCast(theProxy);
  }

  /**
   * @param args to use as source.
   * @return the {@link InitializationData}.
   */
  private static InitializationData getInitializationData(String[] args) {

    // Properties
    final Properties properties = Util.createProperties(args);
    properties.setProperty("Ice.Package.model", "cl.ucn.disc.pdis.fivetapp.zeroice");

    // https://doc.zeroc.com/ice/latest/property-reference/ice-trace
//    properties.setProperty("Ice.Trace.Admin.Properties", "1");
//    properties.setProperty("Ice.Trace.Locator", "2");
//    properties.setProperty("Ice.Trace.Network", "3");
//    properties.setProperty("Ice.Trace.Protocol", "1");
//    properties.setProperty("Ice.Trace.Slicing", "1");
//    properties.setProperty("Ice.Trace.ThreadPool", "1");
//    properties.setProperty("Ice.Compression.Level", "9");
//    properties.setProperty("Ice.Plugin.Slf4jLogger.java", "cl.ucn.disc.pdis.fivetapp.zeroice.Slf4jLoggerPluginFactory");

    InitializationData initializationData = new InitializationData();
    initializationData.properties = properties;

    return initializationData;
  }



  /**
   * Stop the communications.
   */
  public void stop(){
    if(this.theCommunicator == null){
      log.warn("The Communicator was already stopped?");
      return;
    }
    this.theContratos = null;
    this.theCommunicator.destroy();

  }

}
