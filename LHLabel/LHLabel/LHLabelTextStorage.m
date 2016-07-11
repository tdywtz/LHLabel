//
//  LHLabelTextStorage.m
//  LHLabel
//
//  Created by bangong on 16/7/7.
//  Copyright © 2016年 auto. All rights reserved.
//

#import "LHLabelTextStorage.h"

//CTRun的回调，销毁内存的回调
void LHTextRunDelegateDeallocCallback(void * refCon ){
    //LHLabelTextStorage *textStorag = (__bridge LHLabelTextStorage *)refCon;
    //[textStorag DrawRunDealloc];
}

//CTRun的回调，获取高度
CGFloat LHTextRunDelegateGetAscentCallback(void * refCon){
    LHLabelTextStorage *textStorag = (__bridge LHLabelTextStorage *)refCon;
    return [textStorag getAscent];
}

CGFloat LHTextRunDelegateGetDescentCallback(void * refCon){

    LHLabelTextStorage *textStorag = (__bridge LHLabelTextStorage *)refCon;
    return [textStorag getDescent];
}

//CTRun的回调，获取宽度
CGFloat LHTextRunDelegateGetWidthCallback(void * refCon){

     LHLabelTextStorage *textStorag = (__bridge LHLabelTextStorage *)refCon;

     return textStorag.drawSize.width;
}


@implementation LHLabelTextStorage

- (void)dealloc
{
    if ([_draw isKindOfClass:[UIView class]]) {
        [((UIView *)_draw) removeFromSuperview];
    }
}
- (instancetype)initWithData:(id)data{
    if (self = [super init]) {
        self.returnData = data;
    }
    return self;
}

+ (instancetype)initWithData:(id)data draw:(id)draw size:(CGSize)size{
    LHLabelTextStorage *storage = [[LHLabelTextStorage alloc] initWithData:data];
    storage.draw = draw;
    storage.drawSize = size;
    storage.imageAlignment = ImageAlignmentTop;
    return storage;
}

- (CGFloat)getAscent{
    CGFloat ascent = 0;
    if (self.imageAlignment == ImageAlignmentTop) {
        ascent = self.drawSize.height;
    }else if (self.imageAlignment == ImageAlignmentCenter){
      ascent = self.drawSize.height/2;
    }else{
       ascent = 0;
    }
    return ascent;
}

- (CGFloat)getDescent{
    CGFloat ascent = 0;
    if (self.imageAlignment == ImageAlignmentTop) {
        ascent = 0;
    }else if (self.imageAlignment == ImageAlignmentCenter){
        ascent = self.drawSize.height/2;
    }else{
        ascent = self.drawSize.height;
    }
    return ascent;
}

@end
