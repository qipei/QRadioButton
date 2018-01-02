//
//  EIRadioButton.h
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2018年 qipei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QRadioButtonDelegate;

@interface QRadioButton : UIButton {
}

@property(nonatomic, weak)id<QRadioButtonDelegate>   delegate;
@property(nonatomic, copy, readonly)NSString            *groupId;
@property(nonatomic, assign)BOOL checked;
@property(nonatomic, strong)id userInfo;

- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId;

@end

@protocol QRadioButtonDelegate <NSObject>

@optional

- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId;

@end
