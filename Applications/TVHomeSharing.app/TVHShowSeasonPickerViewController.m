@interface TVHShowSeasonPickerViewController
+ (id)new;
- (TVHKMediaEntityCollection)show;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntitiesShelfViewController)seasonsShelfViewController;
- (TVHShowSeasonPickerViewController)init;
- (TVHShowSeasonPickerViewController)initWithCoder:(id)a3;
- (TVHShowSeasonPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHShowSeasonPickerViewController)initWithShow:(id)a3 seasons:(id)a4 mediaLibrary:(id)a5;
- (TVHShowSeasonPickerViewControllerDelegate)delegate;
- (UILabel)titleLabel;
- (id)preferredFocusEnvironments;
- (unint64_t)indexForPreferredFocusedSeason;
- (void)_menuButtonPressed:(id)a3;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIndexForPreferredFocusedSeason:(unint64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateSeasons:(id)a3 changeSet:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHShowSeasonPickerViewController

+ (id)new
{
  return 0LL;
}

- (TVHShowSeasonPickerViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHShowSeasonPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHShowSeasonPickerViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHShowSeasonPickerViewController)initWithShow:(id)a3 seasons:(id)a4 mediaLibrary:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVHShowSeasonPickerViewController;
  v12 = -[TVHShowSeasonPickerViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0LL, 0LL);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_show, a3);
    objc_storeStrong((id *)&v13->_mediaLibrary, a5);
    v14 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"ShowSeasons");
    v15 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  @"ShowSeasons",  v10);
    v27 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    -[TVHMediaEntitiesDataSource updateWithMediaEntitiesDataSourceFetchResults:]( v14,  "updateWithMediaEntitiesDataSourceFetchResults:",  v16);

    unsigned int v17 = -[TVHKMediaLibrary tvh_shouldDisplayWideShowCoverArt](v13->_mediaLibrary, "tvh_shouldDisplayWideShowCoverArt");
    double v18 = 622.0;
    if (!v17) {
      double v18 = 350.0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSimpleLockupShelfViewLayout shelfViewLayoutWithContentViewSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesShelfViewLayout,  "shelfViewLayoutWithContentViewSize:footerLayoutType:",  0LL,  v18));
    v20 = -[TVHMediaEntitiesShelfViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesShelfViewController),  "initWithDataSource:layout:",  v14,  v19);
    seasonsShelfViewController = v13->_seasonsShelfViewController;
    v13->_seasonsShelfViewController = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](v13->_seasonsShelfViewController, "titleLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  6LL,  7LL));
    [v22 setFont:v23];

    -[TVHMediaEntitiesShelfViewController setDelegate:](v13->_seasonsShelfViewController, "setDelegate:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](v13->_seasonsShelfViewController, "collectionView"));
    objc_msgSend(v24, "setContentInset:", 0.0, 90.0, 0.0, 90.0);

    -[TVHShowSeasonPickerViewController setModalPresentationStyle:](v13, "setModalPresentationStyle:", 8LL);
  }

  return v13;
}

- (void)setIndexForPreferredFocusedSeason:(unint64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  a3,  0LL));
  [v5 setIndexPathForPreferredFocusedMediaEntity:v4];
}

- (unint64_t)indexForPreferredFocusedSeason
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 indexPathForPreferredFocusedMediaEntity]);

  id v4 = [v3 item];
  return (unint64_t)v4;
}

- (void)updateSeasons:(id)a3 changeSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataSource]);
  id v10 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  @"ShowSeasons",  v7);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v10, "setChangeSet:", v6);
  v12 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  [v9 updateWithMediaEntitiesDataSourceFetchResults:v11];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHShowSeasonPickerViewController;
  -[TVHShowSeasonPickerViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController view](self, "view"));
  id v4 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuButtonPressed:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v4, "setAllowedPressTypes:", &off_100106AB8);
  [v3 addGestureRecognizer:v4];
  id v5 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[TVHShowSeasonPickerViewController setTitleLabel:](self, "setTitleLabel:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  6LL,  7LL));
  -[UILabel setFont:](v5, "setFont:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController show](self, "show"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvh_displayTitle"));
  -[UILabel setText:](v5, "setText:", v8);

  -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", 1LL);
  -[UILabel setLineBreakMode:](v5, "setLineBreakMode:", 4LL);
  -[UILabel setTextAlignment:](v5, "setTextAlignment:", 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));
  -[UILabel setTextColor:](v5, "setTextColor:", v11);

  [v3 addSubview:v5];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  -[TVHShowSeasonPickerViewController addChildViewController:](self, "addChildViewController:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);
  [v3 addSubview:v13];
  [v12 didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHShowSeasonPickerViewController;
  -[TVHShowSeasonPickerViewController viewDidLayoutSubviews](&v19, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "sizeThatFits:", v5, v7);
  double v10 = v9;
  sub_10002EE78(v5 - v9);
  CGFloat v12 = v11 * 0.5;
  objc_msgSend(v8, "setFrame:", v11 * 0.5, 265.0, v10, 46.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
  objc_msgSend(v14, "sizeThatFits:", v5, v7);
  double v16 = v15;
  double v18 = v17;
  v20.origin.x = v12;
  v20.origin.y = 265.0;
  v20.size.width = v10;
  v20.size.height = 46.0;
  objc_msgSend(v14, "setFrame:", 0.0, CGRectGetMaxY(v20) + 60.0, v16, v18);
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController seasonsShelfViewController](self, "seasonsShelfViewController"));
  double v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController delegate](self, "delegate"));
  [v6 showSeasonPickerViewController:self didSelectSeason:v5];
}

- (void)_menuButtonPressed:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHShowSeasonPickerViewController delegate](self, "delegate", a3));
  [v4 showSeasonPickerViewControllerDidDismiss:self];
}

- (TVHShowSeasonPickerViewControllerDelegate)delegate
{
  return (TVHShowSeasonPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVHKMediaEntityCollection)show
{
  return self->_show;
}

- (TVHMediaEntitiesShelfViewController)seasonsShelfViewController
{
  return self->_seasonsShelfViewController;
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end