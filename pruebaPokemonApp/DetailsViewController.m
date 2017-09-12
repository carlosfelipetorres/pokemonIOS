//
//  DetailsViewController.m
//  pruebaPokemonApp
//
//  Created by Carlos Torres on 9/12/17.
//  Copyright © 2017 Carlos Torres. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;
@property (weak, nonatomic) IBOutlet UILabel *labelName;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:[_data objectForKey:@"image"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    _pokemonImage.image = [UIImage imageWithData:data];
    _labelName.text = [_data objectForKey:@"name"];

    
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
