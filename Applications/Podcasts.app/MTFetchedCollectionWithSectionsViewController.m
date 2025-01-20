@interface MTFetchedCollectionWithSectionsViewController
- (BOOL)hideHeaderForEmptySection:(int64_t)a3;
- (BOOL)updatesContainChanges:(id)a3;
- (BOOL)updatesContainsDeleteSection:(id)a3 sectionCountDict:(id)a4;
- (BOOL)updatesContainsInsertSection:(id)a3 sectionCountDict:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (MTCompositeResultsController)compositeResultsController;
- (MTFetchedCollectionWithSectionsViewController)initWithCollectionViewLayout:(id)a3 compositeFetchedResultsController:(id)a4;
- (MTFetchedCollectionWithSectionsViewController)initWithCompositeFetchedResultsController:(id)a3;
- (NSArray)sections;
- (UIRefreshControl)refreshControl;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)createSectionCountDictionary;
- (id)indexPathForObject:(id)a3;
- (id)indexPathsForObject:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)reuseIdentifierForItemAtIndexPath:(id)a3;
- (id)validIndexPathsForIndexPaths:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)frcState;
- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)registerCollectionViewClasses;
- (void)reloadDataSource;
- (void)setCompositeResultsController:(id)a3;
- (void)setFrcState:(unint64_t)a3;
- (void)setRefreshControl:(id)a3;
- (void)setSections:(id)a3;
- (void)updateCollectionViewForUpdates:(id)a3;
- (void)updateCollectionViewForUpdates:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation MTFetchedCollectionWithSectionsViewController

- (MTFetchedCollectionWithSectionsViewController)initWithCompositeFetchedResultsController:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___MTCollectionViewFlowLayout);
  v6 = -[MTFetchedCollectionWithSectionsViewController initWithCollectionViewLayout:compositeFetchedResultsController:]( self,  "initWithCollectionViewLayout:compositeFetchedResultsController:",  v5,  v4);

  return v6;
}

- (MTFetchedCollectionWithSectionsViewController)initWithCollectionViewLayout:(id)a3 compositeFetchedResultsController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTFetchedCollectionWithSectionsViewController;
  v7 = -[MTFetchedCollectionWithSectionsViewController initWithCollectionViewLayout:]( &v10,  "initWithCollectionViewLayout:",  a3);
  v8 = v7;
  if (v7)
  {
    -[MTFetchedCollectionWithSectionsViewController setCompositeResultsController:]( v7,  "setCompositeResultsController:",  v6);
    [v6 setDelegate:v8];
  }

  return v8;
}

- (void)reloadDataSource
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controllers]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController",  0LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 controllers]);

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)v11) allObjects]);
        id v13 = [v12 copy];

        if (v13) {
          v14 = v13;
        }
        else {
          v14 = &__NSArray0__struct;
        }
        [v5 addObject:v14];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  -[MTFetchedCollectionWithSectionsViewController setSections:](self, "setSections:", v15);
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTFetchedCollectionWithSectionsViewController;
  -[MTFetchedCollectionWithSectionsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v4 setBackgroundColor:v3];

  -[MTFetchedCollectionWithSectionsViewController registerCollectionViewClasses](self, "registerCollectionViewClasses");
}

- (void)registerCollectionViewClasses
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v3 registerClass:objc_opt_class(MTCollectionSectionHeaderView) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kMTFetchedCollectionWithSectionsViewControllerDefaultHeaderIdentifier"];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  [v4 registerClass:objc_opt_class(MTCollectionViewCell) forCellWithReuseIdentifier:@"kMTFetchedCollectionWithSectionsViewControllerDefaultCellIdentifier"];
}

- (void)setCompositeResultsController:(id)a3
{
  objc_super v5 = (MTCompositeResultsController *)a3;
  compositeResultsController = self->_compositeResultsController;
  if (compositeResultsController != v5)
  {
    id v8 = v5;
    -[MTCompositeResultsController setDelegate:](compositeResultsController, "setDelegate:", 0LL);
    objc_storeStrong((id *)&self->_compositeResultsController, a3);
    -[MTCompositeResultsController setDelegate:](self->_compositeResultsController, "setDelegate:", self);
    -[MTFetchedCollectionWithSectionsViewController reloadDataSource](self, "reloadDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
    [v7 reloadData];

    objc_super v5 = v8;
  }
}

- (MTCompositeResultsController)compositeResultsController
{
  compositeResultsController = self->_compositeResultsController;
  if (!compositeResultsController)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___MTCompositeResultsController);
    objc_super v5 = self->_compositeResultsController;
    self->_compositeResultsController = v4;

    -[MTCompositeResultsController setDelegate:](self->_compositeResultsController, "setDelegate:", self);
    compositeResultsController = self->_compositeResultsController;
  }

  return compositeResultsController;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections"));
  id v7 = [v6 count];

  if (v5 >= v7)
  {
    v11 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

    id v10 = [v4 row];
    if (v10 >= [v9 count]) {
      v11 = 0LL;
    }
    else {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
    }
  }

  return v11;
}

- (id)indexPathsForObject:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections"));
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_100095AD4;
  v14 = &unk_100243068;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:&v11];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v7, v11, v12, v13, v14));
  return v9;
}

- (id)indexPathForObject:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController indexPathsForObject:](self, "indexPathsForObject:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);

  return v4;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections", a3));
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:a4]);
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController reuseIdentifierForItemAtIndexPath:]( self,  "reuseIdentifierForItemAtIndexPath:",  v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  -[MTFetchedCollectionWithSectionsViewController collectionView:configureCell:withObject:atIndexPath:]( self,  "collectionView:configureCell:withObject:atIndexPath:",  v7,  v9,  v10,  v6);

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue( [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"kMTFetchedCollectionWithSectionsViewControllerDefaultHeaderIdentifier" forIndexPath:v8]);
  -[MTFetchedCollectionWithSectionsViewController collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:]( self,  "collectionView:configureReusableView:ofSupplementaryElementOfKind:forItemAtIndexPath:",  v10,  v11,  v9,  v8);

  return v11;
}

- (id)reuseIdentifierForItemAtIndexPath:(id)a3
{
  return @"kMTFetchedCollectionWithSectionsViewControllerDefaultCellIdentifier";
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:a5]);

  id v10 = [v9 count];
  if (!-[MTFetchedCollectionWithSectionsViewController hideHeaderForEmptySection:]( self,  "hideHeaderForEmptySection:",  a5)
    || v10)
  {
    [v7 frame];
    CGFloat width = v13;
    +[MTCollectionSectionHeaderView height](&OBJC_CLASS___MTCollectionSectionHeaderView, "height");
    CGFloat height = v14;
  }

  else
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }

  double v15 = width;
  double v16 = height;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (!-[MTFetchedCollectionWithSectionsViewController frcState](v4, "frcState"))
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    frcChangesDict = v4->_frcChangesDict;
    v4->_frcChangesDict = (NSMutableDictionary *)v5;

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4->_frcChangesDict,  "setObject:forKeyedSubscript:",  v7,  @"MTFRCDeletions");

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4->_frcChangesDict,  "setObject:forKeyedSubscript:",  v8,  @"MTFRCInsertions");

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4->_frcChangesDict,  "setObject:forKeyedSubscript:",  v9,  @"MTFRCMoves");

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4->_frcChangesDict,  "setObject:forKeyedSubscript:",  v10,  @"MTFRCUpdates");
  }

  -[MTFetchedCollectionWithSectionsViewController setFrcState:]( v4,  "setFrcState:",  (char *)-[MTFetchedCollectionWithSectionsViewController frcState](v4, "frcState") + 1);
  objc_sync_exit(v4);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  double v16 = self;
  objc_sync_enter(v16);
  frcChangesDict = v16->_frcChangesDict;
  switch(a6)
  {
    case 1uLL:
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( frcChangesDict,  "objectForKeyedSubscript:",  @"MTFRCInsertions"));
      [v18 addObject:v15];
      goto LABEL_5;
    case 2uLL:
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( frcChangesDict,  "objectForKeyedSubscript:",  @"MTFRCDeletions"));
      [v18 addObject:v14];
LABEL_5:

      break;
    case 3uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( frcChangesDict,  "objectForKeyedSubscript:",  @"MTFRCMoves"));
      v29[0] = v14;
      v29[1] = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
      [v20 addObject:v21];

      break;
    case 4uLL:
LABEL_7:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](v16, "collectionView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 indexPathsForVisibleItems]);
      unsigned int v24 = [v23 containsObject:v14];

      if (v24)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](v16, "collectionView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 cellForItemAtIndexPath:v14]);

        if (v13 && v26)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](v16, "collectionView"));
          -[MTFetchedCollectionWithSectionsViewController collectionView:configureCell:withObject:atIndexPath:]( v16,  "collectionView:configureCell:withObject:atIndexPath:",  v27,  v26,  v13,  v14);
        }
      }

      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v16->_frcChangesDict,  "objectForKeyedSubscript:",  @"MTFRCUpdates"));
        [v28 addObject:v14];
      }

      break;
    default:
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
      [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/ATV/View Controllers/CollectionView/MTFetchedCollectionWit hSectionsViewController.m", 314, @"Unknown change of type %ld indexPath %@ newIndexPath %@", a6, v14, v15 lineNumber format];

      break;
  }

  objc_sync_exit(v16);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[MTFetchedCollectionWithSectionsViewController setFrcState:]( v4,  "setFrcState:",  (char *)-[MTFetchedCollectionWithSectionsViewController frcState](v4, "frcState") - 1);
  if (!-[MTFetchedCollectionWithSectionsViewController frcState](v4, "frcState"))
  {
    id v5 = -[NSMutableDictionary copy](v4->_frcChangesDict, "copy");
    frcChangesDict = v4->_frcChangesDict;
    v4->_frcChangesDict = 0LL;

    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController createSectionCountDictionary]( v4,  "createSectionCountDictionary"));
    BOOL v8 = !-[MTFetchedCollectionWithSectionsViewController updatesContainsInsertSection:sectionCountDict:]( v4,  "updatesContainsInsertSection:sectionCountDict:",  v5,  v7)
      && !-[MTFetchedCollectionWithSectionsViewController updatesContainsDeleteSection:sectionCountDict:]( v4,  "updatesContainsDeleteSection:sectionCountDict:",  v5,  v7)
      && -[MTFetchedCollectionWithSectionsViewController updatesContainChanges:](v4, "updatesContainChanges:", v5);
    -[MTFetchedCollectionWithSectionsViewController updateCollectionViewForUpdates:animated:]( v4,  "updateCollectionViewForUpdates:animated:",  v5,  v8);
  }

  objc_sync_exit(v4);
}

- (BOOL)updatesContainsDeleteSection:(id)a3 sectionCountDict:(id)a4
{
  id v5 = a4;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"MTFRCDeletions"]);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)i), "section", (void)v15)));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        uint64_t v12 = (uint64_t)[v11 integerValue];
        if (v12 < 2)
        {

          LOBYTE(v7) = 1;
          goto LABEL_11;
        }

        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12 - 1));
        [v5 setObject:v13 forKeyedSubscript:v10];
      }

      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)updatesContainsInsertSection:(id)a3 sectionCountDict:(id)a4
{
  id v5 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"MTFRCInsertions"]);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "section", (void)v14)));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);

        id v12 = [v11 integerValue];
        if (!v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)updatesContainChanges:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000967FC;
  v6[3] = &unk_100243090;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)createSectionCountDictionary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  char v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController sections](self, "sections"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000968D8;
  v7[3] = &unk_1002430B8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

- (void)updateCollectionViewForUpdates:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    -[MTFetchedCollectionWithSectionsViewController updateCollectionViewForUpdates:]( self,  "updateCollectionViewForUpdates:",  v6);
  }

  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000969FC;
    v8[3] = &unk_100240240;
    v8[4] = self;
    id v9 = v6;
    +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", v8);
  }
}

- (void)updateCollectionViewForUpdates:(id)a3
{
  id v4 = a3;
  -[MTFetchedCollectionWithSectionsViewController _willUpdateCollectionView:](self, "_willUpdateCollectionView:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100096AE8;
  v9[3] = &unk_100240240;
  v9[4] = self;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100096F1C;
  v7[3] = &unk_100241B88;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [v5 performBatchUpdates:v9 completion:v7];
}

- (id)validIndexPathsForIndexPaths:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v12 = objc_msgSend(v11, "section", (void)v20);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
        id v14 = [v13 numberOfSections];

        if ((uint64_t)v12 < (uint64_t)v14)
        {
          id v15 = [v11 row];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTFetchedCollectionWithSectionsViewController collectionView](self, "collectionView"));
          id v17 = objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v11, "section"));
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v8);
  }

  id v18 = [v5 copy];
  return v18;
}

- (void)collectionView:(id)a3 configureReusableView:(id)a4 ofSupplementaryElementOfKind:(id)a5 forItemAtIndexPath:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([UICollectionElementKindSectionHeader isEqualToString:a5])
  {
    id v12 = v10;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController collectionView:titleForHeaderInSection:]( self,  "collectionView:titleForHeaderInSection:",  v15,  [v11 section]));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 textLabel]);
    [v14 setText:v13];

    [v12 setNeedsLayout];
  }
}

- (id)collectionView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTFetchedCollectionWithSectionsViewController compositeResultsController]( self,  "compositeResultsController",  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 controllerAtIndex:a4]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  return v7;
}

- (BOOL)hideHeaderForEmptySection:(int64_t)a3
{
  return 1;
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (void)setRefreshControl:(id)a3
{
}

- (unint64_t)frcState
{
  return self->_frcState;
}

- (void)setFrcState:(unint64_t)a3
{
  self->_frcState = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end