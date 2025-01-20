@interface TVMusicPlayItemsParser
+ (BOOL)_isMAPISongExplicit:(id)a3;
+ (BOOL)_isStoreSongExplicit:(id)a3;
+ (id)_idForMAPIOrStoreItem:(id)a3;
+ (id)_identifierForSongDict:(id)a3;
+ (id)_stringifyID:(id)a3;
+ (id)_typeForMAPIItem:(id)a3;
+ (int64_t)_ratingValueFromMAPIDictionary:(id)a3;
+ (int64_t)_ratingValueFromStoreDictionary:(id)a3;
+ (int64_t)_sourceTypeFromItems:(id)a3;
- (BOOL)_needsSubscription;
- (NSArray)items;
- (NSError)error;
- (TVMusicPlayItemsDataSource)dataSource;
- (TVMusicPlayItemsOptions)options;
- (TVMusicPlayItemsParser)initWithItems:(id)a3 options:(id)a4;
- (id)_mediaAPIDictionaryForAllowedTypes:(id)a3;
- (id)_playbackIntentForAudioURL;
- (id)_playbackIntentForMAPIAlbumOrPlaylist;
- (id)_playbackIntentForMAPIMovieOrTV;
- (id)_playbackIntentForMAPISongs;
- (id)_playbackIntentForMAPITypes:(id)a3 startPlayItem:(id *)a4;
- (id)_playbackIntentForMAPIUploadedVideo;
- (id)_playbackIntentForMediaClip:(id)a3;
- (id)_playbackIntentForMovieClip;
- (id)_playbackIntentForStoreAlbumOrPlaylist;
- (id)_playbackIntentForStoreMovieOrTV;
- (id)_playbackIntentForStoreSongs;
- (id)_playbackIntentForStoreTypes:(id)a3 startPlayItem:(id *)a4;
- (id)_playbackIntentForStoreVideoContent;
- (id)_playbackIntentWithRequest:(id)a3 startItemIdentifiers:(id)a4;
- (id)_playbackIntentWithStoreIDs:(id)a3 startItemIdentifiers:(id)a4;
- (id)_storeDictionaryForAllowedTypes:(id)a3;
- (int64_t)sourceType;
- (void)_getPlaybackIntentForLibraryAlbum:(id)a3;
- (void)_getPlaybackIntentForLibraryPlaylist:(id)a3;
- (void)_getPlaybackIntentForLibrarySongs:(id)a3;
- (void)getPlaybackIntent:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setError:(id)a3;
- (void)setItems:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSourceType:(int64_t)a3;
@end

@implementation TVMusicPlayItemsParser

- (TVMusicPlayItemsParser)initWithItems:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVMusicPlayItemsParser;
  v9 = -[TVMusicPlayItemsParser init](&v15, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___TVMDefaultPlayItemsDataSource);
    dataSource = v9->_dataSource;
    v9->_dataSource = (TVMusicPlayItemsDataSource *)v10;

    objc_storeStrong((id *)&v9->_items, a3);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[TVMusicPlayItemsOptions optionsFromDictionary:]( &OBJC_CLASS___TVMusicPlayItemsOptions,  "optionsFromDictionary:",  v8));
    options = v9->_options;
    v9->_options = (TVMusicPlayItemsOptions *)v12;

    v9->_sourceType = +[TVMusicPlayItemsParser _sourceTypeFromItems:]( &OBJC_CLASS___TVMusicPlayItemsParser,  "_sourceTypeFromItems:",  v7);
  }

  return v9;
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (TVMDefaultPlayItemsDataSource *)v4;
  }
  else {
    v5 = objc_alloc_init(&OBJC_CLASS___TVMDefaultPlayItemsDataSource);
  }
  dataSource = self->_dataSource;
  self->_dataSource = (TVMusicPlayItemsDataSource *)v5;
}

- (void)getPlaybackIntent:(id)a3
{
  id v4 = a3;
  -[TVMusicPlayItemsParser setError:](self, "setError:", 0LL);
  switch(-[TVMusicPlayItemsParser sourceType](self, "sourceType"))
  {
    case 0LL:
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
      -[TVMusicPlayItemsParser setError:](self, "setError:", v5);

      goto LABEL_3;
    case 1LL:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_10004784C;
      v13[3] = &unk_10026ACC0;
      v13[4] = self;
      id v14 = v4;
      -[TVMusicPlayItemsParser _getPlaybackIntentForLibraryAlbum:](self, "_getPlaybackIntentForLibraryAlbum:", v13);
      v6 = v14;
      goto LABEL_19;
    case 2LL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000478AC;
      v11[3] = &unk_10026ACC0;
      v11[4] = self;
      id v12 = v4;
      -[TVMusicPlayItemsParser _getPlaybackIntentForLibraryPlaylist:]( self,  "_getPlaybackIntentForLibraryPlaylist:",  v11);
      v6 = v12;
      goto LABEL_19;
    case 3LL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10004790C;
      v9[3] = &unk_10026ACC0;
      v9[4] = self;
      id v10 = v4;
      -[TVMusicPlayItemsParser _getPlaybackIntentForLibrarySongs:](self, "_getPlaybackIntentForLibrarySongs:", v9);
      v6 = v10;
      goto LABEL_19;
    case 4LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForMAPIAlbumOrPlaylist]( self,  "_playbackIntentForMAPIAlbumOrPlaylist"));
      goto LABEL_17;
    case 5LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMAPIMovieOrTV](self, "_playbackIntentForMAPIMovieOrTV"));
      goto LABEL_17;
    case 6LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMAPISongs](self, "_playbackIntentForMAPISongs"));
      goto LABEL_17;
    case 7LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMAPIUploadedVideo](self, "_playbackIntentForMAPIUploadedVideo"));
      goto LABEL_17;
    case 8LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForStoreAlbumOrPlaylist]( self,  "_playbackIntentForStoreAlbumOrPlaylist"));
      goto LABEL_17;
    case 9LL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForStoreMovieOrTV](self, "_playbackIntentForStoreMovieOrTV"));
      goto LABEL_17;
    case 0xALL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForStoreVideoContent](self, "_playbackIntentForStoreVideoContent"));
      goto LABEL_17;
    case 0xBLL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForStoreSongs](self, "_playbackIntentForStoreSongs"));
      goto LABEL_17;
    case 0xCLL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMovieClip](self, "_playbackIntentForMovieClip"));
      goto LABEL_17;
    case 0xDLL:
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForAudioURL](self, "_playbackIntentForAudioURL"));
LABEL_17:
      v6 = (void *)v7;
      break;
    default:
LABEL_3:
      v6 = 0LL;
      break;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser error](self, "error"));
  (*((void (**)(id, void *, void *))v4 + 2))(v4, v6, v8);

LABEL_19:
}

+ (int64_t)_sourceTypeFromItems:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kind"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 _typeForMAPIItem:v8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"id"]);
      id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringifyID:v11]);

      v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _idForMAPIOrStoreItem:v8]);
      unsigned __int8 v26 = [v9 isEqualToString:@"album"];
      unsigned __int8 v14 = [v9 isEqualToString:@"playlist"];
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"persistentID"]);
      id v16 = [v15 longLongValue];

      if ([v9 isEqualToString:@"album"])
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"albumPersistentID"]);
        id v18 = [v17 longLongValue];

        if (v18)
        {
          int64_t v19 = 1LL;
LABEL_61:

          goto LABEL_62;
        }
      }

      if ([v9 isEqualToString:@"playlist"])
      {
        if (v16
          || (v22 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"playlistID"]),
              id v23 = [v22 longLongValue],
              v22,
              v23))
        {
          int64_t v19 = 2LL;
          goto LABEL_61;
        }
      }

      if ([v9 isEqualToString:@"localTrack"] && v16)
      {
        int64_t v19 = 3LL;
        goto LABEL_61;
      }

      if ([v10 isEqualToString:@"albums"])
      {
        if (!v13)
        {
          goto LABEL_25;
        }
      }

      else if (![v10 isEqualToString:@"playlists"] || !v13)
      {
        if ([v10 isEqualToString:@"music-movies"])
        {
LABEL_26:
          if (v13)
          {
            int64_t v19 = 5LL;
            goto LABEL_61;
          }

+ (id)_typeForMAPIItem:(id)a3
{
  return objc_msgSend(a3, "tvs_stringForKey:", @"type");
}

+ (id)_idForMAPIOrStoreItem:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"id"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringifyID:v4]);

  return v5;
}

+ (id)_stringifyID:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = v3;
  if (!v6)
  {
    if ((objc_opt_respondsToSelector(v3, "stringValue") & 1) != 0) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 stringValue]);
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  return v7;
}

- (id)_mediaAPIDictionaryForAllowedTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {

    id v10 = 0LL;
LABEL_7:
    v13 = 0LL;
    goto LABEL_8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (!v10)
  {
    v13 = 0LL;
    goto LABEL_9;
  }

  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_typeForMAPIItem:", v10);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v10 = v10;
  v13 = v10;
LABEL_8:

LABEL_9:
  return v13;
}

- (id)_storeDictionaryForAllowedTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {

    id v10 = 0LL;
    goto LABEL_10;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"kind"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"kind"]);

      if (v5 && [v4 containsObject:v5])
      {
        id v10 = v10;
        unsigned __int8 v14 = v10;
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {

      uint64_t v5 = 0LL;
    }

- (void)_getPlaybackIntentForLibraryAlbum:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {

    id v10 = 0LL;
LABEL_7:
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v21);

    v4[2](v4, 0LL);
    goto LABEL_8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"albumPersistentID"]);
  id v12 = [v11 longLongValue];

  if (!v12) {
    goto LABEL_7;
  }
  unsigned __int8 v14 = (void *)objc_opt_class(self, v13);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v16 = [v14 _sourceTypeFromItems:v15];

  if (v16 != (id)1) {
    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 itemKind]);

  int64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identifierSetForModelKind:withPersistentID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identifierSetForModelKind:withPersistentID:",  v18,  v12));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser dataSource](self, "dataSource"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000483EC;
  v22[3] = &unk_10026ACE8;
  v22[4] = self;
  unsigned __int8 v24 = v4;
  id v10 = v10;
  id v23 = v10;
  [v20 findMPObjectWithIdentifiers:v19 itemKind:v18 itemProperties:0 completion:v22];

LABEL_8:
}

- (id)_playbackIntentWithStoreIDs:(id)a3 startItemIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  id v10 = [v9 shuffle];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  id v12 = -[TVMusicPlaybackIntent initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:]( v8,  "initWithStoreIDs:shuffle:playbackAction:startItemIdentifiers:",  v7,  v10,  [v11 actionType],  v6);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pafData]);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 featureName]);
  -[TVMusicPlaybackIntent setPlayActivityFeatureName:](v12, "setPlayActivityFeatureName:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pafData]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 recommendationData]);
  -[TVMusicPlaybackIntent setPlayActivityRecommendationData:](v12, "setPlayActivityRecommendationData:", v18);

  return v12;
}

- (id)_playbackIntentWithRequest:(id)a3 startItemIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___TVMusicPlaybackIntent);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  id v10 = [v9 shuffle];
  if (v6)
  {
    uint64_t v11 = -[TVMusicPlaybackIntent initWithRequest:shuffle:startItemIdentifiers:]( v8,  "initWithRequest:shuffle:startItemIdentifiers:",  v7,  v10,  v6);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
    uint64_t v11 = -[TVMusicPlaybackIntent initWithRequest:shuffle:playbackAction:]( v8,  "initWithRequest:shuffle:playbackAction:",  v7,  v10,  [v12 actionType]);

    id v7 = v12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pafData]);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v14 featureName]);
  -[TVMusicPlaybackIntent setPlayActivityFeatureName:](v11, "setPlayActivityFeatureName:", v15);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 pafData]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 recommendationData]);
  -[TVMusicPlaybackIntent setPlayActivityRecommendationData:](v11, "setPlayActivityRecommendationData:", v18);

  return v11;
}

- (void)_getPlaybackIntentForLibraryPlaylist:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

    if (!v10)
    {
      id v12 = 0LL;
      goto LABEL_10;
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"persistentID"]);
    id v11 = [v6 longLongValue];
    if (v11)
    {
      id v12 = v11;
    }

    else
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"playlistID"]);
      id v12 = [v13 longLongValue];
    }

    uint64_t v5 = v10;
  }

  else
  {
    id v12 = 0LL;
  }

LABEL_10:
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  uint64_t v15 = (uint64_t)[v14 playIndex];

  if (v15 == -1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
    if (![v17 shuffle])
    {
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
      id v27 = [v26 actionType];

      if (v27) {
        uint64_t v15 = -1LL;
      }
      else {
        uint64_t v15 = 0LL;
      }
      if (!v12) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }

    uint64_t v15 = -1LL;
  }

  if (!v12)
  {
LABEL_20:
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v28);

    v4[2](v4, 0LL);
    goto LABEL_21;
  }

- (void)_getPlaybackIntentForLibrarySongs:(id)a3
{
  id v31 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  v32 = (char *)[v4 playIndex];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  v30 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v6 = (char *)[obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    v36 = 0LL;
    uint64_t v9 = *(void *)v44;
    do
    {
      id v10 = 0LL;
      v33 = v8;
      id v11 = (char *)(v32 - v8);
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v10);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"persistentID"]);
        id v14 = [v13 longLongValue];

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"kind"]);
        LODWORD(v13) = [v15 isEqualToString:@"localTrack"];

        if ((_DWORD)v13) {
          BOOL v16 = v14 == 0LL;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {
          v17 = 0LL;
        }

        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithPersistentID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForSongWithPersistentID:",  v14));
          [v34 addObject:v17];
        }

        if (v11 == v10)
        {
          id v18 = v17;

          v36 = v18;
        }

        ++v10;
      }

      while (v7 != v10);
      uint64_t v8 = &v7[(void)v33];
      uint64_t v7 = (char *)[obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }

    while (v7);
  }

  else
  {
    v36 = 0LL;
  }

  if ([v34 count])
  {
    int64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequest"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](&OBJC_CLASS___MPModelSong, "kindWithVariants:", 3LL));
    [v19 setItemKind:v20];

    v21 = v31;
    v22 = v36;
    if (v36) {
      id v23 = v36;
    }
    else {
      id v23 = (id)objc_claimAutoreleasedReturnValue([v34 firstObject]);
    }
    v25 = v23;
    [v19 setSortUsingAllowedItemIdentifiers:1];
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser dataSource](v30, "dataSource"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v19 itemKind]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v19 itemProperties]);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000493E8;
    v37[3] = &unk_10026AD60;
    id v38 = v19;
    id v39 = v34;
    v40 = v30;
    id v41 = v36;
    id v42 = v31;
    id v29 = v19;
    [v26 findMPObjectWithIdentifiers:v25 itemKind:v27 itemProperties:v28 completion:v37];
  }

  else
  {
    unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](v30, "setError:", v24);

    v21 = v31;
    (*((void (**)(id, void))v31 + 2))(v31, 0LL);
    v22 = v36;
  }
}

- (id)_playbackIntentForMAPIAlbumOrPlaylist
{
  v49[0] = @"albums";
  v49[1] = @"playlists";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _mediaAPIDictionaryForAllowedTypes:]( self,  "_mediaAPIDictionaryForAllowedTypes:",  v3));

  if (!v4)
  {
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_typeForMAPIItem:", v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_idForMAPIOrStoreItem:", v4);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
LABEL_6:
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v11);
    goto LABEL_7;
  }

  id v11 = (void *)v10;
  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v4);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v12);

LABEL_7:
    uint64_t v13 = 0LL;
    goto LABEL_8;
  }

  __int128 v43 = v7;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"relationships"]);
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"tracks"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"data"]);
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray, v18);
  if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"relationships"]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"tracks"]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"data"]);
  }

  else
  {
    v22 = 0LL;
  }

  if (!v22)
  {
    id v29 = 0LL;
    id v30 = 0LL;
    id v31 = 0LL;
    uint64_t v32 = 1LL;
    goto LABEL_31;
  }

  uint64_t v23 = (uint64_t)[v22 count];
  if (v23 < 1) {
    goto LABEL_29;
  }
  uint64_t v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  uint64_t v26 = (uint64_t)[v25 playIndex];

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  unsigned int v28 = [v27 shuffle];

  if (v28)
  {
    uint64_t v26 = arc4random_uniform(v24);
  }

  else if (v26 == -1)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
    uint64_t v26 = (uint64_t)[v40 actionType];

    if (v26)
    {
LABEL_29:
      id v29 = 0LL;
      goto LABEL_30;
    }
  }

  if (v26 < 0 || v26 >= v24)
  {
    if (v26 >= v24)
    {
      id v38 = sub_100047E60();
      id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v46 = v26;
        __int16 v47 = 2048;
        uint64_t v48 = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Play index of %ld is greater than the number of available tracks (%ld)",  buf,  0x16u);
      }
    }

    goto LABEL_29;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:v26]);
  if (!v29)
  {
LABEL_30:
    id v30 = 0LL;
    id v31 = 0LL;
    uint64_t v32 = 1LL;
    goto LABEL_31;
  }

  id v34 = objc_msgSend((id)objc_opt_class(self, v33), "_identifierForSongDict:", v29);
  id v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
  id v30 = objc_msgSend((id)objc_opt_class(self, v35), "_isMAPISongExplicit:", v29);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:@"type"]);
  unsigned int v37 = [v36 isEqualToString:@"music-videos"];

  if (v37) {
    uint64_t v32 = 3LL;
  }
  else {
    uint64_t v32 = 1LL;
  }
LABEL_31:
  __int128 v44 = v11;
  id v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithStoreIDs:startItemIdentifiers:]( self,  "_playbackIntentWithStoreIDs:startItemIdentifiers:",  v41,  v31));

  [v13 setPlaybackType:v32];
  [v13 setFirstTrackExplicit:v30];
  uint64_t v7 = v43;
  else {
    uint64_t v42 = 3LL;
  }
  [v13 setFirstItemType:v42];

LABEL_8:
  return v13;
}

- (id)_playbackIntentForMAPIMovieOrTV
{
  v19[0] = @"music-movies";
  v19[1] = @"tv-episodes";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _mediaAPIDictionaryForAllowedTypes:]( self,  "_mediaAPIDictionaryForAllowedTypes:",  v3));

  if (!v4)
  {
    uint64_t v7 = 0LL;
    goto LABEL_6;
  }

  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "_typeForMAPIItem:", v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v9 = objc_msgSend((id)objc_opt_class(self, v8), "_idForMAPIOrStoreItem:", v4);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
LABEL_6:
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v11);
    goto LABEL_7;
  }

  id v11 = (void *)v10;
  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v4);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v12);

LABEL_7:
    uint64_t v13 = 0LL;
    goto LABEL_8;
  }

  uint64_t v18 = v11;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithStoreIDs:startItemIdentifiers:]( self,  "_playbackIntentWithStoreIDs:startItemIdentifiers:",  v15,  0LL));

  [v13 setPlaybackType:2];
  else {
    uint64_t v16 = 8LL;
  }
  [v13 setFirstItemType:v16];
  objc_msgSend( v13,  "setVideoContentRating:",  objc_msgSend((id)objc_opt_class(self, v17), "_ratingValueFromMAPIDictionary:", v4));
LABEL_8:

  return v13;
}

- (id)_playbackIntentForMAPISongs
{
  v15[0] = @"songs";
  v15[1] = @"music-videos";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  id v14 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForMAPITypes:startPlayItem:]( self,  "_playbackIntentForMAPITypes:startPlayItem:",  v3,  &v14));
  id v6 = v14;
  if (v4)
  {
    id v7 = objc_msgSend((id)objc_opt_class(self, v5), "_typeForMAPIItem:", v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = [v8 isEqualToString:@"music-videos"];

    if (v9) {
      uint64_t v10 = 3LL;
    }
    else {
      uint64_t v10 = 1LL;
    }
    if (v9) {
      uint64_t v11 = 6LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    [v4 setPlaybackType:v10];
    [v4 setFirstItemType:v11];
    objc_msgSend(v4, "setFirstTrackExplicit:", objc_msgSend((id)objc_opt_class(self, v12), "_isMAPISongExplicit:", v6));
  }

  return v4;
}

- (id)_playbackIntentForMAPITypes:(id)a3 startPlayItem:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _mediaAPIDictionaryForAllowedTypes:]( self,  "_mediaAPIDictionaryForAllowedTypes:",  v6));
  if (!v8)
  {
    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  id v9 = objc_msgSend((id)objc_opt_class(self, v7), "_typeForMAPIItem:", v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v12 = objc_msgSend((id)objc_opt_class(self, v11), "_idForMAPIOrStoreItem:", v8);
  uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
LABEL_6:
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v14);
    goto LABEL_7;
  }

  id v14 = (void *)v13;
  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v8);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v15);

LABEL_7:
    uint64_t v16 = 0LL;
    goto LABEL_8;
  }

  __int128 v44 = a4;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v18 count]));

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = 0LL;
    do
    {
      v25 = v10;
      uint64_t v26 = v14;
      id v27 = v8;
      unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:v24]);

      id v30 = objc_msgSend((id)objc_opt_class(self, v29), "_typeForMAPIItem:", v8);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v30);

      id v32 = objc_msgSend((id)objc_opt_class(self, v31), "_idForMAPIOrStoreItem:", v8);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v32);

      if (v10)
      {
        if (v14)
        {
          if ([v6 containsObject:v10])
          {
            [v19 addObject:v14];
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
            id v34 = (char *)[v33 playIndex];

            if (v24 == v34)
            {
              id v35 = v8;

              v21 = v35;
            }
          }
        }
      }

      ++v24;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
      unsigned int v37 = (char *)[v36 count];
    }

    while (v37 > v24);
  }

  id v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  id v39 = [v38 playIndex];

  if (v39 == (id)-1LL)
  {
    __int128 v43 = 0LL;
  }

  else
  {
    id v41 = objc_msgSend((id)objc_opt_class(self, v40), "_idForMAPIOrStoreItem:", v21);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  [v42 longLongValue],  0));
  }

  if (v44) {
    *__int128 v44 = v21;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithStoreIDs:startItemIdentifiers:]( self,  "_playbackIntentWithStoreIDs:startItemIdentifiers:",  v19,  v43));

LABEL_8:
  return v16;
}

- (id)_playbackIntentForMAPIUploadedVideo
{
  uint64_t v7 = @"uploaded-videos";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForMAPITypes:startPlayItem:]( self,  "_playbackIntentForMAPITypes:startPlayItem:",  v3,  0LL));
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 setPlaybackType:2];
    [v5 setFirstItemType:11];
  }

  return v5;
}

- (id)_playbackIntentForStoreAlbumOrPlaylist
{
  v51[0] = @"album";
  v51[1] = @"playlist";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _storeDictionaryForAllowedTypes:]( self,  "_storeDictionaryForAllowedTypes:",  v3));

  if (!v4)
  {
    uint64_t v8 = 0LL;
LABEL_9:
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v12);
    goto LABEL_10;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kind"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kind"]);
  }
  else {
    uint64_t v8 = 0LL;
  }

  id v10 = objc_msgSend((id)objc_opt_class(self, v9), "_idForMAPIOrStoreItem:", v4);
  uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!v11) {
    goto LABEL_9;
  }
  id v12 = (void *)v11;
  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v13);

LABEL_10:
    id v14 = 0LL;
    goto LABEL_11;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"children"]);
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v17);
  if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0) {
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"children"]);
  }
  else {
    __int128 v44 = 0LL;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"childrenIds"]);
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
  if ((objc_opt_isKindOfClass(v19, v21) & 1) == 0)
  {
    __int128 v45 = 0LL;
    goto LABEL_21;
  }

  id v22 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"childrenIds"]);

  if (!v22)
  {
    __int128 v45 = 0LL;
    uint64_t v29 = 0LL;
LABEL_36:
    id v30 = 0LL;
    uint64_t v31 = 1LL;
    id v32 = v44;
    goto LABEL_37;
  }

  __int128 v45 = v22;
  uint64_t v23 = (uint64_t)[v22 count];
  if (v23 < 1)
  {
LABEL_35:
    uint64_t v29 = 0LL;
    id v22 = 0LL;
    goto LABEL_36;
  }

  uint64_t v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  uint64_t v26 = (uint64_t)[v25 playIndex];

  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  unsigned int v28 = [v27 shuffle];

  if (v28)
  {
    uint64_t v26 = arc4random_uniform(v24);
    goto LABEL_26;
  }

  if (v26 == -1)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
    id v39 = [v38 actionType];

    if (!v39)
    {
      uint64_t v26 = 0LL;
      goto LABEL_26;
    }

    goto LABEL_35;
  }

  if (v26 < 0)
  {
LABEL_42:
    id v32 = v44;
    if (v26 < v24)
    {
      uint64_t v29 = 0LL;
      id v22 = 0LL;
      id v30 = 0LL;
      uint64_t v31 = 1LL;
      goto LABEL_37;
    }

    id v42 = sub_100047E60();
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v48 = v26;
      __int16 v49 = 2048;
      uint64_t v50 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "Play index of %ld is greater than the number of available tracks (%ld)",  buf,  0x16u);
    }

    goto LABEL_46;
  }

- (id)_playbackIntentForStoreMovieOrTV
{
  v20[0] = @"movie";
  v20[1] = @"tvEpisode";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _storeDictionaryForAllowedTypes:]( self,  "_storeDictionaryForAllowedTypes:",  v3));

  if (!v4)
  {
    uint64_t v8 = 0LL;
    goto LABEL_11;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kind"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0) {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"kind"]);
  }
  else {
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"id"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {

    goto LABEL_11;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"id"]);

  if (!v12)
  {
LABEL_11:
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v12);
    goto LABEL_12;
  }

  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v4);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v13);

LABEL_12:
    id v14 = 0LL;
    goto LABEL_13;
  }

  uint64_t v19 = v12;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithStoreIDs:startItemIdentifiers:]( self,  "_playbackIntentWithStoreIDs:startItemIdentifiers:",  v16,  0LL));

  [v14 setPlaybackType:2];
  else {
    uint64_t v17 = 8LL;
  }
  [v14 setFirstItemType:v17];
  objc_msgSend( v14,  "setVideoContentRating:",  objc_msgSend((id)objc_opt_class(self, v18), "_ratingValueFromStoreDictionary:", v4));
LABEL_13:

  return v14;
}

- (id)_playbackIntentForStoreVideoContent
{
  uint64_t v6 = @"urlVideoPlayback";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForStoreTypes:startPlayItem:]( self,  "_playbackIntentForStoreTypes:startPlayItem:",  v3,  0LL));

  [v4 setPlaybackType:2];
  [v4 setFirstItemType:11];
  return v4;
}

- (id)_playbackIntentForStoreSongs
{
  v14[0] = @"song";
  v14[1] = @"musicVideo";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
  id v13 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentForStoreTypes:startPlayItem:]( self,  "_playbackIntentForStoreTypes:startPlayItem:",  v3,  &v13));
  id v5 = v13;
  uint64_t v6 = v5;
  if (v4)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tvs_stringForKey:", @"kind"));
    unsigned int v8 = [v7 isEqualToString:@"musicVideo"];

    if (v8) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 1LL;
    }
    if (v8) {
      uint64_t v10 = 6LL;
    }
    else {
      uint64_t v10 = 2LL;
    }
    [v4 setPlaybackType:v9];
    [v4 setFirstItemType:v10];
    objc_msgSend(v4, "setFirstTrackExplicit:", objc_msgSend((id)objc_opt_class(self, v11), "_isStoreSongExplicit:", v6));
  }

  return v4;
}

- (id)_playbackIntentForMovieClip
{
  v6[0] = @"urlVideoPlayback";
  v6[1] = @"movieClip";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMediaClip:](self, "_playbackIntentForMediaClip:", v3));

  [v4 setPlaybackType:2];
  return v4;
}

- (id)_playbackIntentForAudioURL
{
  uint64_t v6 = @"urlPlayback";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _playbackIntentForMediaClip:](self, "_playbackIntentForMediaClip:", v3));

  [v4 setPlaybackType:1];
  return v4;
}

- (id)_playbackIntentForMediaClip:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser _storeDictionaryForAllowedTypes:](self, "_storeDictionaryForAllowedTypes:", v4));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = objc_alloc(&OBJC_CLASS___MPPropertySet);
    v46[0] = MPModelPropertyMediaClipPreviewArtwork;
    v46[1] = MPModelPropertyMediaClipTitle;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 2LL));
    uint64_t v44 = MPModelRelationshipMediaClipStaticAssets;
    v43[0] = MPModelPropertyStaticAssetDuration;
    v43[1] = MPModelPropertyStaticAssetFlavorType;
    v43[2] = MPModelPropertyStaticAssetMediaType;
    v43[3] = MPModelPropertyStaticAssetURL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 4LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MPPropertySet propertySetWithProperties:]( &OBJC_CLASS___MPPropertySet,  "propertySetWithProperties:",  v9));
    __int128 v45 = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    id v12 = [v7 initWithProperties:v8 relationships:v11];

    id v39 = v12;
    id v13 = [[MPStoreModelMovieMediaClipBuilder alloc] initWithRequestedPropertySet:v12];
    id v41 = objc_alloc_init(&OBJC_CLASS___MPMutableSectionedCollection);
    [v41 appendSection:&stru_100279068];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
    id v15 = [v14 count];

    if (v15)
    {
      uint64_t v16 = 0LL;
      uint64_t v40 = 0LL;
      do
      {
        uint64_t v17 = v6;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v18 objectAtIndexedSubscript:v16]);

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_stringForKey:", @"kind"));
        if (v19 && [v4 containsObject:v19])
        {
          id v20 = [[MPStoreItemMovieClip alloc] initWithLookupDictionary:v6];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaClipWithStoreItemMetadata:0 storeItemMovieClip:v20]);
          if (v21)
          {
            id v22 = v4;
            id v23 = v13;
            [v41 appendItem:v21];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
            v25 = (char *)[v24 playIndex];

            if (v16 == v25)
            {
              uint64_t v26 = objc_claimAutoreleasedReturnValue([v21 identifiers]);

              uint64_t v40 = (void *)v26;
            }

            id v13 = v23;
            id v4 = v22;
          }
        }

        ++v16;
        id v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
        unsigned int v28 = (char *)[v27 count];
      }

      while (v28 > v16);
    }

    else
    {
      uint64_t v40 = 0LL;
    }

    if ([v41 totalItemCount])
    {
      id v31 = objc_alloc_init(&OBJC_CLASS___MPModelStaticRequest);
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelMediaClip kind](&OBJC_CLASS___MPModelMediaClip, "kind"));
      [v31 setItemKind:v32];

      id v33 = [[MPModelStaticResponse alloc] initWithRequest:v31];
      [v33 setResults:v41];
      [v31 setStaticResponse:v33];
      uint64_t v34 = v40;
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithRequest:startItemIdentifiers:]( self,  "_playbackIntentWithRequest:startItemIdentifiers:",  v31,  v40));
      [v35 setFirstItemType:12];
      id v30 = v35;
    }

    else
    {
      id v36 = sub_100047E60();
      unsigned int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      uint64_t v34 = v40;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "No valid movieClip items to play.",  buf,  2u);
      }

      id v31 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
      -[TVMusicPlayItemsParser setError:](self, "setError:", v31);
      id v30 = 0LL;
    }
  }

  else
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v29);

    id v30 = 0LL;
  }

  return v30;
}

- (id)_playbackIntentForStoreTypes:(id)a3 startPlayItem:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _storeDictionaryForAllowedTypes:]( self,  "_storeDictionaryForAllowedTypes:",  v6));
  unsigned int v8 = v7;
  if (!v7)
  {
    id v12 = 0LL;
LABEL_9:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  1LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v16);
    goto LABEL_10;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"kind"]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kind"]);
  }
  else {
    id v12 = 0LL;
  }

  id v14 = objc_msgSend((id)objc_opt_class(self, v13), "_idForMAPIOrStoreItem:", v8);
  uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
  if (!v15) {
    goto LABEL_9;
  }
  uint64_t v16 = (void *)v15;
  if (-[TVMusicPlayItemsParser _needsSubscription](self, "_needsSubscription"))
  {
    sub_100087738(v8);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  off_1002B60D0,  3LL,  0LL));
    -[TVMusicPlayItemsParser setError:](self, "setError:", v17);

LABEL_10:
    uint64_t v18 = 0LL;
    goto LABEL_11;
  }

  uint64_t v46 = a4;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  __int16 v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v20 count]));

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
  id v24 = [v23 count];

  if (v24)
  {
    v25 = 0LL;
    do
    {
      uint64_t v26 = v12;
      id v27 = v16;
      unsigned int v28 = v8;
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v29 objectAtIndexedSubscript:v25]);

      id v30 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kind"]);
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSString, v31);
      if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0) {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"kind"]);
      }
      else {
        id v12 = 0LL;
      }

      id v34 = objc_msgSend((id)objc_opt_class(self, v33), "_idForMAPIOrStoreItem:", v8);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v34);

      if (v12)
      {
        if (v16)
        {
          if ([v6 containsObject:v12])
          {
            [v47 addObject:v16];
            uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
            id v36 = (char *)[v35 playIndex];

            if (v25 == v36)
            {
              id v37 = v8;

              id v22 = v37;
            }
          }
        }
      }

      ++v25;
      id v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser items](self, "items"));
      id v39 = (char *)[v38 count];
    }

    while (v39 > v25);
  }

  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  id v41 = [v40 playIndex];

  if (v41 == (id)-1LL)
  {
    __int128 v45 = 0LL;
  }

  else
  {
    id v43 = objc_msgSend((id)objc_opt_class(self, v42), "_idForMAPIOrStoreItem:", v22);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    __int128 v45 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  [v44 longLongValue],  0));
  }

  if (v46) {
    *uint64_t v46 = v22;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlayItemsParser _playbackIntentWithStoreIDs:startItemIdentifiers:]( self,  "_playbackIntentWithStoreIDs:startItemIdentifiers:",  v47,  v45));

LABEL_11:
  return v18;
}

- (BOOL)_needsSubscription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
  if ([v3 isFreeContent])
  {
    unsigned __int8 v4 = 1;
LABEL_8:

    return v4 ^ 1;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser dataSource](self, "dataSource"));
  unsigned __int8 v6 = [v5 currentUserHasMusicSubscription];

  if ((v6 & 1) == 0)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser options](self, "options"));
    if ([v3 isVoicePlayableContent])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlayItemsParser dataSource](self, "dataSource"));
      unsigned __int8 v4 = [v7 currentUserHasAnyCatalogPlayback];
    }

    else
    {
      unsigned __int8 v4 = 0;
    }

    goto LABEL_8;
  }

  unsigned __int8 v4 = 1;
  return v4 ^ 1;
}

+ (id)_identifierForSongDict:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"id"]);
  id v4 = [v3 longLongValue];

  if (v4) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPIdentifierSet tvm_identiferSetForSongWithStoreID:subscriptionID:]( &OBJC_CLASS___MPIdentifierSet,  "tvm_identiferSetForSongWithStoreID:subscriptionID:",  v4,  0LL));
  }
  else {
    uint64_t v5 = 0LL;
  }
  return v5;
}

+ (int64_t)_ratingValueFromStoreDictionary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_dictionaryForKey:", @"contentRatingsBySystem"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  if (v5)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", v5));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_numberForKey:", @"value"));

    id v8 = [v7 integerValue];
  }

  else
  {
    id v8 = 0LL;
  }

  return (int64_t)v8;
}

+ (int64_t)_ratingValueFromMAPIDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"attributes"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"attributes"]);

    if (!v8)
    {
      id v9 = 0LL;
      goto LABEL_7;
    }

    id v9 = [a1 _ratingValueFromStoreDictionary:v8];
    uint64_t v5 = (void *)v8;
  }

  else
  {
    id v9 = 0LL;
  }

LABEL_7:
  return (int64_t)v9;
}

+ (BOOL)_isMAPISongExplicit:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"attributes"]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_stringForKey:", @"contentRating"));
  unsigned __int8 v5 = [v4 isEqualToString:@"explicit"];

  return v5;
}

+ (BOOL)_isStoreSongExplicit:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"isExplicit"]);
  unsigned __int8 v6 = [v5 BOOLValue];

  BOOL v7 = (v6 & 1) != 0 || (uint64_t)[a1 _ratingValueFromStoreDictionary:v4] > 0;
  return v7;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (TVMusicPlayItemsOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (TVMusicPlayItemsDataSource)dataSource
{
  return self->_dataSource;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setError:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end