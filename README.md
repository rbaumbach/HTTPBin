# HTTPBIN ![iOS Deployment Target](https://img.shields.io/badge/iOS_Deployment_Target-12.0-964B00) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Utensils/blob/master/MIT-LICENSE.txt)

A `Codable` model for the [httpbin api](https://httpbin.org)

## Adding HTTPBin to your project

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Source` directory to your project.


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
