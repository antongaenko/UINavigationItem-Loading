//
//  UINavigationItem+Loading.m
//  Pods
//
//  Created by Anton Gaenko on 09.01.15.
//
//

#import "UINavigationItem+Loading.h"
#import <objc/runtime.h>

static void *ANLoaderPositionAssociationKey = &ANLoaderPositionAssociationKey;
static void *ANSubstitutedViewAssociationKey = &ANSubstitutedViewAssociationKey;

@implementation UINavigationItem (Loading)

- (void)startAnimatingAt:(ANNavBarLoaderPosition)position {
    // stop previous if animated
    [self stopAnimating];
    
    // hold reference for position to stop at the right place
    objc_setAssociatedObject(self, ANLoaderPositionAssociationKey, @(position), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIActivityIndicatorView* loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    // substitute bar views to loader and hold reference to them for restoration
    switch (position) {
        case ANNavBarLoaderPositionLeft:
            objc_setAssociatedObject(self, ANSubstitutedViewAssociationKey, self.leftBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.leftBarButtonItem.customView = loader;
            break;
            
        case ANNavBarLoaderPositionCenter:
            objc_setAssociatedObject(self, ANSubstitutedViewAssociationKey, self.titleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.titleView = loader;
            break;
            
        case ANNavBarLoaderPositionRight:
            objc_setAssociatedObject(self, ANSubstitutedViewAssociationKey, self.rightBarButtonItem.customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.rightBarButtonItem.customView = loader;
            break;
    }
    
    [loader startAnimating];
}

- (void)stopAnimating {
    NSNumber* positionToRestore = objc_getAssociatedObject(self, ANLoaderPositionAssociationKey);
    id componentToRestore = objc_getAssociatedObject(self, ANSubstitutedViewAssociationKey);
    
    // restore UI if animation was in a progress
    if (positionToRestore) {
        switch (positionToRestore.intValue) {
            case ANNavBarLoaderPositionLeft:
                self.leftBarButtonItem.customView = componentToRestore;
                break;
                
            case ANNavBarLoaderPositionCenter:
                self.titleView = componentToRestore;
                break;
                
            case ANNavBarLoaderPositionRight:
                self.rightBarButtonItem.customView = componentToRestore;
                break;
        }
    }
    
    objc_setAssociatedObject(self, ANLoaderPositionAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, ANSubstitutedViewAssociationKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
