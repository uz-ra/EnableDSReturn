#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <substrate.h>
#import <MediaRemote/MediaRemote.h>
#import <spawn.h>
#import <sys/utsname.h>
#import <rootless.h>


@interface NSConcreteNotification : NSNotification
@end


@interface UIKeyboardLayoutStar
-(id)keyHitTest:(CGPoint)test;
-(void)addInputString:(NSString*)string;
-(void)addReturn;
@end
@interface UIKeyBoardImpl
+(id)sharedInstance;
@end