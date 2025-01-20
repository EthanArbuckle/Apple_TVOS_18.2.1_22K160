@interface MTURLCommandRequest
- (MTURLCommandRequest)initWithURLString:(id)a3;
- (NSString)episodeAdamId;
- (NSString)episodeUuid;
- (NSString)podcastAdamId;
- (NSString)podcastFeedUrl;
- (NSString)podcastUuid;
- (NSString)requesterDsid;
- (NSString)stationUuid;
- (NSString)urlString;
- (id)copyWithPlayReason:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)playContext;
- (int64_t)playContextSortType;
- (int64_t)playbackOrder;
- (unint64_t)commandType;
- (unint64_t)playQueueType;
- (unint64_t)playReason;
- (void)_loadQueryParameterValuesFromString:(id)a3;
- (void)_lookupEpisodeUuidIfNecessaryFromURLString:(id)a3;
- (void)_lookupPodcastUuidIfNecessaryFromURLString:(id)a3;
@end

@implementation MTURLCommandRequest

- (MTURLCommandRequest)initWithURLString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTURLCommandRequest;
  v6 = -[MTURLCommandRequest init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_urlString, a3);
    -[MTURLCommandRequest _loadQueryParameterValuesFromString:](v7, "_loadQueryParameterValuesFromString:", v5);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class(self);
  id v5 = (void *)objc_opt_new(v4);
  id v6 = -[NSString copy](self->_urlString, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_commandType;
  v5[3] = self->_playQueueType;
  v5[4] = self->_playReason;
  v5[5] = self->_playbackOrder;
  v5[6] = self->_playContext;
  v5[7] = self->_playContextSortType;
  id v8 = -[NSString copy](self->_podcastUuid, "copy");
  objc_super v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = -[NSString copy](self->_podcastFeedUrl, "copy");
  v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = -[NSString copy](self->_episodeUuid, "copy");
  v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = -[NSString copy](self->_podcastAdamId, "copy");
  v15 = (void *)v5[11];
  v5[11] = v14;

  id v16 = -[NSString copy](self->_episodeAdamId, "copy");
  v17 = (void *)v5[12];
  v5[12] = v16;

  id v18 = -[NSString copy](self->_stationUuid, "copy");
  v19 = (void *)v5[13];
  v5[13] = v18;

  id v20 = -[NSString copy](self->_requesterDsid, "copy");
  v21 = (void *)v5[14];
  v5[14] = v20;

  return v5;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  id result = -[MTURLCommandRequest copy](self, "copy");
  *((void *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  id v42 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v42));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 query]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil __queryStringToQueryDictionary:]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "__queryStringToQueryDictionary:",  v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  unsigned __int8 v8 = [v7 isSubscribeCommandURLString:v42];

  if ((v8 & 1) != 0)
  {
    unint64_t v9 = 1LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
    unsigned __int8 v11 = [v10 isLocalSetPlaybackQueueURLString:v42];

    if ((v11 & 1) != 0)
    {
      unint64_t v9 = 2LL;
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil sharedInstance]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "sharedInstance"));
      unsigned int v13 = [v12 isUniversalPlaybackIdentifierURLString:v42];

      if (!v13) {
        goto LABEL_8;
      }
      unint64_t v9 = 3LL;
    }
  }

  self->_commandType = v9;
LABEL_8:
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  self->_unint64_t playQueueType = (unint64_t)[v14 _playQueueTypeForRequestURL:v4];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"playbackOrder"]);
  self->_playbackOrder = (int64_t)[v15 _episodeOrderFromString:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"playReason"]);
  self->_playReason = (unint64_t)[v17 _playReasonFromString:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"context"]);
  self->_playContext = (int64_t)[v19 _episodeContextFromString:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](&OBJC_CLASS___MTPlaybackIdentifierUtil, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"contextSortType"]);
  self->_playContextSortType = (int64_t)[v21 _episodeContextSortFromString:v22];

  unint64_t playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    v28 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"uuid"]);
    stationUuid = self->_stationUuid;
    self->_stationUuid = v28;

    v30 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"episodeUuid"]);
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v30;

    goto LABEL_12;
  }

  if (playQueueType == 2)
  {
    v24 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"uuid"]);
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v24;

    v26 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"episodeUuid"]);
    v27 = self->_episodeUuid;
    self->_episodeUuid = v26;

    -[MTURLCommandRequest _lookupPodcastUuidIfNecessaryFromURLString:]( self,  "_lookupPodcastUuidIfNecessaryFromURLString:",  v42);
LABEL_12:
    -[MTURLCommandRequest _lookupEpisodeUuidIfNecessaryFromURLString:]( self,  "_lookupEpisodeUuidIfNecessaryFromURLString:",  v42);
  }

  v32 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"storeCollectionId"]);
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v32;

  v34 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"storeTrackId"]);
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"podcastFeedUrl"]);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "__stringByRemovingPercentEscapes:",  v36));

  v38 = (NSString *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "__stringByRemovingPercentEscapes:",  v37));
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v38;

  v40 = (NSString *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"enqueuerDSID"]);
  requesterDsid = self->_requesterDsid;
  self->_requesterDsid = v40;
}

- (void)_lookupPodcastUuidIfNecessaryFromURLString:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  unsigned __int8 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  unsigned int v13 = sub_100084F0C;
  id v14 = &unk_100242AE0;
  id v16 = &v18;
  id v7 = v6;
  id v15 = v7;
  objc_copyWeak(&v17, &location);
  [v7 performBlockAndWait:&v11];
  if (!*((_BYTE *)v19 + 24))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil sharedInstance]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "sharedInstance",  v11,  v12,  v13,  v14,  v15,  v16));
    unint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 podcastUuidForSetPlaybackQueueRequestIdentifier:v4]);
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v9;
  }

  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);
}

- (void)_lookupEpisodeUuidIfNecessaryFromURLString:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainOrPrivateContext]);

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  unsigned __int8 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  unsigned int v13 = sub_100085100;
  id v14 = &unk_100242AE0;
  id v16 = &v18;
  id v7 = v6;
  id v15 = v7;
  objc_copyWeak(&v17, &location);
  [v7 performBlockAndWait:&v11];
  if (!*((_BYTE *)v19 + 24))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackIdentifierUtil sharedInstance]( &OBJC_CLASS___MTPlaybackIdentifierUtil,  "sharedInstance",  v11,  v12,  v13,  v14,  v15,  v16));
    unint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue([v8 episodeUuidForSetPlaybackQueueRequestIdentifier:v4]);
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v9;
  }

  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (unint64_t)commandType
{
  return self->_commandType;
}

- (unint64_t)playQueueType
{
  return self->_playQueueType;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (int64_t)playContext
{
  return self->_playContext;
}

- (int64_t)playContextSortType
{
  return self->_playContextSortType;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (NSString)podcastAdamId
{
  return self->_podcastAdamId;
}

- (NSString)episodeAdamId
{
  return self->_episodeAdamId;
}

- (NSString)stationUuid
{
  return self->_stationUuid;
}

- (NSString)requesterDsid
{
  return self->_requesterDsid;
}

- (void).cxx_destruct
{
}

@end