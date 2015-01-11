//
//  UINavigationItem+Loading.h
//  Pods
//
//  Created by Anton Gaenko on 09.01.15.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ANNavBarLoaderPosition) {
    ANNavBarLoaderPositionCenter = 0,
    ANNavBarLoaderPositionLeft,
    ANNavBarLoaderPositionRight
};

@interface UINavigationItem (Loading)

- (void)startAnimatingAt:(ANNavBarLoaderPosition)position;
- (void)stopAnimating;

@end
