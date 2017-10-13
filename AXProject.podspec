

Pod::Spec.new do |s|



  s.name         = "AXProject"
  s.version      = "0.0.4"
  s.summary      = "项目列表"

  s.description  = <<-DESC

		玩转组件化-项目列表类
                   DESC

  s.homepage     = "https://github.com/GG-beyond/AXProject"




  s.license      = "MIT"

  s.author             = { "GG-beyond" => "872608550@qq.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/GG-beyond/AXProject.git", :tag => "0.0.4" }
  

#  s.source_files = "AXProject/AXProject/**"

    s.subspec 'Models' do |mod|

        mod.source_files =  'AXProject/AXProject/Models/*.{h,m}'
    end

    s.subspec 'ViewModels' do |vm|

        vm.source_files =  'AXProject/AXProject/ViewModels/*.{h,m}'
        vm.dependency 'AXProject/Models'


    end

    s.subspec 'ViewControllers' do |shared|

        shared.source_files =  'AXProject/AXProject/ViewControllers/*.{h,m}'
        shared.dependency 'AXProject/ViewModels'
        shared.dependency 'AXProject/Views'

    end

    s.subspec 'Views' do |app|

        app.source_files =  'AXProject/AXProject/Views/*.{h,m}'
        app.dependency 'AXProject/Models'

    end
       
    s.subspec 'CTMediatorCategory' do |ct|

        ct.source_files =  'AXUserInfo/AXUserInfo/CTMediatorCategory/*.{h,m}'
        ct.dependency 'AXUserInfo/ViewControllers'

    end


  s.exclude_files = "Classes/Exclude"
  s.prefix_header_file = "AXProject/MyConstants.h"
  s.dependency 'CTMediator', '~> 12'
  s.dependency 'AFNetworking', '~> 3.1.0'
  s.dependency 'Categories-AX','~> 0.1.0'
  s.dependency 'AX-HttpClientTool','~> 0.0.4'
  s.dependency 'Masonry','~> 1.0.2'

end
