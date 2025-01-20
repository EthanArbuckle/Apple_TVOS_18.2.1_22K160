@interface MTTVShowsViewController
+ (id)notSubscribedPodcastResultsControllerWithSort:(id)a3;
+ (id)resultsControllerWithSort:(id)a3;
+ (id)subscribedPodcastResultsControllerWithSort:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTTVPodcastActionController)podcastActionController;
- (MTTVShowsViewController)init;
- (UITabBarController)tabBarController;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_indexPathForPodcastUuid:(id)a3;
- (id)collectionView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)reuseIdentifierForItemAtIndexPath:(id)a3;
- (void)_changeSortingTo:(int64_t)a3;
- (void)_showChangeSortUI;
- (void)artworkDidChange:(id)a3;
- (void)collectionView:(id)a3 configureCell:(id)a4 withObject:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 configureCell:(id)a4 withPodcast:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)performDeletePodcast:(id)a3;
- (void)performShowSettingsForPodcast:(id)a3;
- (void)playItemAtIndexPath:(id)a3;
- (void)registerCollectionViewClasses;
- (void)registerForArtworkChangeNotifications;
- (void)setPodcastActionController:(id)a3;
- (void)updateListState;
- (void)viewDidLoad;
@end

@implementation MTTVShowsViewController

+ (id)resultsControllerWithSort:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___MTCompositeResultsController);
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 subscribedPodcastResultsControllerWithSort:v4]);
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 notSubscribedPodcastResultsControllerWithSort:v4]);

  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9 = -[MTCompositeResultsController initWithControllers:](v5, "initWithControllers:", v8);

  return v9;
}

+ (id)subscribedPodcastResultsControllerWithSort:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForSubscribedAndNotHidden]( &OBJC_CLASS___MTPodcast,  "predicateForSubscribedAndNotHidden"));
  v5 = objc_alloc(&OBJC_CLASS___MTCoreDataResultsController);
  v6 = -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:]( v5,  "initWithEntityName:predicate:sortDescriptors:",  kMTPodcastEntityName,  v4,  v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"SHOWS_HEADER" value:&stru_100248948 table:0]);
  -[MTResultsController setTitle:](v6, "setTitle:", v8);

  return v6;
}

+ (id)notSubscribedPodcastResultsControllerWithSort:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(&OBJC_CLASS___MTCoreDataResultsController);
  uint64_t v5 = kMTPodcastEntityName;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcast predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed]( &OBJC_CLASS___MTPodcast,  "predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed"));
  v7 = -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:]( v4,  "initWithEntityName:predicate:sortDescriptors:",  v5,  v6,  v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"Not Following" value:&stru_100248948 table:0]);
  -[MTResultsController setTitle:](v7, "setTitle:", v9);

  return v7;
}

- (MTTVShowsViewController)init
{
  id v3 = objc_alloc_init(&OBJC_CLASS___MTTVPodcastFlowLayout);
  uint64_t v5 = (void *)objc_opt_class(self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForAllPodcasts](&OBJC_CLASS___MTPodcast, "sortDescriptorsForAllPodcasts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 resultsControllerWithSort:v6]);

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
  v8 = -[MTTVFetchedCollectionWithSectionsViewController initWithCollectionViewLayout:compositeFetchedResultsController:]( &v17,  "initWithCollectionViewLayout:compositeFetchedResultsController:",  v3,  v7);
  v10 = v8;
  if (v8)
  {
    v11 = (objc_class *)objc_opt_class(v8, v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MTTVShowsViewController setRestorationIdentifier:](v10, "setRestorationIdentifier:", v13);

    v14 = objc_opt_new(&OBJC_CLASS___MTTVMyPodcastsNoPodcastsViewController);
    -[MTTVFetchedCollectionWithSectionsViewController setEmptyContentViewController:]( v10,  "setEmptyContentViewController:",  v14);

    v15 = -[MTTVPodcastActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVPodcastActionController),  "initWithDelegate:",  v10);
    -[MTTVShowsViewController setPodcastActionController:](v10, "setPodcastActionController:", v15);
  }

  return v10;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
  -[MTTVFetchedCollectionWithSectionsViewController viewDidLoad](&v6, "viewDidLoad");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTPodcastDerivedPropertyObserver sharedInstance]( &OBJC_CLASS___MTPodcastDerivedPropertyObserver,  "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000ABB8;
  v5[3] = &unk_100240268;
  v5[4] = self;
  id v4 = [v3 addDerivedPropertyChangeHandler:v5];

  -[MTTVShowsViewController registerForArtworkChangeNotifications](self, "registerForArtworkChangeNotifications");
}

- (void)registerCollectionViewClasses
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
  -[MTTVFetchedCollectionWithSectionsViewController registerCollectionViewClasses]( &v11,  "registerCollectionViewClasses");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController collectionView](self, "collectionView"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTTVPodcastCollectionViewCell, v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVArtworkBaseCollectionViewCell reuseIdentifier]( &OBJC_CLASS___MTTVPodcastCollectionViewCell,  "reuseIdentifier"));
  [v3 registerClass:v5 forCellWithReuseIdentifier:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController collectionView](self, "collectionView"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TVButtonCollectionHeaderView reuseIdentifier]( &OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView,  "reuseIdentifier"));
  [v7 registerClass:v9 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v10];
}

- (void)registerForArtworkChangeNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"artworkDidChange:" name:kMTImageDownloaderArtworkDidLoadNotification object:0];
}

- (void)artworkDidChange:(id)a3
{
  uint64_t CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(a3, a2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(CacheKeys);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController _indexPathForPodcastUuid:](self, "_indexPathForPodcastUuid:", v10));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController collectionView](self, "collectionView"));
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cellForItemAtIndexPath:v12]);
        }

        else
        {
          v14 = 0LL;
        }

        uint64_t v15 = objc_opt_class(&OBJC_CLASS___MTTVPodcastCollectionViewCell, v11);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0) {
          [v14 loadImageForKey:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }
}

- (void)playItemAtIndexPath:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTPodcast, v3);
  if ((objc_opt_isKindOfClass(v8, v4) & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 uuid]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playPodcastUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playPodcastUuid:",  v5));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    [v7 playManifest:v6 reason:3];
  }
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MTPodcast, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    id v10 = v7;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController podcastActionController](self, "podcastActionController"));
    [v11 setActionObject:v10];

    v12 = (void *)objc_claimAutoreleasedReturnValue([v15 cellForItemAtIndexPath:v6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVShowsViewController podcastActionController](self, "podcastActionController"));
    id v14 = [v13 presentAvailableActionsFromView:v12];
  }
}

- (void)collectionView:(id)a3 configureCell:(id)a4 withObject:(id)a5 atIndexPath:(id)a6
{
  if (a4)
  {
    if (a6) {
      -[MTTVShowsViewController collectionView:configureCell:withPodcast:atIndexPath:]( self,  "collectionView:configureCell:withPodcast:atIndexPath:",  a3);
    }
  }

- (void)collectionView:(id)a3 configureCell:(id)a4 withPodcast:(id)a5 atIndexPath:(id)a6
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 uuid]);
  [v8 loadImageForKey:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 title]);
  [v8 setTitle:v10];

  id v11 = [v7 countOfUnplayedRssEpisodes];
  id v12 = (id)objc_claimAutoreleasedReturnValue( +[MTCountUtil stringForUnplayedEpisodeCount:titleCase:]( &OBJC_CLASS___MTCountUtil,  "stringForUnplayedEpisodeCount:titleCase:",  v11,  1LL));
  [v8 setSubtitle:v12];
}

- (void)updateListState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controllerAtIndex:0]);
  unsigned __int8 v5 = [v4 hasObjects];

  if ((v5 & 1) != 0)
  {
    uint64_t v6 = 1LL;
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 controllerAtIndex:1]);
    unsigned int v9 = [v8 hasObjects];

    uint64_t v6 = v9;
  }

  -[MTTVFetchedCollectionWithSectionsViewController setListState:](self, "setListState:", v6);
}

- (id)reuseIdentifierForItemAtIndexPath:(id)a3
{
  return +[MTTVArtworkBaseCollectionViewCell reuseIdentifier]( &OBJC_CLASS___MTTVPodcastCollectionViewCell,  "reuseIdentifier",  a3);
}

- (id)collectionView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0LL;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  result.height = v6;
  result.width = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  else
  {
    id v11 = (void *)qword_1002B68C8;
    if (!qword_1002B68C8)
    {
      id v12 = -[TVButtonCollectionHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      v13 = (void *)qword_1002B68C8;
      qword_1002B68C8 = (uint64_t)v12;

      id v14 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002B68C8 containedView]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"SORT_BUTTON" value:&stru_100248948 table:0]);
      [v14 setButtonTitle:v16];

      id v11 = (void *)qword_1002B68C8;
    }

    [v11 intrinsicContentSize];
    CGFloat height = v17;
    [v7 frame];
    CGFloat width = v18;
  }

  double v19 = width;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndexPath:v5]);

  if (v10)
  {
    id v7 = -[MTTVPodcastDetailViewController initWithPodcast:]( objc_alloc(&OBJC_CLASS___MTTVPodcastDetailViewController),  "initWithPodcast:",  v10);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootNavController]);

    [v9 pushViewController:v7 animated:1];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([UICollectionElementKindSectionHeader isEqualToString:v9]
    && ![v10 section])
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVButtonCollectionHeaderView reuseIdentifier]( &OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView,  "reuseIdentifier"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10]);

    -[MTTVShowsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( self,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v8,  v12,  v9,  v10);
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
    id v11 = -[MTTVFetchedCollectionWithSectionsViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]( &v15,  "collectionView:viewForSupplementaryElementOfKind:atIndexPath:",  v8,  v9,  v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v12;
}

- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([UICollectionElementKindSectionHeader isEqualToString:v12]
    && ![v13 section])
  {
    id v14 = v11;
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 containedView]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localizedStringForKey:@"SORT_BUTTON" value:&stru_100248948 table:0]);
    [v15 setButtonTitle:v17];

    [v14 setNeedsLayout];
    objc_initWeak(&location, self);
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v14 containedView]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000B79C;
    v20[3] = &unk_100240290;
    objc_copyWeak(&v21, &location);
    [v18 setAction:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
    -[MTTVFetchedCollectionWithSectionsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( &v19,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v10,  v11,  v12,  v13);
  }
}

- (void)_showChangeSortUI
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"SORT_BY" value:&stru_100248948 table:0]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v3,  0LL,  0LL));

  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"SORT_MANUAL" value:&stru_100248948 table:0]);
  v27 = v5;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10000BCF4;
  v43[3] = &unk_1002402B8;
  id v21 = &v44;
  objc_copyWeak(&v44, &location);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v32,  0LL,  v43));
  v47[0] = v31;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"SORT_BY_DATE_FOLLOWED" value:&stru_100248948 table:0]);
  v26 = v6;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10000BD24;
  v41[3] = &unk_1002402B8;
  v22 = &v42;
  objc_copyWeak(&v42, &location);
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v30,  0LL,  v41));
  v47[1] = v29;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:@"SORT_BY_TITLE" value:&stru_100248948 table:0]);
  v25 = v7;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10000BD54;
  v39[3] = &unk_1002402B8;
  v23 = &v40;
  objc_copyWeak(&v40, &location);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  0LL,  v39));
  v47[2] = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"SORT_BY_UPDATED" value:&stru_100248948 table:0]);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10000BD84;
  v37[3] = &unk_1002402B8;
  v24 = &v38;
  objc_copyWeak(&v38, &location);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v37));
  v47[3] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"Cancel" value:&stru_100248948 table:0]);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));
  v47[4] = v15;
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 5LL));

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      double v20 = 0LL;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(v4, "addAction:", *(void *)(*((void *)&v33 + 1) + 8 * (void)v20), v21, v22, v23, v24);
        double v20 = (char *)v20 + 1;
      }

      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }

    while (v18);
  }

  -[MTTVShowsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v4,  1LL,  0LL);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)_changeSortingTo:(int64_t)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForSortType:](&OBJC_CLASS___MTPodcast, "sortDescriptorsForSortType:", a3));
  id v5 = objc_msgSend((id)objc_opt_class(self, v4), "resultsControllerWithSort:", v7);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[MTFetchedCollectionWithSectionsViewController setCompositeResultsController:]( self,  "setCompositeResultsController:",  v6);
}

- (void)performShowSettingsForPodcast:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v6 = -[MTTVPodcastSettingsSplitViewController initWithPodcast:]( objc_alloc(&OBJC_CLASS___MTTVPodcastSettingsSplitViewController),  "initWithPodcast:",  v3);

    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootNavController]);

    [v5 pushViewController:v6 animated:1];
  }

- (void)performDeletePodcast:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
  id v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = _MTLogCategoryDatabase(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 uuid]);
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Will delete podcast %@ due to user action",  (uint8_t *)&v10,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    [v9 deletePodcastWithUuid:v4];
  }
}

- (UITabBarController)tabBarController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVShowsViewController;
  v2 = -[MTTVShowsViewController tabBarController](&v4, "tabBarController");
  return (UITabBarController *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)_indexPathForPodcastUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 podcastForUuid:v4]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController indexPathForObject:](self, "indexPathForObject:", v7));

  return v8;
}

- (MTTVPodcastActionController)podcastActionController
{
  return self->_podcastActionController;
}

- (void)setPodcastActionController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end