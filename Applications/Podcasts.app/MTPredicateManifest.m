@interface MTPredicateManifest
- (BOOL)hasFRCChanges;
- (BOOL)needsFrozenCheck;
- (BOOL)preserveOriginalEpisodeOrdering;
- (BOOL)resultsAreFrozen;
- (MTAllPropertyChangesQueryObserver)allPropertyChangeObserver;
- (MTIndexPathShifter)indexPathShifter;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 predicateToTrack:(id)a4 sortDescriptors:(id)a5;
- (MTResultsChangeGenerator)changeGenerator;
- (NSArray)explicitSortOrder;
- (NSArray)sortDescriptors;
- (NSFetchRequest)fetchRequest;
- (NSFetchedResultsController)frc;
- (NSPredicate)predicate;
- (id)_augmentPredicate:(id)a3;
- (id)_currentEpisodeUuid;
- (void)_frcDidChangeResults:(id)a3 uuidToManagedObjectIDMap:(id)a4;
- (void)_freezeContentIfNeeded;
- (void)_load:(id)a3;
- (void)_observeAllPropertyChangesForEntityName:(id)a3 predicate:(id)a4;
- (void)_refetch:(id)a3;
- (void)_restrictionsDidChange;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setAllPropertyChangeObserver:(id)a3;
- (void)setChangeGenerator:(id)a3;
- (void)setExplicitSortOrder:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setFrc:(id)a3;
- (void)setHasFRCChanges:(BOOL)a3;
- (void)setIndexPathShifter:(id)a3;
- (void)setNeedsFrozenCheck:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setPreserveOriginalEpisodeOrdering:(BOOL)a3;
- (void)setResultsAreFrozen:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation MTPredicateManifest

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3
{
  return -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]( self,  "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:",  a3,  0LL,  0LL);
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 predicateToTrack:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodePubDate,  1LL));
    v19[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeEpisodeNumber,  1LL));
    v19[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  kEpisodeLevel,  0LL));
    v19[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:selector:",  kEpisodeTitle,  1LL,  "localizedStandardCompare:"));
    v19[3] = v14;
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));
  }

  v15 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
  v16 = -[NSFetchRequest initWithEntityName:](v15, "initWithEntityName:", kMTEpisodeEntityName);
  -[NSFetchRequest setPredicate:](v16, "setPredicate:", v9);
  -[NSFetchRequest setSortDescriptors:](v16, "setSortDescriptors:", v10);
  v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]( self,  "initWithInitialEpisodeUuid:fetchRequest:",  v8,  v16);

  return v17;
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MTPredicateManifest;
  v7 = -[MTBaseEpisodeListManifest initWithInitialEpisodeUuid:](&v14, "initWithInitialEpisodeUuid:", a3);
  id v8 = v7;
  if (v7)
  {
    -[MTPredicateManifest setFetchRequest:](v7, "setFetchRequest:", v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 predicate]);
    -[MTPredicateManifest setPredicate:](v8, "setPredicate:", v9);

    -[MTPredicateManifest setNeedsFrozenCheck:](v8, "setNeedsFrozenCheck:", 1LL);
    id v10 = -[MTResultsChangeGenerator initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTResultsChangeGenerator),  "initWithDelegate:",  v8);
    -[MTPredicateManifest setChangeGenerator:](v8, "setChangeGenerator:", v10);

    v11 = objc_alloc_init(&OBJC_CLASS___MTIndexPathShifter);
    -[MTPredicateManifest setIndexPathShifter:](v8, "setIndexPathShifter:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v8 selector:"_restrictionsDidChange" name:@"PFExplicitContentAllowedDidChangeNotification" object:0];
  }

  return v8;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTPredicateManifest;
  -[MTPredicateManifest dealloc](&v4, "dealloc");
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest fetchRequest](self, "fetchRequest"));
  [v5 setSortDescriptors:v4];
}

- (NSArray)sortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest fetchRequest](self, "fetchRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sortDescriptors]);

  return (NSArray *)v3;
}

- (void)_restrictionsDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000E0AF0;
  v2[3] = &unk_10023FF98;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v2);
}

- (void)_load:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1000E0B8C;
  v5[3] = &unk_100240138;
  id v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___MTPredicateManifest;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[MTPredicateManifest _load:](&v4, "_load:", v5);
}

- (void)_refetch:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  if ((-[MTPredicateManifest isLoaded](self, "isLoaded") & 1) != 0)
  {
    kdebug_trace(723518040LL, 0LL, 0LL, 0LL, 0LL);
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472LL;
    id v10 = sub_1000E0D54;
    v11 = &unk_100240138;
    v12 = self;
    v13 = v4;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &v8);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest frc](self, "frc", v8, v9, v10, v11, v12));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 managedObjectContext]);
    [v7 performBlock:v5];
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (id)_augmentPredicate:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTEpisode predicateForDownloaded:excludeHidden:]( &OBJC_CLASS___MTEpisode,  "predicateForDownloaded:excludeHidden:",  0LL,  1LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForFeedDeleted:](&OBJC_CLASS___MTEpisode, "predicateForFeedDeleted:", 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 AND:v6]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v7));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 AND:v8]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
  if ([v10 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](&OBJC_CLASS___MTEpisode, "predicateForEpisodeUuid:", v10));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 OR:v11]);

    uint64_t v9 = (void *)v12;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPodcastIsNotHidden](&OBJC_CLASS___MTEpisode, "predicateForPodcastIsNotHidden"));
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v9 AND:v13]);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForExternalType:](&OBJC_CLASS___MTEpisode, "predicateForExternalType:", 0LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v14 AND:v15]);

  v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTBaseEpisodeListManifest _predicateForFilteringExplicitEpisodes]( self,  "_predicateForFilteringExplicitEpisodes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v16 AND:v17]);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEntitledEpisodes](&OBJC_CLASS___MTEpisode, "predicateForEntitledEpisodes"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v18 AND:v19]);

  return v20;
}

- (id)_currentEpisodeUuid
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest currentItem](self, "currentItem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 episodeUuid]);

  if (![v4 length])
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest initialEpisodeUuid](self, "initialEpisodeUuid"));

    id v4 = (void *)v5;
  }

  return v4;
}

- (void)_frcDidChangeResults:(id)a3 uuidToManagedObjectIDMap:(id)a4
{
  id v7 = (NSMutableArray *)a3;
  id v8 = a4;
  if (-[MTPredicateManifest isLoaded](self, "isLoaded")
    && !-[MTPredicateManifest resultsAreFrozen](self, "resultsAreFrozen"))
  {
    kdebug_trace(723518052LL, 0LL, 0LL, 0LL, 0LL);
    if (self->_preserveOriginalEpisodeOrdering)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));

      if (!v10) {
        objc_storeStrong((id *)&self->_explicitSortOrder, a3);
      }
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder"));

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
      uint64_t v9 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v12 count]);
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest explicitSortOrder](self, "explicitSortOrder", 0LL));
      id v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (i = 0LL; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
          }

          id v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }

        while (v15);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
      if ([v19 length]
        && (-[NSMutableArray containsObject:](v9, "containsObject:", v19) & 1) == 0
        && -[NSMutableArray containsObject:](v7, "containsObject:", v19))
      {
        id v20 = -[MTPredicateManifest currentIndex](self, "currentIndex");
        if (v20 <= -[NSMutableArray count](v9, "count")) {
          id v21 = -[MTPredicateManifest currentIndex](self, "currentIndex");
        }
        else {
          id v21 = 0LL;
        }
        -[NSMutableArray insertObject:atIndex:](v9, "insertObject:atIndex:", v19, v21);
      }
    }

    else
    {
      uint64_t v9 = v7;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    unsigned int v23 = [v22 isEqual:v9];

    if (v23)
    {
      kdebug_trace(723518056LL, 0LL, 0LL, 0LL, 0LL);
      goto LABEL_4;
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    -[MTBaseEpisodeListManifest setEpisodeUuids:](self, "setEpisodeUuids:", v9);
    -[MTBaseEpisodeListManifest setUuidToManagedObjectIDMap:](self, "setUuidToManagedObjectIDMap:", v8);
    if (!-[MTBaseEpisodeListManifest count](self, "count")
      || -[MTPredicateManifest currentIndex](self, "currentIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_47:
      -[MTPredicateManifest _freezeContentIfNeeded](self, "_freezeContentIfNeeded");
      -[MTBaseEpisodeListManifest postManifestDidChangeNotification](self, "postManifestDidChangeNotification");
      kdebug_trace(723518056LL, 0LL, 0LL, 0LL, 0LL);

      goto LABEL_4;
    }

    kdebug_trace(723518060LL, 0LL, 0LL, 0LL, 0LL);
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  -[MTPredicateManifest currentIndex](self, "currentIndex"),  0LL));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
    [v26 setInitialIndexPath:v25];

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest changeGenerator](self, "changeGenerator"));
    [v27 generateChangesForExistingObjects:v24 newObjects:v9 inSection:0];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 shiftedIndexPath]);
    unint64_t v30 = (unint64_t)[v29 row];

    if (v30 != 0x7FFFFFFFFFFFFFFFLL
      || -[MTPredicateManifest currentIndex](self, "currentIndex") == (id)1
      && ((unint64_t v30 = (unint64_t)-[MTPredicateManifest currentIndex](self, "currentIndex") - 1,
           id v31 = -[MTPredicateManifest currentIndex](self, "currentIndex"),
           v31 >= [v24 count])
        ? (v32 = 0LL)
        : (v32 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v24,  "objectAtIndexedSubscript:",  -[MTPredicateManifest currentIndex](self, "currentIndex")))),  v30 >= (unint64_t)-[NSMutableArray count](v9, "count")
        ? (v33 = 0LL)
        : (v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v30))),
          unsigned int v34 = [v32 isEqualToString:v33],
          v33,
          v32,
          v34))
    {
      if ((v30 & 0x8000000000000000LL) != 0) {
        goto LABEL_45;
      }
    }

    else
    {
      unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    }

    if (v30 < -[MTBaseEpisodeListManifest count](self, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest currentItem](self, "currentItem"));
      [v35 setManifestIndex:v30];

LABEL_46:
      -[MTPredicateManifest setCurrentIndex:](self, "setCurrentIndex:", v30);
      kdebug_trace(723518064LL, 0LL, 0LL, 0LL, 0LL);
      goto LABEL_47;
    }

- (void)_freezeContentIfNeeded
{
  if (-[MTPredicateManifest needsFrozenCheck](self, "needsFrozenCheck"))
  {
    kdebug_trace(723518068LL, 0LL, 0LL, 0LL, 0LL);
    -[MTPredicateManifest setNeedsFrozenCheck:](self, "setNeedsFrozenCheck:", 0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
    id v4 = [v3 count];

    if ((unint64_t)v4 >= 0xC9)
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
      if (-[MTPredicateManifest currentIndex](self, "currentIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest _currentEpisodeUuid](self, "_currentEpisodeUuid"));
        uint64_t v7 = (uint64_t)[v5 indexOfObject:v6];
      }

      else
      {
        uint64_t v7 = (uint64_t)-[MTPredicateManifest currentIndex](self, "currentIndex");
      }

      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {

        return;
      }

      uint64_t v8 = 50LL;
      if (v7 > 50) {
        uint64_t v8 = v7;
      }
      uint64_t v9 = v8 - 50;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
      v11 = (char *)[v10 count];

      uint64_t v12 = (char *)(v7 + 100);
      v13 = &v12[-v9];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseEpisodeListManifest episodeUuids](self, "episodeUuids"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", v9, v13));

      -[MTBaseEpisodeListManifest setEpisodeUuids:](self, "setEpisodeUuids:", v15);
      -[MTPredicateManifest setCurrentIndex:](self, "setCurrentIndex:", [v15 indexOfObject:v16]);
      self->_resultsAreFrozen = 1;
    }

    kdebug_trace(723518072LL, 0LL, 0LL, 0LL, 0LL);
  }

- (void)_observeAllPropertyChangesForEntityName:(id)a3 predicate:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E1984;
  v7[3] = &unk_100240980;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  +[IMAVPlayer performOnAvSessionQueue:](&OBJC_CLASS___IMAVPlayer, "performOnAvSessionQueue:", v7);
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v12 shiftedIndexPath]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPredicateManifest indexPathShifter](self, "indexPathShifter"));
  [v13 processChangeAtIndexPath:v11 forChangeType:a6 newIndexPath:v10];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 - 1 <= 2) {
    -[MTPredicateManifest setHasFRCChanges:](self, "setHasFRCChanges:", 1LL);
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  if (-[MTPredicateManifest hasFRCChanges](self, "hasFRCChanges"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchedObjects]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:kEpisodeUuid]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 fetchedObjects]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:kObjectID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  v8,  v6));

    -[MTPredicateManifest setHasFRCChanges:](self, "setHasFRCChanges:", 0LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E1D30;
    v12[3] = &unk_100240980;
    v12[4] = self;
    id v13 = v6;
    id v14 = v9;
    id v10 = v9;
    id v11 = v6;
    +[IMAVPlayer performOnMainQueue:](&OBJC_CLASS___IMAVPlayer, "performOnMainQueue:", v12);
  }
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)explicitSortOrder
{
  return self->_explicitSortOrder;
}

- (void)setExplicitSortOrder:(id)a3
{
}

- (BOOL)preserveOriginalEpisodeOrdering
{
  return self->_preserveOriginalEpisodeOrdering;
}

- (void)setPreserveOriginalEpisodeOrdering:(BOOL)a3
{
  self->_preserveOriginalEpisodeOrdering = a3;
}

- (MTAllPropertyChangesQueryObserver)allPropertyChangeObserver
{
  return self->_allPropertyChangeObserver;
}

- (void)setAllPropertyChangeObserver:(id)a3
{
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (MTResultsChangeGenerator)changeGenerator
{
  return self->_changeGenerator;
}

- (void)setChangeGenerator:(id)a3
{
}

- (MTIndexPathShifter)indexPathShifter
{
  return self->_indexPathShifter;
}

- (void)setIndexPathShifter:(id)a3
{
}

- (BOOL)hasFRCChanges
{
  return self->_hasFRCChanges;
}

- (void)setHasFRCChanges:(BOOL)a3
{
  self->_hasFRCChanges = a3;
}

- (BOOL)needsFrozenCheck
{
  return self->_needsFrozenCheck;
}

- (void)setNeedsFrozenCheck:(BOOL)a3
{
  self->_needsFrozenCheck = a3;
}

- (BOOL)resultsAreFrozen
{
  return self->_resultsAreFrozen;
}

- (void)setResultsAreFrozen:(BOOL)a3
{
  self->_resultsAreFrozen = a3;
}

- (void).cxx_destruct
{
}

@end