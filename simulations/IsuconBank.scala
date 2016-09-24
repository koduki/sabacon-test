
import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class IsuconBank extends Simulation {

	val httpProtocol = http
		.baseURL("http://localhost")
		.inferHtmlResources()
		.acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8")
		.acceptEncodingHeader("gzip, deflate")
		.acceptLanguageHeader("ja,en-US;q=0.8,en;q=0.6")
		.userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36")

	val scn = scenario("BankLoing")
		.exec(
			http("top")
			.get("/")
			.check(status.is(200))
//		).exec(http("login-fail")
//			.post("/login")
//			.formParam("login", "dummy_u")
//			.formParam("password", "dummy_p")
//            .check(regex( """Wrong username or password"""))
        ).exec(http("login-success")
			.post("/login")
			.formParam("login", "isucon8")
			.formParam("password", "isuconpass8")
            .check(regex( """ログインに成功しました。"""))
		)
	setUp(scn.inject(atOnceUsers(3))).protocols(httpProtocol)

}
