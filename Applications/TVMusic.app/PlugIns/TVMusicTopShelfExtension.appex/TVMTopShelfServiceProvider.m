@interface TVMTopShelfServiceProvider
- (BOOL)_isLibraryImporting;
- (BOOL)_useSectionStyle;
- (BOOL)disableCarousel;
- (CGSize)screenSize;
- (NSArray)preferredFlavors;
- (NSArray)top25AlbumIDs;
- (NSMutableSet)cachedFilenames;
- (NSString)musicAppBundleVersion;
- (OS_dispatch_queue)sectionCompletionQueue;
- (TVMTopShelfServiceProvider)init;
- (TVSPreferences)musicPreferences;
- (double)displayScale;
- (id)_artworkCatalogForGenericObject:(id)a3 title:(id *)a4;
- (id)_artworkCatalogForGenericObject:(id)a3 title:(id *)a4 isMusicVideo:(BOOL *)a5;
- (id)_getArtworkURLForItemID:(id)a3 fromPlatformResults:(id)a4;
- (id)_getPreviewVideoURLForItemID:(id)a3 fromPlatformResults:(id)a4;
- (id)_storePlatformRequestQueryItemsWithItemIdentifiers:(id)a3 profile:(id)a4;
- (id)_storeRequestContext;
- (id)_topAlbumsSectionForStoreResponse:(id)a3;
- (id)preferencesToken;
- (id)topAlbumsURLWithBaseURL:(id)a3;
- (int64_t)libraryState;
- (int64_t)recentlyAddedCount;
- (void)_deleteCookieWithName:(id)a3 inRequest:(id)a4;
- (void)_getCarouselItemsForPlaylistDictionary:(id)a3 playlistIDs:(id)a4 urlBag:(id)a5 completion:(id)a6;
- (void)_getRecentlyAddedSection:(id)a3;
- (void)_getTopAlbumsSectionFromURL:(id)a3 completion:(id)a4;
- (void)_getURLForArtworkCatalog:(id)a3 mpObject:(id)a4 completionHandler:(id)a5;
- (void)_libraryUpdated:(id)a3;
- (void)_loadCarouselContentWithBag:(id)a3 completion:(id)a4;
- (void)_loadSectionedContentWithBag:(id)a3 completion:(id)a4;
- (void)_requestMetadataForIdentifiers:(id)a3 baseURL:(id)a4 completion:(id)a5;
- (void)_requestMetadataForIdentifiers:(id)a3 urlBag:(id)a4 completion:(id)a5;
- (void)_requestStoreDataFromURL:(id)a3 completion:(id)a4;
- (void)_topShelfSectionedContentWithBag:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
- (void)setCachedFilenames:(id)a3;
- (void)setDisableCarousel:(BOOL)a3;
- (void)setDisplayScale:(double)a3;
- (void)setLibraryState:(int64_t)a3;
- (void)setMusicAppBundleVersion:(id)a3;
- (void)setMusicPreferences:(id)a3;
- (void)setPreferencesToken:(id)a3;
- (void)setPreferredFlavors:(id)a3;
- (void)setRecentlyAddedCount:(int64_t)a3;
- (void)setScreenSize:(CGSize)a3;
- (void)setSectionCompletionQueue:(id)a3;
- (void)setTop25AlbumIDs:(id)a3;
@end

@implementation TVMTopShelfServiceProvider

- (TVMTopShelfServiceProvider)init
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVMTopShelfServiceProvider;
  v2 = -[TVMTopShelfServiceProvider init](&v20, "init");
  if (v2)
  {
    id v3 = sub_100007CDC();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[TVMTopShelfServiceProvider init]";
      __int16 v23 = 2080;
      v24 = "-[TVMTopShelfServiceProvider init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
    }

    preferredFlavors = v2->_preferredFlavors;
    v2->_preferredFlavors = (NSArray *)&off_100015750;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.TVMusicTopShelfExtension", 0LL);
    sectionCompletionQueue = v2->_sectionCompletionQueue;
    v2->_sectionCompletionQueue = (OS_dispatch_queue *)v6;

    id v8 = [[LSApplicationRecord alloc] initWithBundleIdentifier:@"com.apple.TVMusic" allowPlaceholder:0 error:0];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 shortVersionString]);
    musicAppBundleVersion = v2->_musicAppBundleVersion;
    v2->_musicAppBundleVersion = (NSString *)v9;

    if (!v2->_musicAppBundleVersion)
    {
      id v11 = sub_100007CDC();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v14 = (char *)objc_claimAutoreleasedReturnValue([v13 bundleURL]);
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Could not get client version from bundle: %@",  buf,  0xCu);
      }
    }

    v2->_libraryState = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    v2->_disableCarousel = [v15 BOOLForKey:@"DisableCarousel"];

    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[TVSPreferences preferencesWithDomain:]( &OBJC_CLASS___TVSPreferences,  "preferencesWithDomain:",  @"com.apple.TVMusic"));
    musicPreferences = v2->_musicPreferences;
    v2->_musicPreferences = (TVSPreferences *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  @"com.apple.TVMusic",  &stru_100014930));
    -[TVMTopShelfServiceProvider setPreferencesToken:](v2, "setPreferencesToken:", v18);
  }

  return v2;
}

- (void)dealloc
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider preferencesToken](self, "preferencesToken"));
  +[TVSPreferences removeDomainObserver:](&OBJC_CLASS___TVSPreferences, "removeDomainObserver:", v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMTopShelfServiceProvider;
  -[TVMTopShelfServiceProvider dealloc](&v4, "dealloc");
}

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = sub_100007CDC();
  dispatch_queue_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "loadTopShelfContentWithCompletionHandler:",  (uint8_t *)buf,  2u);
  }

  double v7 = (double)(int)((uint64_t (*)(const __CFString *, uint64_t))MGGetSInt32Answer)( @"main-screen-width",  1920LL);
  MGGetSInt32Answer(@"main-screen-height", 1080LL);
  -[TVMTopShelfServiceProvider setScreenSize:](self, "setScreenSize:", v7, (double)v8);
  -[TVMTopShelfServiceProvider setDisplayScale:]( self,  "setDisplayScale:",  MGGetFloat32Answer(@"main-screen-scale", 1.0));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  @"TVMusicTopShelf",  @"1"));
  objc_initWeak(buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007FA4;
  v12[3] = &unk_100014980;
  objc_copyWeak(&v15, buf);
  id v10 = v4;
  id v14 = v10;
  id v11 = v9;
  id v13 = v11;
  -[TVMTopShelfServiceProvider _loadCarouselContentWithBag:completion:]( self,  "_loadCarouselContentWithBag:completion:",  v11,  v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (void)_loadCarouselContentWithBag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v9 = [v8 effectiveBoolValueForSetting:MCFeatureMusicVideosAllowed];

  if (-[TVMTopShelfServiceProvider disableCarousel](self, "disableCarousel")
    || v9 != 1
    || -[TVMTopShelfServiceProvider _useSectionStyle](self, "_useSectionStyle"))
  {
    id v10 = sub_100007CDC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      unsigned int v17 = -[TVMTopShelfServiceProvider disableCarousel](self, "disableCarousel");
      __int16 v18 = 1024;
      BOOL v19 = v9 == 1;
      __int16 v20 = 1024;
      unsigned int v21 = -[TVMTopShelfServiceProvider _useSectionStyle](self, "_useSectionStyle");
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Not using carousel display: DisableCarousel=%{BOOL}d, allowVideo=%{BOOL}d, sectionStyle=%{BOOL}d",  buf,  0x14u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0LL, 0LL);
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForKey:@"atv-music-homescreen-url"]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000083B4;
    v13[3] = &unk_1000149F8;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v12 valueWithCompletion:v13];
  }
}

- (BOOL)_useSectionStyle
{
  return -[TVSPreferences integerForKey:]( self->_musicPreferences,  "integerForKey:",  @"MusicTopShelfStyle") == 1;
}

- (void)_getCarouselItemsForPlaylistDictionary:(id)a3 playlistIDs:(id)a4 urlBag:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v58 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v10 count]));
  v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v10 count]));
  if (!v11)
  {
    id v14 = sub_100007CDC();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No ordered Playlist array, getting unordered list of playlists from response dictionary.",  buf,  2u);
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  }

  v56 = self;
  id v57 = v12;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v77 = 0u;
  __int128 v76 = 0u;
  id obj = v11;
  id v16 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v66 = *(void *)v77;
    v59 = v13;
    id v60 = v10;
LABEL_7:
    uint64_t v18 = 0LL;
    id v61 = v17;
    while (1)
    {
      if (*(void *)v77 != v66) {
        objc_enumerationMutation(obj);
      }
      BOOL v19 = *(void **)(*((void *)&v76 + 1) + 8 * v18);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvs_dictionaryForKey:", v19));
      unsigned int v21 = v20;
      if (v20
        && (v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"kind"]),
            unsigned int v23 = [v22 isEqualToString:@"playlist"],
            v22,
            v23))
      {
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"name"]);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tvs_arrayForKey:", @"firstTracks"));
        uint64_t v26 = objc_claimAutoreleasedReturnValue([v25 firstObject]);
        v64 = (void *)v26;
        if (v26)
        {
          uint64_t v27 = v26;
          id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v19,  v26));
          [v62 setObject:v27 forKeyedSubscript:v28];
        }

        else
        {
          id v28 = v19;
          id v30 = sub_100007CDC();
          v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v81 = v24;
            __int16 v82 = 2112;
            id v83 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "No first track IDs for playlist: %@, ID %@",  buf,  0x16u);
          }
        }

        v63 = v28;
        id v32 = [[TVTopShelfCarouselItem alloc] initWithIdentifier:v28];
        [v32 setTitle:v24];
        id v33 = sub_100007CDC();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 identifier]);
          *(_DWORD *)buf = 138412290;
          v81 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Carousel item ID: %@", buf, 0xCu);
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://play/playlist?storeID=%@&type=musicVideo",  @"com.apple.TVMusic",  v19));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v36));

        id v38 = [[TVTopShelfAction alloc] initWithURL:v37];
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue( [v39 localizedStringForKey:@"PlayButtonTitle" value:&stru_100014E90 table:0]);
        [v38 _setTitle:v40];

        [v32 setPlayAction:v38];
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@://showPlaylist?playlistID=%@",  @"com.apple.TVMusic",  v19));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v41));

        id v43 = [[TVTopShelfAction alloc] initWithURL:v42];
        [v32 setDisplayAction:v43];
        [v59 addObject:v32];

        id v13 = v59;
        id v10 = v60;
        id v17 = v61;
      }

      else
      {
        id v29 = sub_100007CDC();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v81 = (os_log_s *)v19;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Can't find playlist in dictionary with ID %@",  buf,  0xCu);
        }
      }

      id v44 = [v13 count];
      if (v17 == (id)++v18)
      {
        id v17 = [obj countByEnumeratingWithState:&v76 objects:v84 count:16];
        if (v17) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue([v62 allValues]);
  id v46 = [v45 count];
  id v47 = sub_100007CDC();
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  v49 = v48;
  if (v46)
  {
    v50 = v57;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v81 = (os_log_s *)v45;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Music Video IDs: %@", buf, 0xCu);
    }

    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472LL;
    v72[2] = sub_100008FB4;
    v72[3] = &unk_100014A20;
    id v51 = v13;
    id v73 = v51;
    id v74 = v62;
    v75 = v56;
    v52 = objc_retainBlock(v72);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tvs_dictionaryForKey:", @"children"));
    if ([v53 count])
    {
      ((void (*)(void *, void *))v52[2])(v52, v53);
      v58[2](v58, v51);
    }

    else
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472LL;
      v67[2] = sub_1000093B0;
      v67[3] = &unk_100014A48;
      v70 = v52;
      id v68 = v45;
      v71 = v58;
      id v69 = v51;
      -[TVMTopShelfServiceProvider _requestMetadataForIdentifiers:urlBag:completion:]( v56,  "_requestMetadataForIdentifiers:urlBag:completion:",  v68,  v57,  v67);
    }

    v55 = v58;
  }

  else
  {
    v50 = v57;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (os_log_s *)[v13 count];
      *(_DWORD *)buf = 134217984;
      v81 = v54;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "No preview videos are available for %ld returned carousel items.",  buf,  0xCu);
    }

    v55 = v58;
    v58[2](v58, v13);
  }
}

- (void)_deleteCookieWithName:(id)a3 inRequest:(id)a4
{
  id v26 = a3;
  id v5 = a4;
  id v6 = @"cookie";
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 valueForHTTPHeaderField:@"cookie"]);
  if (v7
    || (id v6 = @"Cookie",
        (id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 valueForHTTPHeaderField:@"Cookie"])) != 0))
  {
    int v8 = v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s componentsSeparatedByString:](v7, "componentsSeparatedByString:", @"; "));
    id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      unsigned int v23 = v6;
      v24 = v8;
      v25 = v5;
      int v14 = 0;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          id v18 = [v17 rangeOfString:@"=" options:2];
          if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v19 = (void *)objc_claimAutoreleasedReturnValue([v17 substringToIndex:v18]);
            if ([v26 caseInsensitiveCompare:v19])
            {
              if (-[NSMutableString length](v10, "length")) {
                -[NSMutableString appendString:](v10, "appendString:", @"; ");
              }
              -[NSMutableString appendString:](v10, "appendString:", v17);
            }

            else
            {
              id v20 = sub_100007CDC();
              unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v19;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Deleted cookie named \"%@\"",  buf,  0xCu);
              }

              ++v14;
            }
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }

      while (v13);

      int v8 = v24;
      id v5 = v25;
      if (v14 >= 1) {
        [v25 setValue:v10 forHTTPHeaderField:v23];
      }
    }

    else
    {
    }
  }

  else
  {
    id v22 = sub_100007CDC();
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cookies not found in request!", buf, 2u);
    }
  }
}

- (void)_requestMetadataForIdentifiers:(id)a3 urlBag:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a4 URLForKey:@"storeplatform-lookup-url-unpersonalized"]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000982C;
  v13[3] = &unk_1000149F8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 valueWithCompletion:v13];
}

- (void)_requestMetadataForIdentifiers:(id)a3 baseURL:(id)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = ICStorePlatformKeyProfileProduct;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMTopShelfServiceProvider _storePlatformRequestQueryItemsWithItemIdentifiers:profile:]( self,  "_storePlatformRequestQueryItemsWithItemIdentifiers:profile:",  a3,  v9));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_URLByAppendingQueryItems:", v11));

  id v13 = -[NSMutableURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSMutableURLRequest), "initWithURL:", v12);
  id v14 = objc_alloc(&OBJC_CLASS___NSString);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v15 timeIntervalSince1970];
  id v17 = -[NSString initWithFormat:](v14, "initWithFormat:", @"%.0f", v16);

  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v13, "setValue:forHTTPHeaderField:", v17, @"X-JS-TIMESTAMP");
  id v18 = objc_alloc(&OBJC_CLASS___ICStoreURLRequest);
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider _storeRequestContext](self, "_storeRequestContext"));
  id v20 = [v18 initWithURLRequest:v13 requestContext:v19];

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[ICJSSignConfiguration storePlatformConfiguration]( &OBJC_CLASS___ICJSSignConfiguration,  "storePlatformConfiguration"));
  [v20 setJSSignConfiguration:v21];

  [v20 setShouldUseMescalSigning:0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100009BDC;
  v23[3] = &unk_100014AC0;
  v23[4] = self;
  id v24 = v8;
  id v22 = v8;
  [v20 buildURLRequestWithCompletionHandler:v23];
}

- (id)_storePlatformRequestQueryItemsWithItemIdentifiers:(id)a3 profile:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 7LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"caller",  @"com.apple.TVMusic"));
  [v7 addObject:v8];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"version",  @"2"));
  [v7 addObject:v9];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);
  if ([v10 length])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"id",  v10));
    [v7 addObject:v11];
  }

  if ([v5 length])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"p",  v5));
    [v7 addObject:v12];
  }

  return v7;
}

- (id)_getArtworkURLForItemID:(id)a3 fromPlatformResults:(id)a4
{
  *(double *)&id v6 = COERCE_DOUBLE(a3);
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "tvs_dictionaryForKey:", v6));
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__CFString tvs_dictionaryForKey:](v7, "tvs_dictionaryForKey:", @"previewArtwork"));
    if (v9) {
      goto LABEL_6;
    }
    id v10 = sub_100007CDC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412546;
      id v38 = @"previewArtwork";
      __int16 v39 = 2112;
      double v40 = *(double *)&v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Can't find artwork key %@ in metadata for music video id %@; using standard artwork instead.",
        (uint8_t *)&v37,
        0x16u);
    }

    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__CFString tvs_dictionaryForKey:](v8, "tvs_dictionaryForKey:", @"artwork"));
    if (v9)
    {
LABEL_6:
      id v12 = [[AMSMediaArtwork alloc] initWithDictionary:v9];
      if (v12)
      {
        -[TVMTopShelfServiceProvider screenSize](self, "screenSize");
        double v14 = v13;
        [v12 artworkSize];
        double v16 = v14 * v15;
        [v12 artworkSize];
        double v18 = v16 / v17;
        BOOL v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "URLWithSize:cropStyle:format:",  AMSMediaArtworkCropStyleBoundedBox,  AMSMediaArtworkFormatJPG,  v18,  v14));
        id v20 = sub_100007CDC();
        unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        id v22 = v21;
        if (v19)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            [v12 artworkSize];
            uint64_t v24 = v23;
            [v12 artworkSize];
            int v37 = 138413570;
            id v38 = v6;
            __int16 v39 = 2048;
            double v40 = v18;
            __int16 v41 = 2048;
            double v42 = v14;
            __int16 v43 = 2048;
            uint64_t v44 = v24;
            __int16 v45 = 2048;
            id v46 = v25;
            __int16 v47 = 2112;
            v48 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "Artwork for music video ID %@: requested size (%g, %g), reported size (%g, %g), URL %@",  (uint8_t *)&v37,  0x3Eu);
          }

          goto LABEL_20;
        }

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          [v12 artworkSize];
          double v33 = v32;
          [v12 artworkSize];
          int v37 = 134219010;
          id v38 = *(const __CFString **)&v18;
          __int16 v39 = 2048;
          double v40 = v14;
          __int16 v41 = 2048;
          double v42 = v33;
          __int16 v43 = 2048;
          uint64_t v44 = v34;
          __int16 v45 = 2112;
          id v46 = v9;
          __int128 v29 = "Could not get artwork URL for requested size (%g, %g), reported size (%g, %g) from artwork dict: %@";
          __int128 v30 = v22;
          uint32_t v31 = 52;
          goto LABEL_18;
        }
      }

      else
      {
        id v28 = sub_100007CDC();
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = 138412290;
          id v38 = (const __CFString *)v9;
          __int128 v29 = "Could not get AMSMediaArtwork object for artwork dictionary: %@";
          __int128 v30 = v22;
          uint32_t v31 = 12;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v37, v31);
        }
      }

      BOOL v19 = 0LL;
LABEL_20:

      goto LABEL_21;
    }

    id v36 = sub_100007CDC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v8;
      __int128 v27 = "No artwork in item dictionary: %@";
      goto LABEL_12;
    }
  }

  else
  {
    id v26 = sub_100007CDC();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v6;
      __int128 v27 = "No item %@ in platform results";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v27, (uint8_t *)&v37, 0xCu);
    }
  }

  BOOL v19 = 0LL;
LABEL_21:

  return v19;
}

- (id)_getPreviewVideoURLForItemID:(id)a3 fromPlatformResults:(id)a4
{
  id v5 = (os_log_s *)a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tvs_dictionaryForKey:", v5));
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tvs_arrayForKey:", @"offers"));
    id v10 = v9;
    if (!v9)
    {
      id v34 = sub_100007CDC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No offers for item %@ in platform results",  buf,  0xCu);
      }

      double v33 = 0LL;
      goto LABEL_47;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tvs_arrayForKey:", @"assets"));

    if (!v12)
    {
      id v35 = sub_100007CDC();
      uint32_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
        int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:@"type"]);
        *(_DWORD *)buf = 138412546;
        id v57 = v37;
        __int16 v58 = 2112;
        v59 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "No assets for offer [%@] in item %@ in platform results",  buf,  0x16u);
      }

      double v33 = 0LL;
      goto LABEL_46;
    }

    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    v48 = v12;
    double v13 = v12;
    id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
    if (v14)
    {
      id v15 = v14;
      id v46 = v8;
      __int16 v47 = v10;
      id v44 = v6;
      __int16 v45 = v5;
      v49 = 0LL;
      uint64_t v16 = *(void *)v52;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v52 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v19 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"flavor"]);
          if (v20)
          {
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider preferredFlavors](self, "preferredFlavors"));
            id v22 = [v21 indexOfObject:v20];

            if ((uint64_t)v22 < v17)
            {
              id v23 = v19;

              v49 = v23;
              uint64_t v17 = (uint64_t)v22;
            }
          }
        }

        id v15 = -[os_log_s countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v51,  v55,  16LL);
      }

      while (v15);

      id v6 = v44;
      id v5 = v45;
      id v8 = v46;
      if (v49)
      {
        uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "tvs_dictionaryForKey:", @"preview"));
        v25 = v24;
        if (v24)
        {
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s tvs_stringForKey:](v24, "tvs_stringForKey:", @"url"));
          if (v26)
          {
            __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v26));
            id v28 = sub_100007CDC();
            __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
            __int128 v30 = v29;
            if (v27)
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v57 = v45;
                __int16 v58 = 2112;
                v59 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Preview video URL for music video ID %@: %@",  buf,  0x16u);
              }

              uint32_t v31 = v27;
            }

            else
            {
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v57 = v26;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Invalid URL: %@", buf, 0xCu);
              }

              uint32_t v31 = 0LL;
            }

            id v10 = v47;
          }

          else
          {
            id v41 = sub_100007CDC();
            double v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v57 = v25;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Can't find URL in preview: %@",  buf,  0xCu);
            }

            uint32_t v31 = 0LL;
            id v8 = v46;
          }
        }

        else
        {
          id v40 = sub_100007CDC();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = (os_log_s *)v49;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Can't find preview in asset: %@",  buf,  0xCu);
          }

          uint32_t v31 = 0LL;
        }

        double v33 = v31;
LABEL_45:
        id v12 = v48;
LABEL_46:

LABEL_47:
        goto LABEL_48;
      }
    }

    else
    {
    }

    id v38 = sub_100007CDC();
    uint32_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider preferredFlavors](self, "preferredFlavors"));
      *(_DWORD *)buf = 138412290;
      id v57 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Can't find one of the following flavors of preview video: %@",  buf,  0xCu);
    }

    double v33 = 0LL;
    goto LABEL_45;
  }

  id v32 = sub_100007CDC();
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v57 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No item %@ in platform results",  buf,  0xCu);
  }

  double v33 = 0LL;
LABEL_48:

  return v33;
}

- (void)_requestStoreDataFromURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void, id))a4;
  if ([v6 isFileURL])
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v6));
    id v20 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v8,  0LL,  &v20));
    id v10 = v20;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"storePlatformData"]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"lockup"]);
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"results"]);

    v7[2](v7, v13, 0LL, v10);
  }

  else
  {
    id v14 = objc_alloc(&OBJC_CLASS___ICStoreURLRequest);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider _storeRequestContext](self, "_storeRequestContext"));
    id v8 = [v14 initWithURL:v6 requestContext:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000ABE4;
    v17[3] = &unk_100014AE8;
    id v18 = v6;
    BOOL v19 = v7;
    [v16 enqueueDataRequest:v8 withCompletionHandler:v17];

    uint64_t v9 = v18;
  }
}

- (id)_storeRequestContext
{
  id v3 = [[ICMutableClientInfo alloc] initWithBundleIdentifier:@"com.apple.TVMusic"];
  [v3 setProcessName:@"com.apple.TVMusic"];
  [v3 setClientIdentifier:@"TVMusic"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider musicAppBundleVersion](self, "musicAppBundleVersion"));
  [v3 setClientVersion:v4];

  [v3 setRequestingBundleIdentifier:@"com.apple.TVMusic"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider musicAppBundleVersion](self, "musicAppBundleVersion"));
  [v3 setRequestingBundleVersion:v5];

  id v6 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
  id v8 = [v6 initWithIdentity:v7 clientInfo:v3];

  return v8;
}

- (void)_loadSectionedContentWithBag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 5LL));
  -[TVMTopShelfServiceProvider setCachedFilenames:](self, "setCachedFilenames:", v8);

  if (!-[TVMTopShelfServiceProvider libraryState](self, "libraryState"))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
    [v9 becomeActiveAndWaitUntilDone:1];

    if (-[TVMTopShelfServiceProvider _isLibraryImporting](self, "_isLibraryImporting")) {
      uint64_t v10 = 2LL;
    }
    else {
      uint64_t v10 = 3LL;
    }
    -[TVMTopShelfServiceProvider setLibraryState:](self, "setLibraryState:", v10);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:self selector:"_libraryUpdated:" name:MPCloudControllerIsUpdateInProgressDidChangeNotification object:0];
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B038;
  v13[3] = &unk_100014B10;
  id v14 = v7;
  id v12 = v7;
  -[TVMTopShelfServiceProvider _topShelfSectionedContentWithBag:completion:]( self,  "_topShelfSectionedContentWithBag:completion:",  v6,  v13);
}

- (void)_topShelfSectionedContentWithBag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007CDC();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[TVMTopShelfServiceProvider _topShelfSectionedContentWithBag:completion:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TVMTopShelfServiceProvider _topShelfSectionedContentWithBag:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  int v35 = 0;
  int64_t v10 = -[TVMTopShelfServiceProvider libraryState](self, "libraryState");
  if (v10 == 3) {
    uint64_t v11 = 2LL;
  }
  else {
    uint64_t v11 = 1LL;
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v11));
  BOOL v13 = v10 == 3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10000B38C;
  v28[3] = &unk_100014B60;
  id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  v11));
  id v29 = v14;
  id v15 = v12;
  id v30 = v15;
  id v32 = buf;
  int v33 = v11;
  id v16 = v7;
  id v31 = v16;
  uint64_t v17 = objc_retainBlock(v28);
  if (v13)
  {
    id v18 = sub_100007CDC();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Showing Recently Added...", (uint8_t *)&v27, 2u);
    }

    objc_initWeak(&v27, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10000B608;
    v24[3] = &unk_100014B88;
    objc_copyWeak(&v26, &v27);
    v25 = v17;
    -[TVMTopShelfServiceProvider _getRecentlyAddedSection:](self, "_getRecentlyAddedSection:", v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v27);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 URLForKey:@"appletv-view-top-url"]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000B718;
  v22[3] = &unk_100014BD8;
  v22[4] = self;
  unsigned int v21 = v17;
  id v23 = v21;
  [v20 valueWithCompletion:v22];

  _Block_object_dispose(buf, 8);
}

- (id)topAlbumsURLWithBaseURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:]( &OBJC_CLASS___NSURLComponents,  "componentsWithURL:resolvingAgainstBaseURL:",  v3,  0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 queryItems]);
  id v6 = [v5 count];

  id v7 = v3;
  if (!v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"id",  @"1"));
    v12[0] = v8;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"popId",  @"82"));
    v12[1] = v9;
    int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
    [v4 setQueryItems:v10];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 URL]);
  }

  return v7;
}

- (void)_getURLForArtworkCatalog:(id)a3 mpObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = sub_100007CDC();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v19 = "-[TVMTopShelfServiceProvider _getURLForArtworkCatalog:mpObject:completionHandler:]";
    __int16 v20 = 2080;
    unsigned int v21 = "-[TVMTopShelfServiceProvider _getURLForArtworkCatalog:mpObject:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  -[TVMTopShelfServiceProvider displayScale](self, "displayScale");
  objc_msgSend(v10, "setDestinationScale:");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000BC28;
  v15[3] = &unk_100014C28;
  id v16 = v8;
  id v17 = v9;
  id v13 = v8;
  id v14 = v9;
  [v10 requestExportableArtworkPropertiesWithCompletion:v15];
}

- (id)_artworkCatalogForGenericObject:(id)a3 title:(id *)a4
{
  return -[TVMTopShelfServiceProvider _artworkCatalogForGenericObject:title:isMusicVideo:]( self,  "_artworkCatalogForGenericObject:title:isMusicVideo:",  a3,  a4,  0LL);
}

- (id)_artworkCatalogForGenericObject:(id)a3 title:(id *)a4 isMusicVideo:(BOOL *)a5
{
  id v7 = a3;
  id v8 = 0LL;
  BOOL v9 = 0;
  switch((unint64_t)[v7 type])
  {
    case 2uLL:
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 album]);
      if ([v10 trackCount] == (id)1)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeSong]);
        unsigned int v12 = [v11 hasVideo];

        if (v12)
        {
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeSong]);
          id v14 = v13;
          if (a4) {
            *a4 = (id)objc_claimAutoreleasedReturnValue([v13 title]);
          }
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 artworkCatalog]);

          BOOL v9 = v15 != 0LL;
          if (v15) {
            id v16 = v14;
          }
          else {
            id v16 = v10;
          }
          id v8 = (id)objc_claimAutoreleasedReturnValue([v16 artworkCatalog]);

          goto LABEL_31;
        }
      }

      if (a4)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
        uint64_t v24 = v23;
        if (v23)
        {
          *a4 = v23;
        }

        else
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 representativeSong]);
          id v27 = objc_claimAutoreleasedReturnValue([v26 title]);
          *a4 = v27;
        }
      }

      unsigned int v21 = v10;
      goto LABEL_29;
    case 4uLL:
      if (a4)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
        *a4 = (id)objc_claimAutoreleasedReturnValue([v17 name]);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 artworkCatalog]);
      BOOL v19 = v18;
      if (v18)
      {
        id v8 = v18;
      }

      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v7 playlist]);
        id v8 = (id)objc_claimAutoreleasedReturnValue([v25 tracksTiledArtworkCatalogWithRows:2 columns:2]);
      }

      goto LABEL_30;
    case 7uLL:
      if (a4)
      {
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v7 season]);
        *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tvm_seasonTitle"));
      }

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v7 season]);
      goto LABEL_20;
    case 9uLL:
      if (a4)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 movie]);
        *a4 = (id)objc_claimAutoreleasedReturnValue([v22 title]);
      }

      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v7 movie]);
LABEL_20:
      id v10 = v21;
LABEL_29:
      id v8 = (id)objc_claimAutoreleasedReturnValue([v21 artworkCatalog]);
LABEL_30:
      BOOL v9 = 0;
LABEL_31:

      break;
    default:
      break;
  }

  if (a5) {
    *a5 = v9;
  }

  return v8;
}

- (id)_topAlbumsSectionForStoreResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 parsedBodyDictionary]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"pageData"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"selectedChart"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"adamIds"]);

  if (!v8)
  {
    id v10 = 0LL;
    goto LABEL_21;
  }

  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, 25));
  }
  id v11 = v9;
  id v12 = [v9 count];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider top25AlbumIDs](self, "top25AlbumIDs"));
  id v46 = v8;
  if (v12 != [v13 count])
  {

    goto LABEL_10;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider top25AlbumIDs](self, "top25AlbumIDs"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
  unsigned int v17 = [v14 isEqualToSet:v16];

  if (!v17)
  {
LABEL_10:
    -[TVMTopShelfServiceProvider setTop25AlbumIDs:](self, "setTop25AlbumIDs:", v11, v46);
    goto LABEL_11;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider top25AlbumIDs](self, "top25AlbumIDs"));

  id v11 = (void *)v18;
LABEL_11:
  id v48 = v4;
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parsedBodyDictionary", v46));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"storePlatformData"]);
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"lockup"]);
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"results"]);

  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 25LL));
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id obj = v11;
  id v23 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v53 = *(void *)v56;
    uint64_t v52 = ICStoreArtworkInfoCropStyleSquareCenterCrop;
    uint64_t v51 = ICStoreArtworkInfoImageFormatPNG;
    v49 = v22;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v56 != v53) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v26]);
        id v28 = objc_alloc(&OBJC_CLASS___ICStoreArtworkInfo);
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"artwork"]);
        id v30 = [v28 initWithArtworkResponseDictionary:v29];

        +[TVTopShelfSectionedContent imageSizeForImageShape:]( &OBJC_CLASS___TVTopShelfSectionedContent,  "imageSizeForImageShape:",  0LL);
        id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "artworkURLWithSize:cropStyle:format:", v52, v51));
        id v32 = [[TVTopShelfSectionedItem alloc] initWithIdentifier:v26];
        int v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:@"name"]);
        [v32 setTitle:v33];

        id v34 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
        id v35 = _urlForPlayingStoreAlbum((uint64_t)[v26 longLongValue], v31);
        id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        id v37 = [v34 initWithURL:v36];

        [v32 setPlayAction:v37];
        id v38 = (void *)objc_claimAutoreleasedReturnValue([v32 playAction]);
        [v32 setDisplayAction:v38];

        [v32 setImageURL:v31 forTraits:1];
        id v39 = sub_100007CDC();
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          id v41 = (void *)objc_claimAutoreleasedReturnValue([v32 title]);
          double v42 = (void *)objc_claimAutoreleasedReturnValue([v32 imageURLForTraits:1]);
          *(_DWORD *)buf = 138412546;
          id v60 = v41;
          __int16 v61 = 2112;
          v62 = v42;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "Top Album %@, URL: %@",  buf,  0x16u);

          id v22 = v49;
        }

        [v54 addObject:v32];
      }

      id v24 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }

    while (v24);
  }

  id v10 = [[TVTopShelfItemCollection alloc] initWithItems:v54];
  __int16 v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v44 = (void *)objc_claimAutoreleasedReturnValue( [v43 localizedStringForKey:@"TopAlbumsSection" value:&stru_100014E90 table:0]);
  [v10 setTitle:v44];

  id v8 = v47;
  id v4 = v48;
LABEL_21:

  return v10;
}

- (void)_getRecentlyAddedSection:(id)a3
{
  id v4 = a3;
  id v5 = sub_100007CDC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "-[TVMTopShelfServiceProvider _getRecentlyAddedSection:]";
    __int16 v21 = 2080;
    id v22 = "-[TVMTopShelfServiceProvider _getRecentlyAddedSection:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000CD30;
  v17[3] = &unk_100014C50;
  void v17[4] = self;
  id v7 = v4;
  id v18 = v7;
  id v8 = objc_retainBlock(v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory recentlyAddedlibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "recentlyAddedlibraryRequest"));
  objc_msgSend(v9, "setContentRange:", 0, 50);
  -[TVMTopShelfServiceProvider setRecentlyAddedCount:](self, "setRecentlyAddedCount:", 0LL);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000CF5C;
  v13[3] = &unk_100014CC8;
  void v13[4] = self;
  id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 3LL));
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v14;
  [v9 performWithResponseHandler:v13];
}

- (void)_getTopAlbumsSectionFromURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100007CDC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v19 = "-[TVMTopShelfServiceProvider _getTopAlbumsSectionFromURL:completion:]";
    __int16 v20 = 2080;
    __int16 v21 = "-[TVMTopShelfServiceProvider _getTopAlbumsSectionFromURL:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %s: ", buf, 0x16u);
  }

  id v10 = objc_alloc(&OBJC_CLASS___ICStoreURLRequest);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTopShelfServiceProvider _storeRequestContext](self, "_storeRequestContext"));
  id v12 = [v10 initWithURL:v6 requestContext:v11];

  objc_initWeak((id *)buf, self);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000D87C;
  v15[3] = &unk_100014CF0;
  objc_copyWeak(&v17, (id *)buf);
  void v15[4] = self;
  id v14 = v7;
  id v16 = v14;
  [v13 enqueueDataRequest:v12 withCompletionHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (BOOL)_isLibraryImporting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
  if ([v2 isInitialImport])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));
    unsigned __int8 v4 = [v3 isUpdateInProgress];
  }

  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_libraryUpdated:(id)a3
{
  id v4 = a3;
  id v5 = sub_100007CDC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[TVMTopShelfServiceProvider _libraryUpdated:]";
    __int16 v16 = 2080;
    id v17 = "-[TVMTopShelfServiceProvider _libraryUpdated:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v14, 0x16u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 object]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](&OBJC_CLASS___MPCloudController, "sharedCloudController"));

  if (v7 == v8)
  {
    unsigned int v9 = -[TVMTopShelfServiceProvider _isLibraryImporting](self, "_isLibraryImporting");
    char v10 = v9;
    id v11 = (void *)(v9 ? 2LL : 3LL);
    if (v11 != (void *)-[TVMTopShelfServiceProvider libraryState](self, "libraryState"))
    {
      -[TVMTopShelfServiceProvider setLibraryState:](self, "setLibraryState:", v11);
      if ((v10 & 1) == 0)
      {
        id v12 = sub_100007CDC();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315394;
          id v15 = "-[TVMTopShelfServiceProvider _libraryUpdated:]";
          __int16 v16 = 2080;
          id v17 = "-[TVMTopShelfServiceProvider _libraryUpdated:]";
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Library synced, updating top shelf",  (uint8_t *)&v14,  0x16u);
        }

        +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
      }
    }
  }

- (int64_t)recentlyAddedCount
{
  return self->_recentlyAddedCount;
}

- (void)setRecentlyAddedCount:(int64_t)a3
{
  self->_recentlyAddedCount = a3;
}

- (OS_dispatch_queue)sectionCompletionQueue
{
  return self->_sectionCompletionQueue;
}

- (void)setSectionCompletionQueue:(id)a3
{
}

- (NSMutableSet)cachedFilenames
{
  return self->_cachedFilenames;
}

- (void)setCachedFilenames:(id)a3
{
}

- (int64_t)libraryState
{
  return self->_libraryState;
}

- (void)setLibraryState:(int64_t)a3
{
  self->_libraryState = a3;
}

- (NSArray)preferredFlavors
{
  return self->_preferredFlavors;
}

- (void)setPreferredFlavors:(id)a3
{
}

- (NSString)musicAppBundleVersion
{
  return self->_musicAppBundleVersion;
}

- (void)setMusicAppBundleVersion:(id)a3
{
}

- (BOOL)disableCarousel
{
  return self->_disableCarousel;
}

- (void)setDisableCarousel:(BOOL)a3
{
  self->_disableCarousel = a3;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (TVSPreferences)musicPreferences
{
  return self->_musicPreferences;
}

- (void)setMusicPreferences:(id)a3
{
}

- (id)preferencesToken
{
  return self->_preferencesToken;
}

- (void)setPreferencesToken:(id)a3
{
}

- (NSArray)top25AlbumIDs
{
  return self->_top25AlbumIDs;
}

- (void)setTop25AlbumIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end