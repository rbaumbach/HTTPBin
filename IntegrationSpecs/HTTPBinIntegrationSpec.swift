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
                                    
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/get")
                                    
                                    expect(httpBinModel.data).to.beNil()
                                    expect(httpBinModel.files).to.beNil()
                                    expect(httpBinModel.form).to.beNil()
                                    expect(httpBinModel.json).to.beNil()
                                    
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
                                    
                                    expect(httpBinModel.args).to.equal(["boss": "gannon", "hero": "link"])
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.contain("https://httpbin.org/get")
                                    expect(httpBinModel.url).to.contain("boss=gannon")
                                    expect(httpBinModel.url).to.contain("hero=link")
                                    
                                    expect(httpBinModel.data).to.beNil()
                                    expect(httpBinModel.files).to.beNil()
                                    expect(httpBinModel.form).to.beNil()
                                    expect(httpBinModel.json).to.beNil()
                                    
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
                                                                        
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.data).to.beEmpty()
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.form).to.beEmpty()
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
                                    
                                    expect(httpBinModel.args).to.equal(["boss": "gannon", "hero": "link"])
                                    expect(httpBinModel.data).to.equal(String.empty)
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.form).to.beEmpty()
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
                                    
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.data).to.beEmpty()
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.form).to.beEmpty()
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
                                                       body: ["junk-drawer": ["sissors", "tape", "matches"]]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.data).to.beEmpty()
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.json).to.beNil()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/post")
                                    
                                    let expectedForm = ["{\"junk-drawer\":[\"sissors\",\"tape\",\"matches\"]}": ""]
                                    
                                    expect(httpBinModel.form).to.equal(expectedForm)
                                    
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
                                    
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.data).to.beEmpty()
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.form).to.beEmpty()
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
                                                      body: ["junk-drawer": ["sissors", "tape", "matches"]]) { (result: Result<HTTPBin, Error>) in
                                    guard let httpBinModel = try? result.get() else {
                                        failSpec()
                                        
                                        return
                                    }
                                    
                                    expect(httpBinModel.args).to.beEmpty()
                                    expect(httpBinModel.data).to.equal("{\"junk-drawer\":[\"sissors\",\"tape\",\"matches\"]}")
                                    expect(httpBinModel.files).to.beEmpty()
                                    expect(httpBinModel.form).to.beEmpty()
                                    expect(httpBinModel.headers).toNot.beEmpty()
                                    expect(httpBinModel.origin).toNot.beNil()
                                    expect(httpBinModel.url).to.equal("https://httpbin.org/put")
                                    
                                    let expectedJSON: [String: JSONCodable] = ["junk-drawer": ["sissors", "tape", "matches"]]
                                    
                                    expect(httpBinModel.json).to.equal(expectedJSON)

                                    
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
            
            describe("file upload") {
                var testBundle: Bundle!
                var multipartFormData: Data!
                
                beforeEach {
                    testBundle = Bundle(for: self)
                    
                    let fileURL = testBundle.url(forResource: "file",
                                                 withExtension: "txt")!
                    
                    let fileData = try! Data(contentsOf: fileURL)
                    
                    let boundaryUUID = UUID().uuidString
                    
                    multipartFormData = MultipartFormDataBuilder().buildMultipartFormData(data: fileData,
                                                                                          filename: "file.txt",
                                                                                          boundaryUUID: boundaryUUID,
                                                                                          contentType: .octetStream)
                    
                    let multipartFormHeader = ["Content-Type": "multipart/form-data; boundary=Boundary-\(boundaryUUID)"]
                    
                    pequenoNetworking = PequenoNetworking(baseURL: "https://httpbin.org",
                                                          headers: multipartFormHeader)
                }

                it("completes with codable HTTPBin model") {
                    hangOn { complete in
                        pequenoNetworking.uploadFile(endpoint: "/post",
                                                     parameters: nil,
                                                     data: multipartFormData) { (result: Result<HTTPBin, Error>) in
                            guard let httpBinModel = try? result.get() else {
                                failSpec()
                                                                    
                                return
                            }

                            expect(httpBinModel.args).to.beEmpty()
                            expect(httpBinModel.data).to.beEmpty()
                            expect(httpBinModel.form).to.beEmpty()
                            expect(httpBinModel.headers).toNot.beEmpty()
                            expect(httpBinModel.json).to.beNil()
                            expect(httpBinModel.origin).toNot.beNil()
                            expect(httpBinModel.url).to.equal("https://httpbin.org/post")
                            
                            let expectedFiles: [String: JSONCodable] = ["file": "Hi httpbin!\n"]
                            
                            expect(httpBinModel.files).to.equal(expectedFiles)

                            
                            complete()
                        }
                    }
                }
            }
        }
    }
}
