@interface TVMusicMPTVEpisodeMediaItem
- (BOOL)useBookmarks;
- (TVMusicMPTVEpisodeMediaItem)initWithTVEpisode:(id)a3;
- (TVMusicMPTVEpisodeMediaItem)initWithTVEpisode:(id)a3 mediaItemMetadata:(id)a4;
- (id)description;
- (id)mediaItemMetadataForProperty:(id)a3;
@end

@implementation TVMusicMPTVEpisodeMediaItem

- (TVMusicMPTVEpisodeMediaItem)initWithTVEpisode:(id)a3 mediaItemMetadata:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicMPTVEpisodeMediaItem;
  return -[TVMusicMPObjectMediaItem initWithMPModelObject:mediaItemMetadata:]( &v5,  "initWithMPModelObject:mediaItemMetadata:",  a3,  a4);
}

- (TVMusicMPTVEpisodeMediaItem)initWithTVEpisode:(id)a3
{
  return -[TVMusicMPTVEpisodeMediaItem initWithTVEpisode:mediaItemMetadata:]( self,  "initWithTVEpisode:mediaItemMetadata:",  a3,  0LL);
}

- (BOOL)useBookmarks
{
  return 1;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_10009C85C;
  v18 = sub_10009C86C;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicMPTVEpisodeMediaItem;
  id v5 = -[TVMusicMPObjectMediaItem mediaItemMetadataForProperty:](&v13, "mediaItemMetadataForProperty:", v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)v15[5];
  if (!v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009C874;
    v9[3] = &unk_100269E60;
    v11 = self;
    v12 = &v14;
    id v10 = v4;
    +[MPModelObject performWithoutEnforcement:](&OBJC_CLASS___MPModelObject, "performWithoutEnforcement:", v9);

    v6 = (void *)v15[5];
  }

  id v7 = v6;
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPTVEpisodeMediaItem tvEpisode](self, "tvEpisode"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 title]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPTVEpisodeMediaItem tvEpisode](self, "tvEpisode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 show]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TV Episode: \"%@\", show title \"%@\"",  v4,  v7));

  return v8;
}

@end