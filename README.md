
![Banner](https://github.com/Pizzo15/LPLiquidSwiftTabBar/blob/main/images/banner.jpg)

# LPLiquidSwiftTabBar

`LPLiquidSwiftTabBar` is an easy to use, animated, elegant, tab bar for iOS.

![LPLiquidSwiftTabBar](https://github.com/Pizzo15/LPLiquidSwiftTabBar/blob/main/images/banner_video_new.gif)

## Usage

### Basic

In your `.storyboard` file create a new `UIViewController` and add a `UIView` to it, setting its leading and trailing constraints.

Make sure this `UIView` implements the `LPLiquidSwiftTabBar` class.

![Class](https://github.com/Pizzo15/LPLiquidSwiftTabBar/blob/main/images/class_module.png)

Link the `LPLiquidSwiftTabBar` view to the `UIViewController` generating a new `IBOutlet` in it:
```
@IBOutlet weak var liquidTabBar: LPLiquidSwiftTabBar!
```

You can start adding tab items using the `add(newLiquidTabBarItem: LPLiquidSwiftTabBarItem, withViewController: UIViewController)`:
```
let homeLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Home", image:  UIImage(systemName: "house")!)
liquidTabBar.add(newLiquidTabBarItem: homeLiquidTabItem, withViewController: UIViewController())
```

### Customize 

You can customize your `LPLiquidSwiftTabBar` by specifying the available attributes **before** you start adding `LPLiquidSwiftTabBarItem` to it.
For example:
```
liquidTabBar.tabBarItemFont = UIFont.boldSystemFont(ofSize: 17)
```

See below for the complete list of available methods and attributes.

## Installation 

### CocoaPods

`LPLiquidSwiftTabBar` is available for installation trough [CocoaPods](https://cocoapods.org). For usage and installation instruction, visit their website.
To install this library simply add this line in your `Podfile`:
```
pod 'LPLiquidSwiftTabBar'
```

### Carthage

`LPLiquidSwiftTabBar` is available for installation trough [Carthage](https://github.com/Carthage/Carthage). For usage and installation instruction, visit their website.
To integrate this library add this line in your `Cartfile`:
```
github "Pizzo15/LPLiquidSwiftTabBar"
```

### Manual

1. Open up Terminal application and `cd` into your iOS project directory

2. **ONLY IF** your project is not already initialized as a git repository, run
```
$ git init
```

3. Add `LPLiquidSwiftTabBar` as a submodule by running
```
$ git submodule add https://github.com/Pizzo15/LPLiquidSwiftTabBar.git
```

4. Open the project folder and drag the `LPLiquidSwiftTabBar.xcodeproj` file into the Project Navigator of your application.
You should drag it at the same level of your blue project icon.
Then click Save on the Xcode dialog that shows up.

5. In the Project Navigator, select your application project and go to "Targets" -> "General"

6. Click the `+` button under the "Frameworks, Libraries, and Embedded Content" section and `Add` the `LPLiquidSwiftTabBar.framework`

## How to use 

### Setup

Via `storyboard`, add a `UIView` element and set its class and model to `LPLiquidSwiftTabBar`.
Then link the `LPLiquidSwiftTabBar` element to a `IBOutlet` variable in your `UIViewController`.
```
@IBOutlet weak var liquidTabBar: LPLiquidSwiftTabBar!
```

You can start adding tab items to the tab bar by using the `add(newLiquidTabBarItem: LPLiquidSwiftTabBarItem, withViewController: UIViewController)` method.
The method takes two arguments:

1. A new `LPLiquidSwiftTabBarItem`, with a title of type `String`, which is shown when the tab is selected, and a `UIImage`, which is shown when the tab is not selected. 
You can create your `LPLiquidSwiftTabBarItem` using:
```
let tabItem = LPLiquidSwiftTabBarItem(title: "Example", image:  UIImage(systemName: "bell")!)
```

2. The `UIViewController` you want to show when the tab item is selected. You can create your `UIViewController` programmatically with 
```
let vc = UIViewController()
```
or you can pass a reference of an existing `UIViewController` using 
```
let vcIdentifier = "<your-vc-identifier>"
let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: vcIdentifier) as! <your-vc>
```

Finally, add the new element to the tab bar:
```
liquidTabBar.add(newLiquidTabBarItem: tabItem, withViewController: vc)
```

**Important:** `LPLiquidSwiftTabBarItem` allows to use up to 5 tab items.

### Methods

Name | Description
---- | -----------
add(newLiquidTabBarItem: LPLiquidSwiftTabBarItem, withViewController: UIViewController) | Add a new `LPLiquidSwiftTabBarItem` to the `LPLiquidSwiftTabBar`. It allows to add up to 5 `LPLiquidSwiftTabBarItem`.
selectTab(atIndex: Int) | Programmatically select the `LPLiquidSwiftTabBarItem` at the specified index, if available.

### Attributes

Property | Description | Default value
-------- | ----------- | -------------
selectedTabItem | **Int** Preselected tab item | 0
tabBarHeight | **CGFloat** The height of the bar | 72
tabBarItemTintColor | **UIColor** The color of the unselected items in the tab bar | .black
tabBarSelectedItemTintColor | **UIColor** The tint color of the selected item in the tab bar | .black
tabBarItemFont | **UIFont** The font of the text of the selected tab bar item | UIFont.systemFont(ofSize: 16.0)
animationDuration | **Double** The duration of the animations ofthe switch of `UIViewController` and tab bar selected item | 0.25

## License

`LPLiquidSwiftTabBar` is available under the MIT license. See the LICENSE file for more info.
