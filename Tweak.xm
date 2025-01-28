#import "Tweak.h"

BOOL enableReturn = YES;

%hook UIKeyboardImpl
-(int)returnKeyType{
//NSLog(@"EnableDSReturn : UIKeyboardImpl returnKeyType is %d", %orig);
return 0;
}
%end

%hook UITextInputTraits
-(long long)returnKeyType{
//NSLog(@"EnableDSReturn : UITextInputTraits returnKeyType is %lld", %orig);
return 0;
}
%end


%hook UIKeyboardLayoutStar

-(void)setAction:(SEL)arg1 forKey:(id)arg2 {

if([NSStringFromSelector(arg1) isEqual:@"performKeyBehaviorCommitInline"] && [arg2 isEqual:@"_keyid_return_"]){
enableReturn=NO;
}else if(![NSStringFromSelector(arg1) isEqual:@"performKeyBehaviorCommitInline"] && [arg2 isEqual:@"_keyid_return_"]){
enableReturn=YES;
}

%orig;
}

- (void)touchUp:(UITouch *)touch {
	NSString* key = [[[self keyHitTest:[touch locationInView:touch.view]] name] lowercaseString];
	if ([key isEqualToString:@"return-key"] && enableReturn) {
//スペースがないと送信になる。多分入力内容に@"/n"で完全一致検索かけてんのかな。故に同時にそれ以外の文字が含まれてればいけるってワケ。
[[%c(UIKeyboardImpl) sharedInstance] addInputString:@" \n"];
  NSLog(@"EnableDSReturn : Inserted return");
	}
else{
	%orig;
}
}

%end