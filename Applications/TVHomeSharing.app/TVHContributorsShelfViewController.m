@interface TVHContributorsShelfViewController
+ (id)new;
- (TVHContributorsShelfViewController)init;
- (TVHContributorsShelfViewController)initWithCoder:(id)a3;
- (TVHContributorsShelfViewController)initWithLayout:(id)a3;
- (TVHContributorsShelfViewController)initWithMediaItem:(id)a3;
- (TVHContributorsShelfViewController)initWithMediaItem:(id)a3 imageSize:(CGSize)a4 headerViewMargin:(NSDirectionalEdgeInsets)a5;
- (TVHContributorsShelfViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHContributorsShelfViewControllerDelegate)delegate;
- (TVHKMediaItem)mediaItem;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (id)_collectionViewCellForIdentifier:(id)a3 atIndexPath:(id)a4;
- (id)_contributorCategoryAtIndexPath:(id)a3;
- (id)_contributorNameAtIndexPath:(id)a3;
- (void)_delegateDidSelectContributor:(id)a3;
- (void)_mediaItemDidChangeAnimated:(BOOL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHContributorsShelfViewController

+ (id)new
{
  return 0LL;
}

- (TVHContributorsShelfViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHContributorsShelfViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHContributorsShelfViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHContributorsShelfViewController)initWithLayout:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHContributorsShelfViewController)initWithMediaItem:(id)a3
{
  id v4 = a3;
  +[TVHShelfViewLayout defaultHeaderViewMargin](&OBJC_CLASS___TVHShelfViewLayout, "defaultHeaderViewMargin");
  v9 = -[TVHContributorsShelfViewController initWithMediaItem:imageSize:headerViewMargin:]( self,  "initWithMediaItem:imageSize:headerViewMargin:",  v4,  250.0,  250.0,  v5,  v6,  v7,  v8);

  return v9;
}

- (TVHContributorsShelfViewController)initWithMediaItem:(id)a3 imageSize:(CGSize)a4 headerViewMargin:(NSDirectionalEdgeInsets)a5
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVHSimpleLockupShelfViewLayout shelfViewLayoutWithContentViewSize:footerLayoutType:]( &OBJC_CLASS___TVHSimpleLockupShelfViewLayout,  "shelfViewLayoutWithContentViewSize:footerLayoutType:",  1LL,  width,  height));
  [v14 setMinimumInteritemSpacing:48.0];
  objc_msgSend(v14, "setHeaderViewMargin:", top, leading, bottom, trailing);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHContributorsShelfViewController;
  v15 = -[TVHShelfViewController initWithLayout:](&v18, "initWithLayout:", v14);
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_mediaItem, a3);
  }

  return v16;
}

- (void)setMediaItem:(id)a3
{
  id v5 = a3;
  if ((-[TVHKMediaItem isEqual:](self->_mediaItem, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_mediaItem, a3);
    -[TVHContributorsShelfViewController _mediaItemDidChangeAnimated:](self, "_mediaItemDidChangeAnimated:", 1LL);
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector(v5, "contributorsShelfViewController:didSelectContributor:");

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | p_delegate & 1;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVHContributorsShelfViewController;
  -[TVHShelfViewController viewDidLoad](&v17, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](self, "collectionView"));
  [v3 registerClass:objc_opt_class(TVHLockupContainingCollectionViewCell) forCellWithReuseIdentifier:@"__CellReuseIdentifier"];
  [v3 setClipsToBounds:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedStringForKey:@"CAST_AND_CREW_TITLE" value:0 table:0]);

  double v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setText:](v6, "setText:", v5);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
  -[UILabel setFont:](v6, "setFont:", v7);

  -[UILabel setNumberOfLines:](v6, "setNumberOfLines:", 1LL);
  -[UILabel setLineBreakMode:](v6, "setLineBreakMode:", 4LL);
  -[UILabel setTextAlignment:](v6, "setTextAlignment:", 4LL);
  -[UILabel setOpaque:](v6, "setOpaque:", 0LL);
  -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", 0LL);
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHVibrantLabelView vibrantLabelViewWithLabel:]( &OBJC_CLASS___TVHVibrantLabelView,  "vibrantLabelViewWithLabel:",  v6));
  -[TVHShelfViewController setHeaderView:](self, "setHeaderView:", v8);
  objc_initWeak(&location, self);
  v9 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10000B0E8;
  v14 = &unk_1000FD018;
  objc_copyWeak(&v15, &location);
  v10 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v9,  "initWithCollectionView:cellProvider:",  v3,  &v11);
  -[TVHContributorsShelfViewController setDiffableDataSource:](self, "setDiffableDataSource:", v10, v11, v12, v13, v14);
  -[TVHContributorsShelfViewController _mediaItemDidChangeAnimated:](self, "_mediaItemDidChangeAnimated:", 0LL);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHContributorsShelfViewController _contributorNameAtIndexPath:]( self,  "_contributorNameAtIndexPath:",  a4));
  if (v5)
  {
    double v6 = v5;
    -[TVHContributorsShelfViewController _delegateDidSelectContributor:](self, "_delegateDidSelectContributor:", v5);
    id v5 = v6;
  }
}

- (void)_delegateDidSelectContributor:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController delegate](self, "delegate"));
    [v5 contributorsShelfViewController:self didSelectContributor:v4];
  }

- (void)_mediaItemDidChangeAnimated:(BOOL)a3
{
  BOOL v29 = a3;
  v31 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  v28 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController mediaItem](self, "mediaItem"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 credits]);

  double v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v5 directors]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 array]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bs_map:", &stru_1000FD058));

  v30 = v9;
  id v27 = [v9 count];
  if (v27)
  {
    v26 = &off_100105DD8;
    -[NSMutableArray addObject:](v6, "addObject:");
  }

  else
  {
    v26 = 0LL;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 actors]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 array]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bs_map:", &stru_1000FD078));

  id v13 = [v12 count];
  if (v13)
  {
    v25 = &off_100105DF0;
    -[NSMutableArray addObject:](v6, "addObject:");
  }

  else
  {
    v25 = 0LL;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 producers]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 array]);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bs_map:", &stru_1000FD098));

  id v17 = [v16 count];
  if (v17)
  {
    objc_super v18 = &off_100105E08;
    -[NSMutableArray addObject:](v6, "addObject:", &off_100105E08);
  }

  else
  {
    objc_super v18 = 0LL;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 screenwriters]);
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 array]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bs_map:", &stru_1000FD0B8));

  id v22 = [v21 count];
  if (v22)
  {
    v23 = &off_100105E20;
    -[NSMutableArray addObject:](v6, "addObject:", &off_100105E20);
  }

  else
  {
    v23 = 0LL;
  }

  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v31, "appendSectionsWithIdentifiers:", v6);
  if (v27) {
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v31,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v30,  v26);
  }
  if (v13) {
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v31,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v12,  v25);
  }
  if (v17) {
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v31,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v16,  v18);
  }
  if (v22) {
    -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v31,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v21,  v23);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController diffableDataSource](v28, "diffableDataSource"));
  [v24 applySnapshot:v31 animatingDifferences:v29];
}

- (id)_collectionViewCellForIdentifier:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](self, "collectionView"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableCellWithReuseIdentifier:@"__CellReuseIdentifier" forIndexPath:v5]);

  double v8 = (TVHContributorLockup *)objc_claimAutoreleasedReturnValue([v7 lockup]);
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionViewLayout]);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lockupLayout]);
    if (v11)
    {
      double v8 = -[TVHContributorLockup initWithSimpleLayout:]( objc_alloc(&OBJC_CLASS___TVHContributorLockup),  "initWithSimpleLayout:",  v11);
      [v7 setLockup:v8];
    }

    else
    {
      double v8 = 0LL;
    }
  }

  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController _contributorNameAtIndexPath:](self, "_contributorNameAtIndexPath:", v5));
  id v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = &stru_100100278;
  }
  id v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString componentsSeparatedByString:](v15, "componentsSeparatedByString:", @" "));
  if ([v16 count])
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    else {
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue([v16 lastObject]);
    }
    v19 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
    -[NSPersonNameComponents setGivenName:](v19, "setGivenName:", v17);
    -[NSPersonNameComponents setFamilyName:](v19, "setFamilyName:", v18);
    -[TVHContributorLockup setPersonNameComponents:](v8, "setPersonNameComponents:", v19);
  }

  uint64_t v20 = objc_claimAutoreleasedReturnValue( -[TVHContributorsShelfViewController _contributorCategoryAtIndexPath:]( self,  "_contributorCategoryAtIndexPath:",  v5));
  v21 = (void *)v20;
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  else {
    id v22 = &stru_100100278;
  }
  v23 = v22;

  -[TVHContributorLockup setSubtitle:](v8, "setSubtitle:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVHLockup layout](v8, "layout"));
  [v24 contentViewSize];
  double v26 = v25;
  double v28 = v27;

  BOOL v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController mediaItem](self, "mediaItem"));
  -[TVHLockup focusedSizeIncrease](v8, "focusedSizeIncrease");
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TVImageProxy tvh_imageProxyWithContributorName:mediaItem:scaleToSize:focusedSizeIncrease:]( &OBJC_CLASS___TVImageProxy,  "tvh_imageProxyWithContributorName:mediaItem:scaleToSize:focusedSizeIncrease:",  v15,  v29,  v26,  v28,  v30));

  -[TVHContributorLockup setImageProxy:](v8, "setImageProxy:", v31);
  return v7;
}

- (id)_contributorCategoryAtIndexPath:(id)a3
{
  id v4 = [a3 section];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController diffableDataSource](self, "diffableDataSource"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 snapshot]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sectionIdentifiers]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v4]);

  switch((unint64_t)[v8 unsignedIntegerValue])
  {
    case 0uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"DIRECTOR_TITLE";
      goto LABEL_7;
    case 1uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"ACTOR_TITLE";
      goto LABEL_7;
    case 2uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"PRODUCER_TITLE";
      goto LABEL_7;
    case 3uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v10 = v9;
      v11 = @"SCREENWRITER_TITLE";
LABEL_7:
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:v11 value:0 table:0]);

      break;
    default:
      uint64_t v12 = 0LL;
      break;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 uppercaseString]);

  return v13;
}

- (id)_contributorNameAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController mediaItem](self, "mediaItem"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 credits]);

  id v7 = [v4 section];
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorsShelfViewController diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 snapshot]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 sectionIdentifiers]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:v7]);

  switch((unint64_t)[v11 unsignedIntegerValue])
  {
    case 0uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 directors]);
      goto LABEL_7;
    case 1uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 actors]);
      goto LABEL_7;
    case 2uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 producers]);
      goto LABEL_7;
    case 3uLL:
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 screenwriters]);
LABEL_7:
      id v13 = (void *)v12;
      if (!v12) {
        goto LABEL_10;
      }
      id v14 = [v4 item];
      if (v14 >= [v13 count]) {
        goto LABEL_10;
      }
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndex:v14]);
      break;
    default:
      id v13 = 0LL;
LABEL_10:
      id v15 = 0LL;
      break;
  }

  return v15;
}

- (TVHKMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (TVHContributorsShelfViewControllerDelegate)delegate
{
  return (TVHContributorsShelfViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end