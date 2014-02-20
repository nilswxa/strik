//
//  STKAlertView.h
//  Strik
//
//  Created by Matthijn Dijkstra on 18/11/13.
//  Copyright (c) 2013 Indev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STKAlertView : UIAlertView <UIAlertViewDelegate>

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
- (id)initWithTitle:(NSString *)title andMessage:(NSString *)message;
- (id)initWithTitle:(NSString *)title message:(NSString *)message target:(id)target yesSelector:(SEL)yesSelector andNoSelector:(SEL)noSelector;
- (id)initWithTitle:(NSString *)title message:(NSString *)message defaultValue:(NSString *)defaultValue target:(id)target okSelector:(SEL)okSelector andCancelSelector:(SEL)cancelSelector;


+ (id)alertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (id)confirmationWithTitle:(NSString *)title message:(NSString *)message target:(id)target yesSelector:(SEL)yesSelector andNoSelector:(SEL)noSelector;
+ (id)promptWithTitle:(NSString *)title message:(NSString *)message defaultValue:(NSString *)defaultValue target:(id)target okSelector:(SEL)okSelector andCancelSelector:(SEL)cancelSelector;

@end
