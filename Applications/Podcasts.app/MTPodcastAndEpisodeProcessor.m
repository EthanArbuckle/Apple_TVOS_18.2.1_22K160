@interface MTPodcastAndEpisodeProcessor
- (MTPodcastAndEpisodeProcessor)init;
- (NSMutableDictionary)episodeObservers;
- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (id)entityName;
- (id)episodeObserverForPodcastUuid:(id)a3;
- (id)episodePredicateForPodcast:(id)a3;
- (id)episodeSortDescriptorsForPodcast:(id)a3;
- (id)episodeUuids;
- (id)podcastPredicate;
- (id)podcastUuids;
- (id)predicate;
- (void)addEpisodeObserverForPodcast:(id)a3;
- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6;
- (void)removeEpisodeObserverForPodcast:(id)a3;
- (void)removeEpisodeObserverForPodcasts:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)setEpisodeObservers:(id)a3;
- (void)stop;
- (void)updateEpisodeObserverForPodcast:(id)a3;
- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5;
@end

@implementation MTPodcastAndEpisodeProcessor

- (MTPodcastAndEpisodeProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTPodcastAndEpisodeProcessor;
  v2 = -[MTBaseProcessor init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPodcastAndEpisodeProcessor;
  -[MTBaseProcessor stop](&v5, "stop");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);
  [v4 enumerateObjectsUsingBlock:&stru_100242D90];
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (id)predicate
{
  return -[MTPodcastAndEpisodeProcessor podcastPredicate](self, "podcastPredicate");
}

- (id)podcastPredicate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"podcastPredicate must be implemented by subclasses",  0LL));
  objc_exception_throw(v2);
  return -[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](v3, v4, v5);
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"episodePredicateForPodcast must be implemented by subclasses",  0LL));
  objc_exception_throw(v4);
  return -[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:](v5, v6, v7);
}

- (id)episodeSortDescriptorsForPodcast:(id)a3
{
  return &__NSArray0__struct;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
}

- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10008E7BC;
  v14[3] = &unk_100242930;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v15 = v11;
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)addEpisodeObserverForPodcast:(id)a3
{
  id v10 = a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v10));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
  }
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:]( self,  "episodeSortDescriptorsForPodcast:",  v10));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:]( self,  "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:",  v10,  v5,  v6));
  [v7 setIdentifier:v10];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  [v9 setObject:v7 forKeyedSubscript:v10];

  objc_sync_exit(v8);
  [v7 startObserving];

  objc_autoreleasePoolPop(v4);
}

- (void)updateEpisodeObserverForPodcast:(id)a3
{
  id v13 = a3;
  id v4 = objc_autoreleasePoolPush();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v13));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](&OBJC_CLASS___NSPredicate, "falsePredicate"));
  }
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastAndEpisodeProcessor episodeObserverForPodcastUuid:]( self,  "episodeObserverForPodcastUuid:",  v13));
  id v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 predicate]);
  id v9 = v8;
  if (!v8 || ([v8 isEqual:v5] & 1) == 0)
  {
    [v7 stop];

LABEL_7:
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:]( self,  "episodeSortDescriptorsForPodcast:",  v13));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:]( self,  "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:",  v13,  v5,  v9));
    [v10 setIdentifier:v13];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    objc_sync_enter(v11);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    [v12 setObject:v10 forKeyedSubscript:v13];

    objc_sync_exit(v11);
    [v10 startObserving];
  }

  objc_autoreleasePoolPop(v4);
}

- (void)removeEpisodeObserverForPodcast:(id)a3
{
  id v7 = a3;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  SEL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5, v7));

  -[MTPodcastAndEpisodeProcessor removeEpisodeObserverForPodcasts:](self, "removeEpisodeObserverForPodcasts:", v6);
}

- (void)removeEpisodeObserverForPodcasts:(id)a3
{
  id v14 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v4);
  if ([v14 count])
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = v14;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

          if (v12)
          {
            [v12 stop];
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }

          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v7);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    [v13 removeObjectsForKeys:v5];
  }

  objc_sync_exit(v4);
}

- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___MTUuidQueryObserver);
  id v12 = -[MTUuidQueryObserver initWithEntityName:predicate:sortDescriptors:]( v11,  "initWithEntityName:predicate:sortDescriptors:",  kMTEpisodeEntityName,  v9,  v10);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10008EFF4;
  v16[3] = &unk_100242DE0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  id v13 = v8;
  id v17 = v13;
  id v14 = -[MTUuidQueryObserver addResultsChangedHandler:](v12, "addResultsChangedHandler:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = NSStringFromSelector(a2);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ must be implemented by subclasses",  v15));

  id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  v16,  0LL));
  objc_exception_throw(v17);
  -[MTPodcastAndEpisodeProcessor episodeObserverForPodcastUuid:](v18, v19, v20);
}

- (id)episodeObserverForPodcastUuid:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (id)podcastUuids
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_10008F360;
  id v9 = sub_10008F370;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10008F378;
  v4[3] = &unk_1002424F8;
  v4[4] = &v5;
  -[MTBaseProcessor results:](self, "results:", v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)episodeUuids
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_10008F360;
  id v12 = sub_10008F370;
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10008F4D8;
  v7[3] = &unk_100242E08;
  v7[4] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  objc_sync_exit(v3);
  id v5 = [(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSMutableDictionary)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end