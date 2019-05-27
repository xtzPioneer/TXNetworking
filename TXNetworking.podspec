#
# Be sure to run `pod lib lint TXNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  # 组件名称
  s.name             = 'TXNetworking'
  # 组件版本
  s.version          = '0.1.1'
  # 组件概要说明
  s.summary          = '基于AFNetworking开发的网络管理工具,采用了链式编程、函数式编程、以及离散式编程。使其降低开发成本、提升开发速率。'
  # 组件详细说明
  s.description      = <<-DESC
  基于AFNetworking开发的网络管理工具,采用了链式编程、函数式编程、以及离散式编程。使其降低开发成本、提升开发速率。该框架还采用了扩展式开发使其易扩展、易更改。
                       DESC
  # 首页地址
  s.homepage         = 'https://github.com/xtzPioneer/TXNetworking'
  # 许可
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  # 作者
  s.author           = { 'xtzPioneer' => 'xtz_pioneer@163.com' }
  # 资源所在地
  s.source           = { :git => 'https://github.com/xtzPioneer/TXNetworking.git', :tag => s.version.to_s }
  # 支持的版本
  s.ios.deployment_target = '8.0'
  # 资源文件
  s.source_files = 'TXNetworking/Classes/**/*.{h,m}'
  # 依赖
  s.dependency 'AFNetworking' , '~> 3.2.1'
end
