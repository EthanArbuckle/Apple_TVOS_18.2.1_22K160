@interface MTTVTopShelfContentProvider
+ (id)containerIdentifierFromItemIdentifier:(id)a3;
+ (id)contentItemForEpisode:(id)a3;
+ (id)contentItemForEpisodeMetadata:(__CFDictionary *)a3;
+ (id)contentItemWithIdentifier:(id)a3 container:(id)a4;
+ (void)isNowPlayingAppPodcasts:(id)a3;
+ (void)nowPlayingContentItem:(id)a3;
- (id)_contentItemsForListenNowEpisodesExcludePodcastUuids:(id)a3 isFirstResumable:(BOOL *)a4;
- (void)_loadRemainingItemsWithNowPlaying:(id)a3 completion:(id)a4;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
@end

@implementation MTTVTopShelfContentProvider

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_opt_class(self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100001E40;
  v7[3] = &unk_100004220;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 nowPlayingContentItem:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_loadRemainingItemsWithNowPlaying:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  char v32 = 0;
  if (+[MTDB canExtensionOpenDatabase](&OBJC_CLASS___MTDB, "canExtensionOpenDatabase"))
  {
    v10 = (void *)objc_opt_class(self);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 containerIdentifierFromItemIdentifier:v11]);

    if (v12) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
    }
    else {
      v13 = 0LL;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVTopShelfContentProvider _contentItemsForListenNowEpisodesExcludePodcastUuids:isFirstResumable:]( self,  "_contentItemsForListenNowEpisodesExcludePodcastUuids:isFirstResumable:",  v13,  &v32));
    v15 = (NSMutableArray *)[v14 mutableCopy];

    id v9 = v15;
  }

  if (-[NSMutableArray count](v9, "count"))
  {
    if (!v6)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v9, "firstObject"));
      v17 = v16;
      if (v32)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v16 playAction]);
        if (v18)
        {
          [v17 setDisplayAction:v18];
        }

        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 displayAction]);
          [v17 setDisplayAction:v19];
        }

        id v20 = objc_alloc(&OBJC_CLASS___TVTopShelfItemCollection);
        v33 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
        id v22 = [v20 initWithItems:v21];

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle podcastsFoundationBundle](&OBJC_CLASS___NSBundle, "podcastsFoundationBundle"));
        v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"TOP_SHELF_RESUME" value:&stru_100004358 table:0]);
        [v22 setTitle:v24];

        -[NSMutableArray addObject:](v8, "addObject:", v22);
        -[NSMutableArray removeObjectAtIndex:](v9, "removeObjectAtIndex:", 0LL);
      }
    }

    id v25 = [[TVTopShelfItemCollection alloc] initWithItems:v9];
    int v26 = os_feature_enabled_home_tab();
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle podcastsFoundationBundle](&OBJC_CLASS___NSBundle, "podcastsFoundationBundle"));
    v28 = v27;
    if (v26) {
      v29 = @"TOP_SHELF_HOME";
    }
    else {
      v29 = @"TOP_SHELF_LISTEN_NOW";
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue([v27 localizedStringForKey:v29 value:&stru_100004358 table:0]);
    [v25 setTitle:v30];

    -[NSMutableArray addObject:](v8, "addObject:", v25);
  }

  id v31 = [[TVTopShelfSectionedContent alloc] initWithSections:v8];
  v7[2](v7, v31);
}

- (id)_contentItemsForListenNowEpisodesExcludePodcastUuids:(id)a3 isFirstResumable:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100002308;
  v23 = sub_100002318;
  id v24 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 privateQueueContext]);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100002320;
  v13[3] = &unk_100004270;
  id v9 = v8;
  id v14 = v9;
  v17 = &v19;
  id v10 = v6;
  id v15 = v10;
  v16 = self;
  v18 = a4;
  [v9 performBlockAndWait:v13];
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

+ (void)nowPlayingContentItem:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000025E4;
  v8[3] = &unk_1000042C0;
  id v9 = (id)objc_claimAutoreleasedReturnValue(global_queue);
  id v10 = v4;
  id v11 = a1;
  id v6 = v9;
  id v7 = v4;
  [a1 isNowPlayingAppPodcasts:v8];
}

+ (void)isNowPlayingAppPodcasts:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  uint64_t LocalOrigin = MRMediaRemoteGetLocalOrigin();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000027C4;
  v9[3] = &unk_100004310;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  MRMediaRemoteGetNowPlayingClientForOrigin(LocalOrigin, v8, v9);
}

+ (id)contentItemForEpisodeMetadata:(__CFDictionary *)a3
{
  uint64_t v4 = kMRMediaRemoteNowPlayingInfoExternalContentIdentifier;
  v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoCollectionIdentifier));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoTitle));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoDuration));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoElapsedTime));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v5,  "objectForKeyedSubscript:",  kMRMediaRemoteNowPlayingInfoArtworkIdentifier));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imageUrlForKey:v11]);

  if (!v13) {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a1 contentItemWithIdentifier:v6 container:v7]);
  [v14 setTitle:v8];
  [v10 doubleValue];
  double v16 = v15;
  [v9 doubleValue];
  [v14 setPlaybackProgress:v16 / v17];
  id v18 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"podcasts://nowPlaying?start=true"));
  id v20 = [v18 initWithURL:v19];
  [v14 setDisplayAction:v20];

  [v14 setPlayAction:0];
  [v14 setImageURL:v13 forTraits:3];
  [v14 setImageShape:0];

  return v14;
}

+ (id)contentItemForEpisode:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 podcastUuid]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a1 contentItemWithIdentifier:v6 container:v7]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 bestTitle]);
    [v8 setTitle:v9];

    [v5 playhead];
    double v11 = v10;
    [v5 duration];
    [v8 setPlaybackProgress:v11 / v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 podcast]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);

    double v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](&OBJC_CLASS___MTImageStore, "defaultStore"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 imageUrlForKey:v14]);
    double v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v5 podcast]);
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 imageURL]);
      id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v20));
    }

    [v8 setImageURL:v18 forTraits:3];
    [v8 setImageShape:0];
    id v21 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 playURL]);
    id v23 = [v21 initWithURL:v22];
    [v8 setPlayAction:v23];

    id v24 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 displayURL]);
    id v26 = [v24 initWithURL:v25];
    [v8 setDisplayAction:v26];
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

+ (id)contentItemWithIdentifier:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  if ([v5 length])
  {
    id v7 = -[__CFString length](v6, "length");
    id v8 = &stru_100004358;
    if (v7) {
      id v8 = v6;
    }
    v15[0] = v5;
    v15[1] = v8;
    id v9 = v8;
    float v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@" CONTAINER-ID:"]);

    id v12 = objc_alloc(&OBJC_CLASS___TVTopShelfSectionedItem);
    id v13 = [v12 initWithIdentifier:v11];
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

+ (id)containerIdentifierFromItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@" CONTAINER-ID:"]);
    else {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndex:1]);
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

@end