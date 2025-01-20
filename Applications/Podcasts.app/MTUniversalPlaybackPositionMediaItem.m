@interface MTUniversalPlaybackPositionMediaItem
- (MTEpisode)episode;
- (NSDictionary)mediaItemDictionary;
- (NSString)description;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
- (void)populateEpisodeDictionary;
- (void)setEpisode:(id)a3;
- (void)setMediaItemDictionary:(id)a3;
@end

@implementation MTUniversalPlaybackPositionMediaItem

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, char *))a4;
  -[MTUniversalPlaybackPositionMediaItem populateEpisodeDictionary](self, "populateEpisodeDictionary");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:v13]);

        char v16 = 0;
        v7[2](v7, v13, v15, &v16);

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }
}

- (void)populateEpisodeDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));

  if (!v3)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem episode](self, "episode"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 managedObjectContext]);

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10005D108;
    v7[3] = &unk_10023FF98;
    v7[4] = self;
    [v6 performBlockAndWait:v7];

    objc_autoreleasePoolPop(v4);
  }

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUniversalPlaybackPositionMediaItem mediaItemDictionary](self, "mediaItemDictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v5, v6));

  return (NSString *)v7;
}

- (NSDictionary)mediaItemDictionary
{
  return self->_mediaItemDictionary;
}

- (void)setMediaItemDictionary:(id)a3
{
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (void)setEpisode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end