//
//  main.m
//  Enumeraciones
//
//  Created by María Jesús Senosiain Caamiña on 20/02/15.
//  Copyright (c) 2015 María Jesús Senosiain Caamiña. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // NSString
        [@"Hola\nMundo" enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
            static int i = 0;
            NSLog(@"Linea %d: %@", i++, line);
        
        }];
        
        
        // NSArray
    
        NSArray *nums = @[@1, @2, @3, @4, @5.5, @6.3333334, @(6.3 + 1.2), [NSNumber numberWithFloat:8.8]];
        
        [nums enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"El Objeto %lu es %@", (unsigned long) idx, obj);
            
            // freno mano: SE LE PONE * porque es por referencia
            if ([obj intValue] >= 5) {
                NSLog(@"Nos vamos");
                *stop = YES;
            }
            
        }];
        
        // Mira mamá, ¡en paralelo!
        [nums enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"El Objeto %lu es %@", (unsigned long) idx, obj);
        }];
        
        
        // Dictionary
        NSDictionary *bso = @{@"Zimmer": @[@"Inception", @"Interstellar"],
                              @"Barry" : @[@"Out of Africna", @"Born Free"]};
        
        [bso enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(<#NSString *format, ...#>)
        }];
        
        
     }
    return 0;
}
