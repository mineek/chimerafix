#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#include <fishhook.h>

int (*orig_uname)(struct utsname *name);

int uname(struct utsname *name) {
	NSLog(@"uname called\n");
	int ret = orig_uname(name);
	NSLog(@"uname: %s\n", name->version);
	if (ret == 0) {
		char *xnu = strstr(name->version, "4903.272.5~1");
		if (xnu) {
			strcpy(xnu, "4903.272.4~1");
		}
	}
	NSLog(@"uname: %s\n", name->version);
	return ret;
}

%ctor {
	NSLog(@"ChimeraFix loaded\n");
	rebind_symbols((struct rebinding[1]){{"uname", (void *)uname, (void **)&orig_uname}}, 1);
}