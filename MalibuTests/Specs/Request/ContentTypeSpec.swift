@testable import Malibu
import Quick
import Nimble

class ContentTypeSpec: QuickSpec {

  override func spec() {
    describe("ContentType") {
      var contentType: ContentType!

      context("when it is Query type") {
        beforeEach {
          contentType = .Query
        }

        describe("#value") {
          it("returns nil") {
            expect(contentType.header).to(beNil())
          }
        }

        describe("#hashValue") {
          it("returns a hash value") {
            expect(contentType.hashValue).to(equal("query".hashValue))
          }
        }

        describe("#equal") {
          it("compares for value equality") {
            expect(contentType).toNot(equal(ContentType.JSON))
            expect(contentType).to(equal(ContentType.Query))
            expect(contentType).toNot(equal(ContentType.Custom("application/custom")))
          }
        }
      }

      context("when it is FormURLEncoded type") {
        beforeEach {
          contentType = .FormURLEncoded
        }

        describe("#value") {
          it("returns a correct string value") {
            expect(contentType.header).to(equal("application/x-www-form-urlencoded"))
          }
        }

        describe("#hashValue") {
          it("returns a hash value of corresponding string value") {
            expect(contentType.hashValue).to(equal(contentType.header?.hashValue))
          }
        }

        describe("#equal") {
          it("compares for value equality") {
            expect(contentType).toNot(equal(ContentType.JSON))
            expect(contentType).to(equal(ContentType.FormURLEncoded))
            expect(contentType).toNot(equal(ContentType.Custom("application/custom")))
          }
        }
      }

      context("when it is JSON type") {
        beforeEach {
          contentType = .JSON
        }

        describe("#value") {
          it("returns a correct string value") {
            expect(contentType.header).to(equal("application/json"))
          }
        }

        describe("#hashValue") {
          it("returns a hash value of corresponding string value") {
            expect(contentType.hashValue).to(equal(contentType.header?.hashValue))
          }
        }

        describe("#equal") {
          it("compares for value equality") {
            expect(contentType).to(equal(ContentType.JSON))
            expect(contentType).toNot(equal(ContentType.FormURLEncoded))
            expect(contentType).toNot(equal(ContentType.Custom("application/custom")))
          }
        }
      }

      context("when it is Custom type") {
        beforeEach {
          contentType = .Custom("application/custom")
        }

        describe("#value") {
          it("returns a correct string value") {
            expect(contentType.header).to(equal("application/custom"))
          }
        }

        describe("#hashValue") {
          it("returns a hash value of corresponding string value") {
            expect(contentType.hashValue).to(equal(contentType.header?.hashValue))
          }
        }

        describe("#equal") {
          it("compares for value equality") {
            expect(contentType).toNot(equal(ContentType.JSON))
            expect(contentType).toNot(equal(ContentType.FormURLEncoded))
            expect(contentType).to(equal(ContentType.Custom("application/custom")))
          }
        }
      }
    }
  }
}