@interface MTEpisodeMetricDataSource
- (BOOL)isEqual:(id)a3;
- (MTEpisodeIdentifier)episodeIdentifier;
- (MTEpisodeMetricDataSource)initWithEpisodeIdentifier:(id)a3;
- (MTEpisodeMetricDataSource)initWithPlayerItem:(id)a3;
- (NSString)podcastState;
- (double)duration;
- (id)_contentGUID;
- (id)_contentId;
- (id)_duration;
- (id)_itemType;
- (id)_mediaType;
- (id)_podcastFeedURL;
- (id)_podcastId;
- (id)_podcastStateForPlayerItem:(id)a3;
- (id)_providerId;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (unint64_t)_itemTypeForEpisode:(id)a3;
- (unint64_t)_itemTypeForPlayerItem:(id)a3;
- (unint64_t)_mediaTypeForEpisode:(id)a3;
- (unint64_t)_mediaTypeForPlayerItem:(id)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)mediaType;
- (void)setDuration:(double)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setPodcastState:(id)a3;
@end

@implementation MTEpisodeMetricDataSource

- (MTEpisodeMetricDataSource)initWithEpisodeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTEpisodeMetricDataSource;
  v6 = -[MTEpisodeMetricDataSource init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_episodeIdentifier, a3);
  }

  return v7;
}

- (MTEpisodeMetricDataSource)initWithPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeIdentifier]);
  v6 = -[MTEpisodeMetricDataSource initWithEpisodeIdentifier:](self, "initWithEpisodeIdentifier:", v5);

  if (v6)
  {
    [v4 duration];
    v6->_duration = v7;
    v6->_mediaType = -[MTEpisodeMetricDataSource _mediaTypeForPlayerItem:](v6, "_mediaTypeForPlayerItem:", v4);
    v6->_itemType = -[MTEpisodeMetricDataSource _itemTypeForPlayerItem:](v6, "_itemTypeForPlayerItem:", v4);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastStateForPlayerItem:](v6, "_podcastStateForPlayerItem:", v4));
    podcastState = v6->_podcastState;
    v6->_podcastState = (NSString *)v8;
  }

  return v6;
}

- (unint64_t)_mediaTypeForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001FF8C;
  v8[3] = &unk_1002409A8;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_itemTypeForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 managedObjectContext]);
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000200C4;
  v8[3] = &unk_1002409A8;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_mediaTypeForPlayerItem:(id)a3
{
  else {
    return a3 != 0LL;
  }
}

- (unint64_t)_itemTypeForPlayerItem:(id)a3
{
  else {
    return a3 != 0LL;
  }
}

- (id)_podcastStateForPlayerItem:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](&OBJC_CLASS____TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 podcastUuid]);

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentPodcastStateDescriptionFrom:v5]);
  return v6;
}

- (id)_contentId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 episodeSerpentID]);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_100248948;
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_contentGUID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 episodeGUID]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_100248948;
  }
  id v5 = v4;

  return v5;
}

- (id)_podcastId
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 podcastAdamID]);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 stringValue]);

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_100248948;
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_podcastFeedURL
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  id v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 currentPodcastFeedURL]);

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_100248948;
  }
  id v5 = v4;

  return v5;
}

- (id)_providerId
{
  return &stru_100248948;
}

- (id)_mediaType
{
  unint64_t v2 = -[MTEpisodeMetricDataSource mediaType](self, "mediaType");
  if (v2 - 1 > 2) {
    return @"unknown";
  }
  else {
    return *(&off_1002409C8 + v2 - 1);
  }
}

- (id)_itemType
{
  unint64_t v2 = -[MTEpisodeMetricDataSource itemType](self, "itemType");
  id v3 = @"unknown";
  if (v2 == 2) {
    id v3 = @"download";
  }
  if (v2 == 1) {
    return @"stream";
  }
  else {
    return (id)v3;
  }
}

- (id)_duration
{
  return +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
}

- (id)metricsContentIdentifier
{
  return -[MTEpisodeMetricDataSource _contentId](self, "_contentId");
}

- (id)metricsAdditionalData
{
  v13[0] = @"contentGUID";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _contentGUID](self, "_contentGUID"));
  v14[0] = v3;
  v13[1] = @"contentLength";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _duration](self, "_duration"));
  v14[1] = v4;
  v13[2] = @"podcastId";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastId](self, "_podcastId"));
  v14[2] = v5;
  v13[3] = @"podcastFeedURL";
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastFeedURL](self, "_podcastFeedURL"));
  v14[3] = v6;
  v13[4] = @"providerId";
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _providerId](self, "_providerId"));
  v14[4] = v7;
  v13[5] = @"mediaType";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _mediaType](self, "_mediaType"));
  v14[5] = v8;
  v13[6] = @"itemType";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _itemType](self, "_itemType"));
  v14[6] = v9;
  v13[7] = @"podcastState";
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastState](self, "_podcastState"));
  v14[7] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  8LL));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___MTEpisodeMetricDataSource);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 metricsContentIdentifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsContentIdentifier](self, "metricsContentIdentifier"));
    unsigned int v9 = [v7 isEqual:v8];

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v6 metricsAdditionalData]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsAdditionalData](self, "metricsAdditionalData"));
      unsigned __int8 v12 = [v10 isEqualToDictionary:v11];
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsContentIdentifier](self, "metricsContentIdentifier"));
  unint64_t v4 = (unint64_t)[v3 hash];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsAdditionalData](self, "metricsAdditionalData"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return self->_episodeIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSString)podcastState
{
  return self->_podcastState;
}

- (void)setPodcastState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end