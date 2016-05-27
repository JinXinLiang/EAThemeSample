#
#  Be sure to run `pod spec lint EATheme.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "EATheme"
  s.version      = "1.1.3"
  s.summary      = "Change your application’s theme!"
  s.homepage     = "https://github.com/JinXinLiang/EAThemeSample"
  s.license      = 'MIT'
  s.author       = { "Eiwodetianna" => "jinxinliang1993@gmail.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/JinXinLiang/EAThemeSample.git", :tag => s.version }
  s.source_files  = "EATheme", "EATheme/**/*.{h,m}"
  s.requires_arc = true

end
