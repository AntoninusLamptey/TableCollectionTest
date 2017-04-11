//
//  NetworkCall.h
//  TableCollectionTest
//
//  Created by Antoninus Lamptey on 4/11/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkCall : NSObject
{
NSMutableArray *raceNames;
}
- (void) getRacesJSON:(void (^)(NSArray *)) callback;

@end
