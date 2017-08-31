

Pod::Spec.new do |s|



  s.name         = "AXProject"
  s.version      = "0.0.1"
  s.summary      = "项目列表"

  s.description  = <<-DESC

		玩转组件化-项目列表类
                   DESC

  s.homepage     = "https://github.com/GG-beyond/AXProject"




  s.license      = "MIT"

  s.author             = { "GG-beyond" => "872608550@qq.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/GG-beyond/AXProject.git", :tag => "0.0.1" }


  

  s.source_files  = "AXProject/AXProject/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.prefix_header_contents = '#import "MyConstants.h"'
  
  # s.dependency "JSONKit", "~> 1.4"
  s.dependency 'CTMediator', '~> 12'
  s.dependency 'AFNetworking', '~> 3.1.0'
  s.dependency 'Categories-AX','~> 0.1.0'
  s.dependency 'AX-HttpClientTool','~> 0.0.4'
  s.dependency 'Masonry','~> 1.0.2'

end
