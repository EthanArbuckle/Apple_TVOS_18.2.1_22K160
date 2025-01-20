@interface MTURLResolver
+ (BOOL)_handleBrowseURL:(id)a3;
+ (BOOL)_handleLegacyCoreSpotlightURL:(id)a3;
+ (BOOL)_handleNowPlayingURL:(id)a3;
+ (BOOL)_isLegacyCoreSpotlightURL:(id)a3;
+ (id)appController;
+ (id)episodeUrlForPodcastStoreId:(int64_t)a3 episodeStoreId:(int64_t)a4;
+ (id)podcastUrlForStoreId:(int64_t)a3;
+ (id)searchUrlForSearchText:(id)a3;
+ (void)handlePodcastsUrlScheme:(id)a3;
+ (void)handleiTMSUrlScheme:(id)a3;
+ (void)showSearchControllerWithSearchText:(id)a3;
@end

@implementation MTURLResolver

+ (id)appController
{
  return +[MTApplication appController](&OBJC_CLASS___MTApplication, "appController");
}

+ (void)handleiTMSUrlScheme:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "pf_cleanUrlToStoreId");
  id v6 = objc_msgSend(v4, "pf_cleanUrlToStoreTrackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_cleanUrlToEpisodeGuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainQueueContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100085FA4;
  v13[3] = &unk_100242B08;
  id v14 = v9;
  id v15 = v7;
  id v18 = v6;
  id v19 = a1;
  id v16 = v4;
  id v17 = v5;
  id v10 = v4;
  id v11 = v7;
  id v12 = v9;
  [v12 performBlock:v13];
}

+ (void)handlePodcastsUrlScheme:(id)a3
{
  id v4 = a3;
  if (([a1 _handleLegacyCoreSpotlightURL:v4] & 1) == 0
    && ([a1 _handleNowPlayingURL:v4] & 1) == 0
    && ([a1 _handleBrowseURL:v4] & 1) == 0)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 host]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"podcastUuid"]);
    v30 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"episodeUuid"]);
    v32[0] = @"play";
    v32[1] = @"show";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
    v31 = (void *)v5;
    if (([v9 containsObject:v5] & 1) == 0)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
      [v10 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Utility/MTURLResolver.m", 107, @"unsupported url: %@", v4 lineNumber format];
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainQueueContext]);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 episodeForUuid:v8]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 podcast]);
    if (v14)
    {
      id v15 = v14;
      id v16 = v12;
      id v17 = v9;
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 uuid]);
      id v19 = v7;
      unsigned __int8 v20 = [v7 isEqualToString:v18];

      if ((v20 & 1) != 0)
      {
        v7 = v19;
      }

      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue([v15 uuid]);
      }

      v9 = v17;
      id v12 = v16;
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 podcastForUuid:v7]);
    }

    id v21 = [v8 length];
    if (v13) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == 0LL;
    }
    uint64_t v23 = !v22;
    id v24 = [v8 length];
    v29 = v7;
    if ((!v13 || !v24) && [v7 length])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[MTRecencyUtil upNextForPodcastUuid:ctx:]( &OBJC_CLASS___MTRecencyUtil,  "upNextForPodcastUuid:ctx:",  v7,  v12));
      uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 episodeUuid]);

      v8 = (void *)v26;
    }

    if (v15)
    {
      id v27 = [v31 isEqualToString:@"play"];
      v28 = (void *)objc_claimAutoreleasedReturnValue([a1 appController]);
      [v28 presentPodcast:v15 episodeUuid:v8 episodeNotAvailable:v23 podcastTab:0 startPlayback:v27 animated:0];
    }
  }
}

+ (void)showSearchControllerWithSearchText:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTURLResolver searchUrlForSearchText:](&OBJC_CLASS___MTURLResolver, "searchUrlForSearchText:", v6));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 appController]);
    [v5 openStoreURL:v4];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a1 appController]);
    [v4 selectSearchTabAndFocusSearchField];
  }
}

+ (id)searchUrlForSearchText:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAddingPercentEncodingWithAllowedCharacters:v4]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"&term=%@", v5));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( [@"itms-podcasts://?action=search&activate=true" stringByAppendingString:v6]);
  }

  else
  {
    v7 = @"itms-podcasts://?action=search&activate=true";
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v7));

  return v8;
}

+ (id)podcastUrlForStoreId:(int64_t)a3
{
  else {
    id v4 = 0LL;
  }
  return v4;
}

+ (id)episodeUrlForPodcastStoreId:(int64_t)a3 episodeStoreId:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue([a1 podcastUrlForStoreId:a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pf_URLByAppendingQueryParameterKey:value:", @"i", v6));

  return v8;
}

+ (BOOL)_handleNowPlayingURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
  id v6 = [v5 caseInsensitiveCompare:@"nowplaying"];
  BOOL v7 = v6 == 0LL;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);

    if (!v9)
    {
      BOOL v7 = 0;
      goto LABEL_3;
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 appController]);
    [v10 presentNowPlayingAnimated:0];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"start"]);
    unsigned int v13 = [v12 BOOLValue];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    uint64_t v5 = v14;
    if (v13)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 currentItem]);
      if (v15)
      {
        id v16 = (void *)v15;
        unsigned __int8 v17 = [v5 isPlayingLocally];

        if ((v17 & 1) == 0) {
          [v5 playWithReason:11];
        }
      }
    }
  }

LABEL_3:
  return v7;
}

+ (BOOL)_handleBrowseURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);
  id v6 = [v5 caseInsensitiveCompare:@"browse"];
  BOOL v7 = v6 == 0LL;
  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);

    if (!v8)
    {
      BOOL v7 = 0;
      goto LABEL_5;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 appController]);
    [v5 selectFeaturedTab];
  }

LABEL_5:
  return v7;
}

+ (BOOL)_isLegacyCoreSpotlightURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
  unsigned int v5 = [v4 isEqualToString:@"podcasts"];

  if (v5
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 host]),
        unsigned int v7 = [v6 hasSuffix:@"play"],
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
    unsigned __int8 v9 = [v8 containsString:@"pid="];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

+ (BOOL)_handleLegacyCoreSpotlightURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
  unsigned int v5 = [v4 hasSuffix:@"play"];

  if (v5)
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v3 query]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v22 componentsSeparatedByString:@"&"]);
    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = sub_100086C10;
    v28 = sub_100086C20;
    id v29 = 0LL;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100086C28;
    v23[3] = &unk_100242B30;
    v23[4] = &v24;
    [v6 enumerateObjectsUsingBlock:v23];
    if (v25[5])
    {
      unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v7, "setNumberStyle:", 1LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
      unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainOrPrivateContext]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter numberFromString:](v7, "numberFromString:", v25[5]));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPersistentId:](&OBJC_CLASS___MTEpisode, "predicateForPersistentId:", v10));
      uint64_t v12 = kEpisodeUuid;
      v30[0] = kEpisodeUuid;
      v30[1] = kEpisodePodcastUuid;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
      id v14 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectDictionariesInEntity:kMTEpisodeEntityName predicate:v11 sortDescriptors:0 propertiesToFetch:v13 includeObjectId:0]);

      id v15 = [v14 count];
      BOOL v16 = v15 != 0LL;
      if (v15)
      {
        unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v14 lastObject]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v12]);
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playEpisodeUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playEpisodeUuid:",  v18));
        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
        [v20 playManifest:v19 reason:3];
      }
    }

    else
    {
      BOOL v16 = 0;
    }

    _Block_object_dispose(&v24, 8);
  }

  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end