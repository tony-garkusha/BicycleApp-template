//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import "___VARIABLE_classPrefix:identifier___ViewController.h"
#import "___VARIABLE_classPrefix:identifier___AppDelegate.h"

@interface ___VARIABLE_classPrefix:identifier___ViewController ()

- (void)subscribeForKeyboardEvents;
- (void)unsubscribeForKeyboardEvents;

@end

@implementation ___VARIABLE_classPrefix:identifier___ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ___VARIABLE_classPrefix:identifier___AppDelegate *delegate = (___VARIABLE_classPrefix:identifier___AppDelegate*)[[UIApplication sharedApplication] delegate];
    _is4InchesRetinaResized = delegate.is4inchesRetina;
    if (_is4InchesRetinaResized) {
        _is4InchesRetinaResized = YES;
        [self reloadFor4InchesRetina];
    }
    
    _doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendLog)];
    _doubleTapRecognizer.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:_doubleTapRecognizer];
}

- (void)reloadFor4InchesRetina {
    
}

- (void)sendLog {
    MFMailComposeViewController *mailComposerVC = [[MFMailComposeViewController alloc] init];
    //TODO: Uncomment following line and change to receipients with your mail address
    //[mailComposerVC setToRecipients:@[@"___FULLUSERNAME___"]];
    [mailComposerVC setSubject:@"Log from ___PROJECTNAME___"];
    [mailComposerVC setMessageBody:[___VARIABLE_classPrefix:identifier___Logger sharedLogger].logString isHTML:NO];
    mailComposerVC.mailComposeDelegate = self;
    [self presentViewController:mailComposerVC animated:YES completion:nil];
}

- (void)setIsKeyboardDependent:(BOOL)isKeyboardDependent {
    if (_isKeyboardDependent != isKeyboardDependent) {
        _isKeyboardDependent = isKeyboardDependent;
        if (_isKeyboardDependent) {
            [self subscribeForKeyboardEvents];
        } else {
            [self unsubscribeForKeyboardEvents];
        }
    }
}

- (void)subscribeForKeyboardEvents {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardUp:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDown:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)unsubscribeForKeyboardEvents {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)keyboardUp:(NSNotification*)notification {
    
}

- (void)keyboardDown:(NSNotification*)notification {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self unsubscribeForKeyboardEvents];
}

- (void)dealloc {
    [self unsubscribeForKeyboardEvents];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
