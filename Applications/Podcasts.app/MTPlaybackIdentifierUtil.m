@interface MTPlaybackIdentifierUtil
+ (id)__queryStringToQueryDictionary:(id)a3;
+ (id)__stringByRemovingPercentEscapes:(id)a3;
+ (id)__stringWithPercentEscape:(id)a3;
- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3;
- (BOOL)isSubscribeCommandURLString:(id)a3;
- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForManifest:(id)a3 queueStatus:(unint64_t *)a4;
- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForPlayerItems:(id)a3;
- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4;
- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5;
- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11;
- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5;
- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3;
- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4;
- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3;
- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3;
- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4;
- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3;
- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3;
- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4;
- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4;
- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3;
- (id)requestIdentifierForPlayerItem:(id)a3;
- (id)requestIdentifiersForManifest:(id)a3 queueStatus:(unint64_t *)a4;
- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9;
- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6;
- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7;
- (int64_t)_episodeContextFromString:(id)a3;
- (int64_t)_episodeContextSortFromString:(id)a3;
- (int64_t)_episodeOrderFromString:(id)a3;
- (unint64_t)_playQueueTypeForRequestURL:(id)a3;
- (unint64_t)_playReasonFromString:(id)a3;
- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5;
@end

@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a4));
  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 query]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__queryStringToQueryDictionary:", v8));

  uint64_t v10 = NSPersistentStringForMTPlayReason(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  [v9 setObject:v11 forKey:@"playReason"];

  v12 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v6 scheme]);
  -[NSURLComponents setScheme:](v12, "setScheme:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
  -[NSURLComponents setHost:](v12, "setHost:", v14);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000816D0;
  v19[3] = &unk_100242A50;
  id v20 = v9;
  id v15 = v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mt_compactMap:", v19));
  -[NSURLComponents setQueryItems:](v12, "setQueryItems:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v12, "string"));
  return v17;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a4));
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 query]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__queryStringToQueryDictionary:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringValue]);
    [v10 setObject:v12 forKey:@"enqueuerDSID"];
  }

  v13 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);
  -[NSURLComponents setScheme:](v13, "setScheme:", v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 host]);
  -[NSURLComponents setHost:](v13, "setHost:", v15);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000818E4;
  v20[3] = &unk_100242A50;
  id v21 = v10;
  id v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mt_compactMap:", v20));
  -[NSURLComponents setQueryItems:](v13, "setQueryItems:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v13, "string"));
  return v18;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
  if ([v4 length])
  {
    if (qword_1002B6A20 != -1) {
      dispatch_once(&qword_1002B6A20, &stru_100242A70);
    }
    unsigned __int8 v5 = [(id)qword_1002B6A18 containsObject:v4];
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
  unsigned __int8 v5 = [v4 isEqualToString:@"subscribe"];

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 host]);
  unsigned __int8 v5 = [v4 isEqualToString:@"playItem"];

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  }
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:]( self,  "_playbackRequestIdentifierWithHost:queryKey:value:",  @"playPodcasts",  @"playbackOrder",  v4));

  return v5;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:]( self,  "_playbackRequestIdentifierWithHost:queryKey:value:",  @"playPodcast",  @"storeTrackId",  a3);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:]( self,  "localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:",  a3,  0LL,  a4);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] || objc_msgSend(v9, "length")) {
    v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:]( self,  "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGu id:episodeStoreId:sampPlaybackOrder:",  v8,  0LL,  0LL,  v9,  0LL,  0LL,  v10));
  }
  else {
    v11 = 0LL;
  }

  return v11;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:]( self,  "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeS toreId:sampPlaybackOrder:",  0LL,  a3,  a4,  0LL,  a5,  a6,  a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:]( self,  "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeS toreId:sampPlaybackOrder:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:]( self,  "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeS toreId:sampPlaybackOrder:",  a3,  a4,  a5,  0LL,  0LL,  0LL,  a6);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:]( self,  "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episode StoreId:context:contextSortType:sampPlaybackOrder:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL,  0LL,  a9);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:]( self,  "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episode StoreId:context:contextSortType:sampPlaybackOrder:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a11;
  if (![v20 length])
  {
    id v21 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;

    id v20 = v21;
  }

  id v22 = [v18 length];
  id v23 = [v16 length];
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v24 setObject:v20 forKey:@"playbackOrder"];
  if (!v23)
  {
    if (!v22) {
      goto LABEL_11;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 mainOrPrivateContext]);

    uint64_t v44 = 0LL;
    v45 = &v44;
    uint64_t v46 = 0x3032000000LL;
    v47 = sub_10008210C;
    v48 = sub_10008211C;
    id v49 = 0LL;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100082124;
    v40[3] = &unk_100240558;
    id v27 = v26;
    id v41 = v27;
    id v42 = v18;
    v43 = &v44;
    [v27 performBlockAndWait:v40];
    if ([(id)v45[5] length]) {
      [v24 setObject:v45[5] forKey:@"uuid"];
    }

    _Block_object_dispose(&v44, 8);
    goto LABEL_10;
  }

  [v24 setObject:v16 forKey:@"uuid"];
  if (v22) {
LABEL_10:
  }
    [v24 setObject:v18 forKey:@"episodeUuid"];
LABEL_11:
  if ([v17 length])
  {
    id v28 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [v24 setObject:v29 forKey:@"podcastFeedUrl"];
  }

  if ([v19 length]) {
    [v24 setObject:v19 forKey:@"episodeGuid"];
  }
  uint64_t v30 = kMTSerpentAdamIdOffset;
  if (a5 && kMTSerpentAdamIdOffset != a5)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a5));
    [v24 setObject:v31 forKey:@"storeCollectionId"];
  }

  if (a8 && v30 != a8)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a8));
    [v24 setObject:v32 forKey:@"storeTrackId"];
  }

  uint64_t v33 = NSPersistentStringForMTEpisodeContext(a9);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  [v24 setObject:v34 forKey:@"context"];

  uint64_t v35 = NSPersistentStringForMTEpisodeContextSortType(a10);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  [v24 setObject:v36 forKey:@"contextSortType"];

  v37 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:]( self,  "_playbackRequestIdentifierWithHost:queryComponents:",  @"playPodcast",  v24));
  return v37;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6 = a4;
  if (!v6) {
    id v6 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  }
  v11[0] = @"storeCollectionId";
  v11[1] = @"playbackOrder";
  v12[0] = a3;
  v12[1] = v6;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  2LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:]( self,  "_playbackRequestIdentifierWithHost:queryComponents:",  @"playPodcast",  v8));

  return v9;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:]( self,  "_playbackRequestIdentifierWithHost:queryKey:value:",  @"subscribe",  @"storeCollectionId",  a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:]( self,  "_playbackRequestIdentifierWithHost:queryKey:value:",  @"subscribe",  @"podcastFeedUrl",  v6));
  return v7;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForStationUuid:episodeUuid:]( self,  "localPlaybackQueueIdentifierForStationUuid:episodeUuid:",  a3,  0LL);
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:]( self,  "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:",  a3,  a4,  0LL,  0LL,  0LL);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:]( self,  "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:",  a3,  0LL,  a4,  a5,  a6);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a3;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
  [v16 setObject:v15 forKey:@"uuid"];

  if ([v12 length]) {
    [v16 setObject:v12 forKey:@"episodeUuid"];
  }
  if ([v13 length]) {
    [v16 setObject:v13 forKey:@"episodeGuid"];
  }
  if ([v14 length])
  {
    id v17 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v14);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    [v16 setObject:v18 forKey:@"podcastFeedUrl"];
  }

  if ((+[MTStoreIdentifier isEmpty:](&OBJC_CLASS___MTStoreIdentifier, "isEmpty:", a6) & 1) == 0)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", a6));
    [v16 setObject:v19 forKey:@"storeTrackId"];
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:]( self,  "_playbackRequestIdentifierWithHost:queryComponents:",  @"playStation",  v16));

  return v20;
}

- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pf_queryAsDictionary"));
  id v5 = objc_alloc(&OBJC_CLASS___MTEpisodeLookupRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"storeTrackId"]);
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "longLongValue"));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"episodeUuid"]);
  [v5 setUuid:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"episodeGuid"]);
  [v5 setEpisodeGuid:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"episodeTitle"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByRemovingPercentEscapes]);
  [v5 setEpisodeTitle:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"podcastTitle"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByRemovingPercentEscapes]);
  [v5 setPodcastTitle:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"podcastFeedUrl"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stringByRemovingPercentEscapes]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByRemovingPercentEscapes]);
  [v5 setPodcastFeedUrl:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"streamUrl"]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByRemovingPercentEscapes]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByRemovingPercentEscapes]);
  [v5 setStreamUrl:v18];

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLookupUtil sharedInstance](&OBJC_CLASS___MTEpisodeLookupUtil, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 findEpisodeWithRequest:v5]);

  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 uuid]);
  return v21;
}

- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"podcastFeedUrl"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByRemovingPercentEscapes]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByRemovingPercentEscapes]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"storeCollectionId"]);
  id v10 = [v9 longLongValue];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mainOrPrivateContext]);

  id v14 = [[MTStoreIdentifier alloc] initWithFeedUrl:v8 storeIdentifier:v11];
  id v15 = objc_alloc(&OBJC_CLASS___NSFetchRequest);
  id v16 = -[NSFetchRequest initWithEntityName:](v15, "initWithEntityName:", kMTPodcastEntityName);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForIdentifer:](&OBJC_CLASS___MTPodcast, "predicateForIdentifer:", v14));
  -[NSFetchRequest setPredicate:](v16, "setPredicate:", v17);

  -[NSFetchRequest setFetchLimit:](v16, "setFetchLimit:", 1LL);
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10008210C;
  id v41 = sub_10008211C;
  id v42 = 0LL;
  uint64_t v31 = 0LL;
  v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_10008210C;
  uint64_t v35 = sub_10008211C;
  id v36 = 0LL;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100082A1C;
  v26[3] = &unk_1002406C0;
  id v18 = v13;
  id v27 = v18;
  id v19 = v16;
  id v28 = v19;
  v29 = &v37;
  uint64_t v30 = &v31;
  id v20 = [v18 performBlockAndWait:v26];
  if (v38[5])
  {
    uint64_t v21 = _MTLogCategoryDatabase(v20);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v38[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error fetching podcast for playback identifier: %@",  buf,  0xCu);
    }

    id v24 = 0LL;
  }

  else
  {
    id v24 = (id)v32[5];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v24;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](&OBJC_CLASS___MTAccountController, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeDsid]);
  id v7 = -[MTPlaybackIdentifierUtil playbackQueueWithDsid:forIdentifiers:]( self,  "playbackQueueWithDsid:forIdentifiers:",  v6,  v4);

  return v7;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 5LL);
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers(v6, v5);

  if (a3)
  {
    id v9 = a3;
    keys = @"enqueuerDSID";
    CFDictionaryRef v7 = CFDictionaryCreate(0LL, (const void **)&keys, (const void **)&v9, 1LL, 0LL, &kCFTypeDictionaryValueCallBacks);
    MRSystemAppPlaybackQueueSetUserInfo(v6, v7);
    CFRelease(v7);
  }

  return v6;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil requestIdentifiersForManifest:queueStatus:]( self,  "requestIdentifiersForManifest:queueStatus:",  a3,  a4));
  id v6 = -[MTPlaybackIdentifierUtil playbackQueueWithAccountInfoForIdentifiers:]( self,  "playbackQueueWithAccountInfoForIdentifiers:",  v5);

  return v6;
}

- (id)requestIdentifiersForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTStoreManifest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = v6;
    if (![v8 loadStatus])
    {
      id v16 = &OBJC_CLASS___DebugUtil_ptr;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 podcastAdamId]);
      unsigned int v18 = +[MTStoreIdentifier isNotEmptyNumber:]( &OBJC_CLASS___MTStoreIdentifier,  "isNotEmptyNumber:",  v17);

      if (v18)
      {
        if ([v8 playbackOrder] == (id)1)
        {
          id v19 = (id *)&SAMPEpisodePlaybackOrderNEWEST_FIRSTValue;
        }

        else
        {
          id v34 = [v8 playbackOrder];
          id v19 = (id *)&SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
          if (v34 == (id)2) {
            id v19 = (id *)&SAMPEpisodePlaybackOrderOLDEST_FIRSTValue;
          }
        }

        id v35 = *v19;
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v8 podcastAdamId]);
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v36 stringValue]);
        v38 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:]( self,  "playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:",  v37,  v35));
        v48 = v38;
        id v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v48,  1LL));
      }

      else
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v8 episodeAdamIds]);
        id v21 = [v20 count];

        if (v21)
        {
          id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          v40 = v8;
          id obj = (id)objc_claimAutoreleasedReturnValue([v8 episodeAdamIds]);
          id v22 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v44;
            do
            {
              for (i = 0LL; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v44 != v24) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
                if ([v16[108] isNotEmptyNumber:v26])
                {
                  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"podcasts://%@",  @"playItem"));
                  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v27));
                  v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
                  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v26));
                  -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, @"storeTrackId");

                  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pf_URLByAppendingQueryParameters:", v29));
                  v32 = v16;
                  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 absoluteString]);

                  -[NSMutableArray addObject:](v42, "addObject:", v33);
                  id v16 = v32;
                }
              }

              id v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
            }

            while (v23);
          }

          goto LABEL_40;
        }

        id v42 = (NSMutableArray *)&__NSArray0__struct;
      }

      goto LABEL_40;
    }
  }

  id v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v9 = (char *)[v6 currentIndex];
  if (v9 >= [v6 count])
  {
    unint64_t v11 = 0LL;
LABEL_15:
    if (a4) {
      goto LABEL_23;
    }
    goto LABEL_40;
  }

  uint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  while (1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:v9]);
LABEL_10:
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil requestIdentifierForPlayerItem:]( self,  "requestIdentifierForPlayerItem:",  v12));
    if ([v15 length]) {
      -[NSMutableArray addObject:](v42, "addObject:", v15);
    }

    if (++v9 >= [v6 count]) {
      goto LABEL_15;
    }
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 currentItem]);
  unsigned __int8 v14 = [v13 isEqual:v12];

  if ((v14 & 1) != 0)
  {
    unint64_t v11 = 1LL;
    goto LABEL_22;
  }

  if ((unint64_t)++v10 <= 1)
  {
    unint64_t v11 = 2LL;
    goto LABEL_10;
  }

  unint64_t v11 = 3LL;
LABEL_22:

  if (a4) {
LABEL_23:
  }
    *a4 = v11;
LABEL_40:

  return v42;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForPlayerItems:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil requestIdentifierForPlayerItem:]( self,  "requestIdentifierForPlayerItem:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  (void)v14));
        if ([v11 length]) {
          [v5 addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = -[MTPlaybackIdentifierUtil playbackQueueWithAccountInfoForIdentifiers:]( self,  "playbackQueueWithAccountInfoForIdentifiers:",  v5);
  return v12;
}

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  BOOL v53 = a4;
  id v6 = a3;
  id v48 = a5;
  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x2020000000LL;
  char v76 = 0;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v69 objects:v86 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v70;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  *(void *)(*((void *)&v69 + 1) + 8LL * (void)i)));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](&OBJC_CLASS___NSString, "UUID"));
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pf_URLByAppendingQueryParameterKey:value:", @"deDupe", v13));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);

        [v7 addObject:v15];
      }

      id v9 = [v8 countByEnumeratingWithState:&v69 objects:v86 count:16];
    }

    while (v9);
  }

  id v16 = v7;
  uint64_t v18 = _MTLogCategoryMediaRemote(v17);
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Fetch player items for playback queue identifiers: %@",  buf,  0xCu);
  }

  id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v50 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v16;
  id v20 = [obj countByEnumeratingWithState:&v65 objects:v85 count:16];
  if (v20)
  {
    uint64_t v52 = *(void *)v66;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v66 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)j);
        id v23 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil episodeUuidForSetPlaybackQueueRequestIdentifier:]( self,  "episodeUuidForSetPlaybackQueueRequestIdentifier:",  v22));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v22));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pf_queryAsDictionary"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"storeTrackId"]);
        id v27 = [v26 longLongValue];

        id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"contentItemId"]);
        if (v53)
        {
          if (+[MTStoreIdentifier isNotEmpty:](&OBJC_CLASS___MTStoreIdentifier, "isNotEmpty:", v27))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  v27));
            -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v22, v29);
          }
        }

        else
        {
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          v82 = sub_10008210C;
          v83 = sub_10008211C;
          id v84 = 0LL;
          if (+[MTPlayerController hasDefaultInstance](&OBJC_CLASS___MTPlayerController, "hasDefaultInstance")
            && [v28 length])
          {
            uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v30 compositeManifest]);
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472LL;
            v62[2] = sub_1000839F8;
            v62[3] = &unk_100240E28;
            id v63 = v28;
            v64 = buf;
            [v31 enumerateObjectsUsingBlock:v62];
          }

          if (!*(void *)(*(void *)&buf[8] + 40LL)
            && (+[PFClientUtil isRunningOnHomepod](&OBJC_CLASS___PFClientUtil, "isRunningOnHomepod") & 1) == 0)
          {
            uint64_t v32 = objc_claimAutoreleasedReturnValue( +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:]( &OBJC_CLASS___MTBaseEpisodeListManifest,  "mediaItemForEpisodeWithUUID:",  v23));
            uint64_t v33 = *(void **)(*(void *)&buf[8] + 40LL);
            *(void *)(*(void *)&buf[8] + 40LL) = v32;
          }

          if (*(void *)(*(void *)&buf[8] + 40LL))
          {
            if ([v28 length])
            {
              id v34 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v28);
              [*(id *)(*(void *)&buf[8] + 40) setInstanceIdentifier:v34];
            }

            -[NSMutableDictionary setObject:forKey:]( v49,  "setObject:forKey:",  *(void *)(*(void *)&buf[8] + 40LL),  v22);
          }

          else
          {
            if (+[MTStoreIdentifier isNotEmpty:](&OBJC_CLASS___MTStoreIdentifier, "isNotEmpty:", v27))
            {
              id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lld",  v27));
              -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v22, v35);
            }

            else
            {
              id v36 = (void *)objc_claimAutoreleasedReturnValue([obj firstObject]);
              unsigned int v37 = [v36 isEqualToString:v22];

              if (v37) {
                *((_BYTE *)v74 + 24) = 1;
              }
              uint64_t v39 = _MTLogCategoryMediaRemote(v38);
              id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v77 = 134218242;
                id v78 = v27;
                __int16 v79 = 2112;
                uint64_t v80 = v22;
                _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Requested to play an item with no database match and no storeId: %lld with identifier: %@.",  v77,  0x16u);
              }
            }
          }

          _Block_object_dispose(buf, 8);
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v65 objects:v85 count:16];
    }

    while (v20);
  }

  v40 = objc_alloc_init(&OBJC_CLASS___MTPlayerItem);
  if (-[NSMutableDictionary count](v50, "count"))
  {
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v50, "allKeys"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_100083A8C;
    v55[3] = &unk_100242A98;
    v56 = v50;
    v57 = v49;
    id v60 = v48;
    id v58 = obj;
    v59 = v40;
    v61 = &v73;
    +[MTNetworkMediaManifest fetchPlayerItemsFor:completion:]( &OBJC_CLASS___MTNetworkMediaManifest,  "fetchPlayerItemsFor:completion:",  v41,  v55);

    id v42 = v56;
LABEL_44:

    goto LABEL_45;
  }

  if (v48)
  {
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectsForKeys:notFoundMarker:]( v49,  "objectsForKeys:notFoundMarker:",  obj,  v40));
    id v42 = (NSMutableDictionary *)[v43 mutableCopy];

    uint64_t v44 = _MTLogCategoryMediaRemote(-[NSMutableDictionary removeObject:](v42, "removeObject:", v40));
    __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v46 = -[NSMutableDictionary count](v42, "count");
      id v47 = [obj count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Fetched %lu player items for %lu identifiers",  buf,  0x16u);
    }

    (*((void (**)(id, NSMutableDictionary *, void, void))v48 + 2))( v48,  v42,  *((unsigned __int8 *)v74 + 24),  0LL);
    goto LABEL_44;
  }

- (id)requestIdentifierForPlayerItem:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"podcasts://%@",  @"playItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
    id v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contentItem]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);

    uint64_t v7 = (uint64_t)[v3 episodeStoreId];
    uint64_t v8 = (uint64_t)[v3 podcastStoreId];
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 episodeUuid]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 episodeGuid]);
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v3 podcastFeedUrl]);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pf_stringWithPercentEscape"));

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v3 author]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v3 streamUrl]);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
    id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pf_stringWithPercentEscape"));

    [v3 playhead];
    double v16 = v15;

    if ([v6 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, @"contentItemId");
    }
    if (v7 >= 1)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", v7));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, @"storeTrackId");
    }

    if (v8 >= 1)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lld", v8));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v18, @"storeCollectionId");
    }

    if ([v9 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, @"episodeUuid");
    }
    if ([v10 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, @"episodeGuid");
    }
    if ([v24 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v24, @"podcastFeedUrl");
    }
    if ([v12 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, @"episodeTitle");
    }
    if ([v23 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v23, @"podcastTitle");
    }
    if ([v27 length]) {
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v27, @"streamUrl");
    }
    if (v16 > 0.0)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%f",  *(void *)&v16));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, @"playhead");
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pf_URLByAppendingQueryParameters:", v4));

    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 absoluteString]);
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3 = qword_1002B6A28;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002B6A28, &stru_100242AB8);
  }
  id v5 = (void *)qword_1002B6A30;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 host]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  uint64_t v8 = (void *)v7;
  id v9 = &off_1002549B0;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  uint64_t v10 = v9;

  id v11 = [v10 unsignedIntegerValue];
  return (unint64_t)v11;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  id v14 = a4;
  id v15 = a5;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:]( self,  "_playbackRequestIdentifierWithHost:queryComponents:",  v10,  v11));
  return v12;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
  -[NSURLComponents setScheme:](v7, "setScheme:", @"podcasts");
  id v20 = v5;
  -[NSURLComponents setHost:](v7, "setHost:", v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v6 count]));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v13);
        id v15 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
        double v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v14]);
        uint64_t v17 = -[NSURLQueryItem initWithName:value:](v15, "initWithName:value:", v14, v16);

        [v8 addObject:v17];
        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  -[NSURLComponents setQueryItems:](v7, "setQueryItems:", v8);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v7, "string"));

  return v18;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAMPEpisodePlaybackOrderNEWEST_FIRSTValue])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:SAMPEpisodePlaybackOrderOLDEST_FIRSTValue])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    unint64_t v4 = MTPlayReasonFromPersistentString(v3);
  }
  else {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int64_t v4 = MTEpisodeContextFromPersistentString(v3);
  }
  else {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    int64_t v4 = MTEpisodeContextSortTypeFromPersistentString(v3);
  }
  else {
    int64_t v4 = 0LL;
  }

  return v4;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes( 0LL,  (CFStringRef)a3,  0LL,  @"\uFFFC!$&'()+,/:;=?@",
                                               0x8000100u));
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes( kCFAllocatorDefault,  (CFStringRef)a3,  &stru_100248948);
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"&"]);
  int64_t v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) componentsSeparatedByString:@"="]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:0]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        if ((unint64_t)[v9 count] >= 2)
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectAtIndex:1]);

          id v11 = (void *)v12;
        }

        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v11, v10);

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v6);
  }

  return v4;
}

@end