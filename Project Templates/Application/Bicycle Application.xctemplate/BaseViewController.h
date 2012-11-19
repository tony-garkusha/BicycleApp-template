//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ___VARIABLE_classPrefix:identifier___ViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    @protected
        UITapGestureRecognizer *_doubleTapRecognizer;
}

@property (nonatomic) BOOL isKeyboardDependent;
@property (nonatomic, readonly) BOOL is4InchesRetinaResized;

- (void)sendLog;

//Override these methods to perform some actions on keyboard appearance/disappearance
- (void)keyboardUp:(NSNotification*)notification;
- (void)keyboardDown:(NSNotification*)notification;

// Override this method in subclasses if you want to set a specific look for the View Controller.
- (void)reloadFor4InchesRetina;

@end
