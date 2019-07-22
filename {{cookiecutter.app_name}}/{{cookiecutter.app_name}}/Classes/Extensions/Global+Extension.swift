//
//  Global+Extension.swift
//  {{cookiecutter.app_name}}
//

import Foundation

/// Throws `fatalError` with additional information about caller and unresolved dependency.
/// - parameters:
///    - dependency: Dependency itself, `Any` type.
///    - file: Name of the file where this function has been called.
///    - line: Line in the file where this function has been called.
/// - returns: `Never`
func unableToResolve(_ dependency: @autoclosure () -> Any, file: StaticString = #file, line: UInt = #line) -> Never {
    fatalError("Unable to resolve dependency of type \(dependency())\n in file \(file) at line \(line)")
}
