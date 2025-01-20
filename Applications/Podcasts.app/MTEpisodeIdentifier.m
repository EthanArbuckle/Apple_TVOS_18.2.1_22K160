@interface MTEpisodeIdentifier
+ (MTEpisodeIdentifier)identifierWithEpisode:(id)a3;
+ (MTEpisodeIdentifier)identifierWithPlayerItem:(id)a3;
- (BOOL)_hasFeedURL:(id)a3;
- (MTEpisodeIdentifier)initWithEpisode:(id)a3;
- (MTEpisodeIdentifier)initWithPlayerItem:(id)a3;
- (NSNumber)episodeAdamID;
- (NSNumber)episodeSerpentID;
- (NSNumber)podcastAdamID;
- (NSString)currentPodcastFeedURL;
- (NSString)episodeGUID;
- (NSString)episodeUUID;
- (NSString)originalPodcastFeedURL;
- (NSString)podcastUUID;
- (void)_updateWithPodcast:(id)a3;
- (void)setCurrentPodcastFeedURL:(id)a3;
- (void)setEpisodeAdamID:(id)a3;
- (void)setEpisodeGUID:(id)a3;
- (void)setEpisodeSerpentID:(id)a3;
- (void)setEpisodeUUID:(id)a3;
- (void)setOriginalPodcastFeedURL:(id)a3;
- (void)setPodcastAdamID:(id)a3;
- (void)setPodcastUUID:(id)a3;
@end

@implementation MTEpisodeIdentifier

+ (MTEpisodeIdentifier)identifierWithEpisode:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithEpisode:v4];

  return (MTEpisodeIdentifier *)v5;
}

+ (MTEpisodeIdentifier)identifierWithPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithPlayerItem:v4];

  return (MTEpisodeIdentifier *)v5;
}

- (MTEpisodeIdentifier)initWithEpisode:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTEpisodeIdentifier;
  id v5 = -[MTEpisodeIdentifier init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
    -[MTEpisodeIdentifier setEpisodeUUID:](v5, "setEpisodeUUID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 guid]);
    -[MTEpisodeIdentifier setEpisodeGUID:](v5, "setEpisodeGUID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier adamIdNumberFromStoreId:]( MTStoreIdentifier,  "adamIdNumberFromStoreId:",  [v4 storeTrackId]));
    -[MTEpisodeIdentifier setEpisodeAdamID:](v5, "setEpisodeAdamID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier validatedIdNumberFromStoreId:]( MTStoreIdentifier,  "validatedIdNumberFromStoreId:",  [v4 storeTrackId]));
    -[MTEpisodeIdentifier setEpisodeSerpentID:](v5, "setEpisodeSerpentID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 podcast]);
    if (v10)
    {
      -[MTEpisodeIdentifier _updateWithPodcast:](v5, "_updateWithPodcast:", v10);
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastUuid]);
      -[MTEpisodeIdentifier setPodcastUUID:](v5, "setPodcastUUID:", v11);
    }
  }

  return v5;
}

- (MTEpisodeIdentifier)initWithPlayerItem:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MTEpisodeIdentifier;
  id v5 = -[MTEpisodeIdentifier init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeUuid]);
    -[MTEpisodeIdentifier setEpisodeUUID:](v5, "setEpisodeUUID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 episodeGuid]);
    -[MTEpisodeIdentifier setEpisodeGUID:](v5, "setEpisodeGUID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier adamIdNumberFromStoreId:]( MTStoreIdentifier,  "adamIdNumberFromStoreId:",  [v4 episodeStoreId]));
    -[MTEpisodeIdentifier setEpisodeAdamID:](v5, "setEpisodeAdamID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier validatedIdNumberFromStoreId:]( MTStoreIdentifier,  "validatedIdNumberFromStoreId:",  [v4 episodeStoreId]));
    -[MTEpisodeIdentifier setEpisodeSerpentID:](v5, "setEpisodeSerpentID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 episode]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 podcast]);

    if (v11)
    {
      -[MTEpisodeIdentifier _updateWithPodcast:](v5, "_updateWithPodcast:", v11);
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastUuid]);
      -[MTEpisodeIdentifier setPodcastUUID:](v5, "setPodcastUUID:", v12);

      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier adamIdNumberFromStoreId:]( MTStoreIdentifier,  "adamIdNumberFromStoreId:",  [v4 podcastStoreId]));
      -[MTEpisodeIdentifier setPodcastAdamID:](v5, "setPodcastAdamID:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 podcastFeedUrl]);
      -[MTEpisodeIdentifier setCurrentPodcastFeedURL:](v5, "setCurrentPodcastFeedURL:", v14);

      -[MTEpisodeIdentifier setOriginalPodcastFeedURL:](v5, "setOriginalPodcastFeedURL:", 0LL);
    }
  }

  return v5;
}

- (void)_updateWithPodcast:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  -[MTEpisodeIdentifier setPodcastUUID:](self, "setPodcastUUID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MTStoreIdentifier adamIdNumberFromStoreId:]( MTStoreIdentifier,  "adamIdNumberFromStoreId:",  [v4 storeCollectionId]));
  -[MTEpisodeIdentifier setPodcastAdamID:](self, "setPodcastAdamID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentFeedURL]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 absoluteString]);
  -[MTEpisodeIdentifier setCurrentPodcastFeedURL:](self, "setCurrentPodcastFeedURL:", v8);

  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 feedURL]);
  -[MTEpisodeIdentifier setOriginalPodcastFeedURL:](self, "setOriginalPodcastFeedURL:", v9);
}

- (BOOL)_hasFeedURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeIdentifier currentPodcastFeedURL](self, "currentPodcastFeedURL"));
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) != 0)
  {
    unsigned __int8 v7 = 1;
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeIdentifier originalPodcastFeedURL](self, "originalPodcastFeedURL"));
    unsigned __int8 v7 = [v8 isEqualToString:v4];
  }

  return v7;
}

- (NSString)episodeUUID
{
  return self->_episodeUUID;
}

- (void)setEpisodeUUID:(id)a3
{
}

- (NSString)episodeGUID
{
  return self->_episodeGUID;
}

- (void)setEpisodeGUID:(id)a3
{
}

- (NSNumber)episodeAdamID
{
  return self->_episodeAdamID;
}

- (void)setEpisodeAdamID:(id)a3
{
}

- (NSNumber)episodeSerpentID
{
  return self->_episodeSerpentID;
}

- (void)setEpisodeSerpentID:(id)a3
{
}

- (NSString)podcastUUID
{
  return self->_podcastUUID;
}

- (void)setPodcastUUID:(id)a3
{
}

- (NSNumber)podcastAdamID
{
  return self->_podcastAdamID;
}

- (void)setPodcastAdamID:(id)a3
{
}

- (NSString)currentPodcastFeedURL
{
  return self->_currentPodcastFeedURL;
}

- (void)setCurrentPodcastFeedURL:(id)a3
{
}

- (NSString)originalPodcastFeedURL
{
  return self->_originalPodcastFeedURL;
}

- (void)setOriginalPodcastFeedURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end