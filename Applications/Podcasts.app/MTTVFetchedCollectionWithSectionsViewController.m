@interface MTTVFetchedCollectionWithSectionsViewController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (MTTVContentUnavailableViewController)emptyContentViewController;
- (MTTVFetchedCollectionWithSectionsViewController)initWithCollectionViewLayout:(id)a3 compositeFetchedResultsController:(id)a4;
- (NSIndexPath)indexPathForAvoidingSectionHeader;
- (NSString)titleToRestore;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)playButtonRecognizer;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)preferredFocusedView;
- (int64_t)listState;
- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)controllerDidChangeContent:(id)a3;
- (void)longPressAction:(id)a3;
- (void)playItemAtIndexPath:(id)a3;
- (void)playPauseButtonAction:(id)a3;
- (void)registerCollectionViewClasses;
- (void)setAvoidenceEnabled:(BOOL)a3 forSectionHeaderAtIndexPath:(id)a4;
- (void)setAvoidenceEnabled:(BOOL)a3 forSectionHeaderView:(id)a4;
- (void)setEmptyContentViewController:(id)a3;
- (void)setIndexPathForAvoidingSectionHeader:(id)a3;
- (void)setListState:(int64_t)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setPlayButtonRecognizer:(id)a3;
- (void)setTitleToRestore:(id)a3;
- (void)standupEmptyContentViewController;
- (void)tearDownEmptyContentViewController;
- (void)updateAvoidingSectingHeader:(id)a3 forFocusedIndexPath:(id)a4;
- (void)updateAvoidingSectingHeaderForFocusedIndexPath:(id)a3;
- (void)updateEmptyView;
- (void)updateListState;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTTVFetchedCollectionWithSectionsViewController

- (MTTVFetchedCollectionWithSectionsViewController)initWithCollectionViewLayout:(id)a3 compositeFetchedResultsController:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  result = -[MTFetchedCollectionWithSectionsViewController initWithCollectionViewLayout:compositeFetchedResultsController:]( &v5,  "initWithCollectionViewLayout:compositeFetchedResultsController:",  a3,  a4);
  if (result) {
    result->_listState = 1LL;
  }
  return result;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  -[MTFetchedCollectionWithSectionsViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v4 setBackgroundColor:v3];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v5 contentInset];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v12 safeAreaInsets];
  double v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  objc_msgSend(v15, "setContentInset:", v14, v7, v9, v11);

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVFetchedCollectionWithSectionsViewController setPlayButtonRecognizer:](self, "setPlayButtonRecognizer:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController playButtonRecognizer](self, "playButtonRecognizer"));
  [v17 addGestureRecognizer:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[UILongPressGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UILongPressGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "longPressAction:",  4LL));
  -[MTTVFetchedCollectionWithSectionsViewController setLongPressRecognizer:](self, "setLongPressRecognizer:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController longPressRecognizer](self, "longPressRecognizer"));
  [v20 addGestureRecognizer:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v22 setClipsToBounds:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  -[MTTVFetchedCollectionWithSectionsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[MTTVFetchedCollectionWithSectionsViewController updateListState](self, "updateListState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController mt_topNavigationController]( self,  "mt_topNavigationController"));
  [v5 setTabBarObservedScrollView:v4];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  id v7 = a4;
  -[MTTVFetchedCollectionWithSectionsViewController viewWillTransitionToSize:withTransitionCoordinator:]( &v9,  "viewWillTransitionToSize:withTransitionCoordinator:",  v7,  width,  height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100070228;
  v8[3] = &unk_100241C60;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  id v6 = a4;
  -[MTTVFetchedCollectionWithSectionsViewController willTransitionToTraitCollection:withTransitionCoordinator:]( &v8,  "willTransitionToTraitCollection:withTransitionCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000702D4;
  v7[3] = &unk_100241C60;
  v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

- (void)playPauseButtonAction:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if (![v9 isTargetPlaying])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", v5));
      if (v6)
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSManagedObject);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          -[MTTVFetchedCollectionWithSectionsViewController playItemAtIndexPath:](self, "playItemAtIndexPath:", v5);
LABEL_10:

          goto LABEL_11;
        }
      }
    }

    else
    {
      id v6 = 0LL;
    }

    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v9 currentItem]);

    if (v8) {
      [v9 playWithReason:3];
    }
    goto LABEL_10;
  }

  [v9 pausePlayerTarget];
LABEL_11:
}

- (void)longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
    id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    if (v6)
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
      -[MTTVFetchedCollectionWithSectionsViewController collectionView:didLongPressItemAtIndexPath:]( self,  "collectionView:didLongPressItemAtIndexPath:",  v5,  v6);
    }
  }

- (void)controllerDidChangeContent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
  -[MTFetchedCollectionWithSectionsViewController controllerDidChangeContent:](&v4, "controllerDidChangeContent:", a3);
  -[MTTVFetchedCollectionWithSectionsViewController updateListState](self, "updateListState");
}

- (void)registerCollectionViewClasses
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v3 registerClass:objc_opt_class(MTTVCollectionViewSectionHeader) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kMTFetchedCollectionWithSectionsViewControllerDefaultHeaderIdentifier"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTTVCollectionViewGlobalHeader);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTHeaderCollectionReusableView reuseIdentifier]( &OBJC_CLASS___MTTVCollectionViewGlobalHeader,  "reuseIdentifier"));
  [v6 registerClass:v4 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v5];
}

- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([UICollectionElementKindSectionHeader isEqualToString:a5])
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MTTVCollectionViewSectionHeader);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      id v13 = v10;
      double v14 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController collectionView:titleForHeaderInSection:]( self,  "collectionView:titleForHeaderInSection:",  v15,  [v11 section]));
      [v13 setTitle:v14];
      [v13 setNeedsLayout];
    }
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([UICollectionElementKindSectionHeader isEqualToString:v9])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"kMTFetchedCollectionWithSectionsViewControllerDefaultHeaderIdentifier" forIndexPath:v10]);
    -[MTTVFetchedCollectionWithSectionsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( self,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v8,  v11,  v9,  v10);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (void)updateAvoidingSectingHeaderForFocusedIndexPath:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sectionHeaderIndexPathForItemIndexPath:v10]);

    uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTTVCollectionViewSectionHeader);
    uint64_t v7 = 0LL;
    if ((objc_opt_isKindOfClass(0LL, v6) & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 sectionHeaderViewForIndexPath:v5]);
    }

    id v9 = v10;
  }

  else
  {
    id v9 = 0LL;
    uint64_t v7 = 0LL;
  }

  -[MTTVFetchedCollectionWithSectionsViewController updateAvoidingSectingHeader:forFocusedIndexPath:]( self,  "updateAvoidingSectingHeader:forFocusedIndexPath:",  v7,  v9);
}

- (void)updateAvoidingSectingHeader:(id)a3 forFocusedIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0LL;
  id v34 = v6;
  if (a3 && v6)
  {
    id v8 = a3;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cellForItemAtIndexPath:v34]);

    [v10 frame];
    CGRect v36 = CGRectInset(v35, -35.0, -35.0);
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 titleView]);
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v8 superview]);
    objc_msgSend(v8, "convertRect:toView:", v24, v17, v19, v21, v23);
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    v38.origin.CGFloat x = v26;
    v38.origin.CGFloat y = v28;
    v38.size.CGFloat width = v30;
    v38.size.CGFloat height = v32;
    if (CGRectIntersectsRect(v37, v38) || ![v34 row])
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v33 sectionHeaderIndexPathForItemIndexPath:v34]);
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  -[MTTVFetchedCollectionWithSectionsViewController setIndexPathForAvoidingSectionHeader:]( self,  "setIndexPathForAvoidingSectionHeader:",  v7);
}

- (void)setIndexPathForAvoidingSectionHeader:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController indexPathForAvoidingSectionHeader]( self,  "indexPathForAvoidingSectionHeader"));

  if (v6 != v5)
  {
    p_indexPathForAvoidingSectionHeader = &self->_indexPathForAvoidingSectionHeader;
    indexPathForAvoidingSectionHeader = self->_indexPathForAvoidingSectionHeader;
    if (indexPathForAvoidingSectionHeader)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_100070B48;
      v24[3] = &unk_100240240;
      v24[4] = self;
      id v9 = indexPathForAvoidingSectionHeader;
      double v25 = v9;
      id v10 = objc_retainBlock(v24);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 _currentFocusAnimationCoordinator]);

      if (v12) {
        [v12 addCoordinatedAnimationsForAnimation:1 animations:v10 completion:0];
      }
      else {
        ((void (*)(void *))v10[2])(v10);
      }
    }

    objc_storeStrong((id *)&self->_indexPathForAvoidingSectionHeader, a3);
    if (*p_indexPathForAvoidingSectionHeader)
    {
      id v13 = *p_indexPathForAvoidingSectionHeader;
      double v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472LL;
      double v20 = sub_100070B58;
      double v21 = &unk_100240240;
      double v22 = self;
      double v14 = v13;
      double v23 = v14;
      id v15 = objc_retainBlock(&v18);
      double v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view", v18, v19, v20, v21, v22));
      double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _currentFocusAnimationCoordinator]);

      if (v17) {
        [v17 addCoordinatedAnimationsForAnimation:0 animations:v15 completion:0];
      }
      else {
        ((void (*)(void ***))v15[2])(v15);
      }
    }
  }
}

- (void)setAvoidenceEnabled:(BOOL)a3 forSectionHeaderAtIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v7 sectionHeaderViewForIndexPath:v6]);

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTTVCollectionViewSectionHeader);
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0) {
    -[MTTVFetchedCollectionWithSectionsViewController setAvoidenceEnabled:forSectionHeaderView:]( self,  "setAvoidenceEnabled:forSectionHeaderView:",  v4,  v9);
  }
}

- (void)setAvoidenceEnabled:(BOOL)a3 forSectionHeaderView:(id)a4
{
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  -[MTTVFetchedCollectionWithSectionsViewController updateAvoidingSectingHeaderForFocusedIndexPath:]( self,  "updateAvoidingSectingHeaderForFocusedIndexPath:",  v6);
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([UICollectionElementKindSectionHeader isEqualToString:a5])
  {
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MTTVCollectionViewSectionHeader);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "im_indexPathForFocusedCell"));
      -[MTTVFetchedCollectionWithSectionsViewController updateAvoidingSectingHeader:forFocusedIndexPath:]( self,  "updateAvoidingSectingHeader:forFocusedIndexPath:",  v10,  v13);

      double v14 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController indexPathForAvoidingSectionHeader]( self,  "indexPathForAvoidingSectionHeader"));
      unsigned int v15 = [v14 isEqual:v11];

      if (v15) {
        -[MTTVFetchedCollectionWithSectionsViewController setAvoidenceEnabled:forSectionHeaderView:]( self,  "setAvoidenceEnabled:forSectionHeaderView:",  1LL,  v10);
      }
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 controllerAtIndex:a5]);

  if ([v9 numberOfObjects])
  {
    [v7 bounds];
    +[MTTVCollectionViewSectionHeader estimatedSize:]( &OBJC_CLASS___MTTVCollectionViewSectionHeader,  "estimatedSize:",  v10,  v11);
    CGFloat width = v12;
    CGFloat height = v14;
  }

  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (void)playItemAtIndexPath:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"Subclasses must override playItemAtIndexPath:",  0LL));
  objc_exception_throw(v4);
  -[MTTVFetchedCollectionWithSectionsViewController collectionView:didLongPressItemAtIndexPath:](v5, v6, v7, v8);
}

- (void)updateListState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  -[MTTVFetchedCollectionWithSectionsViewController setListState:]( self,  "setListState:",  [v3 hasObjects]);
}

- (void)setListState:(int64_t)a3
{
  if (self->_listState != a3)
  {
    self->_listState = a3;
    if (a3) {
      -[MTTVFetchedCollectionWithSectionsViewController tearDownEmptyContentViewController]( self,  "tearDownEmptyContentViewController");
    }
    else {
      -[MTTVFetchedCollectionWithSectionsViewController standupEmptyContentViewController]( self,  "standupEmptyContentViewController");
    }
  }

- (void)setEmptyContentViewController:(id)a3
{
  id v5 = (MTTVContentUnavailableViewController *)a3;
  if (self->_emptyContentViewController != v5)
  {
    id v7 = v5;
    -[MTTVFetchedCollectionWithSectionsViewController tearDownEmptyContentViewController]( self,  "tearDownEmptyContentViewController");
    objc_storeStrong((id *)&self->_emptyContentViewController, a3);
    int64_t v6 = -[MTTVFetchedCollectionWithSectionsViewController listState](self, "listState");
    id v5 = v7;
    if (!v6)
    {
      -[MTTVFetchedCollectionWithSectionsViewController standupEmptyContentViewController]( self,  "standupEmptyContentViewController");
      id v5 = v7;
    }
  }
}

- (void)standupEmptyContentViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    -[MTTVFetchedCollectionWithSectionsViewController addChildViewController:](self, "addChildViewController:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v5 addSubview:v7];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v17 view]);
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    -[MTTVFetchedCollectionWithSectionsViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)tearDownEmptyContentViewController
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    [v4 willMoveToParentViewController:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    [v5 removeFromParentViewController];

    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);
    [v7 removeFromSuperview];

    -[MTTVFetchedCollectionWithSectionsViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  }

- (void)updateEmptyView
{
  if (!-[MTTVFetchedCollectionWithSectionsViewController listState](self, "listState"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));

    if (v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
      id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
      int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
      [v4 addSubview:v6];

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
      [v7 bringSubviewToFront:v9];

      id v20 = (id)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));
      [v20 bounds];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 view]);
      objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);
    }
  }

- (id)preferredFocusedView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 superview]);
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVFetchedCollectionWithSectionsViewController view](self, "view"));

  if (v5 == v6)
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVFetchedCollectionWithSectionsViewController emptyContentViewController]( self,  "emptyContentViewController"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 preferredFocusedView]);

    return v10;
  }

  else
  {
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___MTTVFetchedCollectionWithSectionsViewController;
    id v7 = -[MTTVFetchedCollectionWithSectionsViewController preferredFocusedView](&v11, "preferredFocusedView");
    return (id)objc_claimAutoreleasedReturnValue(v7);
  }

- (MTTVContentUnavailableViewController)emptyContentViewController
{
  return self->_emptyContentViewController;
}

- (int64_t)listState
{
  return self->_listState;
}

- (NSIndexPath)indexPathForAvoidingSectionHeader
{
  return self->_indexPathForAvoidingSectionHeader;
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (void)setPlayButtonRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (NSString)titleToRestore
{
  return self->_titleToRestore;
}

- (void)setTitleToRestore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end