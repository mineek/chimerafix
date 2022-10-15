#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

%group Chimera
%hook ChimeraJailbreakButtonClass
%property (nonatomic, assign) BOOL userInteractionEnabled;
- (BOOL)isEnabled {
	return YES;
}
- (void)setEnabled:(BOOL)enabled {
	%orig(YES);
}
- (BOOL)userInteractionEnabled {
	return YES;
}
%end
%hook ChimeraTintingLabelClass
- (void)setText:(id)text {
	if ([text isEqualToString:@"Incompatible"]) {
		%orig(@"Jailbreak");
	} else {
		%orig(text);
	}
}
%end
%hook UILabel
- (void)setText:(id)text {
	if ([text hasPrefix:@"iOS 12 "]) {
		%orig(@"iOS 12 - 12.5.6 (ChimeraFix)");
	} else {
		%orig(text);
	}
}
%end
%end
%ctor {
	%init(Chimera, ChimeraJailbreakButtonClass = objc_getClass("Chimera.JailbreakButton"), ChimeraTintingLabelClass = objc_getClass("Chimera.TintingLabel"));
}