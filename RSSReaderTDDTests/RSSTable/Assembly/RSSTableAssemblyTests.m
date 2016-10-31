//
//  RSSTableAssemblyTests.m
//  RSSReaderTDD
//
//  Created by lets Code on 30/10/2016.
//  Copyright © 2016 we. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "RSSTableAssembly.h"
#import "RSSTableAssembly_Testable.h"

#import "RSSTableViewController.h"
#import "RSSTablePresenter.h"
#import "RSSTableInteractor.h"
#import "RSSTableRouter.h"
#import "RSSLoader.h"
#import "RSSXMLParser.h"

@interface RSSTableAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) RSSTableAssembly *assembly;

@end

@implementation RSSTableAssemblyTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.assembly = [[RSSTableAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Тестирование создания элементов модуля

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [RSSTableViewController class];
    NSArray *protocols = @[
                           @protocol(RSSTableViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewRSSTable];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [RSSTablePresenter class];
    NSArray *protocols = @[
                           @protocol(RSSTableModuleInput),
                           @protocol(RSSTableViewOutput),
                           @protocol(RSSTableInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterRSSTable];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [RSSTableInteractor class];
    NSArray *protocols = @[
                           @protocol(RSSTableInteractorInput),
                           @protocol(RSSLoaderOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output),
                              RamblerSelector(rssloader)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
													      
    // when
    id result = [self.assembly interactorRSSTable];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [RSSTableRouter class];
    NSArray *protocols = @[
                           @protocol(RSSTableRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerRSSTable];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesServiceRssLoader {
    // given
    Class targetClass = [RSSLoader class];
    NSArray *protocols = @[
                           @protocol(RSSLoaderInput),
                           @protocol(RSSXMLParserDelegate)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output),
                              RamblerSelector(parser)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly serviceRSSLoader];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesServiceRssXMLParser {
    // given
    Class targetClass = [RSSXMLParser class];
    NSArray *protocols = @[
                           @protocol(NSXMLParserDelegate),
                           @protocol(RSSXMLParserInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(delegate)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];
    
    // when
    id result = [self.assembly serviceRSSXMLParser];
    
    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
