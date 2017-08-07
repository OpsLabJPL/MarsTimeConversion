#
# Be sure to run `pod lib lint MarsTimeConversion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MarsTimeConversion'
  s.version          = '0.1.8'
  s.summary          = 'MarsTimeConversion library in Swift.'

  s.description      = <<-DESC
Conversion from Earth date and time to Mars date and time for a lander on the surface.
                       DESC

  s.homepage         = 'https://github.com/drmarkpowell/MarsTimeConversion'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'drmarkpowell' => 'drmarkpowell@gmail.com' }
  s.source           = { :git => 'https://github.com/OpsLabJPL/MarsTimeConversion.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/drmarkpowell'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MarsTimeConversion/Classes/**/*'

end
