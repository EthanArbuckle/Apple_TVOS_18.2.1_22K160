@interface JaliscoMediaImporter
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)includePreorders;
- (BOOL)needsUpdateForTokens;
- (JaliscoMediaImporter)initWithConnection:(id)a3 supportedMediaKindsHandler:(id)a4;
- (id)_chapterArtworkURLsForData:(id)a3 baseURL:(id)a4;
- (id)_chapterDataFromURL:(id)a3;
- (id)_importTracksFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withItemsResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (id)_supportedMediaKindsDatabasePropertyValue;
- (id)mediaFilter;
- (id)metadataKeys;
- (id)purchaseTokens;
- (id)queryFilter;
- (id)supportedMediaKinds;
- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (unsigned)onDiskRevision;
- (void)cancel;
- (void)clearNeedsUpdateForTokens;
@end

@implementation JaliscoMediaImporter

- (JaliscoMediaImporter)initWithConnection:(id)a3 supportedMediaKindsHandler:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___JaliscoMediaImporter;
  v8 = -[JaliscoImporter initWithConnection:](&v11, "initWithConnection:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_supportedMediaKindsHandler, a4);
  }

  return v9;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___JaliscoMediaImporter;
  -[JaliscoImporter cancel](&v7, "cancel");
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000DFB54;
  v5[3] = &unk_1001A5AC0;
  dispatch_semaphore_t v6 = v2;
  v4 = v2;
  [v3 cancelImportOperation:1 completionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (unsigned)onDiskRevision
{
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
  unsigned int v3 = [v2 jaliscoOnDiskDatabaseRevision];

  return v3;
}

- (BOOL)includePreorders
{
  return 1;
}

- (id)mediaFilter
{
  mediaFilter = self->_mediaFilter;
  if (!mediaFilter)
  {
    v4 = objc_alloc(&OBJC_CLASS___ICDJaliscoMediaFilter);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
    dispatch_semaphore_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 jaliscoLastExcludedMediaKinds]);
    objc_super v7 = -[ICDJaliscoMediaFilter initWithKindsToExclude:supportedMediaKindsHandler:]( v4,  "initWithKindsToExclude:supportedMediaKindsHandler:",  v6,  self->_supportedMediaKindsHandler);
    v8 = self->_mediaFilter;
    self->_mediaFilter = v7;

    mediaFilter = self->_mediaFilter;
  }

  return mediaFilter;
}

- (id)queryFilter
{
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoMediaImporter mediaFilter](self, "mediaFilter"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 daapQueryFilterString]);

  return v3;
}

- (id)purchaseTokens
{
  if (-[JaliscoMediaImporter onDiskRevision](self, "onDiskRevision"))
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter connection](self, "connection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userIdentity]);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v4));

    id v6 = v5;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    context = objc_autoreleasePoolPush();
    objc_super v7 = (void *)ML3TrackPropertyPurchaseHistoryID;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  ML3TrackPropertyPurchaseHistoryID,  &off_1001B41F8,  2LL));
    uint64_t v9 = ML3TrackPropertyStoreAccountID;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 jaliscoAccountID]);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v9,  v10,  1LL));
    v28[0] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:value:comparison:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:value:comparison:",  v9,  &off_1001B41F8,  1LL));
    v28[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AnyCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AnyCompoundPredicate,  "predicateMatchingPredicates:",  v13));

    v27[0] = v8;
    v27[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v27, 2LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[ML3AllCompoundPredicate predicateMatchingPredicates:]( &OBJC_CLASS___ML3AllCompoundPredicate,  "predicateMatchingPredicates:",  v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track queryWithLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "queryWithLibrary:predicate:",  v6,  v16));
    [v17 setIgnoreSystemFilterPredicates:1];
    v26[0] = v7;
    v26[1] = ML3TrackPropertyPurchaseHistoryToken;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000DFAC0;
    v24[3] = &unk_1001A6EC8;
    id v19 = v22;
    id v25 = v19;
    [v17 enumeratePersistentIDsAndProperties:v18 usingBlock:v24];

    for (uint64_t i = 1LL; i != -1; --i)
    objc_autoreleasePoolPop(context);
  }

  else
  {
    id v19 = &__NSDictionary0__struct;
  }

  return v19;
}

- (id)metadataKeys
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"dmap.longitemid",  @"daap.songalbumartist",  @"daap.songalbum",  @"daap.songalbumuserrating",  @"daap.songartist",  @"daap.songcomment",  @"daap.songcompilation",  @"daap.songcomposer",  @"daap.songcontentrating",  @"daap.songdateadded",  @"daap.songdatemodified",  @"daap.songdatepurchased",  @"daap.songdateplayed",  @"daap.songdatereleased",  @"daap.songdisabled",  @"daap.songdisccount",  @"daap.songdiscnumber",  @"daap.songexcludefromshuffle",  @"daap.songgenre",  @"daap.songgrouping",  @"daap.songlastskipdate",  @"daap.sortalbumartist",  @"daap.sortalbum",  @"daap.sortartist",  @"daap.sortcomposer",  @"daap.sortname",  @"daap.songstarttime",  @"daap.songstoptime",  @"daap.songtrackcount",  @"daap.songtracknumber",  @"daap.songyear",  @"daap.songuserplaycount",  @"daap.songuserrating",  @"daap.songalbumuserrating",  @"daap.songuserskipcount",  @"dmap.itemavailable",  @"dmap.itemhidden",  @"dmap.itemname",  @"com.apple.itunes.store.episode-screenshot",  @"com.apple.itunes.cloud-artwork-url",  @"com.apple.itunes.cloud-artwork-token",  @"com.apple.itunes.cloud-purchased-token",  @"com.apple.itunes.content-rating",  @"com.apple.itunes.item-flavor-listing",  @"com.apple.itunes.item-flavor",  @"com.apple.itunes.itms-artistid",  @"com.apple.itunes.itms-composerid",
           @"com.apple.itunes.itms-genreid",
           @"com.apple.itunes.itms-playlistid",
           @"com.apple.itunes.itms-songid",
           @"com.apple.itunes.itms-storefrontid",
           @"com.apple.itunes.extended-media-kind",
           @"daap.songcodectype",
           @"daap.songcodecsubtype",
           @"daap.songbitrate",
           @"daap.songbeatsperminute",
           @"daap.songsamplerate",
           @"daap.songformat",
           @"daap.songsize",
           @"daap.songlongsize",
           @"daap.songtime");
}

- (id)supportedMediaKinds
{
  supportedMediaKinds = self->_supportedMediaKinds;
  if (!supportedMediaKinds)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoMediaImporter mediaFilter](self, "mediaFilter"));
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue([v4 supportedMediaKinds]);
    id v6 = self->_supportedMediaKinds;
    self->_supportedMediaKinds = v5;

    supportedMediaKinds = self->_supportedMediaKinds;
  }

  return supportedMediaKinds;
}

- (BOOL)needsUpdateForTokens
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
  unsigned int v4 = [v3 jaliscoNeedsUpdateForTokens];

  if (v4)
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - JaliscoNeedsUpdateForTokens is YES, forcing a full token refresh.",  (uint8_t *)&v11,  0xCu);
    }

    BOOL v6 = 1;
  }

  else
  {
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 jaliscoLastSupportedMediaKinds]);

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[JaliscoMediaImporter _supportedMediaKindsDatabasePropertyValue]( self,  "_supportedMediaKindsDatabasePropertyValue"));
    if (v5 && (-[os_log_s isEqualToString:](v5, "isEqualToString:", v8) & 1) != 0)
    {
      BOOL v6 = 0;
    }

    else
    {
      uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543874;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v5;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@ - Supported media kinds are different, forcing a full token refresh. lastSupportedMediaKinds=%{publ ic}@, currentSupportedMediaKinds=%{public}@",  (uint8_t *)&v11,  0x20u);
      }

      BOOL v6 = 1;
    }
  }

  return v6;
}

- (void)clearNeedsUpdateForTokens
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
  [v2 setJaliscoNeedsUpdateForTokens:0];
}

- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([v12 responseCode] == (id)200) {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[JaliscoMediaImporter _importTracksFromRevision:toRevision:withItemsResponse:clientIdentity:itemsFiles:]( self,  "_importTracksFromRevision:toRevision:withItemsResponse:clientIdentity:itemsFiles:",  v10,  v9,  v12,  v13,  v14));
  }
  else {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"JaliscoImporterErrorDomain",  -1LL,  0LL));
  }
  v16 = (void *)v15;

  return v16;
}

- (id)_chapterDataFromURL:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));

  BOOL v6 = -[NSDictionary initWithContentsOfURL:](v4, "initWithContentsOfURL:", v5);
  return v6;
}

- (id)_chapterArtworkURLsForData:(id)a3 baseURL:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  id v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"chapters"]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"chapter-list"]);

  id v25 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"chapters"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"nominal-image-resolutions"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lastObject]);

  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"images"]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v10]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"url"]);

        if ([v18 length])
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"start"]);
          [v19 floatValue];
          uint64_t v21 = (float)(v20 * 1000.0);

          v22 = (void *)objc_claimAutoreleasedReturnValue([v27 URLByAppendingPathComponent:v18 isDirectory:0]);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v21));
          [v28 setObject:v22 forKey:v23];
        }
      }

      id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v12);
  }

  return v28;
}

- (id)_importTracksFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withItemsResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a5;
  id v60 = a6;
  id v61 = a7;
  v59 = v11;
  if (!v11)
  {
    id v15 = 0LL;
    goto LABEL_31;
  }

  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x3032000000LL;
  v83 = sub_1000DF464;
  v84 = sub_1000DF474;
  id v85 = 0LL;
  context = objc_autoreleasePoolPush();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter connection](self, "connection"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v12 userIdentity]);

  v63 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  LODWORD(v13) = 0;
  -[JaliscoImporter setProgress:](self, "setProgress:", v13);
  if ([v61 count])
  {
    id v14 = v61;
  }

  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v11 responseDataFileURL]);
    v91 = v16;
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
  }

  sub_1000C1FC0(4, v10, v9, v14, 0LL, 0LL, 0LL);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
  v56 = (void *)objc_claimAutoreleasedReturnValue([v17 databasePath]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter musicLibrary](self, "musicLibrary"));
  id v19 = objc_msgSend(v18, "icd_preferredVideoQuality");

  float v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentityStore defaultIdentityStore](&OBJC_CLASS___ICUserIdentityStore, "defaultIdentityStore"));
  id v79 = 0LL;
  v55 = (void *)objc_claimAutoreleasedReturnValue([v20 getPropertiesForUserIdentity:v58 error:&v79]);
  id v57 = v79;

  if (v57)
  {
    uint64_t v21 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "msv_description"));
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to load properties for identity %{public}@ error=%{public}@",  buf,  0x16u);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "msv_map:", &stru_1001A5B00));
  uint64_t v24 = ML3DatabaseImportDataForDAAPFilePaths();
  v54 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v25 = [[ML3MutableDatabaseImport alloc] initWithLibraryPath:v56 trackData:v54 playlistData:0 clientIdentity:v60];
  [v25 setPreferredVideoQuality:v19];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v55 DSID]);
  objc_msgSend(v25, "setStoreAccountID:", objc_msgSend(v26, "longLongValue"));
  v53 = v25;

  objc_initWeak(&location, self);
  if (!(_DWORD)v10)
  {
    uint64_t v90 = objc_opt_class(&OBJC_CLASS___ML3Album, v27);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v90, 1LL));
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter configuration](self, "configuration"));
    +[CloudKeepLocalUtilities downPinCollectionsForClasses:configuration:]( &OBJC_CLASS___CloudKeepLocalUtilities,  "downPinCollectionsForClasses:configuration:",  v28,  v29);
  }

  dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[MLMediaLibraryService sharedMediaLibraryService]( &OBJC_CLASS___MLMediaLibraryService,  "sharedMediaLibraryService"));
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_1000DF47C;
  v76[3] = &unk_1001A5B28;
  objc_copyWeak(&v77, &location);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_1000DF4C4;
  v72[3] = &unk_1001A5B50;
  objc_copyWeak(&v75, &location);
  v72[4] = self;
  v74 = &v80;
  dispatch_semaphore_t dsema = v30;
  dispatch_semaphore_t v73 = dsema;
  [v31 performImport:v53 fromSource:1 withProgressBlock:v76 completionHandler:v72];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (!(_DWORD)v10)
  {
    uint64_t v89 = objc_opt_class(&OBJC_CLASS___ML3Album, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89, 1LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter configuration](self, "configuration"));
    +[CloudKeepLocalUtilities rePinCollectionsForClasses:configuration:]( &OBJC_CLASS___CloudKeepLocalUtilities,  "rePinCollectionsForClasses:configuration:",  v33,  v34);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v88 = 0;
  -[JaliscoImporter setProgress:](self, "setProgress:", COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000LL));
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id obj = v14;
  id v35 = [obj countByEnumeratingWithState:&v68 objects:v86 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v69;
    do
    {
      for (uint64_t i = 0LL; i != v35; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
        v39 = objc_autoreleasePoolPush();
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v38,  1LL,  0LL));
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472LL;
        v65[2] = sub_1000DF620;
        v65[3] = &unk_1001A5B78;
        v65[4] = self;
        v67 = buf;
        v66 = v63;
        +[ICDResponseDataParser enumerateItemsInResponseData:usingHandler:]( &OBJC_CLASS___ICDResponseDataParser,  "enumerateItemsInResponseData:usingHandler:",  v40,  v65);

        objc_autoreleasePoolPop(v39);
      }

      id v35 = [obj countByEnumeratingWithState:&v68 objects:v86 count:16];
    }

    while (v35);
  }

  if (!v81[5] && -[NSMutableDictionary count](v63, "count"))
  {
    v41 = (JaliscoLoadChapterArtworkOperation *)objc_claimAutoreleasedReturnValue( +[ICDeviceInfo currentDeviceInfo]( &OBJC_CLASS___ICDeviceInfo,  "currentDeviceInfo"));
    if ((-[JaliscoLoadChapterArtworkOperation isAppleTV](v41, "isAppleTV") & 1) == 0)
    {
      unsigned __int8 v42 = -[JaliscoImporter isCancelled](self, "isCancelled");

      if ((v42 & 1) != 0) {
        goto LABEL_27;
      }
      v43 = objc_alloc(&OBJC_CLASS___JaliscoLoadChapterArtworkOperation);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter configuration](self, "configuration"));
      v41 = -[JaliscoLoadChapterArtworkOperation initWithConfiguration:clientIdentity:dictionary:]( v43,  "initWithConfiguration:clientIdentity:dictionary:",  v44,  v60,  v63);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter configuration](self, "configuration"));
      v46 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v45));
      [v46 addOperation:v41 forLibraryType:0 priority:2];
    }
  }

- (id)_supportedMediaKindsDatabasePropertyValue
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoMediaImporter mediaFilter](self, "mediaFilter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 supportedMediaKinds]);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);

  return v4;
}

- (void).cxx_destruct
{
}

+ (id)logCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
}

+ (id)oversizeLogCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");
}

@end