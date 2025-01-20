@interface MTTVStationsViewController
+ (id)predicateForStations;
+ (id)stationResultsController;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MTTVStationActionController)stationActionController;
- (MTTVStationsViewController)init;
- (UITabBarController)tabBarController;
- (UITextField)hiddenTextField;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createEmptyContentController;
- (id)reuseIdentifierForItemAtIndexPath:(id)a3;
- (void)_dismissTextField;
- (void)_showCreateStationUI;
- (void)collectionView:(id)a3 configureCell:(id)a4 withObject:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 configureCell:(id)a4 withStation:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)performDeleteStation:(id)a3;
- (void)performShowSettingsForStation:(id)a3;
- (void)playItemAtIndexPath:(id)a3;
- (void)registerCollectionViewClasses;
- (void)setHiddenTextField:(id)a3;
- (void)setStationActionController:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateListState;
@end

@implementation MTTVStationsViewController

+ (id)stationResultsController
{
  v3 = objc_alloc(&OBJC_CLASS___MTCoreDataResultsWithExtrasController);
  uint64_t v4 = kMTPlaylistEntityName;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 predicateForStations]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaylist sortDescriptors](&OBJC_CLASS___MTPlaylist, "sortDescriptors"));
  v7 = -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:]( v3,  "initWithEntityName:predicate:sortDescriptors:",  v4,  v5,  v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"Stations" value:&stru_100248948 table:0]);
  -[MTResultsController setTitle:](v7, "setTitle:", v9);

  return v7;
}

+ (id)predicateForStations
{
  return +[MTPlaylist topLevelPlaylistsPredicate](&OBJC_CLASS___MTPlaylist, "topLevelPlaylistsPredicate");
}

- (MTTVStationsViewController)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___MTTVPodcastFlowLayout);
  id v4 = [(id)objc_opt_class(self) stationResultsController];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc(&OBJC_CLASS___MTCompositeResultsController);
  v17 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v8 = -[MTCompositeResultsController initWithControllers:](v6, "initWithControllers:", v7);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTTVStationsViewController;
  v9 = -[MTTVFetchedCollectionWithSectionsViewController initWithCollectionViewLayout:compositeFetchedResultsController:]( &v16,  "initWithCollectionViewLayout:compositeFetchedResultsController:",  v3,  v8);

  if (v9)
  {
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[MTTVStationsViewController setRestorationIdentifier:](v9, "setRestorationIdentifier:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController createEmptyContentController](v9, "createEmptyContentController"));
    -[MTTVFetchedCollectionWithSectionsViewController setEmptyContentViewController:]( v9,  "setEmptyContentViewController:",  v13);

    v14 = -[MTTVStationActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVStationActionController),  "initWithDelegate:",  v9);
    -[MTTVStationsViewController setStationActionController:](v9, "setStationActionController:", v14);
  }

  return v9;
}

- (id)createEmptyContentController
{
  v3 = objc_opt_new(&OBJC_CLASS___MTTVLibraryNoStationsViewController);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000B8C94;
  v5[3] = &unk_100240290;
  objc_copyWeak(&v6, &location);
  -[MTTVLibraryNoStationsViewController setButtonCallback:](v3, "setButtonCallback:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)registerCollectionViewClasses
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVStationsViewController;
  -[MTTVFetchedCollectionWithSectionsViewController registerCollectionViewClasses](&v9, "registerCollectionViewClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController collectionView](self, "collectionView"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___MTTVStationCollectionViewCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVArtworkBaseCollectionViewCell reuseIdentifier]( &OBJC_CLASS___MTTVStationCollectionViewCell,  "reuseIdentifier"));
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController collectionView](self, "collectionView"));
  uint64_t v7 = objc_opt_class(&OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVButtonCollectionHeaderView reuseIdentifier]( &OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView,  "reuseIdentifier"));
  [v6 registerClass:v7 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([UICollectionElementKindSectionHeader isEqualToString:v9])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVButtonCollectionHeaderView reuseIdentifier]( &OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView,  "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v11 forIndexPath:v10]);

    -[MTTVStationsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( self,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v8,  v12,  v9,  v10);
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MTTVStationsViewController;
    id v13 = -[MTTVFetchedCollectionWithSectionsViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]( &v15,  "collectionView:viewForSupplementaryElementOfKind:atIndexPath:",  v8,  v9,  v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([UICollectionElementKindSectionHeader isEqualToString:v12])
  {
    id v14 = v11;
    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 containedView]);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"CREATE_NEW_STATION_BUTTON" value:&stru_100248948 table:0]);
    [v15 setButtonTitle:v17];

    [v14 setNeedsLayout];
    objc_initWeak(&location, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 containedView]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000B9078;
    v20[3] = &unk_100240290;
    objc_copyWeak(&v21, &location);
    [v18 setAction:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  else
  {
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___MTTVStationsViewController;
    -[MTTVFetchedCollectionWithSectionsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( &v19,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v10,  v11,  v12,  v13);
  }
}

- (void)collectionView:(id)a3 configureCell:(id)a4 withObject:(id)a5 atIndexPath:(id)a6
{
  if (a4)
  {
    if (a6) {
      -[MTTVStationsViewController collectionView:configureCell:withStation:atIndexPath:]( self,  "collectionView:configureCell:withStation:atIndexPath:",  a3);
    }
  }

- (void)playItemAtIndexPath:(id)a3
{
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___MTPlaylist);
  if ((objc_opt_isKindOfClass(v10, v3) & 1) != 0)
  {
    id v4 = v10;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 nextEpisode]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playStationUuid:episodeUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playStationUuid:episodeUuid:",  v6,  v7));

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    [v9 playManifest:v8 reason:3];
  }
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MTPlaylist);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController stationActionController](self, "stationActionController"));
    [v10 setActionObject:v9];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v14 cellForItemAtIndexPath:v6]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController stationActionController](self, "stationActionController"));
    id v13 = [v12 presentAvailableActionsFromView:v11];
  }
}

- (void)collectionView:(id)a3 configureCell:(id)a4 withStation:(id)a5 atIndexPath:(id)a6
{
  id v19 = a4;
  id v8 = a5;
  id v9 = a6;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___MTPlaylist);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 episodes]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 podcast]);

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
    [v19 loadImageForKey:v14];

    objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
    [v19 setTitle:v15];

    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaylistUtil textForUnplayedShort:](&OBJC_CLASS___MTPlaylistUtil, "textForUnplayedShort:", v8));
    [v19 setSubtitle:v16];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    v17 = (objc_class *)objc_opt_class(v8);
    v18 = NSStringFromClass(v17);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    [v13 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/ATV/View Controllers/MTTVStationsViewController.m", 175, @"%@ instead of MTPlaylist for indexPath %@", v16, v9 lineNumber format];
  }
}

- (void)updateListState
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controllerAtIndex:0]);
  unsigned int v5 = [v4 hasObjects];

  -[MTTVFetchedCollectionWithSectionsViewController setListState:](self, "setListState:", v5);
}

- (id)reuseIdentifierForItemAtIndexPath:(id)a3
{
  return +[MTTVArtworkBaseCollectionViewCell reuseIdentifier]( &OBJC_CLASS___MTTVStationCollectionViewCell,  "reuseIdentifier",  a3);
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
  id v5 = a3;
  double v6 = (void *)qword_1002B6AE0;
  if (!qword_1002B6AE0)
  {
    uint64_t v7 = -[TVButtonCollectionHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS____TtC8Podcasts28TVButtonCollectionHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    id v8 = (void *)qword_1002B6AE0;
    qword_1002B6AE0 = (uint64_t)v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002B6AE0 containedView]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"CREATE_NEW_STATION_BUTTON" value:&stru_100248948 table:0]);
    [v9 setButtonTitle:v11];

    double v6 = (void *)qword_1002B6AE0;
  }

  [v6 intrinsicContentSize];
  double v13 = v12;
  [v5 frame];
  double v15 = v14;

  double v16 = v15;
  double v17 = v13;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v6 objectAtIndexPath:v5]);

  if (v10)
  {
    uint64_t v7 = -[MTTVStationDetailViewController initWithPlaylist:]( objc_alloc(&OBJC_CLASS___MTTVStationDetailViewController),  "initWithPlaylist:",  v10);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootNavController]);

    [v9 pushViewController:v7 animated:1];
  }
}

- (UITabBarController)tabBarController
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVStationsViewController;
  v2 = -[MTTVStationsViewController tabBarController](&v4, "tabBarController");
  return (UITabBarController *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)performShowSettingsForStation:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    double v6 = -[MTTVStationSettingsViewController initWithStation:]( objc_alloc(&OBJC_CLASS___MTTVStationSettingsViewController),  "initWithStation:",  v3);

    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootNavController]);

    [v5 pushViewController:v6 animated:1];
  }

- (void)performDeleteStation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](&OBJC_CLASS___MTLibrary, "sharedInstance"));
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController controllerForDeletingStation:fromLibrary:deletionCompletion:]( &OBJC_CLASS___UIAlertController,  "controllerForDeletingStation:fromLibrary:deletionCompletion:",  v4,  v5,  &stru_100243C08));

    -[MTTVStationsViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v6,  1LL,  0LL);
  }

- (void)textFieldDidEndEditing:(id)a3
{
  id v15 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v15 text]);
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_opt_new(&OBJC_CLASS___MTAddPodcastOrStationController);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v15 text]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTAddPodcastOrStationController createAndSaveStationWithTitle:]( v6,  "createAndSaveStationWithTitle:",  v7));

    -[MTTVStationsViewController _dismissTextField](self, "_dismissTextField");
    id v9 = -[MTTVStationDetailViewController initWithPlaylist:]( objc_alloc(&OBJC_CLASS___MTTVStationDetailViewController),  "initWithPlaylist:",  v8);
    id v10 = -[MTTVStationSettingsViewController initWithStation:]( objc_alloc(&OBJC_CLASS___MTTVStationSettingsViewController),  "initWithStation:",  v8);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 rootNavController]);

    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 viewControllers]);
    id v14 = [v13 mutableCopy];

    [v14 addObject:v9];
    [v14 addObject:v10];
    [v12 setViewControllers:v14];
    -[MTTVStationSettingsViewController showAddPodcastsUI](v10, "showAddPodcastsUI");
  }

  else
  {
    -[MTTVStationsViewController _dismissTextField](self, "_dismissTextField");
  }
}

- (void)_showCreateStationUI
{
  id v3 = -[UITextField initWithFrame:](objc_alloc(&OBJC_CLASS___UITextField), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[MTTVStationsViewController setHiddenTextField:](self, "setHiddenTextField:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v4 setHidden:1];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v5 setDelegate:self];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController view](self, "view"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v6 addSubview:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"NEW_PLAYLIST_ALERT" value:&stru_100248948 table:0]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v10 setPlaceholder:v9];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v11 becomeFirstResponder];
}

- (void)_dismissTextField
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationsViewController hiddenTextField](self, "hiddenTextField"));
  [v3 removeFromSuperview];

  -[MTTVStationsViewController setHiddenTextField:](self, "setHiddenTextField:", 0LL);
}

- (UITextField)hiddenTextField
{
  return self->_hiddenTextField;
}

- (void)setHiddenTextField:(id)a3
{
}

- (MTTVStationActionController)stationActionController
{
  return self->_stationActionController;
}

- (void)setStationActionController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end