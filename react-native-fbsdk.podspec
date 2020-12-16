require 'json'
package = JSON.parse(File.read(File.join(__dir__, './', 'package.json')))

Pod::Spec.new do |s|
  s.name          = package['name']
  s.version       = package['version']
  s.summary       = package['description']
  s.requires_arc  = true
  s.author        = { 'dzhuowen' => 'dzhuowen@fb.com' }
  s.license       = package['license']
  s.homepage      = package['homepage']
  s.source        = { :git => 'https://github.com/facebook/react-native-fbsdk.git', :tag => "v#{package['version']}" }
<<<<<<< HEAD
  s.platform      = :ios, '10.0'
  s.dependency      'React'

  s.subspec 'Core' do |ss|
    ss.dependency     'FBSDKCoreKit', '~> 5.8'
=======
  s.platforms     = { :ios => "9.0", :tvos => "9.2" }
  s.dependency      'React'

  s.subspec 'Core' do |ss|
    ss.dependency     'FBSDKCoreKit', '~> 8.1'
>>>>>>> 4577507a864baab99d26270277a7a8a34e178c42
    ss.source_files = 'ios/RCTFBSDK/core/*.{h,m}'
  end

  s.subspec 'Login' do |ss|
<<<<<<< HEAD
    ss.dependency     'FBSDKLoginKit', '~> 5.8'
=======
    ss.dependency     'FBSDKLoginKit', '~> 8.1'
>>>>>>> 4577507a864baab99d26270277a7a8a34e178c42
    ss.source_files = 'ios/RCTFBSDK/login/*.{h,m}'
  end

  s.subspec 'Share' do |ss|
<<<<<<< HEAD
    ss.dependency     'FBSDKShareKit', '~> 5.8'
=======
    ss.dependency     'FBSDKShareKit', '~> 8.1'
>>>>>>> 4577507a864baab99d26270277a7a8a34e178c42
    ss.source_files = 'ios/RCTFBSDK/share/*.{h,m}'
  end
end
