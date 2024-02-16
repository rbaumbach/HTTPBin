Pod::Spec.new do |spec|
  spec.name                  = 'HTTPBin'
  spec.version               = '0.0.1'
  spec.summary               = 'Codable Model for HTTPBin'
  spec.homepage              = 'https://github.com/rbaumbach/HTTPBin'
  spec.license               = { :type => 'MIT', :file => 'MIT-LICENSE.txt' }
  spec.author                = { 'Ryan Baumbach' => 'github@ryan.codes' }
  spec.source                = { :git => 'https://github.com/rbaumbach/HTTPBin.git', :tag => spec.version.to_s }
  spec.requires_arc          = true
  spec.platform              = :ios
  spec.ios.deployment_target = '12.0'
  spec.source_files          = 'Sources/HTTPBin/**/*.{swift}'
  spec.swift_version         = '5.5'
end
