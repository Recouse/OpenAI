//
//  PlatformLogger.swift
//  OpenAI
//
//  Created by Firdavs Khaydarov on 05/08/2025.
//

#if canImport(os)
import os
#else
import Logging
#endif

package struct PlatformLogger {
    #if canImport(os)
    private let log: OSLog
    #else
    private let logger: Logger
    #endif

    package init(subsystem: String, category: String) {
        #if canImport(os)
        self.log = OSLog(subsystem: subsystem, category: category)
        #else
        self.logger = Logger(label: category)
        #endif
    }

    package func debug(_ message: String) {
        #if canImport(os)
        os_log(.debug, log: log, "%@", message)
        #else
        logger.debug("\(message)")
        #endif
    }
}
