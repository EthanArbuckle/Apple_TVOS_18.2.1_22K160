@interface TVMusicJSPlaylistDetailViewController
+ (id)_contextDictionaryForPlaylistDictionary:(id)a3;
+ (id)_stringForPlaylistType:(int64_t)a3;
+ (void)dictionaryForPlaylist:(id)a3 completion:(id)a4;
+ (void)getViewControllerForPlaylist:(id)a3 completion:(id)a4;
- (BOOL)_getPlaylistEntryForViewElement:(id)a3 completion:(id)a4;
- (BOOL)_handleActionForViewElement:(id)a3;
- (BOOL)_handleCommand:(id)a3;
- (BOOL)_handleLongPressForViewElement:(id)a3;
- (BOOL)_handlePlayForViewElement:(id)a3;
- (BOOL)_isPlaylist:(id)a3 visuallySameAsPlaylist:(id)a4;
- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6;
- (MPModelPlaylist)playlist;
- (TVMusicJSPlaylistDetailViewController)initWithPlaylistDictionary:(id)a3 playlistModel:(id)a4;
- (TVMusicPlayItemsPAFData)pafData;
- (id)representedObject;
- (id)songsRequest;
- (void)_addPafDataToPlaybackIntent:(id)a3;
- (void)reloadData;
- (void)setPafData:(id)a3;
- (void)setPlaylist:(id)a3;
@end

@implementation TVMusicJSPlaylistDetailViewController

- (TVMusicJSPlaylistDetailViewController)initWithPlaylistDictionary:(id)a3 playlistModel:(id)a4
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSPlaylistDetailViewController _contextDictionaryForPlaylistDictionary:]( &OBJC_CLASS___TVMusicJSPlaylistDetailViewController,  "_contextDictionaryForPlaylistDictionary:",  a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 library]);
  id v11 = [v10 persistentID];

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 stringValue]);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicJSPlaylistDetailViewController;
  v13 = -[TVMusicJSDocumentViewController initWithContextDictionary:identifier:]( &v16,  "initWithContextDictionary:identifier:",  v8,  v11);
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_playlist, a4);
  }

  return v14;
}

- (id)songsRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  v2));

  return v3;
}

- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((id)TVElementEventSelect == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSPlaylistDetailViewController _handleActionForViewElement:]( self,  "_handleActionForViewElement:",  v11);
LABEL_8:
    BOOL v12 = v13;
    goto LABEL_9;
  }

  if ((id)TVElementEventHoldSelect == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSPlaylistDetailViewController _handleLongPressForViewElement:]( self,  "_handleLongPressForViewElement:",  v11);
    goto LABEL_8;
  }

  if ((id)TVElementEventPlay == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSPlaylistDetailViewController _handlePlayForViewElement:](self, "_handlePlayForViewElement:", v11);
    goto LABEL_8;
  }

  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (void)reloadData
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicJSPlaylistDetailViewController;
  -[TVMusicJSDocumentViewController reloadData](&v10, "reloadData");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "playlistsLibraryRequestWithParentPlaylistFolder:userEditableOnly:allowEmptyPlaylists:",  0LL,  0LL,  1LL));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v3 setAllowedItemIdentifiers:v6];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007A88;
  v7[3] = &unk_100268BC0;
  objc_copyWeak(&v8, &location);
  [v3 performWithResponseHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)representedObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v2));

  return v3;
}

+ (void)getViewControllerForPlaylist:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100007D28;
  v8[3] = &unk_100268C10;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [a1 dictionaryForPlaylist:v7 completion:v8];
}

+ (void)dictionaryForPlaylist:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  50LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  [v8 setObject:v9 forKeyedSubscript:@"name"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvm_dictionaryRepresentation"));
  [v8 setObject:v11 forKeyedSubscript:@"ids"];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringForPlaylistType:", objc_msgSend(v6, "type")));
  [v8 setObject:v12 forKeyedSubscript:@"type"];

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 curator]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  [v8 setObject:v14 forKeyedSubscript:@"curatorName"];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isFavorite]));
  [v8 setObject:v15 forKeyedSubscript:@"isFavorite"];

  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isDisliked]));
  [v8 setObject:v16 forKeyedSubscript:@"isDisliked"];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 library]);
  id v19 = [v18 persistentID];

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 library]);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v21 persistentID]));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSObject clientDataForItemType:persistentID:]( &OBJC_CLASS___TVMusicJSObject,  "clientDataForItemType:persistentID:",  @"playlist",  v23));
    if (v24) {
      [v8 setObject:v24 forKeyedSubscript:@"artworkClientData"];
    }
  }

  if ([v6 traits])
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 4LL));
    [v8 setObject:v25 forKeyedSubscript:@"audioTraits"];
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForPlaylist:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForPlaylist:",  v6));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100008214;
  v30[3] = &unk_100268C60;
  id v31 = v8;
  id v32 = v6;
  id v33 = v7;
  id v27 = v7;
  id v28 = v6;
  id v29 = v8;
  [v26 performWithResponseHandler:v30];
}

+ (id)_stringForPlaylistType:(int64_t)a3
{
  else {
    return *(&off_100268DA0 + a3);
  }
}

+ (id)_contextDictionaryForPlaylistDictionary:(id)a3
{
  v6[0] = @"documentType";
  v6[1] = @"documentData";
  v7[0] = @"playlist";
  v7[1] = a3;
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

- (BOOL)_isPlaylist:(id)a3 visuallySameAsPlaylist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 name]);
  if (v7 == (void *)v8)
  {
  }

  else
  {
    id v9 = (void *)v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    unsigned int v12 = [v10 isEqualToString:v11];

    if (!v12)
    {
      unsigned __int8 v13 = 0;
      goto LABEL_9;
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptionText]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionText]);
  if (v14 == v15)
  {
    unsigned __int8 v13 = 1;
  }

  else
  {
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v5 descriptionText]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 descriptionText]);
    unsigned __int8 v13 = [v16 isEqualToString:v17];
  }

LABEL_9:
  return v13;
}

- (BOOL)_handleActionForViewElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"command"]);

  if (v6) {
    unsigned __int8 v7 = -[TVMusicJSPlaylistDetailViewController _handleCommand:](self, "_handleCommand:", v6);
  }
  else {
    unsigned __int8 v7 = -[TVMusicJSPlaylistDetailViewController _handlePlayForViewElement:](self, "_handlePlayForViewElement:", v4);
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)_handleLongPressForViewElement:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100008790;
  v4[3] = &unk_100268CC8;
  v4[4] = self;
  return -[TVMusicJSPlaylistDetailViewController _getPlaylistEntryForViewElement:completion:]( self,  "_getPlaylistEntryForViewElement:completion:",  a3,  v4);
}

- (BOOL)_handlePlayForViewElement:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000886C;
  v4[3] = &unk_100268CC8;
  v4[4] = self;
  return -[TVMusicJSPlaylistDetailViewController _getPlaylistEntryForViewElement:completion:]( self,  "_getPlaylistEntryForViewElement:completion:",  a3,  v4);
}

- (BOOL)_getPlaylistEntryForViewElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"data-persistent-id"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"data-content-index"]);

  if ((objc_opt_respondsToSelector(v9, "longLongValue") & 1) != 0 && [v9 longLongValue])
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifiers]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 library]);
    id v15 = [v14 persistentID];

    if (v15)
    {
      objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v15));
      id v15 = (id)objc_claimAutoreleasedReturnValue([v16 stringValue]);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController songsRequest](self, "songsRequest"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100008E58;
    v23[3] = &unk_100268D38;
    id v24 = v11;
    id v25 = v6;
    v26 = self;
    id v27 = v7;
    [v17 performRequest:v18 withIdentifier:v15 ignoreCache:0 completion:v23];

    BOOL v19 = 1;
  }

  else
  {
    id v20 = sub_100008B0C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Can't get playlist entry for item %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_handleCommand:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shuffle"])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
    id v6 = v5;
    uint64_t v7 = 1LL;
    goto LABEL_5;
  }

  if ([v4 isEqualToString:@"play"])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController playlist](self, "playlist"));
    id v6 = v5;
    uint64_t v7 = 0LL;
LABEL_5:
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlaybackHelper playbackIntentForSongsInContainer:startIdentifiers:shuffle:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playbackIntentForSongsInContainer:startIdentifiers:shuffle:",  v6,  0LL,  v7));

    if (v8)
    {
      -[TVMusicJSPlaylistDetailViewController _addPafDataToPlaybackIntent:](self, "_addPafDataToPlaybackIntent:", v8);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100009214;
      v14[3] = &unk_100268CF0;
      id v15 = v8;
      id v9 = v14;
      block = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      BOOL v19 = sub_100009360;
      id v20 = &unk_100268D60;
      id v21 = v9;
      id v10 = v8;
      dispatch_async(&_dispatch_main_q, &block);
    }

    goto LABEL_9;
  }

  if (![v4 isEqualToString:@"more-menu"])
  {
    BOOL v12 = 0;
    goto LABEL_10;
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000091CC;
  v16[3] = &unk_100268CF0;
  v16[4] = self;
  id v11 = v16;
  block = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  BOOL v19 = sub_100009360;
  id v20 = &unk_100268D60;
  id v21 = v11;
  dispatch_async(&_dispatch_main_q, &block);

LABEL_9:
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (void)_addPafDataToPlaybackIntent:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController pafData](self, "pafData"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController pafData](self, "pafData"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 featureName]);
    [v9 setPlayActivityFeatureName:v6];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSPlaylistDetailViewController pafData](self, "pafData"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 recommendationData]);
    [v9 setPlayActivityRecommendationData:v8];
  }
}

- (TVMusicPlayItemsPAFData)pafData
{
  return self->_pafData;
}

- (void)setPafData:(id)a3
{
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end