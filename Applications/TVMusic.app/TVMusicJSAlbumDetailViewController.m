@interface TVMusicJSAlbumDetailViewController
+ (BOOL)_loadSongPopularityForAlbum:(id)a3;
+ (id)_contextDictionaryForAlbumDictionary:(id)a3;
+ (id)dictionaryForAlbum:(id)a3 trackCount:(int64_t)a4;
+ (id)songsRequestForAlbum:(id)a3 filterObject:(id)a4;
+ (void)getDictionaryForAlbum:(id)a3 filterObject:(id)a4 completion:(id)a5;
+ (void)getViewControllerForAlbum:(id)a3 optionalGenreOrComposer:(id)a4 completion:(id)a5;
- (BOOL)_getSongForViewElement:(id)a3 completion:(id)a4;
- (BOOL)_handleActionForViewElement:(id)a3;
- (BOOL)_handleCommand:(id)a3;
- (BOOL)_handleLongPressForViewElement:(id)a3;
- (BOOL)_handlePlayForViewElement:(id)a3;
- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6;
- (MPModelAlbum)album;
- (MPModelObject)filterObject;
- (TVMusicJSAlbumDetailViewController)initWithAlbumDictionary:(id)a3 albumModel:(id)a4;
- (TVMusicJSAlbumDetailViewController)initWithAlbumDictionary:(id)a3 albumModel:(id)a4 optionalGenreOrComposer:(id)a5;
- (TVMusicPlayItemsPAFData)pafData;
- (id)representedObject;
- (id)songsRequest;
- (void)_addPafDataToPlaybackIntent:(id)a3;
- (void)reloadData;
- (void)setAlbum:(id)a3;
- (void)setFilterObject:(id)a3;
- (void)setPafData:(id)a3;
@end

@implementation TVMusicJSAlbumDetailViewController

- (TVMusicJSAlbumDetailViewController)initWithAlbumDictionary:(id)a3 albumModel:(id)a4
{
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSAlbumDetailViewController _contextDictionaryForAlbumDictionary:]( &OBJC_CLASS___TVMusicJSAlbumDetailViewController,  "_contextDictionaryForAlbumDictionary:",  a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 identifiers]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 library]);
  id v11 = [v10 persistentID];

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v12 stringValue]);
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TVMusicJSAlbumDetailViewController;
  v13 = -[TVMusicJSDocumentViewController initWithContextDictionary:identifier:]( &v16,  "initWithContextDictionary:identifier:",  v8,  v11);
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_album, a4);
  }

  return v14;
}

- (TVMusicJSAlbumDetailViewController)initWithAlbumDictionary:(id)a3 albumModel:(id)a4 optionalGenreOrComposer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v11 = -[TVMusicJSAlbumDetailViewController initWithAlbumDictionary:albumModel:]( self,  "initWithAlbumDictionary:albumModel:",  a3,  v8);
  if (v11)
  {
    if (v9)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MPModelGenre, v10);
      if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0
        || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___MPModelComposer, v13), (objc_opt_isKindOfClass(v9, v14) & 1) != 0))
      {
        objc_storeStrong((id *)&v11->_filterObject, a5);
      }

      else
      {
        id v15 = sub_10000FAF4();
        objc_super v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Only Genre and Composer are supported as filter objects for album",  v18,  2u);
        }
      }
    }

    +[TVMusicJSAlbumDetailViewController _loadSongPopularityForAlbum:]( &OBJC_CLASS___TVMusicJSAlbumDetailViewController,  "_loadSongPopularityForAlbum:",  v8);
  }

  return v11;
}

+ (id)songsRequestForAlbum:(id)a3 filterObject:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory songsLibraryRequestForAlbum:]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "songsLibraryRequestForAlbum:",  a3));
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scopedContainers]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 scopedContainers]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObject:v5]);
      [v7 setScopedContainers:v10];
    }

    else
    {
      id v12 = v5;
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
      [v7 setScopedContainers:v9];
    }
  }

  return v7;
}

- (id)songsRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController filterObject](self, "filterObject"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSAlbumDetailViewController songsRequestForAlbum:filterObject:]( &OBJC_CLASS___TVMusicJSAlbumDetailViewController,  "songsRequestForAlbum:filterObject:",  v3,  v4));

  return v5;
}

- (BOOL)handleEvent:(id)a3 targetResponder:(id)a4 viewElement:(id)a5 extraInfo:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((id)TVElementEventSelect == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSAlbumDetailViewController _handleActionForViewElement:](self, "_handleActionForViewElement:", v11);
LABEL_8:
    BOOL v12 = v13;
    goto LABEL_9;
  }

  if ((id)TVElementEventHoldSelect == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSAlbumDetailViewController _handleLongPressForViewElement:]( self,  "_handleLongPressForViewElement:",  v11);
    goto LABEL_8;
  }

  if ((id)TVElementEventPlay == v9)
  {
    unsigned __int8 v13 = -[TVMusicJSAlbumDetailViewController _handlePlayForViewElement:](self, "_handlePlayForViewElement:", v11);
    goto LABEL_8;
  }

  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (void)reloadData
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicJSAlbumDetailViewController;
  -[TVMusicJSDocumentViewController reloadData](&v10, "reloadData");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifiers]);
  id v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v3 setAllowedItemIdentifiers:v6];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000FEDC;
  v7[3] = &unk_100268BC0;
  objc_copyWeak(&v8, &location);
  [v3 performWithResponseHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)representedObject
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MPModelGenericObject genericObjectWithModelObject:]( &OBJC_CLASS___MPModelGenericObject,  "genericObjectWithModelObject:",  v2));

  return v3;
}

+ (void)getViewControllerForAlbum:(id)a3 optionalGenreOrComposer:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100010188;
  v11[3] = &unk_100269228;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [a1 getDictionaryForAlbum:v10 filterObject:v9 completion:v11];
}

+ (void)getDictionaryForAlbum:(id)a3 filterObject:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 songsRequestForAlbum:v8 filterObject:a4]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000103A0;
  v13[3] = &unk_100269250;
  id v15 = v9;
  id v16 = a1;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 performWithResponseHandler:v13];
}

+ (id)dictionaryForAlbum:(id)a3 trackCount:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  50LL));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", @"YYYY-MM-dd");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
  [v6 setObject:v8 forKeyedSubscript:@"name"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 artist]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  [v6 setObject:v10 forKeyedSubscript:@"artistName"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 genre]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 name]);
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 genre]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
    v49 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
    [v6 setObject:v15 forKeyedSubscript:@"genreNames"];
  }

  else
  {
    [v6 setObject:&__NSArray0__struct forKeyedSubscript:@"genreNames"];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  [v6 setObject:v16 forKeyedSubscript:@"trackCount"];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isFavorite]));
  [v6 setObject:v17 forKeyedSubscript:@"isFavorite"];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isDisliked]));
  [v6 setObject:v18 forKeyedSubscript:@"isDisliked"];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tvm_dictionaryRepresentation"));
  [v6 setObject:v20 forKeyedSubscript:@"ids"];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 library]);
  id v23 = [v22 persistentID];

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 library]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v25 persistentID]));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringValue]);

    [v6 setObject:v27 forKeyedSubscript:@"persistentID"];
  }

  else
  {
    v27 = 0LL;
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 universalStore]);
  id v30 = [v29 adamID];
  if (v30)
  {
    id v31 = v30;
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v5 identifiers]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v32 universalStore]);
    id v31 = [v33 subscriptionAdamID];

    if (!v31) {
      goto LABEL_11;
    }
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v31));
  v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stringValue]);
  [v6 setObject:v35 forKeyedSubscript:@"id"];

LABEL_11:
  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDateComponents]);
  if ((uint64_t)[v36 year] < 1)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDateComponents]);
    v38 = (void *)objc_claimAutoreleasedReturnValue([v37 date]);

    if (!v38) {
      goto LABEL_18;
    }
  }

  else
  {
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSCalendar calendarWithIdentifier:]( &OBJC_CLASS___NSCalendar,  "calendarWithIdentifier:",  NSCalendarIdentifierGregorian));
  v40 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDateComponents]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v40 date]);
  v42 = v41;
  if (v41)
  {
    id v43 = v41;
  }

  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDateComponents]);
    id v43 = (id)objc_claimAutoreleasedReturnValue([v39 dateFromComponents:v44]);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v7, "stringFromDate:", v43));
  [v6 setObject:v45 forKeyedSubscript:@"releaseDate"];

LABEL_18:
  if (v27)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicJSObject clientDataForItemType:persistentID:]( &OBJC_CLASS___TVMusicJSObject,  "clientDataForItemType:persistentID:",  @"album",  v27));
    if (v46) {
      [v6 setObject:v46 forKeyedSubscript:@"artworkClientData"];
    }
  }

  if ([v5 traits])
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 6LL));
    [v6 setObject:v47 forKeyedSubscript:@"audioTraits"];
  }

  return v6;
}

+ (id)_contextDictionaryForAlbumDictionary:(id)a3
{
  v6[0] = @"documentType";
  v6[1] = @"documentData";
  v7[0] = @"album";
  v7[1] = a3;
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

- (BOOL)_handleActionForViewElement:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"command"]);

  if (v6) {
    unsigned __int8 v7 = -[TVMusicJSAlbumDetailViewController _handleCommand:](self, "_handleCommand:", v6);
  }
  else {
    unsigned __int8 v7 = -[TVMusicJSAlbumDetailViewController _handlePlayForViewElement:](self, "_handlePlayForViewElement:", v4);
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)_handleLongPressForViewElement:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010B90;
  v4[3] = &unk_100269278;
  v4[4] = self;
  return -[TVMusicJSAlbumDetailViewController _getSongForViewElement:completion:]( self,  "_getSongForViewElement:completion:",  a3,  v4);
}

- (BOOL)_handlePlayForViewElement:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010C4C;
  v4[3] = &unk_100269278;
  v4[4] = self;
  return -[TVMusicJSAlbumDetailViewController _getSongForViewElement:completion:]( self,  "_getSongForViewElement:completion:",  a3,  v4);
}

- (BOOL)_getSongForViewElement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"music-track-type"]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 attributes]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"data-content-index"]);

    if ((objc_opt_respondsToSelector(v11, "integerValue") & 1) != 0
      && (id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album")),
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifiers]),
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 library]),
          id v15 = [v14 persistentID],
          v14,
          v13,
          v12,
          v15))
    {
      id v16 = [v11 integerValue];
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifiers]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 library]);
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v19 persistentID]));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 stringValue]);

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController songsRequest](self, "songsRequest"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_1000111AC;
      v29[3] = &unk_1002692C0;
      id v33 = v16;
      id v30 = v6;
      id v31 = self;
      id v32 = v7;
      [v22 performRequest:v23 withIdentifier:v21 ignoreCache:0 completion:v29];

      BOOL v24 = 1;
    }

    else
    {
      id v25 = sub_10000FAF4();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
        *(_DWORD *)buf = 138412546;
        v35 = v27;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Can't find track index for album [%@] in item [%@]",  buf,  0x16u);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0LL);
      BOOL v24 = 0;
    }
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)_handleCommand:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shuffle"])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController album](self, "album"));
    BOOL v6 = 1;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicPlaybackHelper playbackIntentForSongsInContainer:startIdentifiers:shuffle:]( &OBJC_CLASS___TVMusicPlaybackHelper,  "playbackIntentForSongsInContainer:startIdentifiers:shuffle:",  v5,  0LL,  1LL));

    -[TVMusicJSAlbumDetailViewController _addPafDataToPlaybackIntent:](self, "_addPafDataToPlaybackIntent:", v7);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000114B8;
    v13[3] = &unk_100268CF0;
    id v14 = v7;
    BOOL v8 = v13;
    block = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_100011BB0;
    v18 = &unk_100268D60;
    id v19 = v8;
    id v9 = v7;
    dispatch_async(&_dispatch_main_q, &block);
  }

  else if ([v4 isEqualToString:@"more-menu"])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000114CC;
    v12[3] = &unk_100268CF0;
    v12[4] = self;
    id v10 = v12;
    block = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_100011BB0;
    v18 = &unk_100268D60;
    id v19 = v10;
    dispatch_async(&_dispatch_main_q, &block);

    BOOL v6 = 1;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_loadSongPopularityForAlbum:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 universalStore]);
  id v6 = [v5 adamID];
  if (v6)
  {
    id v7 = v6;

LABEL_4:
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringValue]);

    id v12 = objc_alloc_init(&OBJC_CLASS___ICStorePlatformRequest);
    BOOL v24 = v11;
    LOBYTE(v7) = 1;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
    [v12 setItemIdentifiers:v13];

    [v12 setPersonalizationStyle:0];
    [v12 setKeyProfile:ICStorePlatformKeyProfileProduct];
    id v14 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    uint64_t v16 = -[ICStoreRequestContext initWithIdentity:](v14, "initWithIdentity:", v15);
    [v12 setRequestContext:v16];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10001177C;
    v21[3] = &unk_100269328;
    id v22 = v11;
    id v23 = v3;
    id v17 = v11;
    id v18 = [v12 performWithResponseHandler:v21];

    goto LABEL_5;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 identifiers]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
  id v7 = [v9 subscriptionAdamID];

  if (v7) {
    goto LABEL_4;
  }
  id v20 = sub_10000FAF4();
  id v12 = (id)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Can't get song popularity for album: %@",  buf,  0xCu);
    LOBYTE(v7) = 0;
  }

- (void)_addPafDataToPlaybackIntent:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController pafData](self, "pafData"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController pafData](self, "pafData"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 featureName]);
    [v9 setPlayActivityFeatureName:v6];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSAlbumDetailViewController pafData](self, "pafData"));
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

- (MPModelAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (MPModelObject)filterObject
{
  return self->_filterObject;
}

- (void)setFilterObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end