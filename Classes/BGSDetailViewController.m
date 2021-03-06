//
//  BGSDetailViewController.m
//  Saturation
//
//  Created by Shawn Roske on 12/18/09.
//  Copyright 2009 Bitgun. All rights reserved.
//

#import "BGSDetailViewController.h"
#import "SaturationAppDelegate.h"

@interface BGSDetailViewController (Private)

- (void)close:(id)sender;
- (void)setupColorRows;
- (void)toggleFavorite:(id)sender;
- (void)toggleVisualization:(id)sender;

@end


@implementation BGSDetailViewController

@synthesize background;

@synthesize entry;
@synthesize titleLabel;
@synthesize authorLabel;
@synthesize closeButton;

@synthesize colorStripScroll;
@synthesize colorStrip;

@synthesize hexheaderLabel;
@synthesize rgbHeaderLabel;
@synthesize visualizerHeaderLabel;

@synthesize colorIcons;
@synthesize hexContentLabels;

@synthesize hexSeperator;

@synthesize rgbRContentLabels;
@synthesize rgbGContentLabels;
@synthesize rgbBContentLabels;

@synthesize rgbSeperator;

@synthesize simpleCircleOption;
@synthesize simpleParticleOption;
@synthesize comingSoonOption1;
@synthesize comingSoonOption2;
@synthesize comingSoonOption3;
@synthesize comingSoonOption4;

@synthesize favoriteButton;
@synthesize emailButton;

- (UIImageView *)background
{
	if (background == nil)
	{
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"background.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 
																		0.0f, 
																		i.size.width, 
																		i.size.height)];
		[iv setImage:i];
		[self setBackground:iv];
		[iv release];
	}
	return background;
}

- (UIButton *)closeButton
{
	if (closeButton == nil)
	{
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		[btn setShowsTouchWhenHighlighted:YES];
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"button-close.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		[btn setImage:i forState:UIControlStateNormal];
		[btn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
		[btn setFrame:CGRectMake(self.view.bounds.size.width-40.0f, 
								 -2.0f, 
								 42.0f, 
								 42.0f)];
		[self setCloseButton:btn];
		[btn release];
	}
	return closeButton;
}

- (void)close:(id)sender
{
	SaturationAppDelegate *ad = (SaturationAppDelegate *)[[UIApplication sharedApplication] delegate];
	[ad closeDetailView];
}

- (FontLabel *)titleLabel
{
	if (titleLabel == nil)
	{
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(12.0f, 
																	 -2.0f, 
																	 480.0f-36.0f, 
																	 66.0f)
												 fontName:CF_NORMAL
												pointSize:48.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:[[self.entry objectForKey:@"themeTitle"] lowercaseString]];
		[self setTitleLabel:lbl];
		[lbl release];
	}
	return titleLabel;
}

- (FontLabel *)authorLabel
{
	if (authorLabel == nil)
	{
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(13.0f, 
																	 50.0f, 
																	 480.0f-36.0f, 
																	 30.0f)
												 fontName:CF_NORMAL
												pointSize:24.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:[NSString stringWithFormat:@"by: %@", [[self.entry objectForKey:@"authorLabel"] lowercaseString]]];
		[self setAuthorLabel:lbl];
		[lbl release];
	}
	return authorLabel;
}

- (UIScrollView *)colorStripScroll
{
	if (colorStripScroll == nil)
	{
		UIScrollView *v = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 
																		 82.0f, 
																		 480.0f, 
																		 30.0f)];
		[v setShowsVerticalScrollIndicator:NO];
		[v setShowsHorizontalScrollIndicator:NO];
		[self setColorStripScroll:v];
		[v release];
	}
	return colorStripScroll;
}

- (BGSSwatchStrip *)colorStrip
{
	if (colorStrip == nil)
	{
		BGSSwatchStrip *s = [[BGSSwatchStrip alloc] initWithFrame:CGRectMake(-250.0f, 
																			 10.0f, 
																			 480.0f*3, 
																			 10.0f) 
													  andSwatches:[self.entry objectForKey:@"swatches"]];
		[self setColorStrip:s];
		[s release];
	}
	return colorStrip;
}

- (FontLabel *)hexheaderLabel
{
	if (hexheaderLabel == nil)
	{
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(14.0f, 
																	 120.0f, 
																	 100.0f, 
																	 30.0f)
												 fontName:CF_NORMAL
												pointSize:24.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:@"hex:"];
		[self setHexheaderLabel:lbl];
		[lbl release];
	}
	return hexheaderLabel;
}

- (FontLabel *)rgbHeaderLabel
{
	if (rgbHeaderLabel == nil)
	{
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(130.0f, 
																	 120.0f, 
																	 100.0f, 
																	 30.0f)
												 fontName:CF_NORMAL
												pointSize:24.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:@"rgb:"];
		[self setRgbHeaderLabel:lbl];
		[lbl release];
	}
	return rgbHeaderLabel;
}

- (FontLabel *)visualizerHeaderLabel
{
	if (visualizerHeaderLabel == nil)
	{
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(298.0f, 
																	 120.0f, 
																	 160.0f, 
																	 30.0f)
												 fontName:CF_NORMAL
												pointSize:24.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:@"visualizers:"];
		[self setVisualizerHeaderLabel:lbl];
		[lbl release];
	}
	return visualizerHeaderLabel;
}

- (NSMutableArray *)colorIcons
{
	if (colorIcons == nil)
	{
		NSMutableArray *a = [[NSMutableArray alloc] init];
		[self setColorIcons:a];
		[a release];
	}
	return colorIcons;
}
- (NSMutableArray *)hexContentLabels
{
	if (hexContentLabels == nil)
	{
		NSMutableArray *a = [[NSMutableArray alloc] init];
		[self setHexContentLabels:a];
		[a release];
	}
	return hexContentLabels;
}

- (BGSSwatchColor *)hexSeperator
{
	if (hexSeperator == nil)
	{
		BGSSwatchColor *c = [[BGSSwatchColor alloc] initWithFrame:CGRectMake(104.0f, 
																			 160.0f, 
																			 1.0f, 
																			 91.0f) 
														 andColor:CC_WHITE];
		[self setHexSeperator:c];
		[c release];
	}
	return hexSeperator;
}

- (NSMutableArray *)rgbRContentLabels
{
	if (rgbRContentLabels == nil)
	{
		NSMutableArray *a = [[NSMutableArray alloc] init];
		[self setRgbRContentLabels:a];
		[a release];
	}
	return rgbRContentLabels;
}
- (NSMutableArray *)rgbGContentLabels
{
	if (rgbGContentLabels == nil)
	{
		NSMutableArray *a = [[NSMutableArray alloc] init];
		[self setRgbGContentLabels:a];
		[a release];
	}
	return rgbGContentLabels;
}
- (NSMutableArray *)rgbBContentLabels
{
	if (rgbBContentLabels == nil)
	{
		NSMutableArray *a = [[NSMutableArray alloc] init];
		[self setRgbBContentLabels:a];
		[a release];
	}
	return rgbBContentLabels;
}

- (BGSSwatchColor *)rgbSeperator
{
	if (rgbSeperator == nil)
	{
		BGSSwatchColor *c = [[BGSSwatchColor alloc] initWithFrame:CGRectMake(268.0f, 
																			 160.0f, 
																			 1.0f, 
																			 91.0f) 
														 andColor:CC_WHITE];
		[self setRgbSeperator:c];
		[c release];
	}
	return rgbSeperator;
}

- (BGSVisualOptionView *)simpleCircleOption
{
	if (simpleCircleOption == nil)
	{
		BGSVisualOptionView *v = [[BGSVisualOptionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rgbSeperator.frame)+22.0f, 
																					   CGRectGetMinY(self.rgbSeperator.frame)-4.0f, 
																					   48.0f, 
																					   48.0f) 
																	andType:kSimpleCircle];
		[v.iconButton addTarget:self action:@selector(bubbleUp:) forControlEvents:UIControlEventTouchDown];
		[v.iconButton addTarget:self action:@selector(toggleVisualization:) forControlEvents:UIControlEventTouchUpInside];
		SaturationAppDelegate *app = (SaturationAppDelegate *)[[UIApplication sharedApplication] delegate];
		if (app.visualizationType == kSimpleCircle)
			[v setIsSelected:YES];
		[self setSimpleCircleOption:v];
		[v release];
	}
	return simpleCircleOption;
}

- (BGSVisualOptionView *)simpleParticleOption
{
	if (simpleParticleOption == nil)
	{
		BGSVisualOptionView *v = [[BGSVisualOptionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.simpleCircleOption.frame)+6.0f, 
																					   CGRectGetMinY(self.simpleCircleOption.frame), 
																					   48.0f, 
																					   48.0f) 
																	andType:kSimpleParticles];
		[v.iconButton addTarget:self action:@selector(bubbleUp:) forControlEvents:UIControlEventTouchDown];
		[v.iconButton addTarget:self action:@selector(toggleVisualization:) forControlEvents:UIControlEventTouchUpInside];
		SaturationAppDelegate *app = (SaturationAppDelegate *)[[UIApplication sharedApplication] delegate];
		if (app.visualizationType == kSimpleParticles)
			[v setIsSelected:YES];
		[self setSimpleParticleOption:v];
		[v release];
	}
	return simpleParticleOption;
}

- (void)bubbleUp:(id)sender
{
	UIButton *b = (UIButton *)sender;
	[self.view bringSubviewToFront:[b superview]];
}

- (void)toggleVisualization:(id)sender
{
	SaturationAppDelegate *app = (SaturationAppDelegate *)[[UIApplication sharedApplication] delegate];
	int type = app.visualizationType;
	
	if ([sender superview] == self.simpleCircleOption && app.visualizationType != kSimpleCircle)
	{
		type = kSimpleCircle;
		[self.simpleCircleOption setIsSelected:YES];
		[self.simpleParticleOption setIsSelected:NO];
	}
	else if ([sender superview] == self.simpleParticleOption && app.visualizationType != kSimpleParticles)
	{
		type = kSimpleParticles;
		[self.simpleCircleOption setIsSelected:NO];
		[self.simpleParticleOption setIsSelected:YES];
	}

	if (type != app.visualizationType)
	{
		[app setVisualizationType:type];
		[app changeEntry:self.entry];
	}
}

- (UIImageView *)comingSoonOption1
{
	if (comingSoonOption1 == nil)
	{
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"icon-no-visualizer.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.simpleParticleOption.frame)+10.0f, 
																		CGRectGetMinY(self.simpleParticleOption.frame)+4.0f, 
																		i.size.width, 
																		i.size.height)];
		[iv setImage:i];
		[self setComingSoonOption1:iv];
		[iv release];
	}
	return comingSoonOption1;
}

- (UIImageView *)comingSoonOption2
{
	if (comingSoonOption2 == nil)
	{
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"icon-no-visualizer.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.rgbSeperator.frame)+26.0f, 
																		CGRectGetMaxY(self.simpleCircleOption.frame)+8.0f, 
																		i.size.width, 
																		i.size.height)];
		[iv setImage:i];
		[self setComingSoonOption2:iv];
		[iv release];
	}
	return comingSoonOption2;
}

- (UIImageView *)comingSoonOption3
{
	if (comingSoonOption3 == nil)
	{
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"icon-no-visualizer.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.comingSoonOption2.frame)+14.0f, 
																		CGRectGetMinY(self.comingSoonOption2.frame), 
																		i.size.width, 
																		i.size.height)];
		[iv setImage:i];
		[self setComingSoonOption3:iv];
		[iv release];
	}
	return comingSoonOption3;
}

- (UIImageView *)comingSoonOption4
{
	if (comingSoonOption4 == nil)
	{
		NSString *p = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"icon-no-visualizer.png"];
		UIImage *i = [UIImage imageWithContentsOfFile:p];
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.comingSoonOption3.frame)+14.0f, 
																		CGRectGetMinY(self.comingSoonOption3.frame), 
																		i.size.width, 
																		i.size.height)];
		[iv setImage:i];
		[self setComingSoonOption4:iv];
		[iv release];
	}
	return comingSoonOption4;
}

- (BGSFavoriteView *)favoriteButton
{
	if (favoriteButton == nil)
	{
		BGSFavoriteView *e = [[BGSFavoriteView alloc] initWithFrame:CGRectMake(10.0f, 
																			   268.0f, 
																			   48.0f, 
																			   48.0f)];
		BGSKulerFeedController *feed = [[BGSKulerFeedController alloc] init];
		[e setIsFavorite:[feed isFavorite:self.entry]];
		[feed release];
		
		[e.iconButton addTarget:self action:@selector(toggleFavorite:) forControlEvents:UIControlEventTouchUpInside];
		[self setFavoriteButton:e];
		[e release];
	}
	return favoriteButton;
}

- (void)toggleFavorite:(id)sender
{
	BGSKulerFeedController *feed = [[BGSKulerFeedController alloc] init];
	if (self.favoriteButton.isFavorite)
	{
		[feed removeFromFavorites:self.entry];
		[self.favoriteButton setIsFavorite:NO];
	}
	else
	{
		[feed addToFavorites:self.entry];
		[self.favoriteButton setIsFavorite:YES];
	}
	[feed release];
}

- (BGSEmailButton *)emailButton
{
	if (emailButton == nil)
	{
		BGSEmailButton *e = [[BGSEmailButton alloc] initWithFrame:CGRectMake(68.0f, 
																			 268.0f, 
																			 401.0f, 
																			 48.0f)];
		[e addTarget:self action:@selector(email:) forControlEvents:UIControlEventTouchUpInside];
		[e.icon addTarget:self action:@selector(email:) forControlEvents:UIControlEventTouchUpInside];
		[self setEmailButton:e];
		[e release];
	}
	return emailButton;
}

- (void)email:(id)sender
{
	SaturationAppDelegate *app = (SaturationAppDelegate *)[[UIApplication sharedApplication] delegate];
	[app showEmailView];
}

- (id)initWithEntry:(NSDictionary *)entryData
{
	if (self = [super init])
	{
		[self setEntry:entryData];
	}
	return self;
}

- (void)loadView 
{
	CGRect frame = [[UIScreen mainScreen] bounds];
	
	UIView *v = [[UIView alloc] initWithFrame:frame];
	[v setTransform:CGAffineTransformMakeRotation(M_PI/2)];
	[v setBounds:CGRectMake(0.0f, 0.0f, frame.size.height, frame.size.width)];
	[v setBackgroundColor:CC_BACKGROUND];
	[v setAutoresizesSubviews:YES];
	[v setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
	[v sizeToFit];
	self.view = v;
	[v release];
	
	[self.view addSubview:self.background];
	
	[self.view addSubview:self.titleLabel];
	[self.view addSubview:self.authorLabel];
	[self.view addSubview:self.closeButton];
	
	[self.view addSubview:self.colorStripScroll];
	[self.colorStripScroll addSubview:self.colorStrip];
	[self.colorStripScroll setContentSize:CGSizeMake(self.colorStrip.frame.size.width-500.0f, 
													 self.colorStrip.frame.size.height*3)];
	
	[self.view addSubview:self.hexheaderLabel];
	[self.view addSubview:self.rgbHeaderLabel];
	[self.view addSubview:self.visualizerHeaderLabel];
	
	[self setupColorRows];

	[self.view addSubview:self.comingSoonOption1];
	[self.view addSubview:self.comingSoonOption2];
	[self.view addSubview:self.comingSoonOption3];
	[self.view addSubview:self.comingSoonOption4];
	[self.view addSubview:self.simpleCircleOption];
	[self.view addSubview:self.simpleParticleOption];
	
	[self.view addSubview:self.hexSeperator];
	[self.view addSubview:self.rgbSeperator];
	
	[self.view addSubview:self.favoriteButton];
	[self.view addSubview:self.emailButton];
}

- (void)setupColorRows
{
	CGFloat originX = 16.0f;
	CGFloat rowHeight = 20.0f;
	
	CGPoint p = CGPointMake(originX, 160.0f);
	
	NSArray *swatches = [self.entry objectForKey:@"swatches"];
	for (NSDictionary *swatch in swatches)
	{
		UIColor *color = [UIColor colorFromHex:[swatch objectForKey:@"swatchHexColor"] alpha:1.0];
		const CGFloat *components = CGColorGetComponents(color.CGColor);
		
		// color icon
		BGSSwatchColor *i = [[BGSSwatchColor alloc] initWithFrame:CGRectMake(p.x, 
																			 p.y+1.0f, 
																			 10.0f, 
																			 10.0f) 
														 andColor:color];
		[self.view addSubview:i];
		[self.colorIcons addObject:i];
		[i release];
		
		p.x += 16.0f;
		
		// hex label
		FontLabel *lbl = [[FontLabel alloc] initWithFrame:CGRectMake(p.x, 
																	 p.y, 
																	 70.0f, 
																	 16.0f)
												 fontName:CF_NORMAL
												pointSize:14.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		[lbl setText:[swatch objectForKey:@"swatchHexColor"]];
		[self.view addSubview:lbl];
		[self.hexContentLabels addObject:lbl];
		[lbl release];
		
		p.x = 130.0f;
		
		// rgb R label
		lbl = [[FontLabel alloc] initWithFrame:CGRectMake(p.x, 
														  p.y, 
														  35.0f, 
														  16.0f)
									  fontName:CF_NORMAL
									 pointSize:14.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		int v = components[0]*255;
		[lbl setText:[NSString stringWithFormat:@"%i", v]];
		[self.view addSubview:lbl];
		[self.rgbRContentLabels addObject:lbl];
		[lbl release];
		
		p.x += 46.0f;
		
		// rgb G label
		lbl = [[FontLabel alloc] initWithFrame:CGRectMake(p.x, 
														  p.y, 
														  35.0f, 
														  16.0f)
									  fontName:CF_NORMAL
									 pointSize:14.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		v = components[1]*255;
		[lbl setText:[NSString stringWithFormat:@"%i", v]];
		[self.view addSubview:lbl];
		[self.rgbGContentLabels addObject:lbl];
		[lbl release];
		
		p.x += 46.0f;
		
		// rgb B label
		lbl = [[FontLabel alloc] initWithFrame:CGRectMake(p.x, 
														  p.y, 
														  35.0f, 
														  16.0f)
									  fontName:CF_NORMAL
									 pointSize:14.0f];
		[lbl setTextColor:CC_WHITE];
		[lbl setBackgroundColor:CC_CLEAR];
		v = components[2]*255;
		[lbl setText:[NSString stringWithFormat:@"%i", v]];
		[self.view addSubview:lbl];
		[self.rgbBContentLabels addObject:lbl];
		[lbl release];
		
		p.x = originX;
		p.y += rowHeight;
	}
}


- (void)viewWillAppear:(BOOL)animated 
{
	[self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
	[background release];
	
	[entry release];
	[titleLabel release];
	[authorLabel release];
	[colorStrip release];
	
	[hexheaderLabel release];
	[rgbHeaderLabel release];
	[visualizerHeaderLabel release];
	
	[colorIcons release];
	[hexContentLabels release];
	
	[hexSeperator release];
	
	[rgbRContentLabels release];
	[rgbGContentLabels release];
	[rgbBContentLabels release];
	
	[rgbSeperator release];

	[simpleCircleOption release];
	[simpleParticleOption release];
	[comingSoonOption1 release];
	[comingSoonOption2 release];
	[comingSoonOption3 release];
	[comingSoonOption4 release];
	
	[favoriteButton release];
	//[emailButton release];
	
    [super dealloc];
}


@end
