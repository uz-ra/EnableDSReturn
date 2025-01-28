#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <substrate.h>
#import <MediaRemote/MediaRemote.h>
#import <spawn.h>
#import <sys/utsname.h>
#import <rootless.h>

@interface UIKeyboardLayoutStar
-(id)keyHitTest:(CGPoint)test;
-(void)addInputString:(NSString*)string;
-(void)addReturn;
-(void)clearAllTouchInfo;
@end
@interface UIKeyBoardImpl
+(id)sharedInstance;
-(void)handleDelete;
-(void)performDelete;
@end