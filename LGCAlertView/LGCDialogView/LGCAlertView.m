//
//  LGCAlertView.m
//  pickcolor
//
//  Created by apple on 2020/9/15.
//  Copyright © 2020 apple. All rights reserved.
//

#import "LGCAlertView.h"


typedef void(^clickEvent)(BOOL confirmed);

@interface LGCAlertView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;

@property (nonatomic, copy) clickEvent Completion;
@end

@implementation LGCAlertView
{
    NSString *_title;
    NSString *_message;
    NSString *_cancelButtonTitle;
    NSString *_yesButtonTitle;
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle parentVC:(UIViewController *)parentVC completion:(void (^)(BOOL))completion {
    
    LGCAlertView *alertView = [[LGCAlertView alloc]init];
    alertView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    alertView.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [alertView alertWithTitle:title message:message cancelTitle:cancelTitle okTitle:okTitle completion:completion];
    [parentVC presentViewController:alertView animated:YES completion:nil];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle completion:(void (^)(BOOL confirmed))completion{
    
    _title = title;
    _message = message;
    _cancelButtonTitle = cancelTitle;
    _yesButtonTitle = okTitle;

    self.Completion = completion;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI {
    [self setViewConstraintsWithTitle:_title message:_message cancelTitle:_cancelButtonTitle okTitle:_yesButtonTitle];
}


-(void)setViewConstraintsWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle {
    if (!title) {
        self.titleLabel.hidden = YES;
        self.imageView.hidden = YES;
    }
    if (!message) {
        self.messageLabel.hidden = YES;
    }
    if (!cancelTitle) {
        self.cancelButton.hidden = YES;
    }
    if (!okTitle) {
        self.yesButton.hidden = YES;
    }
    self.titleLabel.text = title;
    self.messageLabel.text = message;
    [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
    [self.yesButton setTitle:okTitle forState:UIControlStateNormal];
}

-(IBAction)dismiss:(id)sender {
    !self.Completion?:self.Completion(NO);
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)didClickConfirmButton:(id)sender {
    !self.Completion?:self.Completion(YES);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
