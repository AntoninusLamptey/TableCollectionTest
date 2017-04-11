//
//  ViewController.h
//  TableCollectionTest
//
//  Created by Antoninus Lamptey on 4/10/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

    @property (strong,nonatomic)UICollectionView *collectionView;
    @property (strong,nonatomic) UITableView *tableView;

@end
