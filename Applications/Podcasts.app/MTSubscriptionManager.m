@interface MTSubscriptionManager
- (BOOL)_addEpisode:(id)a3 toMyEpisodesInPodcast:(id)a4 persist:(BOOL)a5;
- (BOOL)_addLatestSeasonForSerialPodcast:(id)a3;
- (BOOL)_addLatestSeasonToPodcast:(id)a3;
- (BOOL)_addNewestEpisodeToPodcast:(id)a3;
- (BOOL)isSubscribingToPodcastWithStoreCollectionID:(int64_t)a3;
- (MTFeedManager)feedManager;
- (MTSubscriptionManager)init;
- (NSMutableDictionary)feedUrlsToParams;
- (NSMutableSet)currentlySubscribingStoreCollectionIds;
- (_TtC18PodcastsFoundation15FeedURLComposer)feedURLComposer;
- (id)preProcessFeedHookWithParams:(id)a3 feed:(id)a4 requestUrl:(id)a5 needsUpdate:(BOOL)a6 ctx:(id)a7;
- (id)subscribeParamsForFeedUrl:(id)a3;
- (void)_feedUpdateAndSubscribeToPodcast:(id)a3 feedUrl:(id)a4 adamId:(int64_t)a5;
- (void)addSubscribeParams:(id)a3 forFeedUrl:(id)a4;
- (void)feedDownloadedWithParams:(id)a3 error:(id)a4 task:(id)a5;
- (void)postProcessFeedHookWithParams:(id)a3 podcastUuid:(id)a4 ctx:(id)a5;
- (void)removeSubscribeParamsForFeedUrl:(id)a3;
- (void)showSubscriptionFailureDialog:(id)a3 error:(id)a4;
- (void)subscribeToPodcastWithParams:(id)a3;
@end

@implementation MTSubscriptionManager

- (MTSubscriptionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTSubscriptionManager;
  v2 = -[MTSubscriptionManager init](&v12, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](&OBJC_CLASS___MTFeedManager, "sharedInstance"));
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS____TtC18PodcastsFoundation15FeedURLComposer);
    feedURLComposer = v2->_feedURLComposer;
    v2->_feedURLComposer = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    feedUrlsToParams = v2->_feedUrlsToParams;
    v2->_feedUrlsToParams = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    currentlySubscribingStoreCollectionIds = v2->_currentlySubscribingStoreCollectionIds;
    v2->_currentlySubscribingStoreCollectionIds = v9;
  }

  return v2;
}

- (id)preProcessFeedHookWithParams:(id)a3 feed:(id)a4 requestUrl:(id)a5 needsUpdate:(BOOL)a6 ctx:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
  if (v16)
  {

    goto LABEL_5;
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v13 author]);

  if (v17)
  {
LABEL_5:
    if ([v13 isNotSubscribable])
    {
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      v53 = @"The feed is not subscribable.";
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.MTSubscriptionManager",  103LL,  v18));

      -[MTSubscriptionManager showSubscriptionFailureDialog:error:]( self,  "showSubscriptionFailureDialog:error:",  v12,  v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v12 completion]);

      if (v20)
      {
        v21 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v12 completion]);
        v21[2](v21, 0LL);
      }

      id v22 = (id)objc_claimAutoreleasedReturnValue( +[MTFeedUpdatePreProcessResult shouldNotContinueResult]( &OBJC_CLASS___MTFeedUpdatePreProcessResult,  "shouldNotContinueResult"));
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v13 resolvedFeedURL]);
      v24 = v23;
      if (v23) {
        id v25 = v23;
      }
      else {
        id v25 = (id)objc_claimAutoreleasedReturnValue([v14 absoluteString]);
      }
      v26 = v25;

      uint64_t v46 = 0LL;
      v47 = &v46;
      uint64_t v48 = 0x3032000000LL;
      v49 = sub_1000AB4F4;
      v50 = sub_1000AB504;
      id v51 = 0LL;
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472LL;
      v39 = sub_1000AB50C;
      v40 = &unk_1002436C0;
      id v41 = v15;
      id v27 = v26;
      id v42 = v27;
      id v43 = v13;
      id v28 = v12;
      id v44 = v28;
      v45 = &v46;
      [v41 performBlockAndWaitWithSave:&v37];
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "completion", v37, v38, v39, v40));

      if (v29)
      {
        v30 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v28 completion]);
        v30[2](v30, 1LL);
      }

      id v31 = objc_alloc(&OBJC_CLASS___MTFeedUpdatePreProcessResult);
      id v22 = [v31 initWithShouldContinue:1 createdPodcastUUID:v47[5]];

      _Block_object_dispose(&v46, 8);
    }

    goto LABEL_15;
  }

  if (v8)
  {
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    v55 = @"The feed is empty. There are no items in the feed, and the feed has no title and no author.";
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.MTSubscriptionManager",  102LL,  v33));

    -[MTSubscriptionManager showSubscriptionFailureDialog:error:]( self,  "showSubscriptionFailureDialog:error:",  v12,  v34);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v12 completion]);

  if (v35)
  {
    v36 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v12 completion]);
    ((void (**)(void, BOOL))v36)[2](v36, !v8);
  }

  id v22 = (id)objc_claimAutoreleasedReturnValue( +[MTFeedUpdatePreProcessResult shouldNotContinueResult]( &OBJC_CLASS___MTFeedUpdatePreProcessResult,  "shouldNotContinueResult"));
LABEL_15:

  return v22;
}

- (void)postProcessFeedHookWithParams:(id)a3 podcastUuid:(id)a4 ctx:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000AB824;
  v15[3] = &unk_100240C10;
  id v16 = a5;
  id v10 = v9;
  id v17 = v10;
  v18 = self;
  id v14 = v8;
  id v19 = v14;
  id v11 = v16;
  [v11 performBlockAndWait:v15];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v14 processingCompletion]);

  if (v12)
  {
    id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v14 processingCompletion]);
    ((void (**)(void, id))v13)[2](v13, v10);
  }
}

- (void)feedDownloadedWithParams:(id)a3 error:(id)a4 task:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (!v9 || ([v9 userCanceledAuth] & 1) == 0) {
      -[MTSubscriptionManager showSubscriptionFailureDialog:error:]( self,  "showSubscriptionFailureDialog:error:",  v13,  v8);
    }
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 completion]);

    if (v11)
    {
      id v12 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v13 completion]);
      v12[2](v12, 0LL);
    }
  }
}

- (BOOL)_addLatestSeasonToPodcast:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v14 = 0LL;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    char v17 = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000ABB18;
    v10[3] = &unk_100240A80;
    v10[4] = self;
    id v11 = v5;
    id v13 = &v14;
    id v7 = v6;
    id v12 = v7;
    [v7 performBlockAndWait:v10];
    BOOL v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_addLatestSeasonForSerialPodcast:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodesInLatestSeasonWithLimit:0]);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= -[MTSubscriptionManager _addEpisode:toMyEpisodesInPodcast:persist:]( self,  "_addEpisode:toMyEpisodesInPodcast:persist:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)i),  v4,  0LL);
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  for (unint64_t j = kMaxSubscribeDownloadForSerialWithSeasons; j < (unint64_t)[v5 count]; ++j)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:j]);
    [v12 suppressAutomaticDownloadsIfNeeded];
  }

  return v8 & 1;
}

- (BOOL)_addNewestEpisodeToPodcast:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v13 = 0LL;
    __int128 v14 = &v13;
    uint64_t v15 = 0x2020000000LL;
    char v16 = 0;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 managedObjectContext]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000ABDB0;
    v9[3] = &unk_100240738;
    id v11 = self;
    id v12 = &v13;
    id v10 = v5;
    [v6 performBlockAndWait:v9];
    BOOL v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_addEpisode:(id)a3 toMyEpisodesInPodcast:(id)a4 persist:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  BOOL v10 = 0;
  if (v7 && v8)
  {
    uint64_t v19 = 0LL;
    v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 1;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000ABF48;
    v14[3] = &unk_1002436E8;
    id v15 = v7;
    __int128 v17 = &v19;
    BOOL v18 = a5;
    id v12 = v11;
    id v16 = v12;
    [v12 performBlockAndWait:v14];
    BOOL v10 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

- (void)subscribeToPodcastWithParams:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedManager](self, "feedManager"));
  unsigned int v6 = objc_msgSend(v5, "abortUpdatesIfNetworkUnreachable:", objc_msgSend(v4, "userInitiated"));

  if (!v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
    id v9 = [v8 length];

    if (v9)
    {
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v4 url]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    }

    else
    {
      id v11 = 0LL;
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedURLComposer](self, "feedURLComposer"));
    id v38 = 0LL;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "feedURLForOptionalURL:adamID:error:",  v11,  objc_msgSend(v4, "storeCollectionId"),  &v38));
    id v14 = v38;

    if (v14)
    {
      id v15 = [v14 code];
      if (v15 == +[FeedURLComposer errorURLDoesNotExist]( &OBJC_CLASS____TtC18PodcastsFoundation15FeedURLComposer,  "errorURLDoesNotExist"))
      {
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        id v44 = @"The feed url does not exist.";
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.MTSubscriptionManager",  101LL,  v16));

        -[MTSubscriptionManager showSubscriptionFailureDialog:error:]( self,  "showSubscriptionFailureDialog:error:",  v4,  v17);
LABEL_11:

        goto LABEL_22;
      }

      id v18 = [v14 code];
      if (v18 == +[FeedURLComposer errorURLInvalid]( &OBJC_CLASS____TtC18PodcastsFoundation15FeedURLComposer,  "errorURLInvalid"))
      {
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"The feed url is invalid: %@",  v13));
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        id v42 = v17;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.podcasts.MTSubscriptionManager",  100LL,  v19));

        -[MTSubscriptionManager showSubscriptionFailureDialog:error:]( self,  "showSubscriptionFailureDialog:error:",  v4,  v20);
        goto LABEL_11;
      }

      id v21 = [v14 code];
      id v22 = +[FeedURLComposer errorCannotGenerateInternalURL]( &OBJC_CLASS____TtC18PodcastsFoundation15FeedURLComposer,  "errorCannotGenerateInternalURL");
      if (v21 == v22)
      {
        uint64_t v23 = _MTLogCategoryFeedUpdate(v22);
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = [v4 storeCollectionId];
          *(_DWORD *)buf = 134217984;
          id v40 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "For some weird reason we cannot generate url of type internal://%lld",  buf,  0xCu);
        }
      }
    }

    id v26 = [v4 storeCollectionId];
    if (!v26)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
      unsigned int v28 = +[MTPodcast isRedirectURL:](&OBJC_CLASS___MTPodcast, "isRedirectURL:", v27);

      if (!v28
        || (v29 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]),
            id v26 = +[MTPodcast storeCollectionIdForRedirectURL:]( &OBJC_CLASS___MTPodcast,  "storeCollectionIdForRedirectURL:",  v29),  v29,  !v26))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[MTSubscriptionController sharedInstance]( &OBJC_CLASS___MTSubscriptionController,  "sharedInstance"));
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_1000AC468;
        v33[3] = &unk_100243710;
        id v34 = v30;
        id v35 = v4;
        v36 = self;
        id v37 = v13;
        id v32 = v30;
        [v31 podcastExistsInStoreWithFeedUrl:v32 completion:v33];

        goto LABEL_22;
      }

      [v4 setStoreCollectionId:v26];
    }

    -[MTSubscriptionManager _feedUpdateAndSubscribeToPodcast:feedUrl:adamId:]( self,  "_feedUpdateAndSubscribeToPodcast:feedUrl:adamId:",  v4,  v13,  v26);
LABEL_22:

    goto LABEL_23;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
  [v7 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTSubscriptionManager.m" lineNumber:281 format:@"Skipping subscibe to podcasts due to network not being reachable"];

LABEL_23:
}

- (void)_feedUpdateAndSubscribeToPodcast:(id)a3 feedUrl:(id)a4 adamId:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 absoluteString]);
  uint64_t v46 = self;
  -[MTSubscriptionManager addSubscribeParams:forFeedUrl:](self, "addSubscribeParams:forFeedUrl:", v8, v10);

  uint64_t v12 = _MTLogCategoryFeedUpdate(v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  uint64_t v16 = _MTLogCategoryFollowing(v15);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 141558786;
    uint64_t v62 = 1752392040LL;
    __int16 v63 = 2048;
    int64_t v64 = a5;
    __int16 v65 = 2160;
    uint64_t v66 = 1752392040LL;
    __int16 v67 = 2112;
    id v68 = v9;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v18,  OS_SIGNPOST_INTERVAL_BEGIN,  v14,  "MTSubscriptionManager subscribe",  "adamID hash: %{mask.hash}lli, url hash: %{mask.hash}@",  buf,  0x2Au);
  }

  os_signpost_id_t v44 = v14;
  v45 = v9;

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](&OBJC_CLASS___PodcastsApplicationStateMonitor, "shared"));
  id v20 = [v19 isActive];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey userInitiated](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "userInitiated"));
  v59[0] = v21;
  int64_t v22 = a5;
  NSErrorUserInfoKey v43 = v8;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 userInitiated]));
  v60[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey foreground](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "foreground"));
  v59[1] = v24;
  id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v20));
  v60[1] = v25;
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey backgroundFetch]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "backgroundFetch"));
  v59[2] = v26;
  v60[2] = &__kCFBooleanFalse;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsDataKey podcastStoreId]( &OBJC_CLASS___MTFeedUpdateMetricsDataKey,  "podcastStoreId"));
  v59[3] = v27;
  int64_t v28 = v22;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v22));
  v60[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey source](&OBJC_CLASS___MTFeedUpdateMetricsDataKey, "source"));
  v59[4] = v30;
  v60[4] = &off_100254DA0;
  uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  5LL));

  uint64_t v33 = _MTLogCategoryFeedUpdate(v32);
  id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v62 = v31;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updating podcast %@", buf, 0xCu);
  }

  id v35 = (void *)objc_claimAutoreleasedReturnValue( +[MTFeedUpdateMetricsAction podcastDataSource]( &OBJC_CLASS___MTFeedUpdateMetricsAction,  "podcastDataSource"));
  +[IMMetrics recordEvent:dataSource:data:](&OBJC_CLASS___IMMetrics, "recordEvent:dataSource:data:", v35, 0LL, v31);

  v36 = (void *)v31;
  id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedManager](v46, "feedManager"));
  id v38 = [v43 userInitiated];
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1000ACA24;
  v57[3] = &unk_100243738;
  v57[4] = v46;
  id v58 = v43;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1000ACA38;
  v53[3] = &unk_100243760;
  v53[4] = v46;
  id v54 = v58;
  id v55 = v45;
  os_signpost_id_t v56 = v44;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000ACAE8;
  v50[3] = &unk_100243788;
  v50[4] = v46;
  id v51 = v54;
  os_signpost_id_t v52 = v44;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1000ACB80;
  v47[3] = &unk_1002437B0;
  v47[4] = v46;
  id v48 = v55;
  os_signpost_id_t v49 = v44;
  id v39 = v55;
  id v40 = v54;
  LOBYTE(v42) = 1;
  LOBYTE(v41) = 0;
  [v37 updateFeedForFeedUrl:v39 cloudSyncFeedUrl:v39 podcastStoreId:v28 triggerBy:0 userInitiated:v38 forceBootstrap:0 useBackgroundFetch:v41 sourc e:16 isSubscribing:v42 feedDownloadedHook:v57 preProcessFeedHook:v53 postProcessFeedHook:v50 completion:v47];
}

- (BOOL)isSubscribingToPodcastWithStoreCollectionID:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[MTSubscriptionManager currentlySubscribingStoreCollectionIds]( self,  "currentlySubscribingStoreCollectionIds"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a3));
  LOBYTE(a3) = [v6 containsObject:v7];

  objc_sync_exit(v5);
  return a3;
}

- (id)subscribeParamsForFeedUrl:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

  objc_sync_exit(v5);
  return v7;
}

- (void)addSubscribeParams:(id)a3 forFeedUrl:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  [v8 setObject:v11 forKey:v6];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTSubscriptionManager currentlySubscribingStoreCollectionIds]( self,  "currentlySubscribingStoreCollectionIds"));
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v11 storeCollectionId]));
  [v9 addObject:v10];

  objc_sync_exit(v7);
}

- (void)removeSubscribeParamsForFeedUrl:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  [v8 removeObjectForKey:v4];

  id v9 = [v7 storeCollectionId];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[MTSubscriptionManager currentlySubscribingStoreCollectionIds]( self,  "currentlySubscribingStoreCollectionIds"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  [v10 removeObject:v11];

  objc_sync_exit(v5);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v15 = @"com.apple.podcasts.MTSubscriptionManager.StoreCollectionID";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v9));
  uint64_t v16 = v13;
  os_signpost_id_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  [v12 postNotificationName:@"com.apple.podcasts.MTSubscriptionManager.DidFinishSubscribingNotification" object:self userInfo:v14];
}

- (void)showSubscriptionFailureDialog:(id)a3 error:(id)a4
{
  id v5 = a4;
  if ([a3 userInitiated])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000AD0D4;
    block[3] = &unk_10023FF98;
    id v7 = v5;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (_TtC18PodcastsFoundation15FeedURLComposer)feedURLComposer
{
  return self->_feedURLComposer;
}

- (NSMutableDictionary)feedUrlsToParams
{
  return self->_feedUrlsToParams;
}

- (NSMutableSet)currentlySubscribingStoreCollectionIds
{
  return self->_currentlySubscribingStoreCollectionIds;
}

- (void).cxx_destruct
{
}

@end