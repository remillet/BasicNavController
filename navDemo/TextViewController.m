/*
 File: TextViewController.m 
 Abstract: The view controller for hosting the UITextView features of this sample. 
 Version: 2.9 
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple 
 Inc. ("Apple") in consideration of your agreement to the following 
 terms, and your use, installation, modification or redistribution of 
 this Apple software constitutes acceptance of these terms.  If you do 
 not agree with these terms, please do not use, install, modify or 
 redistribute this Apple software. 
 
 In consideration of your agreement to abide by the following terms, and 
 subject to these terms, Apple grants you a personal, non-exclusive 
 license, under Apple's copyrights in this original Apple software (the 
 "Apple Software"), to use, reproduce, modify and redistribute the Apple 
 Software, with or without modifications, in source and/or binary forms; 
 provided that if you redistribute the Apple Software in its entirety and 
 without modifications, you must retain this notice and the following 
 text and disclaimers in all such redistributions of the Apple Software. 
 Neither the name, trademarks, service marks or logos of Apple Inc. may 
 be used to endorse or promote products derived from the Apple Software 
 without specific prior written permission from Apple.  Except as 
 expressly stated in this notice, no other rights or licenses, express or 
 implied, are granted by Apple herein, including but not limited to any 
 patent rights that may be infringed by your derivative works or by other 
 works in which the Apple Software may be incorporated. 
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION 
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND 
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS. 
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL 
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, 
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED 
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), 
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE 
 POSSIBILITY OF SUCH DAMAGE. 
 
 Copyright (C) 2011 Apple Inc. All Rights Reserved. 
 
 */

#import "TextViewController.h"

@implementation TextViewController

@synthesize textView;

- (void)dealloc
{
	[textView release];
	[super dealloc];
}

- (void)setupTextView
{
	self.textView = [[[UITextView alloc] initWithFrame:self.view.frame] autorelease];
	self.textView.textColor = [UIColor blackColor];
	self.textView.font = [UIFont fontWithName:@"Arial" size:12.0];
	self.textView.delegate = self;
	self.textView.backgroundColor = [UIColor whiteColor];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"documentsDirectory %@\n", documentsDirectory);
	
	//make a file name to read the text view data from the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textViewContent.txt", 
                          documentsDirectory];

	//Read the second string.
	NSError *error = nil;
    NSString *string2FromFileAtPath = [[NSString alloc]
                                       initWithContentsOfFile:fileName
                                       encoding:NSUTF8StringEncoding
                                       error:&error];
    if (error) {
        NSLog(@"Error reading file at %@\n%@\n",
              fileName, [error localizedFailureReason]);
        [error release];
        error = nil;
    }
    NSLog(@"text view data %@\n", string2FromFileAtPath);
	
	if (string2FromFileAtPath) {
		self.textView.text = string2FromFileAtPath;
	} else {
		self.textView.text = @"Look, how the floor of heaven\nIs thick inlaid with patines of bright gold;\nThere's not the smallest orb which thou behold'st\nBut in his motion like an angel sings ...\nSuch harmony is in immortal souls;\nBut, whilst this muddy vesture of decay\nDoth grossly close it in, we cannot hear it.\n\n";
	}

	self.textView.returnKeyType = UIReturnKeyDefault;
	self.textView.keyboardType = UIKeyboardTypeDefault;	// use the default type input method (entire keyboard)
	self.textView.scrollEnabled = YES;
	
	// this will cause automatic vertical resize when the table is resized
	self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	
	// note: for UITextView, if you don't like autocompletion while typing use:
	// myTextView.autocorrectionType = UITextAutocorrectionTypeNo;
	
	[self.view addSubview: self.textView];

}

- (void)viewDidAppear:(BOOL)animated
{
	NSLog(@"View did appear.");	
}

- (void)viewDidDisappear:(BOOL)animated
{
	NSLog(@"View did disappear.");	
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	//read the file (if it exists) back into the string
	NSLog(@"Read the string from the file now.");
	
	self.title = NSLocalizedString(@"TextViewTitle", @"");
	[self setupTextView];
}

// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	NSLog(@"Save the string to a file now.");

	self.textView = nil;
}



- (void)saveAction:(id)sender
{
	NSError *error = nil;

	//Text view has been dismissed. Resign first responder, which will remove the keypad.
	//
	[self.textView resignFirstResponder];
	self.navigationItem.rightBarButtonItem = nil;	// this will remove the "save" button
    //This is your opportunity to save the text.
    NSLog(@"Save action method called: %@", self.textView.text);
	
	//Use writeToFile to write an object to a file in a known directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"documentsDirectory %@\n", documentsDirectory);

	//make a file name to write the data to the documents directory:
    NSString *fileName = [NSString stringWithFormat:@"%@/textViewContent.txt", 
                          documentsDirectory];

    //Save content to the documents directory
    [self.textView.text writeToFile:fileName 
               atomically:NO 
                 encoding:NSUTF8StringEncoding 
                    error:&error];
	
	if (error) {
        NSLog(@"Error writing file at %@\n%@\n", fileName, [error localizedFailureReason]);
        [error release];
        error = nil;
    } else {
		NSLog(@"Successfully wrote text to file at %@\n", fileName);
	}


}


#pragma mark -
#pragma mark UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
	// provide my own Save button to dismiss the keyboard
	UIBarButtonItem* saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                              target:self
                                                                              action:@selector(saveAction:)];
	self.navigationItem.rightBarButtonItem = saveItem;
	[saveItem release];
}



@end

