//
//  ZPLoadMoreFooterView.h
//  用xib自定义等高的cell
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPLoadMoreFooterView;

/**
 协议的命名规则：自定义控件类的名称+Delegate
 */
@protocol ZPLoadMoreFooterViewDelegate <NSObject>

/**
 自己写的代理协议里面的代理方法一般都要写“@optional”（可选的）。
 */
@optional

/**
 代理协议里面的代理方法的命名规则：根据苹果的命名规则，代理方法要把触发此方法的控件作为参数传进去；
 如果两个类之间需要用代理方法传值的话则代理方法中还需要写一个参数用来接收那个需要传递的值。
 */
-(void)loadMoreFooterViewDidClickLoadMoreButton:(ZPLoadMoreFooterView *)footer;

@end

@interface ZPLoadMoreFooterView : UIView

/**
 代理属性用weak关键字来修饰
 */
@property (nonatomic, weak) id <ZPLoadMoreFooterViewDelegate> delegate;

//构造方法
+ (instancetype)footerView;

@end
