Pod::Spec.new do |s|
  s.name     = 'YumeAlamofire'
  s.version  = '5.0.6'
  s.license  = 'MIT'
  s.summary  = "A Library combine network request and json decode in POP way"
  s.homepage = 'https://github.com/yume190/YumeAlamofire'
  s.authors  = { 'yume190' => 'yume190@gmail.com' }
  s.social_media_url = "https://www.facebook.com/yume190"
  s.source   = { :git => 'https://github.com/yume190/YumeAlamofire.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  # s.osx.deployment_target = '10.11'

  # s.tvos.deployment_target = '9.0'
  # s.watchos.deployment_target = '2.0'
  s.default_subspec = "Core"
  s.swift_version = '5.0'
  # s.static_framework = true

  s.subspec "Core" do |ss|
    ss.source_files = [
      'Sources/YumeAlamofire/*.swift',
      'Sources/YumeAlamofire/Entry/*.swift',
      'Sources/YumeAlamofire/Error/*.swift',
      'Sources/YumeAlamofire/Misc/*.swift'
    ]
      #"Sources/Moya/", "Sources/Moya/Plugins/"
    ss.dependency "Alamofire", "~> 4.8.0"
    ss.dependency "JSONDecodeKit", "~> 5.0"
    
    ss.framework  = "Foundation"
  end

  s.subspec "Rx" do |ss|
    ss.source_files = [
      'Sources/Rx/*.swift',
    ]

    ss.dependency 'RxSwift'
    ss.dependency "YumeAlamofire/Core"
  end

  s.subspec "JSONMock" do |ss|
    ss.source_files = "Sources/JSONMock/*.swift"
    ss.dependency "YumeAlamofire/Core"
  end
end
