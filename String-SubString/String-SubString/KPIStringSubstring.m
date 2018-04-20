//
//  KPIStringSubstring.m
//  String-SubString
//
//  Created by paul on 4/19/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPIStringSubstring.h"

@implementation KPIStringSubstring

-(NSArray *) output{
    
    NSMutableArray *arrayOfSubstrings = [NSMutableArray array];
   
    NSDictionary *openBracers = @{@'(' : [NSMutableArray array],
                                   @'<' : [NSMutableArray array],
                                   @'[' : [NSMutableArray array],
                                   };
    
    NSDictionary *closedBracers =@{ @')' : @'(',
                                     @'>' : @'<',
                                     @']' : @'[',
                                     };
    
    for (int i = 0; i < [self.startString length]; i++) {
        unichar temp = [self.startString characterAtIndex:i];
        
        if ([openBracers objectForKey:[NSNumber numberWithChar:temp]]) {
            [[openBracers objectForKey:[NSNumber numberWithChar:temp]] addObject:
             [NSNumber numberWithInteger:i+1]];
        }
        else if ([closedBracers objectForKey:[NSNumber numberWithChar:temp]]) {
            
            NSInteger location = [[[openBracers objectForKey:
            [closedBracers objectForKey: [NSNumber numberWithChar:temp]]] lastObject] integerValue];
            
            [arrayOfSubstrings addObject: [self.startString substringWithRange:
                                           NSMakeRange(location, i - location)]];
            
            [[openBracers objectForKey:[closedBracers objectForKey:[NSNumber numberWithChar:
                                                                    temp]]] removeLastObject];
        }
    }
 
    return arrayOfSubstrings;
}
@end


//NSCharacterSet *openSet = [NSCharacterSet characterSetWithCharactersInString:@"([<"];
//
//NSCharacterSet *closeSet = [NSCharacterSet characterSetWithCharactersInString:@")]>"];
//
//NSMutableArray *arrayOfIndexes = [NSMutableArray array];
//
//
//for (int i = 0; i < [self.startString length]; i++) {
//    unichar temp = [self.startString characterAtIndex:i];
//
//    if ([openSet characterIsMember:temp]) {
//        [arrayOfIndexes addObject:[NSNumber numberWithInteger:(i + 1)]];
//
//    } else if ([closeSet characterIsMember:temp]) {
//        NSInteger location = [[arrayOfIndexes lastObject] integerValue];
//        [arrayOfSubstrings addObject: [self.startString substringWithRange:
//                                       NSMakeRange(location, i - location)]];
//        [arrayOfIndexes removeLastObject];
//    }
//    }
