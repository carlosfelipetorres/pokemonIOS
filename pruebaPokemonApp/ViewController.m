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
@interface ViewController ()

{
    NSMutableArray *pokemonList;
}
@end

static NSString *segueShowDetails = @"showDetail";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    pokemonList = [NSMutableArray
                   arrayWithObjects:@{@"image":@"https://www.mundoperro.net/wp-content/uploads/Nombres-de-perro-con-la-letra-G.jpg",@"name":@"pikachu"},
                                    @{@"image":@"https://www.mundoperro.net/wp-content/uploads/Nombres-de-perro-con-la-letra-G.jpg",@"name":@"charizar"},
                                    @{@"image":@"https://www.mundoperro.net/wp-content/uploads/Nombres-de-perro-con-la-letra-G.jpg",@"name":@"doggichar"},
                                        nil];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    NSURL *url = [NSURL URLWithString:[tempDic objectForKey:@"image"]];
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
