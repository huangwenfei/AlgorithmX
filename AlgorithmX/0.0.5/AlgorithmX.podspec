
Pod::Spec.new do |spec|

  spec.name         = "AlgorithmX"
  spec.version      = "0.0.5"
  spec.summary      = "Basic algorithm library."
  
  spec.description  = <<-DESC
  Basic algorithm library. Ep: LinkedList、 Stack、 Queue、... Graph .
                   DESC
                   
  spec.homepage     = "https://github.com/huangwenfei/AlgorithmX"
  spec.license      = { :type => "BSD 3-Clause", :file => "LICENSE" }
  spec.author             = { "黄文飞" => "yi.yuan.zi@163.com" }

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.15"
  spec.source       = { :git => "https://github.com/huangwenfei/AlgorithmX.git", :tag => spec.version }
  
  spec.swift_versions = ['5.1', '5.2', '5.3']
  spec.source_files  = "Sources/**/*.swift"
  spec.exclude_files = "Sources/Supporting Files/*"

end
