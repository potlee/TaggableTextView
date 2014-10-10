#
#  Be sure to run `pod spec lint TaggableTextView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "TaggableTextView"
  s.version      = "1.0.0"
  s.summary      = "Customizable UITextView subclass that supports tagging"

  s.description  = <<-DESC
                    Customizable UITextView subclass that supports tagging and hastags.
                    DESC

  s.homepage     = "https://github.com/potlee/TaggableTextView"
  s.license      = { :type => 'Apache License, Version 2.0', :text => '
                         Licensed under the Apache License, Version 2.0 (the "License");
                             you may not use this file except in compliance with the License.
                                   You may obtain a copy of the License at

                                 http://www.apache.org/licenses/LICENSE-2.0

                                     Unless required by applicable law or agreed to in writing, software
                                         distributed under the License is distributed on an "AS IS" BASIS,
                                               WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
                                                   See the License for the specific language governing permissions and
                                                       limitations under the License.
                                                           '
                                           }

  s.author             = { "Deep Patel" => "deepp@umich.edu" }
  s.social_media_url = "http://facebook.com/potlee"
  s.platform     = :ios
  s.source       = { :git => "https://github.com/potlee/TaggableTextView.git", :tag => '1.0.0'}
  s.source_files  = '*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
end
;sa
