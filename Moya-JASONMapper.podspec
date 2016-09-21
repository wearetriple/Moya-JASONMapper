Pod::Spec.new do |s|
  s.name             = "Moya-JASONMapper"
  s.version          = "1.0.0"
  s.summary          = "Map objects through JASON in combination with Moya"
  s.description  = <<-EOS
    [JASON](https://github.com/delba/JASON) bindings for
    [Moya](https://github.com/Moya/Moya) for easier JSON serialization.
    Includes [RxSwift](https://github.com/ReactiveX/RxSwift/) bindings as well.
    Instructions on how to use it are in
    [the README](https://github.com/AvdLee/Moya-JASONMapper).
  EOS
  s.homepage     = "https://github.com/AvdLee/Moya-JASONMapper"
  s.license      = { :type => "MIT", :file => "License" }
  s.author           = { "Antoine van der Lee" => "a.vanderlee@triple-it.nl" }
  s.source           = { :git => "https://github.com/AvdLee/Moya-JASONMapper.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/twannl'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Source/*.swift"
    ss.dependency "Moya"
    ss.dependency "JASON"
    ss.framework  = "Foundation"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "Source/RxSwift/*.swift"
    ss.dependency "Moya/RxSwift"
    ss.dependency "Moya-JASONMapper/Core"
    ss.dependency "RxSwift"
  end

  s.subspec "ReactiveCocoa" do |ss|
    ss.source_files = "Source/ReactiveCocoa/*.swift"
    ss.dependency "Moya/ReactiveCocoa"
    ss.dependency "Moya-JASONMapper/Core"
    ss.dependency "ReactiveCocoa"
  end
end