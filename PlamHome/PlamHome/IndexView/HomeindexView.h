//
//  indexView.h
//  PlamHome
//
//  Created by Evan on 15/9/18.
//  Copyright © 2015年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeindexViewDelegate <NSObject>

@optional
- (void)appGuiderWillClose;
- (void)appGuiderDidClose;

@end
@interface HomeindexView : UIView<UIScrollViewDelegate>
@property (nonatomic, assign) id<HomeindexViewDelegate> delegate;
@end
