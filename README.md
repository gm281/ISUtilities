ISUtilities
===========

Objective-C utility classes used in various InSeven Limited libraries and projects.

Classes
-------

### ISNotifier

A lightweight notificaion mechanism for observers for situations where NSNotificationCenter requires too much boiler-plate code or isn't explicit enough:


```objc
#import <ISUtilities/ISUtilities.h>
    
// Construct the notifier.
ISNotifier *notifier = [ISNotifier new];

// Add an observer.
id anObserver = [YourCustomClass new];
[notifier addObserver:anObserver];

// Notifying all observers.
[notifier notify:@selector(didUpdate:) 
      withObject:self];

// Remove the observer (optional)
[notifier removeObserver:anObserver];
```

Notes:

- Observers are added and removed with the `addObserver:` and `removeObserver:` methods.
- Observers are weakly referenced so it is not necessary to remove them when observers are released.
- Notifications are dispatched to all observers which respond to a given selector using the `notify:withObject:withObject:...` methods. 
- It is recommended that you wrap the calls to `addObserver:` and `removeObserver:` with ones which enforce a protocol to avoid adding the wrong type of class or simply failing to implement one of your observer selectors.


### NSDictionary+JSON

JSON serialization and de-serialization category for NSDictionary:

```objc
#import <ISUtilities/ISUtilities.h>

// Serialization.
NSDictionary *outDict = @{@"title": @"cheese"};
NSString *json = [outDict JSON];
NSLog(@"%@", json); // {"title": "cheese"}

// De-serialization.
NSDictionary *inDict = [NSDictionary dictionaryWithJSON:json];
NSLog(@"Title: %@", outDict[@"title"]); // Title: cheese
```


### NSObject+Serialize

Category for checking whether an NSObject can be serialized using the `writeToFile:atomically:` and `writeToURL:atomically:` methods:

```objc
#import <ISUtilities/ISUtilities.h>

NSDictionary *valid =
@{@"items":
  @[@"one",
    @"two",
    @"three"]};
BOOL checkValid = [valid canWriteToFile]; // YES

NSArry *invalid =
@[[YourCustomClass new],
  [YourCustomClass new]];
BOOL checkInvalid = [invalid canWriteToFile]; // NO
```

This can prove userful if it is necessary to ensure that an NSDictionary or NSArray and its contents can be safely stored to file. It works by validating that every object is an instance of `NSData`, `NSDate`, `NSNumber`, `NSString`, `NSArray`, or `NSDictionary` (as described in the documentation for `NSArray`  and `NSDictionary`).


### UIAlertView+Block
### UIApplication+Activity
### UIImage+Utilities
### UIView+Parent
