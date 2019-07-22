//
//  LogFormatter.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/22/19.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import CocoaLumberjack
import SwifterSwift

class LogFormatter: NSObject, DDLogFormatter {
    func format(message logMessage: DDLogMessage) -> String? {
        // Log format as below: [ISO8601Z DateTime] <Class Name> VERBOSE/DEBUG/INFO/WARN/ERROR: Log Message
        return NSString(format: "[%@] <%@> [%@]: %@",
                        logMessage.timestamp.iso8601String,
                        logMessage.fileName,
                        logMessage.flag.toString(), logMessage.message) as String
    }
}

extension DDLogFlag {
    
    func toString() -> String {
        switch self {
        case DDLogFlag.error:
            return "ERROR"
        case DDLogFlag.warning:
            return "WARN"
        case DDLogFlag.info:
            return "INFO"
        case DDLogFlag.debug:
            return "DEBUG"
        case DDLogFlag.verbose:
            return "VERBOSE"
        default:
            return "UNKNOWN"
        }
    }
}
