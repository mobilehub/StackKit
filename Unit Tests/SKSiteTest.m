//
//  SKSiteTest.m
//  StackKit
/**
  Copyright (c) 2011 Dave DeLong
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 **/

#import "SKSiteTest.h"
#import "SKTestConstants.h"
#import <StackKit/StackKit.h>

@implementation SKSiteTest

- (void) testStatistics {
	SKSite * site = [SKSite stackOverflowSite];
	
	NSDictionary * stats = [site statistics];
	
	NSString * apiVersion = [[stats objectForKey:SKStatsAPIInfo] objectForKey:SKStatsAPIInfoVersion];
	STAssertEqualObjects(apiVersion, SKAPIVersion, @"API versions do not match!");
}

- (void) testMetaSite {
	SKSite * so = [SKSite stackOverflowSite];
	SKSite * metaSO = [so metaSite];
	STAssertEqualObjects([[metaSO apiURL] host], @"api.meta.stackoverflow.com", @"Unexpected meta URL: %@", [metaSO apiURL]);
	
	SKSite * metaMetaSO = [metaSO metaSite];
	STAssertTrue(metaSO == metaMetaSO, @"meta.stackoverflow.com should not have a meta site, but found: %@", [metaMetaSO apiURL]);
	
	SKSite * su = [SKSite superUserSite];
	SKSite * metaSU = [su metaSite];
	STAssertNotNil(metaSU, @"SuperUser should have a meta site");
}

@end
