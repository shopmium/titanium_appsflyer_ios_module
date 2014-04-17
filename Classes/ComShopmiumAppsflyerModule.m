/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComShopmiumAppsflyerModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComShopmiumAppsflyerModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"38a005b3-4032-47dc-b015-a5eaa141e1c8";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.shopmium.appsflyer";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(void)startTracker:(id)args
{

	NSString *appleAppID      = [args objectAtIndex:0];
	NSString *appsFlyerDevKey = [args objectAtIndex:1];

	[AppsFlyerTracker sharedTracker].appsFlyerDevKey = appsFlyerDevKey;
	[AppsFlyerTracker sharedTracker].appleAppID      = appleAppID;
}

-(void)setInstallId:(id)installId
{
	ENSURE_SINGLE_ARG(installId, NSString);
	[AppsFlyerTracker sharedTracker].customerUserID = installId;
}

-(void)trackAppLaunch:(id)args
{
	ENSURE_UI_THREAD_0_ARGS
	NSLog(@"[DEBUG] AppsFlyer > TrackAppLaunch: appsFlyerDevKey: %@", [AppsFlyerTracker sharedTracker].appsFlyerDevKey);
	NSLog(@"[DEBUG] AppsFlyer > TrackAppLaunch: appleAppID: %@", [AppsFlyerTracker sharedTracker].appleAppID);
	NSLog(@"[DEBUG] AppsFlyer > TrackAppLaunch: customerUserID: %@", [AppsFlyerTracker sharedTracker].customerUserID);
	[[AppsFlyerTracker sharedTracker] trackAppLaunch];
}

-(void)trackAction:(id)args
{
	NSString *eventName  = [args objectAtIndex:0];
	NSString *eventValue = [args objectAtIndex:1];
	[[AppsFlyerTracker sharedTracker] trackEvent:eventName withValue:eventValue];
}

@end
