//
//  DetailsViewController.m
//  pruebaPokemonApp
//
//  Created by Carlos Torres on 9/12/17.
//  Copyright © 2017 Carlos Torres. All rights reserved.
//

#import "DetailsViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelHeight;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *name = [_data objectForKey:@"name"];
    _labelName.text = name;
    
    NSString *url = [NSString stringWithFormat: @"http://pokeapi.co/api/v2/pokemon/%@/", name];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {}
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             //NSLog(@"response object: %@", responseObject);
             NSDictionary *sprites = responseObject[@"sprites"];
             NSURL *url = [NSURL URLWithString:[sprites objectForKey:@"front_default"]];
             NSData *data = [NSData dataWithContentsOfURL:url];
             
             _labelWeight.text = [NSString stringWithFormat:@"%i", responseObject[@"weight"]];
             _labelHeight.text = [NSString stringWithFormat:@"%i", responseObject[@"height"]];
             _pokemonImage.image = [UIImage imageWithData:data];
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"response error: %@", error);
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
