//
//  LogService.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/22/19
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import CocoaLumberjack

class LogService: LogServiceType {
    
    static let shared = LogService()
    private let fileLogger = DDFileLogger()
    
    init() {
        
        let formatter = LogFormatter()
        
        #if DEBUG
            dynamicLogLevel = .all
        #else
            dynamicLogLevel = .info
        
            // ASL = Apple System Log
            if let aslLogger = DDOSLogger.sharedInstance {
                aslLogger.logFormatter = formatter
                DDLog.add(aslLogger, with: dynamicLogLevel)
            }
        
        #endif
        
        // TTY = XCode console
        if let ttyLogger = DDTTYLogger.sharedInstance {
            ttyLogger.logFormatter = formatter
            DDLog.add(ttyLogger, with: dynamicLogLevel)
        }
        
        // Persistence log file that saves up to 2MB of logs to disk
        fileLogger.logFormatter = formatter
        fileLogger.rollingFrequency = 0 // no limits
        fileLogger.maximumFileSize = UInt64(1024 * 1024 * 2) // 2 MB
        fileLogger.logFileManager.maximumNumberOfLogFiles = 0
        fileLogger.logFileManager.logFilesDiskQuota = UInt64(1024 * 1024 * 2) // quota is 2 MB max
        DDLog.add(fileLogger, with: dynamicLogLevel)
    }
    
    func info(_ format: String, _ args: CVarArg...) {
        DDLogInfo(String(format: format, args))
    }
    
    func warning(_ format: String, _ args: CVarArg...) {
        DDLogWarn(String(format: format, args))
    }
    
    func error(_ format: String, _ args: CVarArg...) {
        // The default philosophy for asynchronous logging is very simple:
        // Log messages with errors should be executed synchronously.
        // All other log messages, such as debug output, are executed asynchronously.
        DDLogError(String(format: format, args))
    }
    
    func debug(_ format: String, _ args: CVarArg...) {
        DDLogDebug(String(format: format, args))
    }
    
    func verbose(_ format: String, _ args: CVarArg...) {
        DDLogVerbose(String(format: format, args))
    }
    
    static func info(_ format: String, _ args: CVarArg...) {
        LogService.shared.info(format, args)
    }
	
    static func warning(_ format: String, _ args: CVarArg...) {
        LogService.shared.warning(format, args)
    }
    
    static func error(_ format: String, _ args: CVarArg...) {
        LogService.shared.error(format, args)
    }
    
    static func debug(_ format: String, _ args: CVarArg...) {
        LogService.shared.debug(format, args)
    }
    
    static func verbose(_ format: String, _ args: CVarArg...) {
        LogService.shared.verbose(format, args)
    }
    
    /// Log files
    ///
    /// - Returns: An array of DDLogFileInfo instances
    class func logFiles() -> [DDLogFileInfo] {
        return shared.fileLogger.logFileManager.sortedLogFileInfos
    }
}
