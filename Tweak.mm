#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>
#import "libjelbrekicu/jelbrekicu.h"

UIPasteboard *pasteboard = UIPasteboard.generalPasteboard;
JelBrekICU *jbicu = nil;
HBPreferences *preferences = nil;
NSString *key = nil;

%hook SSScreenCapturer

-(void)_saveImageToPhotoLibrary:(UIImage *)image environmentDescription:(id)env
{
    %orig;
    [preferences registerObject:&key default:0 forKey:@"token"];
    [[JelBrekICU new] uploadUIImage:image jelbrekKey:key siteURL:[NSURL URLWithString:@"http://jelbrek.icu/upload"] completionHandler:^(NSString *url)
    {
        if([jbicu logging])
            NSLog(@"JelbrekICU: url: %@", url);
        if(url)
            pasteboard.string = url;
    }];
}

%end

%ctor
{
    jbicu = [JelBrekICU new];
    //[jbicu setLogging:YES];
    preferences = [HBPreferences preferencesForIdentifier:@"com.cryptic.jbicuprefs"];
    if([jbicu logging])
        NSLog(@"JelbrekICU: Init");
}