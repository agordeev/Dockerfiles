import Vapor
import VaporSQLite
import FluentSQLite

let lDroplet = Droplet()
try lDroplet.addProvider(VaporSQLite.Provider.self)

lDroplet.get("version") {
	pRequest in

	if let lDb = lDroplet.database?.driver as? SQLiteDriver {
		let lVersion = try lDb.raw("SELECT sqlite_version()")
		return try JSON(node: lVersion)
	} else {
		return "No db connection"
	}
}

lDroplet.run()
