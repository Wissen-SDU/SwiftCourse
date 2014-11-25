//
//  Test.h
//  Ders1
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject


@property(nonatomic,strong) NSString * isim;

-(void)merhabaDe:(NSString *)isim
           soyad:(NSString *)soyad
          numara:(NSInteger)numara;

@end
