
Pod::Spec.new do |s|

  s.name         = "TCCarouselView"
  s.version      = "0.0.1"
  s.summary      = "一个轻量级无限轮播组件"
  s.homepage     = "https://github.com/TardisCXX/TCCarouselView"
  s.license      = "MIT"
  s.author       = { "TardisCXX" => "email@address.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/TardisCXX/TCCarouselView.git", :tag => s.version }
  s.source_files  = "TCCarouselView", "TCCarouselViewProject/TCCarouselView/*.{h,m}"
  s.requires_arc = true

end
