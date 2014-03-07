#
#  Be sure to run `pod spec lint TaggableTextView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TaggableTextView"
  s.version      = "0.8.1"
  s.summary      = "Customizable UITextView subclass that supports tagging"

  s.description  = <<-DESC
                    Customizable UITextView subclass that supports tagging
                    DESC

  s.homepage     = "https://github.com/potlee/TaggableTextView"
  s.license      = 'MIT'


  s.author             = { "Deep Patel" => "deepp@umich.edu" }
  s.social_media_url = "http://facebook.com/potlee"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/potlee/TaggableTextView.git"}
  s.source_files  = '*'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
end
