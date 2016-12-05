#
# Be sure to run `pod lib lint MarsTimeConversion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MarsTimeConversion"
  s.version          = "0.1.7"
  s.summary          = "MarsTimeConversion library in Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Conversion from Earth date and time to Mars date and time for a lander on the surface.
                       DESC

  s.homepage         = "https://github.com/OpsLabJPL/MarsTimeConversion"
  s.license          = 'Apache 2.0'
  s.author           = { "Mark Powell" => "drmarkpowell@gmail.com" }
  s.source           = { :git => "https://github.com/OpsLabJPL/MarsTimeConversion.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/drmarkpowell'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MarsTimeConversion/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MarsTimeConversion' => ['MarsTimeConversion/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
