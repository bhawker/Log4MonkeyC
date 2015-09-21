using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.Lang as Ciq;
using Toybox.Time as Time;
using Log4MonkeyC as Log;

//! Simple test harness/how-to app for experimenting with the Log4MonkeyC module
class Log4MonkeyCTestHarness extends App.AppBase {
	var logger;

    //! onStart() is called on application start up
    function onStart() {
    	// Construct logging Config
		// Using dictionary...
		var config = new Log4MonkeyC.Config();
    	config.init({ Log.LOG_LEVEL_KEY => Log.DEBUG, Log.DATE_FORMAT_KEY => Time.FORMAT_SHORT });
    	// ...or builder
		//var config = new Log4MonkeyC.Config().setLogLevel(Log.DEBUG).setDateFormat(Time.FORMAT_SHORT);
		
		// Set Config on module to be used for subsequently created Loggers
		Log4MonkeyC.setLogConfig(config);
		
		// Create Logger
		logger = Log.getLogger("Log4MonkeyCTestHarness");
		
		// Test logging
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