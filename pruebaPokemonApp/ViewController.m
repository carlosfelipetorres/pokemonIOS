//
//  ViewController.m
//  pruebaPokemonApp
//
//  Created by Carlos Torres on 9/8/17.
//  Copyright © 2017 Carlos Torres. All rights reserved.
//

#import "ViewController.h"
#import "PokemonCellTableViewCell.h"
#import "DetailsViewController.h"
#import <AFNetworking/AFNetworking.h>
@interface ViewController ()

{
    NSMutableArray *pokemonList;
}
@end

static NSString *segueShowDetails = @"showDetail";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // NSString *URLString = @"";
   // NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://pokeapi.co/api/v2/pokemon" parameters:nil
        progress:^(NSProgress * _Nonnull downloadProgress) {}
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"response object: %@", responseObject);
            NSNumber *count = responseObject[@"count"];
            pokemonList = responseObject[@"results"];
            [self.tableView reloadData];
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"response error: %@", error);
        }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"pokemonCell";
    
    PokemonCellTableViewCell *cell = (PokemonCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[PokemonCellTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    NSDictionary *tempDic = [pokemonList objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:@"http://images6.fanpop.com/image/photos/38900000/Pokeball-pokemon-38912743-120-120.png"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    cell.pokemonImage.image = [UIImage imageWithData:data];
    cell.pokemonNameLabel.text = [tempDic objectForKey:@"name"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return pokemonList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *tempDic = [pokemonList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:segueShowDetails sender:tempDic];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:segueShowDetails]){
        DetailsViewController *detailsVC = (DetailsViewController*)segue.destinationViewController;
        detailsVC.data = sender;
    }
}

@end
