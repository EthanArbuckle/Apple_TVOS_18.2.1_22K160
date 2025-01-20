@interface RPActivityViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NSArray)activities;
- (NSString)hostAppBundleIdentifier;
- (NSString)hostAppDisplayName;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIImage)hostAppImage;
- (UIViewController)currentActivityViewController;
- (UIVisualEffectView)effectView;
- (id)_roundedImageFromImage:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)completionHandler;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapMenuButton;
- (void)setActivities:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentActivityViewController:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHostAppBundleIdentifier:(id)a3;
- (void)setHostAppDisplayName:(id)a3;
- (void)setHostAppImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation RPActivityViewController

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___RPActivityViewController;
  -[RPActivityViewController viewDidLoad](&v36, "viewDidLoad");
  v3 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v3, "setScrollDirection:", 1LL);
  -[UICollectionViewFlowLayout setItemSize:](v3, "setItemSize:", 300.0, 180.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v3, "setMinimumInteritemSpacing:", 60.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v3, "setMinimumLineSpacing:", 60.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v4 frame];
  double v6 = v5 * 0.5 + -90.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v7 frame];
  double v9 = v8;

  double v10 = 0.0;
  v11 = -[UICollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___UICollectionView),  "initWithFrame:collectionViewLayout:",  v3,  0.0,  v6,  v9,  180.0);
  collectionView = self->_collectionView;
  self->_collectionView = v11;

  -[UICollectionView setClipsToBounds:](self->_collectionView, "setClipsToBounds:", 0LL);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView registerClass:forCellWithReuseIdentifier:]( self->_collectionView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___RPActivityCell),  @"ActivityCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v13 addSubview:self->_collectionView];

  if (-[NSArray count](self->_activities, "count") <= 5)
  {
    if (-[NSArray count](self->_activities, "count"))
    {
      unint64_t v14 = 0LL;
      do
        ++v14;
      while (-[NSArray count](self->_activities, "count") > v14);
      double v10 = (double)(int)v14 * 300.0 + (double)((int)v14 + 1) * 60.0;
    }

    -[UICollectionView frame](self->_collectionView, "frame");
    -[UICollectionView setFrame:](self->_collectionView, "setFrame:", 0.0, 0.0, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
    [v15 frame];
    double MidX = CGRectGetMidX(v37);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
    [v17 frame];
    -[UICollectionView setCenter:](self->_collectionView, "setCenter:", MidX, CGRectGetMidY(v38));
  }

  v18 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 60.0));
  -[UILabel setFont:](v18, "setFont:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:]( &OBJC_CLASS___NSBundle,  "_rpLocalizedStringFromFrameworkBundleWithKey:",  @"BROADCAST_ACTIVITIES_TITLE"));
  -[UILabel setText:](v18, "setText:", v20);

  -[UILabel sizeToFit](v18, "sizeToFit");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  -[UILabel setTextColor:](v18, "setTextColor:", v21);

  -[UILabel setAlpha:](v18, "setAlpha:", 0.3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v22 frame];
  double v24 = v23 * 0.5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController collectionView](self, "collectionView"));
  [v25 frame];
  -[UILabel setCenter:](v18, "setCenter:", v24, v26 + -100.0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v27 addSubview:v18];

  v28 = objc_alloc(&OBJC_CLASS___UIVisualEffectView);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 1LL));
  v30 = -[UIVisualEffectView initWithEffect:](v28, "initWithEffect:", v29);
  -[RPActivityViewController setEffectView:](self, "setEffectView:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v31 bounds];
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");

  -[UIVisualEffectView setAutoresizingMask:](self->_effectView, "setAutoresizingMask:", 18LL);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v32 addSubview:self->_effectView];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v33 sendSubviewToBack:self->_effectView];

  -[UICollectionView registerClass:forCellWithReuseIdentifier:]( self->_collectionView,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___RPActivityCell),  @"ActivityCell");
  v34 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "didTapMenuButton");
  -[UITapGestureRecognizer setAllowedPressTypes:](v34, "setAllowedPressTypes:", &off_10000CA88);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController view](self, "view"));
  [v35 addGestureRecognizer:v34];
}

- (void)didTapMenuButton
{
  id completionHandler = self->_completionHandler;
  if (completionHandler) {
    (*((void (**)(id, void, void, void, void, uint64_t))completionHandler + 2))( completionHandler,  0LL,  0LL,  0LL,  0LL,  1LL);
  }
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 60.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_activities, "count", a3, a4);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = (void *)objc_claimAutoreleasedReturnValue([a3 dequeueReusableCellWithReuseIdentifier:@"ActivityCell" forIndexPath:v6]);
  activities = self->_activities;
  id v9 = [v6 row];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](activities, "objectAtIndex:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);

  if (!v11)
  {
    v12 = objc_alloc(&OBJC_CLASS___UIImageView);
    [v7 frame];
    double v14 = v13;
    [v7 frame];
    v15 = -[UIImageView initWithFrame:](v12, "initWithFrame:", 0.0, 0.0, v14);
    [v7 setImageView:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 contentView]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
    [v16 addSubview:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 contentView]);
    [v18 setClipsToBounds:0];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 applicationExtension]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 _extensionBundle]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleURL]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 URLByDeletingLastPathComponent]);
  double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 URLByDeletingLastPathComponent]);

  double v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v23));
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 infoDictionary]);
  double v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"CFBundleIcons"]);
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:@"CFBundlePrimaryIcon"]);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", v27, v24));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPActivityViewController _roundedImageFromImage:](self, "_roundedImageFromImage:", v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
  [v30 setImage:v29];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
  [v31 setAdjustsImageWhenAncestorFocused:1];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
  if (!v32)
  {
    v33 = objc_alloc(&OBJC_CLASS___UILabel);
    v34 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
    [v34 frame];
    double v36 = v35 + 30.0;
    CGRect v37 = (void *)objc_claimAutoreleasedReturnValue([v7 contentView]);
    [v37 frame];
    CGRect v38 = -[UILabel initWithFrame:](v33, "initWithFrame:", 0.0, v36);
    [v7 setActivityTitle:v38];

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](&OBJC_CLASS___UIFont, "systemFontOfSize:", 40.0));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
    [v40 setFont:v39];

    v41 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
    [v41 setTextAlignment:1];

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
    [v43 setTextColor:v42];

    v44 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
    [v44 setHidden:1];

    v45 = (void *)objc_claimAutoreleasedReturnValue([v7 imageView]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
    [v45 addSubview:v46];
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue([v7 activityTitle]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v10 activityTitle]);
  [v47 setText:v48];

  return v7;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_activities, "objectAtIndex:", objc_msgSend(a4, "row", a3)));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationExtension]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000034D4;
  v16[3] = &unk_10000C388;
  v16[4] = self;
  objc_msgSend(v6, "set_requestPostCompletionBlockWithItems:", v16);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100003ADC;
  v15[3] = &unk_10000C3B0;
  v15[4] = self;
  [v6 setRequestCancellationBlock:v15];
  double v7 = objc_alloc_init(&OBJC_CLASS___NSExtensionItem);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v9 = -[NSItemProvider initWithItem:typeIdentifier:]( objc_alloc(&OBJC_CLASS___NSItemProvider),  "initWithItem:typeIdentifier:",  self->_hostAppBundleIdentifier,  kUTTypeData);
  [v8 addObject:v9];

  double v10 = -[NSItemProvider initWithItem:typeIdentifier:]( objc_alloc(&OBJC_CLASS___NSItemProvider),  "initWithItem:typeIdentifier:",  self->_hostAppDisplayName,  kUTTypeData);
  [v8 addObject:v10];

  if (self->_hostAppImage)
  {
    v11 = -[NSItemProvider initWithItem:typeIdentifier:]( objc_alloc(&OBJC_CLASS___NSItemProvider),  "initWithItem:typeIdentifier:",  self->_hostAppImage,  kUTTypeData);
    [v8 addObject:v11];
  }

  -[NSExtensionItem setAttachments:](v7, "setAttachments:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 applicationExtension]);
  v17 = v7;
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100003B08;
  v14[3] = &unk_10000C418;
  v14[4] = self;
  [v12 instantiateViewControllerWithInputItems:v13 connectionHandler:v14];
}

- (id)_roundedImageFromImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  UIGraphicsBeginImageContextWithOptions(v12, 0, 1.0);
  [v3 size];
  double v5 = v4;
  [v3 size];
  double v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:]( &OBJC_CLASS___UIBezierPath,  "bezierPathWithRoundedRect:cornerRadius:",  0.0,  0.0,  v5,  v6,  10.0));
  [v7 addClip];

  [v3 size];
  double v9 = v8;
  [v3 size];
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v9, v10);

  return UIGraphicsGetImageFromCurrentImageContext();
}

- (NSString)hostAppBundleIdentifier
{
  return self->_hostAppBundleIdentifier;
}

- (void)setHostAppBundleIdentifier:(id)a3
{
}

- (NSString)hostAppDisplayName
{
  return self->_hostAppDisplayName;
}

- (void)setHostAppDisplayName:(id)a3
{
}

- (UIImage)hostAppImage
{
  return self->_hostAppImage;
}

- (void)setHostAppImage:(id)a3
{
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIViewController)currentActivityViewController
{
  return self->_currentActivityViewController;
}

- (void)setCurrentActivityViewController:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end