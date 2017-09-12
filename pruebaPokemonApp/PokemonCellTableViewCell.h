//
//  PokemonCellTableViewCell.h
//  pruebaPokemonApp
//
//  Created by Carlos Torres on 9/12/17.
//  Copyright © 2017 Carlos Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PokemonCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pokemonImage;
@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLabel;

@end
