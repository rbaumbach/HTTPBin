import Quick
import Moocher
import Capsule
import Utensils
@testable import HTTPBin

final class HTTPBinIntegrationSpec: QuickSpec {
    override class func spec() {
        describe("HTTPBin") {
            var pequenoNetworking: PequenoNetworking!

            describe("without headers") {
                beforeEach {
                    pequenoNetworking = PequenoNetworking(baseURL: "https://httpbin.org",
                                                          headers: nil)
                    pequenoNetworking.debugPrint = URLSessionTaskEngine.DebugPrint(option: .all,
                                                                                   printType: .verbose)
                }
                
                describe("GET request") {
                    describe("without parameters") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.get(endpoint: "/get",
                                                      parameters: nil) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.files).to.beNil()
                                    
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/get")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                    
                    describe("with parameters") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.get(endpoint: "/get",
                                                      parameters: ["hero": "link",
                                                                   "boss": "gannon"]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.files).to.beNil()
                                    
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.contain("https://httpbin.org/get")
                                    expect(httpBinModel.url).to.contain("boss=gannon")
                                    expect(httpBinModel.url).to.contain("hero=link")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                }
                
                describe("DELETE request") {
                    describe("without parameters") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.delete(endpoint: "/delete",
                                                         parameters: nil) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                                                        
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form).toNot.beNil()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/delete")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                    
                    describe("with parameters") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.delete(endpoint: "/delete",
                                                         parameters: ["hero": "link",
                                                                      "boss": "gannon"]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form).toNot.beNil()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.contain("https://httpbin.org/delete")
                                    expect(httpBinModel.url).to.contain("boss=gannon")
                                    expect(httpBinModel.url).to.contain("hero=link")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                }
                
                describe("POST request") {
                    describe("without body") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.post(endpoint: "/post",
                                                       body: nil) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form).toNot.beNil()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/post")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                    
                    describe("with body") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.post(endpoint: "/post",
                                                       body: ["junk-drawer": ["sissors", "tape", "matches"],
                                                              "number-of-dogs": 2]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form?.keys.count).to.equal(1)
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/post")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                }
                
                describe("PUT request") {
                    describe("without body") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.put(endpoint: "/put",
                                                      body: nil) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form).toNot.beNil()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/put")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                    
                    describe("with body") {
                        it("completes with codable HTTPBin model") {
                            hangOn { complete in
                                pequenoNetworking.put(endpoint: "/put",
                                                      body: ["junk-drawer": ["sissors", "tape", "matches"],
                                                             "number-of-dogs": 2]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).toNot.beNil()
                                    expect(httpBinModel.data).toNot.equal(String.empty)
                                    expect(httpBinModel.files).toNot.beNil()
                                    expect(httpBinModel.form).to.beEmpty()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).toNot.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/put")
                                    
                                    complete()
                                }
                            }
                        }
                    }
                }
            }
            
            describe("with headers") {
                beforeEach {
                    pequenoNetworking = PequenoNetworking(baseURL: "https://httpbin.org",
                                                          headers: ["blues-uno": "jake",
                                                                    "blues-dos": "elwood"])
                }
                
                describe("GET request") {
                    it("completes with codable HTTPBin model") {
                        hangOn { complete in
                            pequenoNetworking.get(endpoint: "/get",
                                                  parameters: nil) { (result: Result<HTTPBin, Error>) in
                                guard let httpBinModel = try? result.get() else {
                                    failSpec()
                                                                        
                                    return
                                }
                                
                                let rawHeaders = httpBinModel.headers.map { (key, value) in
                                    return (key.lowercased(), value)
                                }
                                
                                let processedHeaders = Dictionary(uniqueKeysWithValues: rawHeaders)
                                
                                expect(processedHeaders["blues-uno"]).to.equal("jake")
                                expect(processedHeaders["blues-dos"]).to.equal("elwood")
                                
                                complete()
                            }
                        }
                    }
                }
                
                describe("DELETE request") {
                    it("completes with codable HTTPBin model") {
                        hangOn { complete in
                            pequenoNetworking.delete(endpoint: "/delete",
                                                     parameters: nil) { (result: Result<HTTPBin, Error>) in
                                guard let httpBinModel = try? result.get() else {
                                    failSpec()
                                                                        
                                    return
                                }
                                
                                let rawHeaders = httpBinModel.headers.map { (key, value) in
                                    return (key.lowercased(), value)
                                }
                                
                                let processedHeaders = Dictionary(uniqueKeysWithValues: rawHeaders)
                                
                                expect(processedHeaders["blues-uno"]).to.equal("jake")
                                expect(processedHeaders["blues-dos"]).to.equal("elwood")
                                
                                complete()
                            }
                        }
                    }
                }
                
                describe("POST request") {
                    it("completes with codable HTTPBin model") {
                        hangOn { complete in
                            pequenoNetworking.post(endpoint: "/post",
                                                   body: nil) { (result: Result<HTTPBin, Error>) in
                                guard let httpBinModel = try? result.get() else {
                                    failSpec()
                                                                        
                                    return
                                }
                                
                                let rawHeaders = httpBinModel.headers.map { (key, value) in
                                    return (key.lowercased(), value)
                                }
                                
                                let processedHeaders = Dictionary(uniqueKeysWithValues: rawHeaders)
                                
                                expect(processedHeaders["blues-uno"]).to.equal("jake")
                                expect(processedHeaders["blues-dos"]).to.equal("elwood")
                                
                                complete()
                            }
                        }
                    }
                }
                
                describe("PUT request") {
                    it("completes with codable HTTPBin model") {
                        hangOn { complete in
                            pequenoNetworking.put(endpoint: "/put",
                                                  body: nil) { (result: Result<HTTPBin, Error>) in
                                guard let httpBinModel = try? result.get() else {
                                    failSpec()
                                                                        
                                    return
                                }
                                
                                let rawHeaders = httpBinModel.headers.map { (key, value) in
                                    return (key.lowercased(), value)
                                }
                                
                                let processedHeaders = Dictionary(uniqueKeysWithValues: rawHeaders)
                                
                                expect(processedHeaders["blues-uno"]).to.equal("jake")
                                expect(processedHeaders["blues-dos"]).to.equal("elwood")
                                
                                complete()
                            }
                        }
                    }
                }
            }
        }
    }
}
