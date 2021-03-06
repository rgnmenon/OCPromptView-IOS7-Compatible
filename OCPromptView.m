//
//  OCPromptView.m
//  TextPrompt
//
//  Created by Objective Coders LLC on 12/31/10.
//

#import "OCPromptView.h"

@implementation OCPromptView

@synthesize textField;

- (id)initWithPrompt:(NSString *)prompt delegate:(id)delegate cancelButtonTitle:(NSString *)cancelTitle acceptButtonTitle:(NSString *)acceptTitle {
    
   
   // NSLog(@"%d",[prompt sizeWithFont:[UIFont systemFontOfSize:18.0]].width);
	while ([prompt sizeWithFont:[UIFont systemFontOfSize:18.0]].width > 240.0) {
		prompt = [NSString stringWithFormat:@"%@...", [prompt substringToIndex:[prompt length] - 4]];
	}
    if (self = [super initWithTitle:prompt message:@"\n" delegate:delegate cancelButtonTitle:cancelTitle otherButtonTitles:acceptTitle, nil]) {
        UITextField *theTextField ;
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7){
            self.alertViewStyle = UIAlertViewStylePlainTextInput;
             theTextField = [self textFieldAtIndex:0];
             self.delegate =delegate;
            
        }
		else
             theTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 31.0)];
        [theTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
		[theTextField setAutocapitalizationType:UITextAutocapitalizationTypeWords];
		[theTextField setBorderStyle:UITextBorderStyleRoundedRect];
		[theTextField setBackgroundColor:[UIColor clearColor]];
		[theTextField setTextAlignment:UITextAlignmentCenter];
		
        theTextField.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1/1];
        [self addSubview:theTextField];
		
        self.textField = theTextField;
        //[theTextField release];
		
		// if not >= 4.0
		NSString *sysVersion = [[UIDevice currentDevice] systemVersion];
		if (![sysVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedDescending) {
			CGAffineTransform translate = CGAffineTransformMakeTranslation(0.0, 130.0); 
			[self setTransform:translate];
		}
    }
    return self;
}

- (void)show {
  [textField becomeFirstResponder];
    [super show];
    
}

- (NSString *)enteredText {
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
      return [self textFieldAtIndex:0].text;
    else
        return  [self.textField text];

    
}

- (void)dealloc {
    self.textField =0;
    //[textField release];
    //[super dealloc];
}

@end
