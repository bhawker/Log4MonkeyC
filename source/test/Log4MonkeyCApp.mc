using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Lang as Ciq;
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
		
		testMessages();
		testErrorExceptions();
		testFatalExceptions();		
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new Log4MonkeyCView() ];
    }
    
    hidden function testMessages() {
    	logger.debug("Debug Message");
    	logger.info("Info Message");
    	logger.warn("Warn Message");
    	logger.error("Error Message");
    	logger.fatal("Fatal Message");
    }
    
    hidden function testErrorExceptions() {
    	// Log an exception as an error
    	try {
    		throw new Ciq.Exception();
    	} catch (e1) {
    		logger.errorException(e1);
    	}
    	
    	// Log an exception with an identifying message as an error
		try {
    		throw new Ciq.Exception();
    	} catch (e2) {
    		logger.errorExceptionAndMsg("Custom error exception message", e2);
    	}
    }
    
    hidden function testFatalExceptions() {
   	    // Log an exception as fatal
    	try {
    		throw new Ciq.Exception();
    	} catch (e1) {
    		logger.fatalException(e1);
    	}
    	
    	// Log an exception with an identifying message as fatal
		try {
    		throw new Ciq.Exception();
    	} catch (e2) {
    		logger.fatalExceptionAndMsg("Custom fatal exception message", e2);
    	}
    }

}