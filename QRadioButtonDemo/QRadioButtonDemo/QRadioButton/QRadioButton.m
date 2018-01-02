//
//  QRadioButton.m
//  QRadioButton
//
//  Created by qipei on 18-1-2.
//  Copyright (c) 2018年 qipei. All rights reserved.
//

#import "QRadioButton.h"

#define Q_RADIO_ICON_WH                     (16.0)
#define Q_ICON_TITLE_MARGIN                 (5.0)


static NSMapTable *_groupRadioDic = nil;

@implementation QRadioButton

- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId {
    self = [super init];
    if (self) {
        _delegate = delegate;
        _groupId = groupId;
        
        [self addToGroup];
        
        self.exclusiveTouch = YES;
        
        [self setImage:[UIImage imageNamed:@"radio_unchecked.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"radio_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(radioBtnChecked) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)addToGroup {
    if(!_groupRadioDic) {
        _groupRadioDic = [NSMapTable weakToStrongObjectsMapTable];
    }
    
    NSHashTable *_gRadios = [_groupRadioDic objectForKey:_groupId];
    if (!_gRadios) {
        _gRadios = [NSHashTable weakObjectsHashTable];
    }
    [_gRadios addObject:self];
    [_groupRadioDic setObject:_gRadios forKey:_groupId];
}


- (void)removeFromGroup {
    if (_groupRadioDic) {
        [_groupRadioDic removeObjectForKey:_groupId];
//        NSMutableArray *_gRadios = [_groupRadioDic objectForKey:_groupId];
//        if (_gRadios) {
//            [_gRadios removeObject:self];
//            if (_gRadios.count == 0) {
//                [_groupRadioDic removeObjectForKey:_groupId];
//            }
//        }
    }
}


- (void)uncheckOtherRadios {
    NSHashTable *_gRadios = [_groupRadioDic objectForKey:_groupId];
    if (_gRadios.count > 0) {
        for (QRadioButton *_radio in _gRadios) {
            if (_radio.checked && ![_radio isEqual:self]) {
                _radio.checked = NO;
            }
        }
    }
}

- (void)setChecked:(BOOL)checked {
    if (_checked == checked) {
        return;
    }
    
    _checked = checked;
    self.selected = checked;
    
    if (self.selected) {
        [self uncheckOtherRadios];
    }
    
    if (self.selected && _delegate && [_delegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)]) {
        [_delegate didSelectedRadioButton:self groupId:_groupId];
    }
}

- (void)radioBtnChecked {
    if (_checked) {
        return;
    }
    
    self.selected = !self.selected;
    _checked = self.selected;
    
    if (self.selected) {
        [self uncheckOtherRadios];
    }
    
    if (self.selected && _delegate && [_delegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)]) {
        [_delegate didSelectedRadioButton:self groupId:_groupId];
        
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, (CGRectGetHeight(contentRect) - Q_RADIO_ICON_WH)/2.0, Q_RADIO_ICON_WH, Q_RADIO_ICON_WH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(Q_RADIO_ICON_WH + Q_ICON_TITLE_MARGIN, 0,
                      CGRectGetWidth(contentRect) - Q_RADIO_ICON_WH - Q_ICON_TITLE_MARGIN,
                      CGRectGetHeight(contentRect));
}



- (void)dealloc {
    _delegate = nil;
    _groupId = nil;
    _userInfo = nil;
    [self removeFromGroup];
}


@end
