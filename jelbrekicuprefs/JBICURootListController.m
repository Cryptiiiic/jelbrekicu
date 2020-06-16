#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import "JBICURootListController.h"
#import "../libjelbrekicu/jelbrekicu.h"

@implementation JBICURootListController

HBPreferences *preferences = nil;
NSString *key = nil;

+ (NSString *)hb_specifierPlist
{
	return @"Root";
}

- (instancetype)init
{
	self = [super init];

	if (self)
	{
		preferences = [HBPreferences preferencesForIdentifier:@"com.cryptic.jbicuprefs"];
		HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
		appearanceSettings.tintColor = [UIColor colorWithRed:118.f / 255.f green:75.f / 255.f blue:162.f / 255.f alpha:1];

		appearanceSettings.navigationBarTintColor = [UIColor colorWithRed:102.f / 255.f green:126.f / 255.f blue:234.f / 255.f alpha:1];
		appearanceSettings.navigationBarTitleColor = [UIColor colorWithRed:255.f / 255.f green:255.f / 255.f blue:255.f / 255.f alpha:1];
		appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed:118.f / 255.f green:75.f / 255.f blue:162.f / 255.f alpha:1];

		appearanceSettings.statusBarTintColor = [UIColor colorWithRed:118.f / 255.f green:75.f / 255.f blue:162.f / 255.f alpha:1];

		appearanceSettings.tableViewBackgroundColor = [UIColor colorWithRed:102.f / 255.f green:126.f / 255.f blue:234.f / 255.f alpha:1];
		appearanceSettings.tableViewCellBackgroundColor = [UIColor colorWithRed:0.f / 255.f green:0.f / 255.f blue:0.f / 255.f alpha:1];

		self.hb_appearanceSettings = appearanceSettings;
	}

	return self;
}

- (void)login
{
	JelBrekICU *jbicu = [JelBrekICU new];
	[preferences registerObject:&key default:0 forKey:@"token"];
    [jbicu login:key siteURL:[NSURL URLWithString:@"https://jelbrek.icu/login"] completionHandler:^(BOOL success)
    {
        if([jbicu logging])
            NSLog(@"JelbrekICUPrefs: login: success: %@", success ? @"YES" : @"NO");
		dispatch_queue_t current_queue = dispatch_get_main_queue();
		dispatch_async(current_queue, 
		^{
			UIAlertController *loginAlert = [UIAlertController alertControllerWithTitle:@"JelbrekICU" message:(success ? @"Login success!" : @"Failed to log in.") preferredStyle:UIAlertControllerStyleActionSheet];
			UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
			[loginAlert addAction:ok];
			[self presentViewController:loginAlert animated:YES completion:nil];
		});
    }];
}

- (void)openGitHub {
	[[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/Cryptiiiic/jelbrekicu"]]
	options:@{}
	completionHandler:nil];
}

- (void)openTwitter {
	[[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/Cryptiiiic"]]
	options:@{}
	completionHandler:nil];
}

- (void)openWebsite {
	[[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://cryptiiiic.com/"]]
	options:@{}
	completionHandler:nil];
}

- (void)openReddit {
	[[[UIApplication sharedApplication]
 	openURL:[NSURL URLWithString:@"https://reddit.com/u/MrCryptiic/"]]
	options:@{}
	completionHandler:nil];
}
@end
