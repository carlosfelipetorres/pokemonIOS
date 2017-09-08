//
//  AppDelegate.h
//  pruebaPokemonApp
//
//  Created by Carlos Torres on 9/8/17.
//  Copyright © 2017 Carlos Torres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

