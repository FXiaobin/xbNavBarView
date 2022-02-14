
Pod::Spec.new do |spec|


  spec.name         = "xbNavBarView"
  spec.version      = "0.0.4"
  spec.summary      = "xbNavBarView."
  spec.description  = "自定义导航条视图，xbNavBarView"

  spec.license      = "MIT"
  spec.swift_version = "5.0"

  spec.platform     = :ios
  spec.platform     = :ios, "9.0"
  # spec.ios.deployment_target = "5.0"

  spec.author             = { "FXiaobin" => "527256662@qq.com" }
  spec.homepage     = "https://github.com/FXiaobin/xbNavBarView"
  spec.source       = { :git => "https://github.com/FXiaobin/xbNavBarView.git", :tag => "#{spec.version}" }

  spec.source_files  = "xbNavBarView", "xbNavBarView/*.{swift}"

  spec.requires_arc = true
  spec.dependency "SnapKit"

end
