//
//  ZPLoadMoreFooterView.m
//  用xib自定义等高的cell
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPLoadMoreFooterView.h"

@interface ZPLoadMoreFooterView()

@property (weak, nonatomic) IBOutlet UIButton *loadMoreButton;
@property (weak, nonatomic) IBOutlet UIView *loadingMoreView;

@end

@implementation ZPLoadMoreFooterView

#pragma mark ————— 构造方法 —————
+ (instancetype)footerView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

#pragma mark ————— 点击“点击按钮加载”按钮 —————
- (IBAction)clickLoadMoreButton:(id)sender
{
    self.loadMoreButton.hidden = YES;
    self.loadingMoreView.hidden = NO;
    
    /**
     因为代理协议中的代理方法是@optional（可选的），如果本类直接调用此代理方法而遵循此代理协议的类中没有实现此代理方法的话，则程序就会崩溃。为了避免上述情况的发生，在本类中调用代理方法之前应该先调用respondsToSelector:方法来确定遵循此代理协议的类中有没有实现代理方法，如果返回YES则再进行调用。
     */
    if ([self.delegate respondsToSelector:@selector(loadMoreFooterViewDidClickLoadMoreButton:)])
    {
        [self.delegate loadMoreFooterViewDidClickLoadMoreButton:self];
    }
}

@end
