# Moya-JASONMapper

[![Version](https://img.shields.io/cocoapods/v/Moya-JASONMapper.svg?style=flat)](http://cocoapods.org/pods/Moya-JASONMapper)
[![Build Status](https://travis-ci.org/AvdLee/Moya-JASONMapper.svg?style=flat&branch=master)](https://travis-ci.org/AvdLee/Moya-JASONMapper)
[![Language](https://img.shields.io/badge/language-swift3.0-f48041.svg?style=flat)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/Moya-JASONMapper.svg?style=flat)](http://cocoapods.org/pods/Moya-JASONMapper)
[![Platform](https://img.shields.io/cocoapods/p/Moya-JASONMapper.svg?style=flat)](http://cocoapods.org/pods/Moya-JASONMapper)
[![Twitter](https://img.shields.io/badge/twitter-@twannl-blue.svg?style=flat)](http://twitter.com/twannl)

## Installation

Moya-JASONMapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Moya-JASONMapper"
```

The subspec if you want to use the bindings over RxSwift.

```ruby
pod "Moya-JASONMapper/RxSwift"
```

And the subspec if you want to use the bindings over ReactiveCocoa.

```ruby
pod "Moya-JASONMapper/ReactiveCocoa"
```

#### Swift version vs Pod version
| Swift version | Pod version    |
| ------------- | --------------- |
| 3.X           | >= 2.0.0			|
| 2.3           | 1.0.0			   |

## Usage

### Example project
To run the example project, clone the repo, and run `pod install` from the Example directory first. It includes sample code and unit tests.


### Model definitions
Create a `Class` or `Struct` which implements the `Mappable` protocol.

```swift
import Foundation
import Moya_JASONMapper
import JASON

final class GetResponse : ALJSONAble {
    
    let url:NSURL?
    let origin:String
    let args:[String: String]?
    
    required init?(jsonData:JSON){
        self.url = jsonData["url"].nsURL
        self.origin = jsonData["origin"].stringValue
        self.args = jsonData["args"].object as? [String : String]
    }
    
}
```

### 1. Without RxSwift or ReactiveCocoa
```swift
stubbedProvider.request(ExampleAPI.getObject) { (result) -> () in
    switch result {
    case let .success(response):
        do {
            let getResponseObject = try response.map(to: GetResponse.self)
            print(getResponseObject)
        } catch {
            print(error)
        }
    case let .failure(error):
        print(error)
    }
}
```

### 2. With ReactiveCocoa
```swift
RCStubbedProvider.request(token: ExampleAPI.getObject)
    .map(to: GetResponse.self)
    .on(failed: { (error) -> () in
        print(error)
    }) { (response) -> () in
        print(response)
    }.start()
```

### 3. With RxSwift
```swift
let disposeBag = DisposeBag()

RXStubbedProvider.request(ExampleAPI.getObject)
    .map(to: GetResponse.self)
    .subscribe(onNext: { (response) -> Void in
        print(response)
    }, onError: { (error) -> Void in
        print(error)
    }).addDisposableTo(disposeBag)
```

## Other repo's
If you're using [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON), checkout [Moya-SwiftyJSONMapper](https://github.com/AvdLee/Moya-SwiftyJSONMapper)

## Author

Antoine van der Lee 

Mail: [info@avanderlee.com](mailto:info@avanderlee.com)  
Home: [www.avanderlee.com](https://www.avanderlee.com)  
Twitter: [@twannl](https://www.twitter.com/twannl)
## License

Moya-JASONMapper is available under the MIT license. See the LICENSE file for more info.
