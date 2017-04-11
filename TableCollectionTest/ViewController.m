//
//  ViewController.m
//  TableCollectionTest
//
//  Created by Antoninus Lamptey on 4/10/17.
//  Copyright © 2017 Antoninus Lamptey. All rights reserved.
//

#import "ViewController.h"
#import "NetworkCall.h"

@interface ViewController (){
    NSArray *raceNameInfo;
    
}

@end

@implementation ViewController



-(void) viewWillAppear:(BOOL)animated {
    

    /*
    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    [self.view addSubview:myNav];
    
    
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch layout"
                                                                style:UIBarButtonItemStylePlain
                                                                target:self action:@selector(switchView)];
    
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Races"];
    navigItem.rightBarButtonItem = doneItem;
    
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
    */
   // [UIBarButtonItem appearance].tintColor = [UIColor blueColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Navigation bar initialisation
    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    [self.view addSubview:myNav];
    
    
    //button initialization
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch layout"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self action:@selector(switchView)];
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Races"];
    navigItem.rightBarButtonItem = doneItem;
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];

    NetworkCall *getJSON = [[NetworkCall alloc] init];
    [getJSON getRacesJSON:^(NSArray *races){
        raceNameInfo = races;
        //[self.view addSubview:self.tableView];
        //[self.tableView reloadData];
    }];

    // Table view initializations
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,60, [[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height- 100)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    //Collection view initializations
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,60, 50, 50) collectionViewLayout:layout ];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"newFriendCell"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    
    //adding subviews
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    
   
}

// function to switch views
-(IBAction)switchView{
    
    UIView *sourceView, *destinationView;
    
    if (self.tableView.superview == self.view)
    {
        sourceView = self.tableView;
        destinationView = self.collectionView;
    }
    else
    {
        sourceView = self.collectionView;
        destinationView = self.tableView;
    }
    
    destinationView.frame = CGRectMake(0,60, [[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height- 100);
    [sourceView removeFromSuperview];
    [self.view addSubview:destinationView];
    
    //Adding navigation bar again so it shows when returning to tableview layout
    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    [self.view addSubview:myNav];
    
    
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch layout"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self action:@selector(switchView)];
    
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Races"];
    navigItem.rightBarButtonItem = doneItem;
    
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
    [self.tableView reloadData];

}



//tableview delegate functions
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newFriendCellt"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newFriendCellt"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[raceNameInfo objectAtIndex:indexPath.row]];
    return cell;

}

//collection view delegate functions(number of rows & cell at index)

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return raceNameInfo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    //static NSString *collectionCellID = @"newFriendCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newFriendCell" forIndexPath:indexPath];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, cell.bounds.size.width, 40)];
    title.tag = 200;
    title.text = [NSString stringWithFormat:@"%@",[raceNameInfo objectAtIndex:indexPath.row]];
    title.textColor = [UIColor blackColor];
    
    
    [cell.contentView addSubview:title];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(50, 50);
}

//table view number of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return raceNameInfo.count;
};


@end
