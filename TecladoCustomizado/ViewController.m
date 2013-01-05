//
//  ViewController.m
//  TecladoCustomizado
//
//  Created by Rafael Brigagão Paulino on 28/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "ViewController.h"
#import "TecladoViewController.h"

@interface ViewController ()
{
    TecladoViewController *teclado;
}

@end

@implementation ViewController
@synthesize textFieldVitima;
@synthesize textViewVitima;
@synthesize textFieldVitima2;
@synthesize TextFieldVitima3;

//metodos acionados quando o textfiled ou textview é selecionado
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   //textField
    //passar a instancia do campo selecionado
    teclado.target = textField;
}

-(BOOL)tecladoDeveProcessarCliqueNoReturn:(UITextField *)campoDeTexto
{
    if (campoDeTexto == textFieldVitima)
    {
        [textFieldVitima2 becomeFirstResponder];
    }
    else if (campoDeTexto == textFieldVitima2)
    {
        [TextFieldVitima3 becomeFirstResponder];
    }
    
    else if (campoDeTexto == TextFieldVitima3)
    {
        [TextFieldVitima3 resignFirstResponder];
    }
    
    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
   //textView
    //passar a instancia do campo selecionado
    teclado.target = textView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //carregar a interface do teclado
    teclado = [self.storyboard instantiateViewControllerWithIdentifier:@"idTeclado"];
    
    textFieldVitima.inputView = teclado.view;
    textFieldVitima2.inputView = teclado.view;
    TextFieldVitima3.inputView = teclado.view;
    textViewVitima.inputView = teclado.view;
    
    //barra para ser acessorio do teclado
    UIToolbar *barra = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    [barra setBarStyle:UIBarStyleBlack];
    
    //criando um botao para colocar dentro da barra
    UIBarButtonItem *btnFechar = [[UIBarButtonItem alloc] initWithTitle:@"Fechar" style:UIBarButtonItemStyleBordered target:self action:@selector(fecharTeclado)];
    
    //adicionar o botao nabarra
    [barra setItems:[NSArray arrayWithObject:btnFechar]];
    
    //associar a barra aos campos
    textFieldVitima.inputAccessoryView = barra;
    textViewVitima.inputAccessoryView = barra;
    
    
}

-(void)fecharTeclado
{
    [teclado.target resignFirstResponder];
}


- (void)viewDidUnload
{
    [self setTextFieldVitima:nil];
    [self setTextViewVitima:nil];
    [self setTextFieldVitima2:nil];
    [self setTextFieldVitima3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
