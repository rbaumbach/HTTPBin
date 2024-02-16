# HTTPBin [![Cocoapod Version](https://img.shields.io/cocoapods/v/HTTPBin.svg)](https://github.com/rbaumbach/HTTPBin) [![Swift Version](https://img.shields.io/badge/Swift-5.5-blue)](https://github.com/rbaumbach/HTTPBin/blob/master/Package.swift) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/HTTPBin) ![iOS Deployment Target](https://img.shields.io/badge/iOS_Deployment_Target-12.0-964B00) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Utensils/blob/master/MIT-LICENSE.txt)

A `Codable` model for the [httpbin api](https://httpbin.org)

## Adding HTTPBin to your project

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Source` directory to your project.

## Usage

Anywhere you want to use a `Codable HTTPBin`.

```swift
    let networking = PequenoNetworking(baseURL: "https://httpbin.org")
    
    networking.get(endpoint: "/get",
                   parameters: nil) { (result: Result<HTTPBin, Error>) in
        let httpBin = try? result.get()
    }
    
    // or
    
    let httpBin = try? JSONDecoder().decode(HTTPBin.self, from: jsonData)
```

The above example uses `PequenoNetworking` from the [Utensils project](https://github.com/rbaumbach/Utensils), but this can be used wherever you serialize, or deserialize json using the `Codable` apis.

## Testing

* Prerequisites: [ruby](https://github.com/sstephenson/rbenv), [ruby gems](https://rubygems.org/pages/download), [bundler](http://bundler.io)

This project has been setup to use [fastlane](https://fastlane.tools) to run the specs.

First, bundle required gems, install [Cocoapods](http://cocoapods.org). Next, inside the root project directory run:

```bash
$ bundle
$ bundle exec pod install
```

And then use fastlane to run all the specs on the command line:

```bash
$ bundle exec fastlane integrationSpecs
```

## Suggestions, requests, and feedback

Thanks for checking out Utensils.  Any feedback, suggestions and feedback can be can be sent to: github@ryan.codes, or opened as a github issue.
