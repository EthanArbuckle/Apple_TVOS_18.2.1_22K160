@interface TVHProductViewController
+ (CATransform3D)_contentSectionCellHeaderLargeScaleTransform;
+ (CATransform3D)_contentSectionCellHeaderSmallScaleTransform;
+ (TVHProductViewController)new;
+ (id)_cellSpacingHeightsForMargins:(id)a3;
+ (id)_multipleItemsStyleBackdropTintViewColorWithUserInterfaceStyle:(int64_t)a3;
- (BOOL)_isFocusInBannerCell;
- (BOOL)_isMultipleItemsStyle;
- (BOOL)_isPartialScrollingEnabled;
- (BOOL)_isSingleItemStyle;
- (BOOL)_shouldFirstContentSectionCellUseTitledCell;
- (BOOL)_updateUserInterfaceStyleOverride;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)preloadCollectionViewContentOnLayout;
- (CGSize)_contentSizeAndContentSectionCellMargins:(id *)a3 contentSectionFirstCellPartialMargin:(UIEdgeInsets *)a4 contentSectionFirstCellZeroTopMargin:(UIEdgeInsets *)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)preloadCollectionViewContentSize;
- (NSArray)contentSectionCellMargins;
- (NSArray)contentSectionItems;
- (TVHCollectionView)collectionView;
- (TVHKBackgroundImageInfo)backgroundImageInfo;
- (TVHProductBannerView)bannerView;
- (TVHProductBannerViewController)bannerViewController;
- (TVHProductViewController)init;
- (TVHProductViewController)initWithCoder:(id)a3;
- (TVHProductViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHProductViewController)initWithStyle:(unint64_t)a3 backgroundImageInfo:(id)a4;
- (TVHProductViewControllerDelegate)delegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)_marginForFirstContentSectionCellWithMode:(unint64_t)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)contentSectionFirstCellPartialMargin;
- (UIEdgeInsets)contentSectionFirstCellZeroTopMargin;
- (UIImageView)backgroundImageView;
- (UIImageView)multipleItemsStyleVignetteImageView;
- (UIImageView)vignetteImageView;
- (UIView)backdropView;
- (UIView)multipleItemsStyleBackdropTintView;
- (double)_bannerCellHeight;
- (double)_contentSectionCellMaxTitleLabelHeightPlusMargin;
- (double)bannerCellHeight;
- (id)_allViewControllers;
- (id)_collectionViewCellForIdentifier:(id)a3 atIndexPath:(id)a4;
- (id)_contentSectionRowCellViewControllerAtIndex:(unint64_t)a3;
- (id)_contentSectionViewControllerAtIndex:(unint64_t)a3;
- (id)_contentSectionViewControllers;
- (id)_firstContentSectionCellWithIsFocusInBanner:(BOOL)a3;
- (id)_lastInteractiveContentSectionCell;
- (id)_titledContentSectionCellLabelWithText:(id)a3;
- (id)_viewControllerAtIndexPath:(id)a3;
- (id)_yOffsetForView:(id)a3 withScrollView:(id)a4 targetYOffset:(double)a5;
- (id)preferredFocusEnvironments;
- (unint64_t)_lastInteractiveContentSectionCellIndex;
- (unint64_t)style;
- (void)_addMultipleItemsStyleSpecificBackgroundViews;
- (void)_addOrRemoveMultipleItemsStyleSpecificBackgroundViews;
- (void)_calculatePreloadContentSizeAndCellMargins;
- (void)_configureFirstContentSectionCellHeaderScalingWithIsFocusInBanner:(BOOL)a3;
- (void)_configureFirstContentSectionCellScrollingSpeedBump;
- (void)_contentItemsDidChangeAnimated:(BOOL)a3;
- (void)_layoutBackdropAndVignetteViews;
- (void)_makeFirstContentSectionCellHeaderLarger;
- (void)_makeFirstContentSectionCellHeaderSmaller;
- (void)_removeMultipleItemsStyleSpecificBackgroundViews;
- (void)_updateBackgroundViews;
- (void)_updateMarginForFirstContentSectionCell:(id)a3 marginMode:(unint64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)purgeBackgroundImages;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundImageInfo:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setBannerCellHeight:(double)a3;
- (void)setBannerViewController:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentSectionCellMargins:(id)a3;
- (void)setContentSectionFirstCellPartialMargin:(UIEdgeInsets)a3;
- (void)setContentSectionFirstCellZeroTopMargin:(UIEdgeInsets)a3;
- (void)setContentSectionItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setMultipleItemsStyleBackdropTintView:(id)a3;
- (void)setMultipleItemsStyleVignetteImageView:(id)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setPreloadCollectionViewContentOnLayout:(BOOL)a3;
- (void)setPreloadCollectionViewContentSize:(CGSize)a3;
- (void)setVignetteImageView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TVHProductViewController

+ (TVHProductViewController)new
{
  return 0LL;
}

- (TVHProductViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHProductViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHProductViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHProductViewController)initWithStyle:(unint64_t)a3 backgroundImageInfo:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHProductViewController;
  v8 = -[TVHProductViewController initWithNibName:bundle:](&v17, "initWithNibName:bundle:", 0LL, 0LL);
  v9 = v8;
  if (v8)
  {
    v8->_style = a3;
    objc_storeStrong((id *)&v8->_backgroundImageInfo, a4);
    contentSectionItems = v9->_contentSectionItems;
    v9->_contentSectionItems = (NSArray *)&__NSArray0__struct;

    contentSectionCellMargins = v9->_contentSectionCellMargins;
    v9->_contentSectionCellMargins = (NSArray *)&__NSArray0__struct;

    __int128 v12 = *(_OWORD *)&UIEdgeInsetsZero.top;
    __int128 v13 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    *(_OWORD *)&v9->_contentSectionFirstCellZeroTopMargin.top = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(_OWORD *)&v9->_contentSectionFirstCellZeroTopMargin.bottom = v13;
    *(_OWORD *)&v9->_contentSectionFirstCellPartialMargin.top = v12;
    *(_OWORD *)&v9->_contentSectionFirstCellPartialMargin.bottom = v13;
    v14 = -[TVHProductBannerViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___TVHProductBannerViewController),  "initWithStyle:",  v9->_style != 0);
    bannerViewController = v9->_bannerViewController;
    v9->_bannerViewController = v14;
  }

  return v9;
}

- (TVHProductBannerView)bannerView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bannerView]);

  return (TVHProductBannerView *)v3;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector(v5, "productViewController:didOverrideUserInterfaceStyle:");

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (void)setBackgroundImageInfo:(id)a3
{
  id v5 = a3;
  if ((-[TVHKBackgroundImageInfo isEqual:](self->_backgroundImageInfo, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundImageInfo, a3);
    if (-[TVHProductViewController isViewLoaded](self, "isViewLoaded"))
    {
      if (-[TVHProductViewController _updateUserInterfaceStyleOverride](self, "_updateUserInterfaceStyleOverride"))
      {
        -[TVHProductViewController _removeMultipleItemsStyleSpecificBackgroundViews]( self,  "_removeMultipleItemsStyleSpecificBackgroundViews");
        -[TVHProductViewController _addOrRemoveMultipleItemsStyleSpecificBackgroundViews]( self,  "_addOrRemoveMultipleItemsStyleSpecificBackgroundViews");
      }

      -[TVHProductViewController _updateBackgroundViews](self, "_updateBackgroundViews");
    }
  }
}

- (void)setContentSectionItems:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contentSectionItems, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    contentSectionItems = self->_contentSectionItems;
    self->_contentSectionItems = v4;

    if (-[TVHProductViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[TVHProductViewController _addOrRemoveMultipleItemsStyleSpecificBackgroundViews]( self,  "_addOrRemoveMultipleItemsStyleSpecificBackgroundViews");
      -[TVHProductViewController _calculatePreloadContentSizeAndCellMargins]( self,  "_calculatePreloadContentSizeAndCellMargins");
      -[TVHProductViewController _contentItemsDidChangeAnimated:](self, "_contentItemsDidChangeAnimated:", 1LL);
    }
  }
}

- (void)purgeBackgroundImages
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageInfo](self, "backgroundImageInfo"));
  [v5 setImage:0];
  [v5 setBackdropImage:0];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageView](self, "backgroundImageView"));
  [v3 removeFromSuperview];

  -[TVHProductViewController setBackgroundImageView:](self, "setBackgroundImageView:", 0LL);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backdropView](self, "backdropView"));
  [v4 removeFromSuperview];

  -[TVHProductViewController setBackdropView:](self, "setBackdropView:", 0LL);
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHProductViewController;
  -[TVHProductViewController setOverrideUserInterfaceStyle:](&v6, "setOverrideUserInterfaceStyle:");
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController delegate](self, "delegate"));
    [v5 productViewController:self didOverrideUserInterfaceStyle:a3];
  }

- (void)loadView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v15 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", v5, v7, v9, v11);
  __int128 v12 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v12, "setMinimumLineSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:", 0.0);
  __int128 v13 = -[TVHCollectionView initWithFrame:collectionViewLayout:]( objc_alloc(&OBJC_CLASS___TVHCollectionView),  "initWithFrame:collectionViewLayout:",  v12,  v5,  v7,  v9,  v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[TVHCollectionView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[TVHCollectionView setDelegate:](v13, "setDelegate:", self);
  -[TVHCollectionView registerClass:forCellWithReuseIdentifier:]( v13,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVHProductCollectionViewCell),  @"__RegularCellIdentifier");
  -[TVHCollectionView registerClass:forCellWithReuseIdentifier:]( v13,  "registerClass:forCellWithReuseIdentifier:",  objc_opt_class(&OBJC_CLASS___TVHTitledProductCollectionViewCell),  @"__TitleCellIdentifier");
  -[TVHCollectionView setAutoresizingMask:](v13, "setAutoresizingMask:", 18LL);
  -[TVHCollectionView setContentInset:](v13, "setContentInset:", 0.0, 0.0, 90.0, 0.0);
  -[TVHCollectionView _setContentInsetAdjustmentBehavior:](v13, "_setContentInsetAdjustmentBehavior:", 2LL);
  -[TVHProductViewController setCollectionView:](self, "setCollectionView:", v13);
  -[UIView addSubview:](v15, "addSubview:", v13);
  -[TVHProductViewController setView:](self, "setView:", v15);
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHProductViewController;
  -[TVHProductViewController viewDidLoad](&v12, "viewDidLoad");
  -[TVHProductViewController _updateUserInterfaceStyleOverride](self, "_updateUserInterfaceStyleOverride");
  -[TVHProductViewController _bannerCellHeight](self, "_bannerCellHeight");
  -[TVHProductViewController setBannerCellHeight:](self, "setBannerCellHeight:");
  -[TVHProductViewController _updateBackgroundViews](self, "_updateBackgroundViews");
  -[TVHProductViewController _calculatePreloadContentSizeAndCellMargins]( self,  "_calculatePreloadContentSizeAndCellMargins");
  objc_initWeak(&location, self);
  v3 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  double v8 = sub_10000E8A4;
  double v9 = &unk_1000FD018;
  objc_copyWeak(&v10, &location);
  double v5 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v3,  "initWithCollectionView:cellProvider:",  v4,  &v6);

  -[TVHProductViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5, v6, v7, v8, v9);
  -[TVHProductViewController _contentItemsDidChangeAnimated:](self, "_contentItemsDidChangeAnimated:", 0LL);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVHProductViewController;
  -[TVHProductViewController viewDidLayoutSubviews](&v29, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  if (-[TVHProductViewController preloadCollectionViewContentOnLayout](self, "preloadCollectionViewContentOnLayout"))
  {
    -[TVHProductViewController setPreloadCollectionViewContentOnLayout:]( self,  "setPreloadCollectionViewContentOnLayout:",  0LL);
    double y = CGPointZero.y;
    -[TVHProductViewController preloadCollectionViewContentSize](self, "preloadCollectionViewContentSize");
    objc_msgSend(v8, "_ensureViewsAreLoadedInRect:", CGPointZero.x, y, v10, v11);
  }

  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageView](self, "backgroundImageView"));
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v5, v7);

  -[TVHProductViewController _layoutBackdropAndVignetteViews](self, "_layoutBackdropAndVignetteViews");
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController multipleItemsStyleBackdropTintView]( self,  "multipleItemsStyleBackdropTintView"));
  if (v13)
  {
    [v8 contentSize];
    double v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  1LL));
    objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionViewLayout]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 layoutAttributesForItemAtIndexPath:v16]);

    [v18 frame];
    double v20 = v19;
    [v18 frame];
    double v22 = v20 + v21 + -39.0;
    objc_msgSend(v13, "setFrame:", 0.0, v22, v5, v15 - v22 + 200.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController multipleItemsStyleVignetteImageView]( self,  "multipleItemsStyleVignetteImageView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 image]);
    [v24 size];
    double v26 = v25;
    double v28 = v27;

    objc_msgSend(v23, "setFrame:", 0.0, v22 - v28, v26, v28);
    [v8 sendSubviewToBack:v23];
    [v8 sendSubviewToBack:v13];
  }
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    double v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVHProductViewController;
  -[TVHProductViewController didUpdateFocusInContext:withAnimationCoordinator:]( &v28,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  v7);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _contentSectionViewControllers](self, "_contentSectionViewControllers"));
  if ([v8 count])
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForItemAtIndexPath:v10]);

    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  1LL));
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForItemAtIndexPath:v12]);

    double v14 = 0LL;
    if ((unint64_t)[v8 count] >= 2)
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  1LL,  1LL));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForItemAtIndexPath:v15]);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10000EDE0;
    v21[3] = &unk_1000FD160;
    id v22 = (id)objc_claimAutoreleasedReturnValue([v6 nextFocusedView]);
    id v23 = v13;
    id v24 = (id)objc_claimAutoreleasedReturnValue([v6 previouslyFocusedView]);
    id v25 = v14;
    double v26 = self;
    id v27 = v11;
    id v16 = v11;
    id v17 = v14;
    id v18 = v24;
    id v19 = v13;
    id v20 = v22;
    [v7 addCoordinatedAnimations:v21 completion:0];
  }
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _viewControllerAtIndexPath:](self, "_viewControllerAtIndexPath:", a5, a4));
  if (v8)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController childViewControllers](self, "childViewControllers"));
    unsigned __int8 v7 = [v6 containsObject:v8];

    if ((v7 & 1) == 0)
    {
      -[TVHProductViewController addChildViewController:](self, "addChildViewController:", v8);
      [v8 didMoveToParentViewController:self];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v11 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _viewControllerAtIndexPath:](self, "_viewControllerAtIndexPath:", a5));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController childViewControllers](self, "childViewControllers"));
    if ([v8 containsObject:v7])
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
      unsigned int v10 = [v9 isDescendantOfView:v11];

      if (v10)
      {
        [v7 willMoveToParentViewController:0];
        [v7 removeFromParentViewController];
      }
    }

    else
    {
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _viewControllerAtIndexPath:](self, "_viewControllerAtIndexPath:", v6));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 bounds];
  double v11 = v10;

  objc_msgSend(v8, "sizeThatFits:", v11, 0.0);
  double v13 = v12;
  if ([v6 section] == (id)1)
  {
    id v14 = [v6 item];
    if (!v14
      && -[TVHProductViewController _shouldFirstContentSectionCellUseTitledCell]( self,  "_shouldFirstContentSectionCellUseTitledCell"))
    {
      -[TVHProductViewController _contentSectionCellMaxTitleLabelHeightPlusMargin]( self,  "_contentSectionCellMaxTitleLabelHeightPlusMargin");
      double v13 = v13 + v15;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionCellMargins](self, "contentSectionCellMargins"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectAtIndex:v14]);
    objc_msgSend(v17, "tvh_marginValue");
    double v19 = v18;
    double v21 = v20;

    double v13 = v13 + v19 + v21;
  }

  double v22 = v11;
  double v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if (a5)
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }

  else
  {
    double bottom = 8.0;
    double top = 0.0;
    double left = 0.0;
    double right = 0.0;
  }

  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 focusedView]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _yOffsetForView:withScrollView:targetYOffset:]( self,  "_yOffsetForView:withScrollView:targetYOffset:",  v11,  v7,  a5->y));
  if (v9)
  {
    [v9 doubleValue];
    a5->double y = v10;
  }
}

- (void)_contentItemsDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  v22[0] = &off_100105E68;
  v22[1] = &off_100105E80;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 2LL));
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v6);

  double v21 = @"__BannerItemIdentifier";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v7,  &off_100105E68);

  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      double v13 = 0LL;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) identifier]);
        -[NSMutableArray addObject:](v8, "addObject:", v14);

        double v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v11);
  }

  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v8,  &off_100105E80);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController diffableDataSource](self, "diffableDataSource"));
  [v15 applySnapshot:v5 animatingDifferences:v3];
}

- (id)_collectionViewCellForIdentifier:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  if ([v5 section])
  {
    id v7 = [v5 item];
    if (v7)
    {
      id v8 = v7;
      double v9 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableCellWithReuseIdentifier:@"__RegularCellIdentifier" forIndexPath:v5]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionViewControllerAtIndex:]( self,  "_contentSectionViewControllerAtIndex:",  v8));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
      [v9 setProductContentView:v11];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionCellMargins](self, "contentSectionCellMargins"));
      double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndex:v8]);
      objc_msgSend(v13, "tvh_marginValue");
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      objc_msgSend(v9, "setProductContentViewMargin:", v15, v17, v19, v21);
    }

    else
    {
      BOOL v24 = -[TVHProductViewController _isFocusInBannerCell](self, "_isFocusInBannerCell");
      double v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _firstContentSectionCellWithIsFocusInBanner:]( self,  "_firstContentSectionCellWithIsFocusInBanner:",  v24));
      -[TVHProductViewController _configureFirstContentSectionCellScrollingSpeedBump]( self,  "_configureFirstContentSectionCellScrollingSpeedBump");
      -[TVHProductViewController _configureFirstContentSectionCellHeaderScalingWithIsFocusInBanner:]( self,  "_configureFirstContentSectionCellHeaderScalingWithIsFocusInBanner:",  v24);
    }
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableCellWithReuseIdentifier:@"__RegularCellIdentifier" forIndexPath:v5]);
    double v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 view]);

    [v9 setProductContentView:v23];
  }

  objc_msgSend(v9, "tvh_setDebugLayoutColorType:", 1);

  return v9;
}

- (id)_firstContentSectionCellWithIsFocusInBanner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionViewControllerAtIndex:]( self,  "_contentSectionViewControllerAtIndex:",  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  if (-[TVHProductViewController _shouldFirstContentSectionCellUseTitledCell]( self,  "_shouldFirstContentSectionCellUseTitledCell"))
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 dequeueReusableCellWithReuseIdentifier:@"__TitleCellIdentifier" forIndexPath:v6]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bannerView]);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 infoView]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 title]);

    double v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _titledContentSectionCellLabelWithText:]( self,  "_titledContentSectionCellLabelWithText:",  v13));
    [v9 setTitleLabel:v14];
    objc_msgSend(v9, "setTitleLabelMargin:", 66.0, 90.0, 37.0, 90.0);
    [v9 setShowingTitleLabel:!v3];
    [v9 setProductContentView:v8];
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionCellMargins](self, "contentSectionCellMargins"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectAtIndex:0]);
    objc_msgSend(v16, "tvh_marginValue");
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    objc_msgSend(v9, "setProductContentViewMargin:", v18, v20, v22, v24);
  }

  else
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( [v5 dequeueReusableCellWithReuseIdentifier:@"__RegularCellIdentifier" forIndexPath:v6]);
    [v9 setProductContentView:v8];
    if (v3) {
      uint64_t v25 = 0LL;
    }
    else {
      uint64_t v25 = 2LL;
    }
    -[TVHProductViewController _marginForFirstContentSectionCellWithMode:]( self,  "_marginForFirstContentSectionCellWithMode:",  v25);
    objc_msgSend(v9, "setProductContentViewMargin:");
  }

  return v9;
}

+ (id)_multipleItemsStyleBackdropTintViewColorWithUserInterfaceStyle:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 == 1) {
    double v3 = 1.0;
  }
  return (id)objc_claimAutoreleasedReturnValue( +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  v3,  0.15));
}

- (void)_removeMultipleItemsStyleSpecificBackgroundViews
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( -[TVHProductViewController multipleItemsStyleVignetteImageView]( self,  "multipleItemsStyleVignetteImageView"));
  [v4 removeFromSuperview];
  -[TVHProductViewController setMultipleItemsStyleVignetteImageView:]( self,  "setMultipleItemsStyleVignetteImageView:",  0LL);
  double v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController multipleItemsStyleBackdropTintView]( self,  "multipleItemsStyleBackdropTintView"));
  [v3 removeFromSuperview];
  -[TVHProductViewController setMultipleItemsStyleBackdropTintView:]( self,  "setMultipleItemsStyleBackdropTintView:",  0LL);
}

- (void)_addMultipleItemsStyleSpecificBackgroundViews
{
  id v3 = -[TVHProductViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
  double v9 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[UIView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0LL);
  id v4 = [(id)objc_opt_class(self) _multipleItemsStyleBackdropTintViewColorWithUserInterfaceStyle:v3];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v5);

  -[UIView tvh_setDebugLayoutColorType:](v9, "tvh_setDebugLayoutColorType:", 12LL);
  -[TVHProductViewController setMultipleItemsStyleBackdropTintView:](self, "setMultipleItemsStyleBackdropTintView:", v9);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  [v6 insertSubview:v9 atIndex:0];
  if (v3 == (id)1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Backdrop-Vignette"));
    id v8 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v7);
    -[UIImageView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0LL);
    -[UIImageView tvh_setDebugLayoutColorType:](v8, "tvh_setDebugLayoutColorType:", 11LL);
    -[TVHProductViewController setMultipleItemsStyleVignetteImageView:]( self,  "setMultipleItemsStyleVignetteImageView:",  v8);
    [v6 insertSubview:v8 aboveSubview:v9];
  }
}

- (void)_addOrRemoveMultipleItemsStyleSpecificBackgroundViews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController multipleItemsStyleBackdropTintView]( self,  "multipleItemsStyleBackdropTintView"));

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  BOOL v5 = (unint64_t)[v4 count] >= 2 && (id)-[TVHProductViewController style](self, "style") == (id)1;

  if (!v3 || v5)
  {
    if (v3) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v5;
    }
    if (v6) {
      -[TVHProductViewController _addMultipleItemsStyleSpecificBackgroundViews]( self,  "_addMultipleItemsStyleSpecificBackgroundViews");
    }
  }

  else
  {
    -[TVHProductViewController _removeMultipleItemsStyleSpecificBackgroundViews]( self,  "_removeMultipleItemsStyleSpecificBackgroundViews");
  }

- (void)_updateBackgroundViews
{
  id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductViewController view](self, "view"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageInfo](self, "backgroundImageInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 image]);
  BOOL v5 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageView](self, "backgroundImageView"));
  BOOL v6 = v5;
  if (v5)
  {
    -[UIImageView removeFromSuperview](v5, "removeFromSuperview");
    -[TVHProductViewController setBackgroundImageView:](self, "setBackgroundImageView:", 0LL);
  }

  if (v4)
  {
    id v7 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);

    -[UIImageView setOpaque:](v7, "setOpaque:", 1LL);
    -[UIImageView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0LL);
    -[UIImageView tvh_setDebugLayoutColorType:](v7, "tvh_setDebugLayoutColorType:", 4LL);
    -[TVHProductViewController setBackgroundImageView:](self, "setBackgroundImageView:", v7);
    [v18 insertSubview:v7 atIndex:0];
    BOOL v6 = v7;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backdropView](self, "backdropView"));
  double v9 = v8;
  if (v8)
  {
    [v8 removeFromSuperview];
    -[TVHProductViewController setBackdropView:](self, "setBackdropView:", 0LL);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  id v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v3 backdropImage]);
    if (v12)
    {
      double v13 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v12);
      -[UIImageView setContentMode:](v13, "setContentMode:", 6LL);
      -[UIImageView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0LL);
      -[UIImageView setOpaque:](v13, "setOpaque:", 1LL);
      -[UIImageView setClipsToBounds:](v13, "setClipsToBounds:", 1LL);
      -[TVHProductViewController setBackdropView:](self, "setBackdropView:", v13);
      if (v6) {
        [v18 insertSubview:v13 aboveSubview:v6];
      }
      else {
        [v18 insertSubview:v13 atIndex:0];
      }
    }

    else
    {
      double v13 = (UIImageView *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](&OBJC_CLASS___UIBlurEffect, "effectWithStyle:", 5005LL));
      double v15 = -[UIVisualEffectView initWithEffect:](objc_alloc(&OBJC_CLASS___UIVisualEffectView), "initWithEffect:", v13);
      -[UIVisualEffectView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0LL);
      -[TVHProductViewController setBackdropView:](self, "setBackdropView:", v15);
      [v18 insertSubview:v15 atIndex:0];
    }

    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backdropView](self, "backdropView"));
    objc_msgSend(v14, "tvh_setDebugLayoutColorType:", 6);
    double v16 = (UIImageView *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController vignetteImageView](self, "vignetteImageView"));
    if (!v16)
    {
      double v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"Backdrop-Vignette"));
      double v16 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v17);
      -[UIImageView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0LL);
      -[UIImageView tvh_setDebugLayoutColorType:](v16, "tvh_setDebugLayoutColorType:", 13LL);
      -[TVHProductViewController setVignetteImageView:](self, "setVignetteImageView:", v16);
    }

    [v18 insertSubview:v16 aboveSubview:v14];
  }

  else
  {
    double v14 = v9;
  }
}

- (void)_layoutBackdropAndVignetteViews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController view](self, "view"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v28.origin.x = v5;
  v28.origin.double y = v7;
  v28.size.double width = v9;
  v28.size.double height = v11;
  double Height = CGRectGetHeight(v28);
  id v27 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backdropView](self, "backdropView"));
  [v27 frame];
  double v14 = v13;
  -[TVHProductViewController bannerCellHeight](self, "bannerCellHeight");
  double v16 = Height - v15;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  [v17 contentOffset];
  double v19 = v16 + v18;

  if (v19 >= Height) {
    double v19 = Height;
  }
  if ((BSFloatEqualToFloat(v19, v14) & 1) == 0)
  {
    double v20 = Height - v19;
    v29.origin.x = v5;
    v29.origin.double y = v7;
    v29.size.double width = v9;
    v29.size.double height = v11;
    objc_msgSend(v27, "setFrame:", 0.0, v20, CGRectGetWidth(v29), v19);
    double v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController vignetteImageView](self, "vignetteImageView"));
    double v22 = (void *)objc_claimAutoreleasedReturnValue([v21 image]);
    [v22 size];
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(v21, "setFrame:", 0.0, v20 - v26, v24, v26);
  }
}

- (double)_bannerCellHeight
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v3 bounds];
  double v5 = v4;

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
  objc_msgSend(v7, "sizeThatFits:", v5, 0.0);
  double v9 = v8;

  return v9;
}

- (void)_calculatePreloadContentSizeAndCellMargins
{
  __int128 v3 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  __int128 v16 = *(_OWORD *)&UIEdgeInsetsZero.top;
  __int128 v17 = v3;
  __int128 v14 = v16;
  __int128 v15 = v3;
  id v13 = 0LL;
  -[TVHProductViewController _contentSizeAndContentSectionCellMargins:contentSectionFirstCellPartialMargin:contentSectionFirstCellZeroTopMargin:]( self,  "_contentSizeAndContentSectionCellMargins:contentSectionFirstCellPartialMargin:contentSectionFirstCellZeroTopMargin:",  &v13,  &v14,  &v16);
  double v5 = v4;
  double v7 = v6;
  id v8 = v13;
  double v9 = v7 + 500.0;
  -[TVHProductViewController preloadCollectionViewContentSize](self, "preloadCollectionViewContentSize");
  if (v11 != v5 || v10 != v9)
  {
    -[TVHProductViewController setPreloadCollectionViewContentSize:]( self,  "setPreloadCollectionViewContentSize:",  v5,  v9);
    -[TVHProductViewController setPreloadCollectionViewContentOnLayout:]( self,  "setPreloadCollectionViewContentOnLayout:",  1LL);
  }

  -[TVHProductViewController setContentSectionCellMargins:](self, "setContentSectionCellMargins:", v8);
  -[TVHProductViewController setContentSectionFirstCellZeroTopMargin:]( self,  "setContentSectionFirstCellZeroTopMargin:",  v16,  v17);
  -[TVHProductViewController setContentSectionFirstCellPartialMargin:]( self,  "setContentSectionFirstCellPartialMargin:",  v14,  v15);
}

- (CGSize)_contentSizeAndContentSectionCellMargins:(id *)a3 contentSectionFirstCellPartialMargin:(UIEdgeInsets *)a4 contentSectionFirstCellZeroTopMargin:(UIEdgeInsets *)a5
{
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 bounds];
  double v11 = v10;

  uint64_t v43 = 0LL;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000LL;
  uint64_t v46 = 0LL;
  -[TVHProductViewController bannerCellHeight](self, "bannerCellHeight");
  v44[3] = v12 + v44[3];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x4010000000LL;
  v40 = &unk_1000E79F9;
  __int128 v14 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  __int128 v41 = *(_OWORD *)&UIEdgeInsetsZero.top;
  __int128 v42 = v14;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x4010000000LL;
  v34 = &unk_1000E79F9;
  __int128 v35 = v41;
  __int128 v36 = v14;
  double v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  double v23 = sub_1000102E4;
  double v24 = &unk_1000FD188;
  double v30 = v11;
  id v27 = &v43;
  double v25 = self;
  CGRect v28 = &v31;
  CGRect v29 = &v37;
  id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v13 count]));
  id v26 = v15;
  [v13 enumerateObjectsUsingBlock:&v21];
  if (a3) {
    *a3 = objc_msgSend(v15, "copy", v21, v22, v23, v24, v25);
  }
  if (a4)
  {
    __int128 v16 = *((_OWORD *)v38 + 3);
    *(_OWORD *)&a4->double top = *((_OWORD *)v38 + 2);
    *(_OWORD *)&a4->double bottom = v16;
  }

  if (a5)
  {
    __int128 v17 = *((_OWORD *)v32 + 3);
    *(_OWORD *)&a5->double top = *((_OWORD *)v32 + 2);
    *(_OWORD *)&a5->double bottom = v17;
  }

  double v18 = v44[3];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  double v19 = v11;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (double)_contentSectionCellMaxTitleLabelHeightPlusMargin
{
  return v2 + 103.0;
}

- (id)_yOffsetForView:(id)a3 withScrollView:(id)a4 targetYOffset:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _contentSectionViewControllers](self, "_contentSectionViewControllers"));
  if ([v10 count])
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForItemAtIndexPath:v12]);

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForItemAtIndexPath:v14]);

    __int128 v16 = 0LL;
    if ((unint64_t)[v10 count] >= 2)
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  1LL,  1LL));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 cellForItemAtIndexPath:v17]);
    }

    -[TVHProductViewController bannerCellHeight](self, "bannerCellHeight");
    double v19 = v18;
    double v20 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _lastInteractiveContentSectionCell]( self,  "_lastInteractiveContentSectionCell"));
    unsigned int v21 = -[TVHProductViewController _isPartialScrollingEnabled](self, "_isPartialScrollingEnabled");
    if ([v8 isDescendantOfView:v13])
    {
      [v13 frame];
      double MinY = CGRectGetMinY(v36);
    }

    else
    {
      if (v20 && [v8 isDescendantOfView:v20])
      {
        [v9 contentInset];
        double v25 = v24;
        [v20 frame];
        double v26 = CGRectGetMinY(v37);
        [v9 contentSize];
        double v28 = v27;
        [v9 frame];
        double v29 = v25 + v28 - CGRectGetHeight(v38);
        if (v26 < v29) {
          double v29 = v26;
        }
        double v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v29));
        [v23 doubleValue];
        if (v30 < v19)
        {
          uint64_t v31 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19));

          double v23 = (_UNKNOWN **)v31;
        }

        goto LABEL_25;
      }

      if (v19 > a5) {
        unsigned int v32 = v21;
      }
      else {
        unsigned int v32 = 0;
      }
      if (v32 != 1) {
        goto LABEL_22;
      }
      if ([v8 isDescendantOfView:v15])
      {
        [v9 contentOffset];
        double v34 = v33;
        [v13 frame];
        if (v34 < CGRectGetHeight(v39) * 0.5)
        {
          double v23 = &off_100106E48;
LABEL_25:

          goto LABEL_26;
        }
      }

      if (![v8 isDescendantOfView:v16])
      {
LABEL_22:
        if (v19 <= a5 && ![v8 isDescendantOfView:v15])
        {
          double v23 = 0LL;
          goto LABEL_25;
        }
      }

      double MinY = v19;
    }

    double v23 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", MinY));
    goto LABEL_25;
  }

  double v23 = 0LL;
LABEL_26:

  return v23;
}

+ (id)_cellSpacingHeightsForMargins:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v3 count] - 1));
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x4010000000LL;
    v16[3] = &unk_1000E79F9;
    __int128 v6 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    __int128 v17 = *(_OWORD *)&UIEdgeInsetsZero.top;
    __int128 v18 = v6;
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x4010000000LL;
    v13[3] = &unk_1000E79F9;
    __int128 v14 = v17;
    __int128 v15 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000108E8;
    v9[3] = &unk_1000FD1B0;
    double v11 = v16;
    double v12 = v13;
    id v7 = v5;
    id v10 = v7;
    [v3 enumerateObjectsUsingBlock:v9];
    id v4 = [v7 copy];

    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v16, 8);
  }

  else
  {
    id v4 = &__NSArray0__struct;
  }

  return v4;
}

- (UIEdgeInsets)_marginForFirstContentSectionCellWithMode:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      -[TVHProductViewController contentSectionFirstCellZeroTopMargin](self, "contentSectionFirstCellZeroTopMargin");
LABEL_7:
      double v3 = v13;
      double v4 = v14;
      double v5 = v15;
      double v6 = v16;
      break;
    case 1uLL:
      -[TVHProductViewController contentSectionFirstCellPartialMargin](self, "contentSectionFirstCellPartialMargin");
      goto LABEL_7;
    case 2uLL:
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionCellMargins](self, "contentSectionCellMargins"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
      objc_msgSend(v8, "tvh_marginValue");
      double v3 = v9;
      double v4 = v10;
      double v5 = v11;
      double v6 = v12;

      break;
  }

  double v17 = v3;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  result.double right = v20;
  result.double bottom = v19;
  result.double left = v18;
  result.double top = v17;
  return result;
}

- (void)_updateMarginForFirstContentSectionCell:(id)a3 marginMode:(unint64_t)a4
{
  id v6 = a3;
  -[TVHProductViewController _marginForFirstContentSectionCellWithMode:]( self,  "_marginForFirstContentSectionCellWithMode:",  a4);
  objc_msgSend(v6, "setProductContentViewMargin:");
}

- (BOOL)_shouldFirstContentSectionCellUseTitledCell
{
  if ((id)-[TVHProductViewController style](self, "style") != (id)1) {
    return 0;
  }
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_configureFirstContentSectionCellScrollingSpeedBump
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionRowCellViewControllerAtIndex:]( self,  "_contentSectionRowCellViewControllerAtIndex:",  0LL));
  if ((objc_opt_respondsToSelector(v2, "setSpeedBumpEdges:") & 1) != 0) {
    [v2 setSpeedBumpEdges:4];
  }
}

- (void)_configureFirstContentSectionCellHeaderScalingWithIsFocusInBanner:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionRowCellViewControllerAtIndex:]( self,  "_contentSectionRowCellViewControllerAtIndex:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 scalableHeaderView]);
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
    objc_msgSend(v8, "setAnchorPoint:", 0.0, 1.0);

    if (v3)
    {
      double v9 = (void *)objc_opt_class(self);
      if (v9)
      {
        [v9 _contentSectionCellHeaderSmallScaleTransform];
LABEL_8:
        __int128 v24 = v16;
        __int128 v25 = v17;
        __int128 v26 = v18;
        __int128 v27 = v19;
        __int128 v20 = v12;
        __int128 v21 = v13;
        __int128 v22 = v14;
        __int128 v23 = v15;
        double v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer", v12, v13, v14, v15, v16, v17, v18, v19));
        __int128 v16 = v24;
        __int128 v17 = v25;
        __int128 v18 = v26;
        __int128 v19 = v27;
        __int128 v12 = v20;
        __int128 v13 = v21;
        __int128 v14 = v22;
        __int128 v15 = v23;
        [v11 setTransform:&v12];

        goto LABEL_9;
      }
    }

    else
    {
      double v10 = (void *)objc_opt_class(self);
      if (v10)
      {
        [v10 _contentSectionCellHeaderLargeScaleTransform];
        goto LABEL_8;
      }
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    goto LABEL_8;
  }

- (void)_makeFirstContentSectionCellHeaderSmaller
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionRowCellViewControllerAtIndex:]( self,  "_contentSectionRowCellViewControllerAtIndex:",  0LL));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scalableHeaderView]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  id v6 = (void *)objc_opt_class(self);
  if (v6) {
    [v6 _contentSectionCellHeaderSmallScaleTransform];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  [v5 setTransform:v7];
}

- (void)_makeFirstContentSectionCellHeaderLarger
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionRowCellViewControllerAtIndex:]( self,  "_contentSectionRowCellViewControllerAtIndex:",  0LL));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scalableHeaderView]);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  id v6 = (void *)objc_opt_class(self);
  if (v6) {
    [v6 _contentSectionCellHeaderLargeScaleTransform];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  [v5 setTransform:v7];
}

+ (CATransform3D)_contentSectionCellHeaderSmallScaleTransform
{
  __int128 v3 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v8.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v8.m33 = v3;
  __int128 v4 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v8.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v8.m43 = v4;
  __int128 v5 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v8.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v8.m13 = v5;
  __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v8.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v8.m23 = v6;
  return CATransform3DScale(retstr, &v8, 0.76, 0.76, 1.0);
}

+ (CATransform3D)_contentSectionCellHeaderLargeScaleTransform
{
  __int128 v3 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v3;
  __int128 v4 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v4;
  __int128 v5 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v5;
  __int128 v6 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v6;
  return result;
}

- (id)_allViewControllers
{
  __int128 v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _contentSectionViewControllers](self, "_contentSectionViewControllers"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  return v3;
}

- (id)_viewControllerAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 section];
  unint64_t v6 = (unint64_t)[v4 item];

  if (v5 | v6)
  {
    if (v5 == 1) {
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionViewControllerAtIndex:]( self,  "_contentSectionViewControllerAtIndex:",  v6));
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController bannerViewController](self, "bannerViewController"));
  }

  return v7;
}

- (id)_contentSectionViewControllers
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bs_map:", &stru_1000FD1F0));

  return v3;
}

- (id)_contentSectionViewControllerAtIndex:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController contentSectionItems](self, "contentSectionItems"));
  if ((unint64_t)[v4 count] <= a3)
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:a3]);
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewController]);
  }

  return v6;
}

- (id)_contentSectionRowCellViewControllerAtIndex:(unint64_t)a3
{
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVHProductViewController _contentSectionViewControllerAtIndex:]( self,  "_contentSectionViewControllerAtIndex:",  a3));
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)_isSingleItemStyle
{
  return -[TVHProductViewController style](self, "style") == 0;
}

- (BOOL)_isMultipleItemsStyle
{
  return !-[TVHProductViewController _isSingleItemStyle](self, "_isSingleItemStyle");
}

- (BOOL)_isPartialScrollingEnabled
{
  BOOL v3 = -[TVHProductViewController _isSingleItemStyle](self, "_isSingleItemStyle");
  if (v3) {
    LOBYTE(v3) = -[TVHProductViewController _lastInteractiveContentSectionCellIndex]( self,  "_lastInteractiveContentSectionCellIndex") != 0;
  }
  return v3;
}

- (BOOL)_isFocusInBannerCell
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  0LL));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 cellForItemAtIndexPath:v4]);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 focusedView]);

  CATransform3D v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController view](self, "view"));
  LODWORD(v6) = [v7 isDescendantOfView:v8];

  if ((_DWORD)v6 && v5)
  {
    unsigned __int8 IsZero = [v7 isDescendantOfView:v5];
  }

  else
  {
    id v10 = [v3 contentOffset];
    unsigned __int8 IsZero = BSFloatIsZero(v10, v11);
  }

  BOOL v12 = IsZero;

  return v12;
}

- (id)_titledContentSectionCellLabelWithText:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setText:](v4, "setText:", v3);

  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  3LL,  7LL));
  -[UILabel setFont:](v4, "setFont:", v5);

  -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 1LL);
  -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 4LL);
  -[UILabel setTextAlignment:](v4, "setTextAlignment:", 4LL);
  return v4;
}

- (unint64_t)_lastInteractiveContentSectionCellIndex
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController _contentSectionViewControllers](self, "_contentSectionViewControllers"));
  if ((unint64_t)[v2 count] < 2)
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "reverseObjectEnumerator", 0));
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          CATransform3D v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
          if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TVHRowCellContentViewController])
          {
            unint64_t v9 = (unint64_t)[v2 indexOfObject:v8];
            goto LABEL_13;
          }
        }

        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  }

  return v9;
}

- (id)_lastInteractiveContentSectionCell
{
  uint64_t v3 = -[TVHProductViewController _lastInteractiveContentSectionCellIndex]( self,  "_lastInteractiveContentSectionCellIndex");
  if (v3 < 1)
  {
    id v7 = 0LL;
  }

  else
  {
    uint64_t v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController collectionView](self, "collectionView"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  v4,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 cellForItemAtIndexPath:v6]);
  }

  return v7;
}

- (BOOL)_updateUserInterfaceStyleOverride
{
  id v3 = -[TVHProductViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductViewController backgroundImageInfo](self, "backgroundImageInfo"));
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 recommendedForegroundUserInterfaceStyle];
    id v7 = sub_10007A1C8();
    CATransform3D v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = sub_10007A238((unint64_t)v6);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v14 = 138412290;
      __int128 v15 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "TVHProductViewController: Overriding user interface style to: %@",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    id v6 = v3;
  }

  -[TVHProductViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v6);
  if (v3) {
    BOOL v11 = v3 == v6;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;

  return v12;
}

- (unint64_t)style
{
  return self->_style;
}

- (TVHProductViewControllerDelegate)delegate
{
  return (TVHProductViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)contentSectionItems
{
  return self->_contentSectionItems;
}

- (TVHKBackgroundImageInfo)backgroundImageInfo
{
  return self->_backgroundImageInfo;
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIImageView)vignetteImageView
{
  return self->_vignetteImageView;
}

- (void)setVignetteImageView:(id)a3
{
}

- (UIView)multipleItemsStyleBackdropTintView
{
  return self->_multipleItemsStyleBackdropTintView;
}

- (void)setMultipleItemsStyleBackdropTintView:(id)a3
{
}

- (UIImageView)multipleItemsStyleVignetteImageView
{
  return self->_multipleItemsStyleVignetteImageView;
}

- (void)setMultipleItemsStyleVignetteImageView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (TVHCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)preloadCollectionViewContentOnLayout
{
  return self->_preloadCollectionViewContentOnLayout;
}

- (void)setPreloadCollectionViewContentOnLayout:(BOOL)a3
{
  self->_preloadCollectionViewContentOnLayout = a3;
}

- (CGSize)preloadCollectionViewContentSize
{
  double width = self->_preloadCollectionViewContentSize.width;
  double height = self->_preloadCollectionViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreloadCollectionViewContentSize:(CGSize)a3
{
  self->_preloadCollectionViewContentSize = a3;
}

- (TVHProductBannerViewController)bannerViewController
{
  return self->_bannerViewController;
}

- (void)setBannerViewController:(id)a3
{
}

- (double)bannerCellHeight
{
  return self->_bannerCellHeight;
}

- (void)setBannerCellHeight:(double)a3
{
  self->_bannerCelldouble Height = a3;
}

- (NSArray)contentSectionCellMargins
{
  return self->_contentSectionCellMargins;
}

- (void)setContentSectionCellMargins:(id)a3
{
}

- (UIEdgeInsets)contentSectionFirstCellZeroTopMargin
{
  double top = self->_contentSectionFirstCellZeroTopMargin.top;
  double left = self->_contentSectionFirstCellZeroTopMargin.left;
  double bottom = self->_contentSectionFirstCellZeroTopMargin.bottom;
  double right = self->_contentSectionFirstCellZeroTopMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentSectionFirstCellZeroTopMargin:(UIEdgeInsets)a3
{
  self->_contentSectionFirstCellZeroTopMargin = a3;
}

- (UIEdgeInsets)contentSectionFirstCellPartialMargin
{
  double top = self->_contentSectionFirstCellPartialMargin.top;
  double left = self->_contentSectionFirstCellPartialMargin.left;
  double bottom = self->_contentSectionFirstCellPartialMargin.bottom;
  double right = self->_contentSectionFirstCellPartialMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentSectionFirstCellPartialMargin:(UIEdgeInsets)a3
{
  self->_contentSectionFirstCellPartialMargin = a3;
}

- (void).cxx_destruct
{
}

@end