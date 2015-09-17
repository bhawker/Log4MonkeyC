using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Log4MonkeyC as Log;

//! Simple test harness app for experimenting with the Log4MonkeyC module
class Log4MonkeyCTestHarness extends App.AppBase {
	var logger;

    //! onStart() is called on application start up
    function onStart() {
    	var debugLevel = Log.DEBUG;
    	var config = new Log4MonkeyC.Config();
		config.setLogLevel(debugLevel);
		Log4MonkeyC.setLogConfig(config);
		
		logger = Log.getLogger("Log4MonkeyCTestHarness");
		testLogLevels();		
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new Log4MonkeyCView() ];
    }
    
    hidden function testLogLevels() {
    	logger.debug("Debug Message");
    	logger.info("Info Message");
    	logger.warn("Warn Message");
    	logger.error("Error Message");
    	logger.fatal("Fatal Message");
    }

}
