# ImagePickerEasy

[![CI Status](https://img.shields.io/travis/wajeehulhassan/ImagePickerEasy.svg?style=flat)](https://travis-ci.org/wajeehulhassan/ImagePickerEasy)
[![Version](https://img.shields.io/cocoapods/v/ImagePickerEasy.svg?style=flat)](https://cocoapods.org/pods/ImagePickerEasy)
[![License](https://img.shields.io/cocoapods/l/ImagePickerEasy.svg?style=flat)](https://cocoapods.org/pods/ImagePickerEasy)
[![Platform](https://img.shields.io/cocoapods/p/ImagePickerEasy.svg?style=flat)](https://cocoapods.org/pods/ImagePickerEasy)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ImagePickerEasy is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ImagePickerEasy'
```


```swift
   
   // A simple and easy method to pick images from your camera and gallery 
   
   ImagePickerEasy.shared.present(from: sender as! UIView, vc: self) { image in
      if image != nil{
          self.mImageView.image = image
      }
   }
   
```

## Author

wajeehulhassan, wajeeh661@gmail.com

## License

ImagePickerEasy is available under the MIT license. See the LICENSE file for more info.
