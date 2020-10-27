//
//  AviaSalesConceptTests.m
//  AviaSalesConceptTests
//
//  Created by Kirill Khudiakov on 27.10.2020.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GeoCoder.h"

@interface AviaSalesConceptTests : XCTestCase
@property (nonatomic) GeoCoder* geoCoder;

@end

@implementation AviaSalesConceptTests

- (void)setUp {
    self.geoCoder = [GeoCoder shared];
}

- (void)tearDown {
    
}

- (void)testGeoCoder {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    
    CLLocation* location = [[CLLocation alloc] initWithLatitude:58.592725 longitude:16.185962];
    [[GeoCoder shared] addressFromLocation:location andCompletion:^(NSArray * _Nonnull places) {
        NSLog(@"places: %@", places);
        XCTAssertTrue(true);
        [completionExpectation fulfill];
    }];
    

    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
