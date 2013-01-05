//
//  TecladoViewController.m
//  TecladoCustomizado
//
//  Created by Rafael Brigagão Paulino on 28/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "TecladoViewController.h"

@interface TecladoViewController ()
{
    BOOL capsAtivo;
}

@end

@implementation TecladoViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)botaoTextoPressionado:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        //botao de texto
        NSString *texto = [sender titleForState:UIControlStateNormal];
        
        //devemos verificar de qual classe é o target
        if ([_target isKindOfClass:[UITextField class]])
        {
            UITextField *campo = _target;
            campo.text = [campo.text stringByAppendingString:texto];
        }
        else
        {
            UITextField *campo = _target;
            campo.text = [campo.text stringByAppendingString:texto];
        }
    }
    else
    {
        //botao de espaco
        //devemos verificar de qual classe é o target
        if ([_target isKindOfClass:[UITextField class]])
        {
            UITextField *campo = _target;
            campo.text = [campo.text stringByAppendingString:@" "];
        }
        else
        {
            UITextField *campo = _target;
            campo.text = [campo.text stringByAppendingString:@" "];
        }
    }
}

- (IBAction)botaoCapsLockPressionado:(UIButton *)sender
{
    if (!capsAtivo)
    {
        for (int i = 0; i<[_botoesTeclado count]; i++)
        {
            NSString *textoBotao = [[_botoesTeclado objectAtIndex:i] titleForState:UIControlStateNormal];
            
            textoBotao = [textoBotao uppercaseString];
            
            [[_botoesTeclado objectAtIndex:i] setTitle:textoBotao forState:UIControlStateNormal];
        }
    }
    else
    {
        for (int i = 0; i<[_botoesTeclado count]; i++)
        {
            NSString *textoBotao = [[_botoesTeclado objectAtIndex:i] titleForState:UIControlStateNormal];
            
            textoBotao = [textoBotao lowercaseString];
            
            [[_botoesTeclado objectAtIndex:i] setTitle:textoBotao forState:UIControlStateNormal];
        }
        
    }
    
    capsAtivo = !capsAtivo;

}

- (IBAction)botaoApagarTexto:(UIButton *)sender
{
    if ([_target isKindOfClass:[UITextField class]])
    {
        UITextField *campo = _target;
        
        if (campo.text.length > 0)
        {
            campo.text = [campo.text substringToIndex:[campo.text length] -1];
        }
    }
    else
    {
        UITextField *campo = _target;
        
        if (campo.text.length > 0)
        {
           campo.text = [campo.text substringToIndex:[campo.text length] -1]; 
        }
    }
}

- (IBAction)cliqueReturn:(UIButton *)sender
{
    BOOL devePularLinha = [_delegate tecladoDeveProcessarCliqueNoReturn:_target];
    
    if (devePularLinha)
    {
        //pular linha add um \n
    }
    else
    {
        //nao pular linha
    }
}
@end
