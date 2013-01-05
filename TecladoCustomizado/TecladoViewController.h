//
//  TecladoViewController.h
//  TecladoCustomizado
//
//  Created by Rafael Brigagão Paulino on 28/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TecladoViewControllerDelegate <NSObject>

-(BOOL)tecladoDeveProcessarCliqueNoReturn:(UITextField*)campoDeTexto;

@end

@interface TecladoViewController : UIViewController

@property (nonatomic, strong) IBOutletCollection(UIButton)NSArray *botoesTeclado;

//precisamos guardar dentro do teclado a instancia do campo que esta em foco. como nao sabemos se ele e do tipo textfield ou textview, criamos como ID
@property (nonatomic, weak) id target;

- (IBAction)botaoTextoPressionado:(UIButton *)sender;
- (IBAction)botaoCapsLockPressionado:(UIButton *)sender;
- (IBAction)botaoApagarTexto:(UIButton *)sender;

- (IBAction)cliqueReturn:(UIButton *)sender;


@property (nonatomic, weak) id <TecladoViewControllerDelegate> delegate;

@end
