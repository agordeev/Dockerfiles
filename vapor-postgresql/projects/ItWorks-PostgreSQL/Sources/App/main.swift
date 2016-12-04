import Vapor
import VaporPostgreSQL

let lDroplet = Droplet()
try lDroplet.addProvider(VaporPostgreSQL.Provider.self)

lDroplet.get("version") {
	pRequest in

	if let lDb = lDroplet.database?.driver as? PostgreSQLDriver {
		let lVersion = try lDb.raw("SELECT version()")
		return try JSON(node: lVersion)
	} else {
		return "No db connection"
	}
}

lDroplet.run()
