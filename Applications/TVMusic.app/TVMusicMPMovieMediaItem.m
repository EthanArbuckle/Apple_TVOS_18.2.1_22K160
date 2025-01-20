@interface TVMusicMPMovieMediaItem
- (BOOL)useBookmarks;
- (TVMusicMPMovieMediaItem)initWithMovie:(id)a3;
- (TVMusicMPMovieMediaItem)initWithMovie:(id)a3 mediaItemMetadata:(id)a4;
- (id)description;
- (id)mediaItemMetadataForProperty:(id)a3;
@end

@implementation TVMusicMPMovieMediaItem

- (TVMusicMPMovieMediaItem)initWithMovie:(id)a3 mediaItemMetadata:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicMPMovieMediaItem;
  return -[TVMusicMPObjectMediaItem initWithMPModelObject:mediaItemMetadata:]( &v5,  "initWithMPModelObject:mediaItemMetadata:",  a3,  a4);
}

- (TVMusicMPMovieMediaItem)initWithMovie:(id)a3
{
  return -[TVMusicMPMovieMediaItem initWithMovie:mediaItemMetadata:](self, "initWithMovie:mediaItemMetadata:", a3, 0LL);
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
  v17 = sub_100027510;
  v18 = sub_100027520;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVMusicMPMovieMediaItem;
  id v5 = -[TVMusicMPObjectMediaItem mediaItemMetadataForProperty:](&v13, "mediaItemMetadataForProperty:", v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)v15[5];
  if (!v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100027528;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicMPMovieMediaItem movie](self, "movie"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 title]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Movie: \"%@\"", v3));

  return v4;
}

@end