@interface MTMediaPlayerEpisodeLookupUtil
+ (id)findEpisodeFromModelObject:(id)a3;
@end

@implementation MTMediaPlayerEpisodeLookupUtil

+ (id)findEpisodeFromModelObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  id v5 = objc_alloc_init(&OBJC_CLASS___MTEpisodeLookupRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 universalStore]);
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "adamID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 library]);
  objc_msgSend(v5, "setPersistentID:", objc_msgSend(v7, "persistentID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 library]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseID]);
  [v5 setUuid:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 vendorID]);
  [v5 setEpisodeGuid:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 podcast]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 feedURL]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 absoluteString]);
  [v5 setPodcastFeedUrl:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  [v5 setEpisodeTitle:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v3 author]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
  [v5 setPodcastTitle:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 streamURL]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 absoluteString]);
  [v5 setStreamUrl:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLookupUtil sharedInstance](&OBJC_CLASS___MTEpisodeLookupUtil, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 findEpisodeWithRequest:v5]);

  return v20;
}

@end