//
//  BGSListViewController.h
//  Saturation
//
//  Created by Shawn Roske on 12/19/09.
//  Copyright 2009 Bitgun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FontsAndColors.h"
#import "BGSEntryViewCell.h"
#import "BGSSectionButton.h"
#import "BGSSwatchColor.h"
#import "BGSKulerFeedController.h"
#import "BGSTableView.h"
#import "BGSLoadingView.h"

@interface BGSListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> 
{
	NSArray *selectedEntries;
	UIImageView *background;
	UIButton *closeButton;
	BGSTableView *tableView;
	BGSLoadingView *headerView;
	BGSLoadingView *footerView;
	BGSKulerFeedController *feed;
	BGSSectionButton *newestButton;
	BGSSectionButton *popularButton;
	BGSSectionButton *randomButton;
	BGSSectionButton *favoritesButton;
	BGSSectionButton *lastSelectedButton;
	BGSSwatchColor *seperator;
	BOOL currentlyRefreshing;
}

@property (nonatomic, retain) NSArray *selectedEntries;
@property (nonatomic, retain) UIImageView *background;
@property (nonatomic, retain) UIButton *closeButton;
@property (nonatomic, retain) BGSTableView *tableView;
@property (nonatomic, retain) BGSLoadingView *headerView;
@property (nonatomic, retain) BGSLoadingView *footerView;
@property (nonatomic, retain) BGSKulerFeedController *feed;
@property (nonatomic, retain) BGSSectionButton *newestButton;
@property (nonatomic, retain) BGSSectionButton *popularButton;
@property (nonatomic, retain) BGSSectionButton *randomButton;
@property (nonatomic, retain) BGSSectionButton *favoritesButton;
@property (nonatomic, retain) BGSSwatchColor *seperator;

@end