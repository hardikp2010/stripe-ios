//
//  STPThreeDSUICustomization.m
//  StripeiOS
//
//  Created by Yuki Tokuhiro on 6/17/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

#import "STPThreeDSUICustomization.h"
#import "STPThreeDSCustomization+Private.h"
#import "STPThreeDSFooterCustomization.h"

#import <Stripe3DS2/STDSUICustomization.h>

@interface STPThreeDSUICustomization()
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, STPThreeDSButtonCustomization *> *buttonCustomizationDictionary;
@end

@implementation STPThreeDSUICustomization

+ (instancetype)defaultSettings {
    return [STPThreeDSUICustomization new];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _uiCustomization = [STDSUICustomization new];
        _buttonCustomizationDictionary = [@{
                                            @(STPThreeDSCustomizationButtonTypeNext): [STPThreeDSButtonCustomization defaultSettingsForButtonType:STPThreeDSCustomizationButtonTypeNext
                                                                                   ],
                                            @(STPThreeDSCustomizationButtonTypeCancel): [STPThreeDSButtonCustomization defaultSettingsForButtonType:STPThreeDSCustomizationButtonTypeCancel],
                                            @(STPThreeDSCustomizationButtonTypeResend): [STPThreeDSButtonCustomization defaultSettingsForButtonType:STPThreeDSCustomizationButtonTypeResend],
                                            @(STPThreeDSCustomizationButtonTypeSubmit): [STPThreeDSButtonCustomization defaultSettingsForButtonType:STPThreeDSCustomizationButtonTypeSubmit],
                                            @(STPThreeDSCustomizationButtonTypeContinue): [STPThreeDSButtonCustomization defaultSettingsForButtonType:STPThreeDSCustomizationButtonTypeContinue],
                                            } mutableCopy];
    }
    return self;
}

- (void)setButtonCustomization:(STPThreeDSButtonCustomization *)buttonCustomization forType:(STPThreeDSCustomizationButtonType)buttonType {
    self.buttonCustomizationDictionary[@(buttonType)] = buttonCustomization;
    [self.uiCustomization setButtonCustomization:buttonCustomization.buttonCustomization forType:(STDSUICustomizationButtonType)buttonType];
}

- (STPThreeDSButtonCustomization *)buttonCustomizationForButtonType:(STPThreeDSCustomizationButtonType)buttonType {
    return self.buttonCustomizationDictionary[@(buttonType)];
}

- (void)setFooterCustomization:(STPThreeDSFooterCustomization *)footerCustomization {
    _footerCustomization = footerCustomization;
    self.uiCustomization.footerCustomization = footerCustomization.footerCustomization;
}

- (void)setLabelCustomization:(STPThreeDSLabelCustomization *)labelCustomization {
    _labelCustomization = labelCustomization;
    self.uiCustomization.labelCustomization = labelCustomization.labelCustomization;
}

@end
