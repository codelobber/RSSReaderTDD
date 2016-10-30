//
//  RSSTableModuleInput.h
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RSSTableModuleInput <RamblerViperModuleInput>

/**
 @author lets Code

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
