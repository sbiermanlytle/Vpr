#
# Be sure to run `pod lib lint Vipr.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Vipr'
  s.version          = '0.1.0'
  s.summary          = 'A lightweight lib with univeral utility'
  s.description      = <<-DESC
A lightweight lib with univeral utility.
                       DESC

  s.homepage         = 'https://github.com/sbiermanlytle/Vipr.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sebastian Bierman-Lytle' => 'Sebastian Bierman-Lytle' }
  s.source           = { :git => 'https://github.com/sbiermanlytle/Vipr.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iioinc'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Vipr/Classes/**/*'

  # s.resource_bundles = {
  #   'Vipr' => ['Vipr/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 4.6'
  s.dependency 'SwiftyJSON', '~> 4.0.0'
  # s.dependency 'Mixpanel-swift'
end
