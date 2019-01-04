#
# Be sure to run `pod lib lint ZkTouchableLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZkTouchableLabel'
  s.version          = '0.1.0'
  s.summary          = 'ZkTouchableLabel'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ZkTouchableLabel是一个用于处理label不同字符点击相应的库。
                       DESC

  s.homepage         = 'https://github.com/ziank/ZkTouchableLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ziank' => 'haixianqi0111@163.com' }
  s.source           = { :git => 'https://github.com/ziank/ZkTouchableLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZkTouchableLabel/Classes/*'
  
  # s.resource_bundles = {
  #   'ZkTouchableLabel' => ['ZkTouchableLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
