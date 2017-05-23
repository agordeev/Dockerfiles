import Vapor

// Tof: Import only to access to a Database and PostgreSQLProvider class
import FluentProvider
import PostgreSQLProvider

final class Routes: RouteCollection {
  func build(_ builder: RouteBuilder) throws {
    builder.get("hello") {
      req in
      var json = JSON()
      try json.set("hello", "world")
      return json
    }
    
    builder.get("plaintext") {
      req in
      return "Hello, world!"
    }
    
    builder.get {
      req in
      
      // Tof: Access directly to the PostgreSQL driver
      if let lDb = Database.default?.driver as? PostgreSQLDriver.Driver {
        let lVersion = try lDb.raw("SELECT version()")
        return JSON(node: lVersion)
      } else {
        return "No db connection"
      }
    }
    
    try builder.resource("posts", PostController.self)
  }
}

/// Since Routes doesn't depend on anything
/// to be initialized, we can conform it to EmptyInitializable
///
/// This will allow it to be passed by type.
extension Routes: EmptyInitializable { }
