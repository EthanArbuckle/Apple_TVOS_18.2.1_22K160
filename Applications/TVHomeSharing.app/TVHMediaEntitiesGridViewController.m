@interface TVHMediaEntitiesGridViewController
+ (TVHMediaEntitiesGridViewController)new;
- (BOOL)_mayShowTitledSectionHeaders;
- (BOOL)_shouldShowBannerView;
- (BOOL)_shouldShowTitledSectionHeaders;
- (BOOL)centersHeaderTitle;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (BOOL)isViewVisible;
- (BOOL)showingTitledSectionHeaders;
- (BOOL)showsActivityIndicatorWhileWaitingForInitialMediaEntities;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)gridLockupClass;
- (NSArray)headerControls;
- (NSArray)mediaEntities;
- (NSArray)sortOptions;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (TVHCollectionViewChangeSetDataSource)changeSetDataSource;
- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource;
- (TVHMediaEntitiesGridViewController)init;
- (TVHMediaEntitiesGridViewController)initWithCoder:(id)a3;
- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3;
- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3 layout:(id)a4;
- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3 layout:(id)a4 applyGradientMask:(BOOL)a5;
- (TVHMediaEntitiesGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMediaEntitiesGridViewControllerDelegate)delegate;
- (TVHMediaEntitiesGridWrapperView)gridWrapperView;
- (TVHSortOption)currentSortOption;
- (UIEdgeInsets)gridContentInset;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_gridViewLayout;
- (id)_lockupLayoutForMediaEntity:(id)a3;
- (id)_sectionHeaderViewForCollectionView:(id)a3 atIndexPath:(id)a4;
- (id)preferredFocusEnvironments;
- (id)sortOptionsForSortContextMenuButton:(id)a3;
- (unint64_t)currentSortOptionIndexForSortContextMenuButton:(id)a3;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)_delegateConfigureLockup:(id)a3 forMediaEntity:(id)a4;
- (void)_delegateDidLongPressMediaEntity:(id)a3;
- (void)_delegateDidPlayMediaEntity:(id)a3;
- (void)_delegateDidSelectMediaEntity:(id)a3;
- (void)_sortButtonSelected;
- (void)_updateCenteringHeaderView:(id)a3;
- (void)_updateFirstSectionHeader;
- (void)_updateInteractiveHeaderView:(id)a3;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)mediaEntitiesDataSource:(id)a3 currentSortDidChange:(id)a4;
- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4;
- (void)removeAllMediaEntities;
- (void)setCentersHeaderTitle:(BOOL)a3;
- (void)setChangeSetDataSource:(id)a3;
- (void)setCurrentSortOption:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGridContentInset:(UIEdgeInsets)a3;
- (void)setGridLockupClass:(Class)a3;
- (void)setGridWrapperView:(id)a3;
- (void)setHeaderControls:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderTitle:(id)a3 controls:(id)a4 andSortOptions:(id)a5;
- (void)setMediaEntitiesDataSource:(id)a3;
- (void)setShowingTitledSectionHeaders:(BOOL)a3;
- (void)setShowsActivityIndicatorWhileWaitingForInitialMediaEntities:(BOOL)a3;
- (void)setSortOptions:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)sortContextMenuButton:(id)a3 didSelectSortOption:(id)a4;
- (void)updateWithMediaEntitiesDataSourceFetchResults:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVHMediaEntitiesGridViewController

+ (TVHMediaEntitiesGridViewController)new
{
  return 0LL;
}

- (TVHMediaEntitiesGridViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaEntitiesGridViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TVHMediaEntitiesGridViewLayout);
  v6 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:](self, "initWithDataSource:layout:", v4, v5);

  return v6;
}

- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3 layout:(id)a4
{
  return -[TVHMediaEntitiesGridViewController initWithDataSource:layout:applyGradientMask:]( self,  "initWithDataSource:layout:applyGradientMask:",  a3,  a4,  1LL);
}

- (TVHMediaEntitiesGridViewController)initWithDataSource:(id)a3 layout:(id)a4 applyGradientMask:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewController;
  v11 = -[TVHMediaEntitiesGridViewController initWithNibName:bundle:](&v26, "initWithNibName:bundle:", 0LL, 0LL);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaEntitiesDataSource, a3);
    -[TVHMediaEntitiesDataSource setDelegate:](v12->_mediaEntitiesDataSource, "setDelegate:", v12);
    objc_opt_class(&OBJC_CLASS___TVHPosterLockup);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    Class gridLockupClass = v12->_gridLockupClass;
    v12->_Class gridLockupClass = (Class)v14;

    v16 = objc_alloc(&OBJC_CLASS___TVHCollectionView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v20 = -[TVHCollectionView initWithFrame:collectionViewLayout:]( v16,  "initWithFrame:collectionViewLayout:",  v10,  CGRectZero.origin.x,  y,  width,  height);
    -[TVHCollectionView setDelegate:](v20, "setDelegate:", v12);
    -[TVHCollectionView setClipsToBounds:](v20, "setClipsToBounds:", 0LL);
    -[TVHCollectionView setRemembersLastFocusedIndexPath:](v20, "setRemembersLastFocusedIndexPath:", 1LL);
    -[TVHCollectionView setContentInset:](v20, "setContentInset:", 0.0, 90.0, 50.0, 90.0);
    if (v5) {
      -[TVHCollectionView configureDefaultGradientMaskForDirection:]( v20,  "configureDefaultGradientMaskForDirection:",  1LL);
    }
    v21 = -[TVHMediaEntitiesGridWrapperView initWithFrame:collectionView:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridWrapperView),  "initWithFrame:collectionView:",  v20,  CGRectZero.origin.x,  y,  width,  height);
    gridWrapperView = v12->_gridWrapperView;
    v12->_gridWrapperView = v21;

    headerControls = v12->_headerControls;
    v12->_headerControls = (NSArray *)&__NSArray0__struct;

    sortOptions = v12->_sortOptions;
    v12->_sortOptions = (NSArray *)&__NSArray0__struct;
  }

  return v12;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "mediaEntitiesGridViewController:configure Lockup:forMediaEntity:") & 1;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesGridViewController:didSelectMediaEntity:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesGridViewController:didLongPressMediaEntity:") & 1) != 0) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesGridViewController:didPlayMediaEntity:") & 1) != 0) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
  char v9 = objc_opt_respondsToSelector(v5, "mediaEntitiesGridViewController:currentSortDidChange:");

  if ((v9 & 1) != 0) {
    char v10 = 16;
  }
  else {
    char v10 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v10;
}

- (void)setGridContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  char v7 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionView]);
  objc_msgSend(v7, "setContentInset:", top, left, bottom, right);
  [v7 setNeedsLayout];
}

- (UIEdgeInsets)gridContentInset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (void)setCurrentSortOption:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController currentSortOption](self, "currentSortOption"));

  if (v4 != v6)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
    [v5 setCurrentSortOption:v6];
  }
}

- (TVHSortOption)currentSortOption
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSortOption]);

  return (TVHSortOption *)v3;
}

- (void)setHeaderTitle:(id)a3
{
}

- (void)setHeaderTitle:(id)a3 controls:(id)a4 andSortOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = (NSString *)[a3 copy];
  headerTitle = self->_headerTitle;
  self->_headerTitle = v10;

  -[TVHMediaEntitiesGridViewController setHeaderControls:](self, "setHeaderControls:", v9);
  -[TVHMediaEntitiesGridViewController setSortOptions:](self, "setSortOptions:", v8);
}

- (void)setCentersHeaderTitle:(BOOL)a3
{
  if (self->_centersHeaderTitle != a3)
  {
    self->_centersHeaderTitle = a3;
  }

- (void)setHeaderSubtitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  headerSubtitle = self->_headerSubtitle;
  self->_headerSubtitle = v4;
}

- (NSArray)mediaEntities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaEntities]);

  return (NSArray *)v3;
}

- (void)updateWithMediaEntitiesDataSourceFetchResults:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  [v5 updateWithMediaEntitiesDataSourceFetchResults:v4];
}

- (void)removeAllMediaEntities
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  [v2 removeAll];
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  -[TVHMediaEntitiesGridViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewController;
  -[TVHMediaEntitiesGridViewController viewDidLoad](&v21, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mediaEntities]);
  if ([v5 count])
  {
  }

  else
  {
    unsigned int v6 = -[TVHMediaEntitiesGridViewController showsActivityIndicatorWhileWaitingForInitialMediaEntities]( self,  "showsActivityIndicatorWhileWaitingForInitialMediaEntities");

    if (v6) {
      [v3 setShowsActivityIndicator:1];
    }
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionView]);
  *(void *)&double v8 = objc_opt_class(&OBJC_CLASS___TVHLockupContainingCollectionViewCell).n128_u64[0];
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", v9, @"GridCellIdentifier", v8);
  *(void *)&double v10 = objc_opt_class(&OBJC_CLASS___TVHCollectionViewSectionHeaderView).n128_u64[0];
  objc_msgSend( v7,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  v11,  UICollectionElementKindSectionHeader,  @"TitledSectionHeaderViewIdentifier",  v10);
  *(void *)&double v12 = objc_opt_class(&OBJC_CLASS___UICollectionReusableView).n128_u64[0];
  objc_msgSend( v7,  "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:",  v13,  UICollectionElementKindSectionHeader,  @"BlankSectionHeaderViewIdentifier",  v12);
  objc_initWeak(&location, self);
  double v14 = objc_alloc(&OBJC_CLASS___TVHCollectionViewChangeSetDataSource);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100097DA8;
  v18[3] = &unk_1000FD750;
  objc_copyWeak(&v19, &location);
  double v15 = -[TVHCollectionViewChangeSetDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v14,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v7,  v4,  &stru_1000FFC08,  v18);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100097E0C;
  v16[3] = &unk_1000FCFB0;
  objc_copyWeak(&v17, &location);
  -[TVHCollectionViewChangeSetDataSource setSupplementaryViewProvider:](v15, "setSupplementaryViewProvider:", v16);
  -[TVHMediaEntitiesGridViewController setChangeSetDataSource:](self, "setChangeSetDataSource:", v15);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewController;
  -[TVHMediaEntitiesGridViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[TVHMediaEntitiesGridViewController setViewVisible:](self, "setViewVisible:", 1LL);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesGridViewController;
  -[TVHMediaEntitiesGridViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVHMediaEntitiesGridViewController setViewVisible:](self, "setViewVisible:", 0LL);
}

- (id)preferredFocusEnvironments
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  id v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntityAtIndexPath:v6]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesGridViewController _lockupLayoutForMediaEntity:]( self,  "_lockupLayoutForMediaEntity:",  v8));
  double v10 = v9;
  if (v9)
  {
    [v9 lockupSize];
    double v12 = v11;
    double v14 = v13;
  }

  else
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController _gridViewLayout](self, "_gridViewLayout"));
    [v15 itemSize];
    double v12 = v16;
    double v14 = v17;
  }

  double v18 = v12;
  double v19 = v14;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController _gridViewLayout](self, "_gridViewLayout", a3, a4));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchResultIdentifierAtSection:a5]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 minimumLineSpacingByFetchRequestIdentifier]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

  if (v11)
  {
    [v11 floatValue];
    double v13 = v12;
  }

  else
  {
    [v7 minimumLineSpacing];
    double v13 = v14;
  }

  return v13;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController _gridViewLayout](self, "_gridViewLayout", a3, a4));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 fetchResultIdentifierAtSection:a5]);

  double v10 = (void *)objc_claimAutoreleasedReturnValue([v7 minimumInteritemSpacingByFetchRequestIdentifier]);
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v9]);

  if (v11)
  {
    [v11 floatValue];
    double v13 = v12;
  }

  else
  {
    [v7 minimumInteritemSpacing];
    double v13 = v14;
  }

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  unsigned int v7 = -[TVHMediaEntitiesGridViewController _shouldShowBannerView](self, "_shouldShowBannerView", a3, a4);
  unsigned int v8 = -[TVHMediaEntitiesGridViewController _shouldShowTitledSectionHeaders](self, "_shouldShowTitledSectionHeaders");
  if (a5)
  {
    BOOL v9 = v8 == 0;
    double v10 = 63.0;
  }

  else
  {
    if ((v7 & v8 & 1) != 0)
    {
      double v11 = 280.0;
      goto LABEL_11;
    }

    double v10 = 190.0;
    if (!v7) {
      double v10 = 0.0;
    }
    BOOL v9 = v8 == 0;
  }

  double v11 = 90.0;
  if (v9) {
    double v11 = v10;
  }
LABEL_11:
  double v12 = 0.0;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  unsigned int v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesGridViewController _delegateDidSelectMediaEntity:](self, "_delegateDidSelectMediaEntity:", v8);
    unsigned int v7 = v8;
  }
}

- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  unsigned int v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesGridViewController _delegateDidPlayMediaEntity:](self, "_delegateDidPlayMediaEntity:", v8);
    unsigned int v7 = v8;
  }
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return (*(_BYTE *)&self->_delegateFlags >> 2) & 1;
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  unsigned int v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesGridViewController _delegateDidLongPressMediaEntity:]( self,  "_delegateDidLongPressMediaEntity:",  v8);
    unsigned int v7 = v8;
  }
}

- (void)mediaEntitiesDataSource:(id)a3 mediaEntitiesDidChange:(id)a4
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView", a3, a4));
  [v9 setShowsActivityIndicator:0];
  unsigned int v5 = -[TVHMediaEntitiesGridViewController showingTitledSectionHeaders](self, "showingTitledSectionHeaders");
  BOOL v6 = -[TVHMediaEntitiesGridViewController _shouldShowTitledSectionHeaders](self, "_shouldShowTitledSectionHeaders");
  if (v5 != v6)
  {
    -[TVHMediaEntitiesGridViewController setShowingTitledSectionHeaders:](self, "setShowingTitledSectionHeaders:", v6);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v9 collectionView]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 collectionViewLayout]);
    [v8 invalidateLayout];
  }
}

- (void)mediaEntitiesDataSource:(id)a3 currentSortDidChange:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    id v5 = a4;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController delegate](self, "delegate"));
    [v6 mediaEntitiesGridViewController:self currentSortDidChange:v5];
  }

- (id)sortOptionsForSortContextMenuButton:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController sortOptions](self, "sortOptions", a3));
  objc_super v4 = v3;
  if (!v3) {
    id v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  return v5;
}

- (unint64_t)currentSortOptionIndexForSortContextMenuButton:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController currentSortOption](self, "currentSortOption", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController sortOptions](self, "sortOptions"));
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0LL;
  }
  else {
    unint64_t v7 = (unint64_t)v6;
  }

  return v7;
}

- (void)sortContextMenuButton:(id)a3 didSelectSortOption:(id)a4
{
}

- (void)_delegateConfigureLockup:(id)a3 forMediaEntity:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController delegate](self, "delegate"));
    [v8 mediaEntitiesGridViewController:self configureLockup:v7 forMediaEntity:v6];
  }

- (void)_delegateDidSelectMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController delegate](self, "delegate"));
    [v5 mediaEntitiesGridViewController:self didSelectMediaEntity:v4];
  }

- (void)_delegateDidLongPressMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController delegate](self, "delegate"));
    [v5 mediaEntitiesGridViewController:self didLongPressMediaEntity:v4];
  }

- (void)_delegateDidPlayMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController delegate](self, "delegate"));
    [v5 mediaEntitiesGridViewController:self didPlayMediaEntity:v4];
  }

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntityAtIndexPath:v6]);

  if (v8)
  {
    id v9 = v15;
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lockup]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesGridViewController _lockupLayoutForMediaEntity:]( self,  "_lockupLayoutForMediaEntity:",  v8));
    if (!v10
      || (double v12 = (void *)objc_claimAutoreleasedReturnValue([v10 layout]),
          unsigned __int8 v13 = [v12 isEqual:v11],
          v12,
          (v13 & 1) == 0))
    {
      id v14 = objc_msgSend( objc_alloc(-[TVHMediaEntitiesGridViewController gridLockupClass](self, "gridLockupClass")),  "initWithSimpleLayout:",  v11);

      [v9 setLockup:v14];
      double v10 = v14;
    }

    -[TVHMediaEntitiesGridViewController _delegateConfigureLockup:forMediaEntity:]( self,  "_delegateConfigureLockup:forMediaEntity:",  v10,  v8);
  }
}

- (id)_sectionHeaderViewForCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  unsigned int v9 = -[TVHMediaEntitiesGridViewController _shouldShowBannerView](self, "_shouldShowBannerView");
  unsigned __int8 v10 = -[TVHMediaEntitiesGridViewController showingTitledSectionHeaders](self, "showingTitledSectionHeaders");
  if (v8) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = v9;
  }
  if ((v10 & 1) != 0 || v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TitledSectionHeaderViewIdentifier" forIndexPath:v7]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sectionTitleAIndex:", objc_msgSend(v7, "section")));
    [v12 setTitle:v14];
    double v15 = 20.0;
    if (v11)
    {
      if (-[TVHMediaEntitiesGridViewController centersHeaderTitle](self, "centersHeaderTitle"))
      {
        double v16 = objc_alloc_init(&OBJC_CLASS___TVHSimpleHeaderView);
        -[TVHSimpleHeaderView setCentersLabel:](v16, "setCentersLabel:", 1LL);
        -[TVHMediaEntitiesGridViewController _updateCenteringHeaderView:](self, "_updateCenteringHeaderView:", v16);
      }

      else
      {
        double v16 = objc_alloc_init(&OBJC_CLASS___TVHInteractiveHeaderView);
        -[TVHMediaEntitiesGridViewController _updateInteractiveHeaderView:](self, "_updateInteractiveHeaderView:", v16);
      }

      [v6 contentInset];
      double v18 = v17;
      double v20 = v19;
      [v6 bounds];
      double v22 = v21 - v18 - v20;
      double v15 = 0.0;
      -[TVHSimpleHeaderView setFrame:](v16, "setFrame:", 0.0, 0.0, v22, 190.0);
      [v12 setBannerView:v16];
    }

    [v12 setTitleTopOffset:v15];
  }

  else
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue( [v6 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"BlankSectionHeaderViewIdentifier" forIndexPath:v7]);
    [v12 setHidden:1];
  }

  return v12;
}

- (void)_updateFirstSectionHeader
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  id v25 = (id)objc_claimAutoreleasedReturnValue([v3 collectionView]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( [v25 supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:v4]);

  objc_opt_class(&OBJC_CLASS___TVHCollectionViewSectionHeaderView);
  uint64_t v7 = v6;
  id v8 = v5;
  unsigned int v9 = v8;
  if (v7)
  {
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      unsigned __int8 v10 = v9;
    }
    else {
      unsigned __int8 v10 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v10 = 0LL;
  }

  id v11 = v10;

  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bannerView]);
    objc_opt_class(&OBJC_CLASS___TVHInteractiveHeaderView);
    uint64_t v14 = v13;
    id v15 = v12;
    double v16 = v15;
    if (v14)
    {
      if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0) {
        double v17 = v16;
      }
      else {
        double v17 = 0LL;
      }
    }

    else
    {
      double v17 = 0LL;
    }

    id v18 = v17;

    if (v18)
    {
      -[TVHMediaEntitiesGridViewController _updateInteractiveHeaderView:](self, "_updateInteractiveHeaderView:", v18);
    }

    else
    {
      objc_opt_class(&OBJC_CLASS___TVHSimpleHeaderView);
      uint64_t v20 = v19;
      id v21 = v16;
      double v22 = v21;
      if (v20)
      {
        if ((objc_opt_isKindOfClass(v21, v20) & 1) != 0) {
          v23 = v22;
        }
        else {
          v23 = 0LL;
        }
      }

      else
      {
        v23 = 0LL;
      }

      id v24 = v23;

      -[TVHMediaEntitiesGridViewController _updateCenteringHeaderView:](self, "_updateCenteringHeaderView:", v24);
    }
  }
}

- (void)_updateCenteringHeaderView:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 label]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerTitle](self, "headerTitle"));
  [v5 setText:v4];
}

- (void)_updateInteractiveHeaderView:(id)a3
{
  id v4 = a3;
  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerControls](self, "headerControls"));
  if (v5) {
    -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v5);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController sortOptions](self, "sortOptions"));
  id v7 = [v6 count];

  if (v7)
  {
    if (sub_100073068())
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHButton sortContextMenuButtonWithDataSource:delegate:]( &OBJC_CLASS___TVHButton,  "sortContextMenuButtonWithDataSource:delegate:",  self,  self));
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVHButton sortButton](&OBJC_CLASS___TVHButton, "sortButton"));
      [v8 addTarget:self action:"_sortButtonSelected" forControlEvents:0x2000];
    }

    -[NSMutableArray addObject:](v13, "addObject:", v8);
  }

  [v4 setControls:v13];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerTitle](self, "headerTitle"));
  [v9 setText:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 subtitleLabel]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerSubtitle](self, "headerSubtitle"));
  [v11 setText:v12];
}

- (void)_sortButtonSelected
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController sortOptions](self, "sortOptions"));
  if ([v3 count])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController currentSortOption](self, "currentSortOption"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100098E80;
    v6[3] = &unk_1000FDEC8;
    v6[4] = self;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController tvh_sortOptionAlertControllerWithSortOptions:currentSortOptionIndex:completionHandler:]( UIAlertController,  "tvh_sortOptionAlertControllerWithSortOptions:currentSortOptionIndex:completionHandler:",  v3,  [v3 indexOfObject:v4],  v6));
    -[TVHMediaEntitiesGridViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v5,  1LL,  0LL);
  }
}

- (BOOL)_mayShowTitledSectionHeaders
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 itemCollectionDescriptors]);
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)_shouldShowTitledSectionHeaders
{
  BOOL v3 = -[TVHMediaEntitiesGridViewController _mayShowTitledSectionHeaders](self, "_mayShowTitledSectionHeaders");
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 itemCollectionDescriptors]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100099090;
    v19[3] = &unk_1000FFC30;
    id v6 = v4;
    id v20 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bs_filter:", v19));

    if ((unint64_t)[v7 count] < 2)
    {
      LOBYTE(v3) = 1;
    }

    else
    {
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
LABEL_5:
        uint64_t v12 = 0LL;
        while (1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "title", (void)v15));

          if (v13) {
            break;
          }
          if (v10 == (id)++v12)
          {
            id v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
      }

      LOBYTE(v3) = 1;
LABEL_14:
    }
  }

  return v3;
}

- (BOOL)_shouldShowBannerView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerTitle](self, "headerTitle"));
  if ([v3 length])
  {
    BOOL v4 = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerSubtitle](self, "headerSubtitle"));
    if ([v5 length])
    {
      BOOL v4 = 1;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController headerControls](self, "headerControls"));
      if ([v6 count])
      {
        BOOL v4 = 1;
      }

      else
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController sortOptions](self, "sortOptions"));
        BOOL v4 = [v7 count] != 0;
      }
    }
  }

  return v4;
}

- (id)_gridViewLayout
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController gridWrapperView](self, "gridWrapperView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);

  return v4;
}

- (id)_lockupLayoutForMediaEntity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesGridViewController _gridViewLayout](self, "_gridViewLayout"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lockupLayoutByMediaEntityType]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lockupLayout]);
  }

  return v8;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (TVHMediaEntitiesGridViewControllerDelegate)delegate
{
  return (TVHMediaEntitiesGridViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (Class)gridLockupClass
{
  return self->_gridLockupClass;
}

- (void)setGridLockupClass:(Class)a3
{
}

- (BOOL)showsActivityIndicatorWhileWaitingForInitialMediaEntities
{
  return self->_showsActivityIndicatorWhileWaitingForInitialMediaEntities;
}

- (void)setShowsActivityIndicatorWhileWaitingForInitialMediaEntities:(BOOL)a3
{
  self->_showsActivityIndicatorWhileWaitingForInitialMediaEntities = a3;
}

- (BOOL)centersHeaderTitle
{
  return self->_centersHeaderTitle;
}

- (NSArray)headerControls
{
  return self->_headerControls;
}

- (void)setHeaderControls:(id)a3
{
}

- (NSArray)sortOptions
{
  return self->_sortOptions;
}

- (void)setSortOptions:(id)a3
{
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (TVHMediaEntitiesGridWrapperView)gridWrapperView
{
  return self->_gridWrapperView;
}

- (void)setGridWrapperView:(id)a3
{
}

- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource
{
  return self->_mediaEntitiesDataSource;
}

- (void)setMediaEntitiesDataSource:(id)a3
{
}

- (TVHCollectionViewChangeSetDataSource)changeSetDataSource
{
  return self->_changeSetDataSource;
}

- (void)setChangeSetDataSource:(id)a3
{
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (void)setViewVisible:(BOOL)a3
{
  self->_viewVisible = a3;
}

- (BOOL)showingTitledSectionHeaders
{
  return self->_showingTitledSectionHeaders;
}

- (void)setShowingTitledSectionHeaders:(BOOL)a3
{
  self->_showingTitledSectionHeaders = a3;
}

- (void).cxx_destruct
{
}

@end