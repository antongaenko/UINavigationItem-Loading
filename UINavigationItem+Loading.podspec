Pod::Spec.new do |s|
  s.name     = 'UINavigationItem+Loading'
  s.version  = '1.0'
  s.ios.deployment_target   = '6.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'Simple category to show a loading status in a navigation bar in place of left/right items or title.'
  s.homepage = 'https://github.com/Just-/UINavigationItem-Loading'
  s.author   = { 'Anton Gaenko' => 'antony.gaenko@gmail.com' }
  s.social_media_url = 'https://twitter.com/Anton_Gaenko'
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/Just-/UINavigationItem-Loading',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = '*.{h,m}'
  s.public_header_files = '*.h'
end
