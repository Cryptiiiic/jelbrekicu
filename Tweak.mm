#import "libjelbrekicu/jelbrekicu.h"

%hook SSScreenCapturer

-(void)_saveImageToPhotoLibrary:(UIImage *)image environmentDescription:(id)env
{
    %orig;
    [[JelBrekICU new] uploadUIImage:image jelbrekKey:@"N2av5POLXAb6z50R1scthYE5" siteURL:[NSURL URLWithString:@"http://jelbrek.icu/upload.php"]];
}

%end

%ctor
{
    NSLog(@"JelbrekICU: Init");
}