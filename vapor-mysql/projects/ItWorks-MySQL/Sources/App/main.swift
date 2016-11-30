import Vapor
import VaporMySQL

let lDroplet = Droplet()
try lDroplet.addProvider(VaporMySQL.Provider.self)

lDroplet.get("version") {
	pRequest in

	if let lDb = lDroplet.database?.driver as? MySQLDriver {
		let lVersion = try lDb.raw("SELECT version()")
		return try JSON(node: lVersion)
	} else {
		return "No db connection"
	}
}

lDroplet.run()
