@interface TVHMediaEntitiesPlayedStateViewController
+ (id)new;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHKMediaLibrary)mediaLibrary;
- (TVHMediaEntitiesPlayedStateDataSource)playedStateDataSource;
- (TVHMediaEntitiesPlayedStateViewController)init;
- (TVHMediaEntitiesPlayedStateViewController)initWithCoder:(id)a3;
- (TVHMediaEntitiesPlayedStateViewController)initWithMediaLibrary:(id)a3 unplayedDataSource:(id)a4 partiallyPlayedDataSource:(id)a5 lockupLayoutByMediaEntityType:(id)a6;
- (TVHMediaEntitiesPlayedStateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMediaEntitiesPlayedStateViewControllerDelegate)delegate;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_delegateDidLongPressMediaEntity:(id)a3;
- (void)_delegateDidPlayMediaEntity:(id)a3;
- (void)_delegateDidSelectMediaEntity:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHMediaEntitiesPlayedStateViewController

+ (id)new
{
  return 0LL;
}

- (TVHMediaEntitiesPlayedStateViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesPlayedStateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaEntitiesPlayedStateViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesPlayedStateViewController)initWithMediaLibrary:(id)a3 unplayedDataSource:(id)a4 partiallyPlayedDataSource:(id)a5 lockupLayoutByMediaEntityType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v15, "setScrollDirection:", 0LL);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v15, "setMinimumLineSpacing:", 50.0);
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesPlayedStateViewController;
  v16 = -[TVHStackViewController initWithLayout:](&v26, "initWithLayout:", v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_mediaLibrary, a3);
    objc_initWeak(&location, v17);
    v18 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesPlayedStateDataSource);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100089794;
    v22[3] = &unk_1000FF888;
    id v23 = v14;
    objc_copyWeak(&v24, &location);
    v19 = -[TVHMediaEntitiesPlayedStateDataSource initWithUnplayedDataSource:partiallyPlayedDataSource:shelfViewControllerBlock:]( v18,  "initWithUnplayedDataSource:partiallyPlayedDataSource:shelfViewControllerBlock:",  v12,  v13,  v22);
    playedStateDataSource = v17->_playedStateDataSource;
    v17->_playedStateDataSource = v19;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "mediaEntitiesPlayedStateViewController:di dSelectMediaEntity:") & 1;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesPlayedStateViewController:didLongPressMediaEntity:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector(v5, "mediaEntitiesPlayedStateViewController:didPlayMediaEntity:");

  if ((v7 & 1) != 0) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v8;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesPlayedStateViewController;
  -[TVHMediaEntitiesPlayedStateViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHStackViewController stackView](self, "stackView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 collectionView]);

  objc_msgSend(v4, "setContentInset:", 45.0, 68.0, 60.0, 90.0);
  [v4 setClipsToBounds:0];
  [v4 configureDefaultGradientMaskForDirection:1];
  *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___TVHStackViewControllerCollectionViewCell).n128_u64[0];
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v6, @"CellReuseIdentifier", v5);
  objc_initWeak(&location, self);
  char v7 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController playedStateDataSource](self, "playedStateDataSource"));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100089AF8;
  id v13 = &unk_1000FCF88;
  objc_copyWeak(&v14, &location);
  v9 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v7,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v4,  v8,  &stru_1000FF8A8,  &v10);

  -[TVHMediaEntitiesPlayedStateViewController setDiffableDataSource:]( self,  "setDiffableDataSource:",  v9,  v10,  v11,  v12,  v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController playedStateDataSource](self, "playedStateDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mediaEntitiesShelfViewControllerAtIndexPath:v7]);

  [v8 frame];
  double Width = CGRectGetWidth(v23);
  [v8 adjustedContentInset];
  double v13 = v12;
  double v15 = v14;

  double v16 = Width - v13 - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);
  objc_msgSend(v17, "sizeThatFits:", v16, 1.79769313e308);
  double v19 = v18;

  double v20 = v16;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController playedStateDataSource](self, "playedStateDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController childViewControllers](self, "childViewControllers"));
    unsigned __int8 v10 = [v9 containsObject:v8];

    if ((v10 & 1) == 0)
    {
      -[TVHMediaEntitiesPlayedStateViewController addChildViewController:](self, "addChildViewController:", v8);
      [v8 didMoveToParentViewController:self];
      goto LABEL_9;
    }

    id v11 = sub_10007A1C8();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C7F8();
    }
  }

  else
  {
    id v13 = sub_10007A1C8();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C798();
    }
  }

LABEL_9:
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController playedStateDataSource](self, "playedStateDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  if (!v8)
  {
    id v11 = sub_10007A1C8();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C858();
    }
    goto LABEL_8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController childViewControllers](self, "childViewControllers"));
  unsigned int v10 = [v9 containsObject:v8];

  if (!v10)
  {
    id v13 = sub_10007A1C8();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10009C8B8();
    }
LABEL_8:

    goto LABEL_9;
  }

  [v8 willMoveToParentViewController:0];
  [v8 removeFromParentViewController];
LABEL_9:
}

- (void)mediaEntitiesShelfViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController mediaLibrary](self, "mediaLibrary"));
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesShelfViewController:(id)a3 didSelectMediaEntity:(id)a4
{
}

- (void)mediaEntitiesShelfViewController:(id)a3 didLongPressMediaEntity:(id)a4
{
}

- (void)mediaEntitiesShelfViewController:(id)a3 didPlayMediaEntity:(id)a4
{
}

- (void)_delegateDidSelectMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController delegate](self, "delegate"));
    [v5 mediaEntitiesPlayedStateViewController:self didSelectMediaEntity:v4];
  }

- (void)_delegateDidLongPressMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController delegate](self, "delegate"));
    [v5 mediaEntitiesPlayedStateViewController:self didLongPressMediaEntity:v4];
  }

- (void)_delegateDidPlayMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController delegate](self, "delegate"));
    [v5 mediaEntitiesPlayedStateViewController:self didPlayMediaEntity:v4];
  }

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesPlayedStateViewController playedStateDataSource](self, "playedStateDataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntitiesShelfViewControllerForItemIdentifier:v6]);

  [v11 setIdentifier:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 collectionView]);
  [v9 configureDefaultGradientMaskForDirection:8];

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v11 setChildView:v10];
}

- (TVHMediaEntitiesPlayedStateViewControllerDelegate)delegate
{
  return (TVHMediaEntitiesPlayedStateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TVHKMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (TVHMediaEntitiesPlayedStateDataSource)playedStateDataSource
{
  return self->_playedStateDataSource;
}

- (TVHCollectionViewDiffableDataSource)diffableDataSource
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