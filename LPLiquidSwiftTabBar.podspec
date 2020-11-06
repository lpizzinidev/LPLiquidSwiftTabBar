
Pod::Spec.new do |spec|
  spec.name         = "LPLiquidSwiftTabBar"
  spec.version      = "0.0.1"
  spec.summary      = "An animated tab bar built in Swift."
  spec.description  = <<-DESC
	`LPLiquidSwiftTabBar` is an animated and customizable widget that can be used in iOS app. You can attach to it a maximum of 5 tabs with the associated view controllers.
  DESC
  spec.homepage     = "https://github.com/Pizzo15/LPLiquidSwiftTabBar.git"
  spec.license      = "MIT"
  spec.author       = { "Luca Pizzini" => "lpizzini7@gmail.com" }

  spec.platform     = :ios, "12.0"

  spec.ios.deployment_target = "12.0"

  spec.source       = { :git => "https://github.com/Pizzo15/LPLiquidSwiftTabBar.git", :tag => spec.version.to_s }
 
  spec.source_files  = "LPLiquidSwiftTabBar/*.swift"

  spec.swift_versions = ["5.1", "5.2", "5.3"]

end
