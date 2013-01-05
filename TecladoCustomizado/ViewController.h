//
//  ViewController.h
//  TecladoCustomizado
//
//  Created by Rafael Brigagão Paulino on 28/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldVitima;
@property (weak, nonatomic) IBOutlet UITextView *textViewVitima;
@property (weak, nonatomic) IBOutlet UITextField *textFieldVitima2;

@property (weak, nonatomic) IBOutlet UITextField *TextFieldVitima3;
@end
