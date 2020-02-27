#import <UIKit/UIKit.h>
#import "libjelbrekicu/jelbrekicu.h"

UIPasteboard *pasteboard = UIPasteboard.generalPasteboard;

%hook SSScreenCapturer

-(void)_saveImageToPhotoLibrary:(UIImage *)image environmentDescription:(id)env
{
    %orig;
    NSString *url = [[JelBrekICU new] uploadUIImage:image jelbrekKey:@"b326ae99-b778-4b84-91f5-595402e05a35" siteURL:[NSURL URLWithString:@"http://jelbrek.icu/upload"]];
    if([[JelBrekICU new] logging])
        NSLog(@"JelbrekICU: url: %@", url);
    if(url)
        pasteboard.string = url;
}

%end

%ctor
{
    if([[JelBrekICU new] logging])
        NSLog(@"JelbrekICU: Init");
}