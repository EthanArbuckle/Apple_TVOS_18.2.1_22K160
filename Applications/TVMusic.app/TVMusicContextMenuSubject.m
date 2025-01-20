@interface TVMusicContextMenuSubject
+ (int64_t)favoriteStateForMPObject:(id)a3;
+ (void)subjectWithLibraryObject:(id)a3 container:(id)a4 completion:(id)a5;
+ (void)subjectWithObject:(id)a3 playbackReportingDictionary:(id)a4 container:(id)a5 completion:(id)a6;
+ (void)subjectWithSongInPlayQueue:(id)a3 container:(id)a4 completion:(id)a5;
- (BOOL)libraryAdded;
- (BOOL)storefrontSupportsLyrics;
- (MPModelGenericObject)container;
- (MPModelGenericObject)mpObject;
- (NSData)recommendationData;
- (NSString)featureName;
- (NSString)playlistVersionHash;
- (NSString)title;
- (TVMusicContextMenuSubject)initWithLibraryObject:(id)a3 container:(id)a4;
- (TVMusicContextMenuSubject)initWithObject:(id)a3 playbackReportingDictionary:(id)a4 container:(id)a5;
- (int64_t)favoriteState;
- (int64_t)origin;
- (int64_t)playlistIndex;
- (void)setContainer:(id)a3;
- (void)setFavoriteState:(int64_t)a3;
- (void)setFeatureName:(id)a3;
- (void)setLibraryAdded:(BOOL)a3;
- (void)setMpObject:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setPlaylistIndex:(int64_t)a3;
- (void)setPlaylistVersionHash:(id)a3;
- (void)setRecommendationData:(id)a3;
- (void)setStorefrontSupportsLyrics:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVMusicContextMenuSubject

+ (void)subjectWithObject:(id)a3 playbackReportingDictionary:(id)a4 container:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[TVMusicContextMenuSubject initWithObject:playbackReportingDictionary:container:]( objc_alloc(&OBJC_CLASS___TVMusicContextMenuSubject),  "initWithObject:playbackReportingDictionary:container:",  v12,  v11,  v10);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  -[TVMusicContextMenuSubject setStorefrontSupportsLyrics:]( v13,  "setStorefrontSupportsLyrics:",  [v14 storeFrontSupportsLyrics]);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100085EC8;
  v18[3] = &unk_10026BA80;
  v19 = v13;
  id v20 = v9;
  v15 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008684C;
  block[3] = &unk_100268D60;
  id v22 = v15;
  v16 = v13;
  id v17 = v9;
  dispatch_async(&_dispatch_main_q, block);
}

+ (void)subjectWithLibraryObject:(id)a3 container:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = -[TVMusicContextMenuSubject initWithLibraryObject:container:]( objc_alloc(&OBJC_CLASS___TVMusicContextMenuSubject),  "initWithLibraryObject:container:",  v9,  v8);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  -[TVMusicContextMenuSubject setStorefrontSupportsLyrics:]( v10,  "setStorefrontSupportsLyrics:",  [v11 storeFrontSupportsLyrics]);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100086018;
  v15[3] = &unk_10026BA80;
  v16 = v10;
  id v17 = v7;
  id v12 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008684C;
  block[3] = &unk_100268D60;
  id v19 = v12;
  v13 = v10;
  id v14 = v7;
  dispatch_async(&_dispatch_main_q, block);
}

+ (void)subjectWithSongInPlayQueue:(id)a3 container:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, TVMusicContextMenuSubject *))a5;
  id v10 = a4;
  id v11 = objc_alloc_init(&OBJC_CLASS___TVMusicContextMenuSubject);
  -[TVMusicContextMenuSubject setOrigin:](v11, "setOrigin:", 3LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v8));
  -[TVMusicContextMenuSubject setMpObject:](v11, "setMpObject:", v12);

  -[TVMusicContextMenuSubject setContainer:](v11, "setContainer:", v10);
  -[TVMusicContextMenuSubject setFeatureName:](v11, "setFeatureName:", @"now_playing");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 identifiers]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 universalStore]);
  if ([v14 adamID])
  {
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 universalStore]);
    id v16 = [v15 subscriptionAdamID];

    if (!v16)
    {
      -[TVMusicContextMenuSubject setLibraryAdded:](v11, "setLibraryAdded:", [v8 isLibraryAdded]);
      v9[2](v9, v11);
      goto LABEL_5;
    }
  }

  v25[0] = MPModelPropertySongLibraryAdded;
  v25[1] = MPModelPropertySongIsFavorite;
  v25[2] = MPModelPropertySongIsDisliked;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 3LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v17));

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLyricsRequest sharedInstance](&OBJC_CLASS___TVMusicLyricsRequest, "sharedInstance"));
  -[TVMusicContextMenuSubject setStorefrontSupportsLyrics:]( v11,  "setStorefrontSupportsLyrics:",  [v19 storeFrontSupportsLyrics]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_1000862B0;
  v20[3] = &unk_10026BEE8;
  id v21 = v13;
  id v22 = v11;
  id v24 = a1;
  v23 = v9;
  +[TVMusicLibraryUtilities findMPSongWithIdentifiers:itemProperties:completionHandler:]( &OBJC_CLASS___TVMusicLibraryUtilities,  "findMPSongWithIdentifiers:itemProperties:completionHandler:",  v21,  v18,  v20);

LABEL_5:
}

+ (int64_t)favoriteStateForMPObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (+[TVMusicLibraryUtilities isItemFavorited:](&OBJC_CLASS___TVMusicLibraryUtilities, "isItemFavorited:", v3))
    {
      int64_t v4 = 2LL;
    }

    else if (+[TVMusicLibraryUtilities isItemDisliked:](&OBJC_CLASS___TVMusicLibraryUtilities, "isItemDisliked:", v3))
    {
      int64_t v4 = 3LL;
    }

    else
    {
      int64_t v4 = 1LL;
    }
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (TVMusicContextMenuSubject)initWithObject:(id)a3 playbackReportingDictionary:(id)a4 container:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TVMusicContextMenuSubject;
  id v12 = -[TVMusicContextMenuSubject init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    v12->_origin = 2LL;
    objc_storeStrong((id *)&v12->_mpObject, a3);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"featureName"]);
    v15 = (NSString *)[v14 copy];
    featureName = v13->_featureName;
    v13->_featureName = v15;

    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvs_stringForKey:", @"recommendationData"));
    if ([v17 length])
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue([v17 dataUsingEncoding:4]);
      recommendationData = v13->_recommendationData;
      v13->_recommendationData = (NSData *)v18;
    }

    objc_storeStrong((id *)&v13->_container, a5);
  }

  return v13;
}

- (TVMusicContextMenuSubject)initWithLibraryObject:(id)a3 container:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVMusicContextMenuSubject;
  id v9 = -[TVMusicContextMenuSubject init](&v19, "init");
  id v10 = v9;
  if (v9)
  {
    v9->_origin = 1LL;
    objc_storeStrong((id *)&v9->_mpObject, a3);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicLibraryUITracker sharedTracker](&OBJC_CLASS___TVMusicLibraryUITracker, "sharedTracker"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 currentPAFFeatureName]);
    featureName = v10->_featureName;
    v10->_featureName = (NSString *)v12;

    objc_storeStrong((id *)&v10->_container, a4);
    if ([v7 type] == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v7 song]);
      v10->_libraryAdded = [v15 isLibraryAdded];
    }

    else
    {
      v10->_libraryAdded = 1;
    }

    id v16 = (void *)objc_opt_class(v10, v14);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);
    v10->_favoriteState = (int64_t)[v16 favoriteStateForMPObject:v17];
  }

  return v10;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (MPModelGenericObject)mpObject
{
  return self->_mpObject;
}

- (void)setMpObject:(id)a3
{
}

- (MPModelGenericObject)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
}

- (NSString)playlistVersionHash
{
  return self->_playlistVersionHash;
}

- (void)setPlaylistVersionHash:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (int64_t)playlistIndex
{
  return self->_playlistIndex;
}

- (void)setPlaylistIndex:(int64_t)a3
{
  self->_playlistIndex = a3;
}

- (BOOL)libraryAdded
{
  return self->_libraryAdded;
}

- (void)setLibraryAdded:(BOOL)a3
{
  self->_libraryAdded = a3;
}

- (BOOL)storefrontSupportsLyrics
{
  return self->_storefrontSupportsLyrics;
}

- (void)setStorefrontSupportsLyrics:(BOOL)a3
{
  self->_storefrontSupportsLyrics = a3;
}

- (int64_t)favoriteState
{
  return self->_favoriteState;
}

- (void)setFavoriteState:(int64_t)a3
{
  self->_favoriteState = a3;
}

- (void).cxx_destruct
{
}

@end