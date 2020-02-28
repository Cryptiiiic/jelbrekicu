#import <CepheiPrefs/HBAppearanceSettings.h>
#include "JBICURootListController.h"

@implementation JBICURootListController

+ (NSString *)hb_specifierPlist
{
	return @"Root";
}

- (instancetype)init
{
	self = [super init];

	if (self)
	{
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

@end
