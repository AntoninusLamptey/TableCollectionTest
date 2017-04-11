//
//  NetworkCall.m
//  TableCollectionTest
//
//  Created by Antoninus Lamptey on 4/11/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "NetworkCall.h"
#import <dispatch/dispatch.h>

@implementation NetworkCall{
    //NSMutableArray *raceNames;
    dispatch_queue_t myQueue;
    NSData *myData;
    NSURL *myUrl;
}


- (void) getRacesJSON:(void (^)(NSArray *)) callback{
    
    raceNames = [[NSMutableArray alloc] init];
    myQueue = dispatch_queue_create("myQueue", NULL);
    dispatch_async(myQueue, ^{
        myUrl = [NSURL URLWithString:@"http://ergast.com/api/f1/current.json"];
        //Assign the data from the URL
        myData = [NSData dataWithContentsOfURL:myUrl];
        
        NSDictionary *myDict = [NSJSONSerialization JSONObjectWithData:myData options:0 error:nil];
        NSDictionary *races = [[[myDict objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
        for(NSDictionary *tempValue in races)
        {
                [raceNames addObject:tempValue[@"raceName"]];
            
        }
        callback(raceNames);
        
    });

}
@end

//Maybe useful code:

//dispatch_async(dispatch_get_main_queue(), ^{[self goToMainQueue]});
//Parsing JSON and adding elements to relevant array
/*
 NSDictionary *myDict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
 NSDictionary *races = [[[myDict objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
 
 for(NSDictionary *tempValue in races)
 {
 NSError *error;
 if(!error)
 {
 //NSString *s = [[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"];
 [raceNames addObject:[[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"]];
 
 }
 
 }
 callback(raceNames);
 */
