void sub_100002D94(id a1)
{
  TVMusicLibraryManager *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___TVMusicLibraryManager);
  v2 = (void *)qword_100018F98;
  qword_100018F98 = (uint64_t)v1;
}

id sub_100002F18()
{
  if (qword_100018FA8 != -1) {
    dispatch_once(&qword_100018FA8, &stru_1000148D0);
  }
  return (id)qword_100018FB0;
}

void sub_100003070(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] != *(id *)(a1 + 40))
  {
    id v2 = sub_100002F18();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", objc_msgSend(*(id *)(a1 + 32), "state")));
      v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _debugNameForState:*(void *)(a1 + 40)]);
      int v7 = 138412546;
      v8 = v4;
      __int16 v9 = 2112;
      v10 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "State changed from %@ to %@",  (uint8_t *)&v7,  0x16u);
    }

    *(void *)(*(void *)(a1 + 32) + 8LL) = *(void *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 postNotificationName:@"TVMusicLibraryManagerStateChangedNotification" object:*(void *)(a1 + 32)];

    if (*(void *)(a1 + 40) == 2LL) {
      [*(id *)(a1 + 32) _updateSyncProgress];
    }
  }
}

void sub_10000327C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(double *)(a1 + 40);
  if (*(double *)(v1 + 24) != v2)
  {
    *(double *)(v1 + 24) = v2;
    id v4 = sub_100002F18();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = *(double *)(a1 + 40) * 100.0;
      int v8 = 134217984;
      double v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Sync progress: %g%%", (uint8_t *)&v8, 0xCu);
    }

    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v7 postNotificationName:@"TVMusicLibraryManagerSyncProgressNotification" object:*(void *)(a1 + 32)];
  }

void sub_1000034DC(uint64_t a1, float a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000357C;
  v3[3] = &unk_100014860;
  v3[4] = *(void *)(a1 + 32);
  float v4 = a2;
  double v2 = v3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003DA4;
  block[3] = &unk_1000148F8;
  id v6 = v2;
  dispatch_async(&_dispatch_main_q, block);
}

id sub_10000357C(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:"_updateSyncProgress" withObject:0 afterDelay:0.2];
}

id sub_10000387C(uint64_t a1)
{
  id v2 = sub_100002F18();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[TVMusicLibraryManager _subscriptionStatusDidChange:]_block_invoke";
    __int16 v7 = 2080;
    int v8 = "-[TVMusicLibraryManager _subscriptionStatusDidChange:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %s: ", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) _updateSyncState];
}

void sub_1000039FC(uint64_t a1)
{
  id v2 = sub_100002F18();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[TVMusicLibraryManager _libraryDidChange:]_block_invoke";
    __int16 v7 = 2080;
    int v8 = "-[TVMusicLibraryManager _libraryDidChange:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Sending library update notification",  (uint8_t *)&v5,  0x16u);
  }

  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 postNotificationName:@"TVMusicLibraryManagerLibraryUpdatedNotification" object:*(void *)(a1 + 32)];
}

void sub_100003C38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  [*(id *)(a1 + 32) _updateSyncState];
  if ([*(id *)(a1 + 32) state] == (id)3 && objc_msgSend(*(id *)(a1 + 32), "state") != v2)
  {
    id v3 = sub_100002F18();
    float v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "-[TVMusicLibraryManager _updateInProgressDidChange:]_block_invoke";
      __int16 v8 = 2080;
      double v9 = "-[TVMusicLibraryManager _updateInProgressDidChange:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %s: Sending library update notification",  (uint8_t *)&v6,  0x16u);
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v5 postNotificationName:@"TVMusicLibraryManagerLibraryUpdatedNotification" object:*(void *)(a1 + 32)];
  }

void sub_100003D68(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVMusic", "TVMusicLibraryManager");
  id v2 = (void *)qword_100018FB0;
  qword_100018FB0 = (uint64_t)v1;
}

uint64_t sub_100003D98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100003DA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100007CDC()
{
  if (qword_100018FB8 != -1) {
    dispatch_once(&qword_100018FB8, &stru_100014D10);
  }
  return (id)qword_100018FC0;
}

void sub_100007D1C(id a1)
{
  id v1 = sub_100007CDC();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Top shelf style changed, refreshing content.",  v3,  2u);
  }

  +[TVTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVTopShelfContentProvider,  "topShelfContentDidChange");
}

void sub_100007F88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100007FA4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = sub_100007CDC();
    __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    double v9 = v8;
    if (a3)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Calling completion for carousel content: %@",  buf,  0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    }

    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Content not available for carousel-style top shelf; using sectioned style instead.",
          buf,
          2u);
      }

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100008118;
      v11[3] = &unk_100014958;
      uint64_t v10 = *(void *)(a1 + 32);
      id v12 = *(id *)(a1 + 40);
      [WeakRetained _loadSectionedContentWithBag:v10 completion:v11];
    }
  }
}

void sub_100008118(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100007CDC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Calling completion for sectioned content: %@",  (uint8_t *)&v6,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000083B4(id *a1, void *a2, uint64_t a3, void *a4)
{
  int v6 = a2;
  id v7 = a4;
  id v8 = sub_100007CDC();
  double v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Requesting video playlist data from URL: %@",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, a1[4]);
    id v11 = a1[4];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000085BC;
    v12[3] = &unk_1000149D0;
    objc_copyWeak(&v16, (id *)buf);
    id v13 = a1[5];
    id v15 = a1[6];
    id v14 = v6;
    [v11 _requestStoreDataFromURL:v14 completion:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      v18 = @"atv-music-homescreen-url";
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No URL for bag key: %@, error: %@",  buf,  0x16u);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_100008598( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1000085BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v11 = sub_100007CDC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Video Playlist result: %@", buf, 0xCu);
      }

      uint64_t v14 = *(void *)(a1 + 32);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100008770;
      v16[3] = &unk_1000149A8;
      id v17 = *(id *)(a1 + 48);
      [WeakRetained _getCarouselItemsForPlaylistDictionary:v7 playlistIDs:v8 urlBag:v14 completion:v16];
    }

    else
    {
      if (v13)
      {
        id v15 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        id v19 = v15;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "No response from URL %@, error: %@",  buf,  0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    }
  }
}

void sub_100008770(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___TVTopShelfCarouselContent);
  id v5 = [v4 initWithStyle:TVTopShelfCarouselContentStyleActionsMusic items:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100008FB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = *(id *)(a1 + 32);
  id v36 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v36)
  {
    uint64_t v4 = *(void *)v39;
    id v32 = v3;
    uint64_t v33 = *(void *)v39;
    uint64_t v31 = a1;
    do
    {
      for (i = 0LL; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        int v6 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        id v7 = *(void **)(a1 + 40);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

        if (v9)
        {
          BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _getPreviewVideoURLForItemID:v9 fromPlatformResults:v3]);
          [v6 setPreviewVideoURL:v10];

          id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _getArtworkURLForItemID:v9 fromPlatformResults:v3]);
          v37 = v6;
          if (v11)
          {
            [v6 setImageURL:v11 forTraits:1];
            id v35 = objc_alloc(&OBJC_CLASS___TVTopShelfAction);
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 playAction]);
            BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 absoluteString]);
            id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 absoluteString]);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingFormat:@"&artworkURL=%@", v15]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v16));
            id v18 = [v35 initWithURL:v17];

            a1 = v31;
            id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"PlayButtonTitle" value:&stru_100014E90 table:0]);
            [v18 _setTitle:v20];

            id v3 = v32;
            uint64_t v4 = v33;
            [v37 setPlayAction:v18];
          }

          id v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvs_dictionaryForKey:", v9));
          v22 = v21;
          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tvs_stringForKey:", @"name"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tvs_stringForKey:", @"artistName"));
            if ([v23 length] && objc_msgSend(v24, "length"))
            {
              v25 = v11;
              id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ – %@",  v23,  v24));
LABEL_15:
              v27 = v26;
              if (v26) {
                [v37 setContextTitle:v26];
              }
            }

            else
            {
              v25 = v11;
              if ([v23 length])
              {
                id v26 = v23;
                goto LABEL_15;
              }

              v27 = 0LL;
            }

            id v11 = v25;
          }

          id v28 = sub_100007CDC();
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v37 contextTitle]);
            *(_DWORD *)buf = 138412546;
            v43 = v9;
            __int16 v44 = 2112;
            v45 = v30;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Carousel item video ID %@, name %@",  buf,  0x16u);

            uint64_t v4 = v33;
          }
        }
      }

      id v36 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v36);
  }
}

void sub_1000093B0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (!a2 || v5)
  {
    id v7 = sub_100007CDC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[4];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      BOOL v13 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Invalid response for metadata request for music videos: %@, error: %@",  (uint8_t *)&v10,  0x16u);
    }
  }

  else
  {
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  (*(void (**)(void))(a1[7] + 16LL))();
}

void sub_10000982C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009910;
  block[3] = &unk_100014A70;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  id v16 = v6;
  uint64_t v17 = v10;
  id v18 = v11;
  id v12 = *(id *)(a1 + 48);
  id v19 = v7;
  id v20 = v12;
  id v13 = v7;
  id v14 = v6;
  dispatch_async(v9, block);
}

id sub_100009910(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(*(id *)(a1 + 40), "_requestMetadataForIdentifiers:baseURL:completion:", *(void *)(a1 + 48));
  }
  id v2 = sub_100007CDC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    int v6 = 138412546;
    id v7 = @"storeplatform-lookup-url-unpersonalized";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Bag value for %@ not found. Bag error: %@",  (uint8_t *)&v6,  0x16u);
  }

  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

void sub_100009BDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100007CDC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000DEA4((uint64_t)v3, v5);
  }

  id v6 = [v3 mutableCopy];
  [*(id *)(a1 + 32) _deleteCookieWithName:@"itrv" inRequest:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v7 setURLCache:0];
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v7));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100009D08;
  v10[3] = &unk_100014A98;
  id v11 = *(id *)(a1 + 40);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataTaskWithRequest:v6 completionHandler:v10]);
  [v9 resume];
}

void sub_100009D08(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100007CDC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Got response: %@, data: %@, error: %@",  buf,  0x20u);
  }

  if (v7 && !v9)
  {
    id v24 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v24));
    id v13 = v24;
    id v14 = v13;
    if (!v12 || v13)
    {
      id v20 = sub_100007CDC();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Error parsing store response: %@",  buf,  0xCu);
      }

      id v17 = v14;
    }

    else
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"results"]);
      if (v15)
      {
        id v16 = (void *)v15;
        id v17 = 0LL;
LABEL_19:

        goto LABEL_20;
      }

      id v22 = sub_100007CDC();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No results in response dictionary: %@",  buf,  0xCu);
      }

      id v17 = 0LL;
    }

    id v16 = 0LL;
    goto LABEL_19;
  }

  id v18 = sub_100007CDC();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No response from store platform request, error: %@",  buf,  0xCu);
  }

  id v17 = v9;
  id v16 = 0LL;
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000ABE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 parsedBodyDictionary]);

  if (v6 || !v7)
  {
    id v18 = sub_100007CDC();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = *(void **)(a1 + 32);
      int v20 = 138412546;
      id v21 = v19;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No response from store platform request: %@, error: %@",  (uint8_t *)&v20,  0x16u);
    }

    id v17 = 0LL;
    id v11 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 parsedBodyDictionary]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"storePlatformData"]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"lockup"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"results"]);

    if (!v11)
    {
      id v12 = sub_100007CDC();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 parsedBodyDictionary]);
        int v20 = 138412290;
        id v21 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No results in response dictionary: %@",  (uint8_t *)&v20,  0xCu);
      }
    }

    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 parsedBodyDictionary]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", @"pageData"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tvs_arrayForKey:", @"adamIds"));
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_10000B038(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000B348( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_10000B38C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3));
    id v7 = *(void **)(a1 + 32);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
    [v7 setObject:v6 forKeyedSubscript:v8];

    [*(id *)(a1 + 40) addObject:v5];
  }

  id v9 = sub_100007CDC();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) + 1;
    int v12 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    int v20 = v11;
    __int16 v21 = 1024;
    int v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "addSection count = %d, total = %d", buf, 0xEu);
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
  int v14 = *(_DWORD *)(v13 + 24) + 1;
  *(_DWORD *)(v13 + 24) = v14;
  if (v14 == *(_DWORD *)(a1 + 64))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000B558;
    v17[3] = &unk_100014B38;
    uint64_t v15 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 32);
    [v15 sortUsingComparator:v17];
    id v16 = [[TVTopShelfSectionedContent alloc] initWithSections:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

id sub_10000B558(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a2 title]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v7]);
  id v9 = *(void **)(a1 + 32);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);
  id v12 = [v8 compare:v11];

  return v12;
}

void sub_10000B608(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = sub_100007CDC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (WeakRetained)
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Adding RecentlyAdded section: %@",  (uint8_t *)&v8,  0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    if (v7)
    {
      LOWORD(v_Block_object_dispose((const void *)(v22 - 144), 8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "TVMTopShelfServiceProvider Instance dealloc'd",  (uint8_t *)&v8,  2u);
    }
  }
}

void sub_10000B718(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = sub_100007CDC();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got top albums URL from bag: %@", buf, 0xCu);
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) topAlbumsURLWithBaseURL:v6]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10000B8C0;
    v13[3] = &unk_100014BB0;
    id v12 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v12 _getTopAlbumsSectionFromURL:v11 completion:v13];
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = @"appletv-view-top-url";
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Did not find bag key %@, bag error: %@",  buf,  0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10000B8C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100007CDC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Adding TopAlbums section: %@",  (uint8_t *)&v6,  0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000BC28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 resolvedURLString]);

  id v5 = sub_100007CDC();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 resolvedURLString]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Got URL for artwork: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 resolvedURLString]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    int v20 = sub_10000BEE4;
    __int16 v21 = &unk_100014C00;
    id v23 = *(id *)(a1 + 40);
    id v11 = v10;
    id v22 = v11;
    id v12 = v19;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v20((uint64_t)v12);
    }

    else
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      v25 = sub_10000DE98;
      id v26 = &unk_1000148F8;
      __int16 v27 = v12;
      dispatch_async(&_dispatch_main_q, &buf);
    }
  }

  else
  {
    if (v7)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Could not get artwork for object: %@",  (uint8_t *)&buf,  0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    id v16 = sub_10000BEF4;
    __int16 v17 = &unk_1000148F8;
    id v18 = *(id *)(a1 + 40);
    id v14 = v15;
    if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
    {
      v16((uint64_t)v14);
    }

    else
    {
      *(void *)&__int128 buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472LL;
      v25 = sub_10000DE98;
      id v26 = &unk_1000148F8;
      __int16 v27 = v14;
      dispatch_async(&_dispatch_main_q, &buf);
    }

    id v11 = v18;
  }
}

uint64_t sub_10000BEE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t sub_10000BEF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id _urlForPlayingGenericObject(void *a1)
{
  id v1 = a1;
  id v2 = [v1 type];
  if (v2 == (id)2)
  {
    id v3 = @"album";
    goto LABEL_5;
  }

  if (v2 == (id)4)
  {
    id v3 = @"playlist";
LABEL_5:
    int v4 = 1;
    goto LABEL_7;
  }

  int v4 = 0;
  id v3 = 0LL;
LABEL_7:
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v1 identifiers]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 universalStore]);
  id v7 = [v6 adamID];
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v1 identifiers]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 universalStore]);
    id v7 = [v9 subscriptionAdamID];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v1 identifiers]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 library]);
  id v12 = [v11 persistentID];

  if (v12)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v1 identifiers]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 library]);
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v14 persistentID]));

    uint64_t v15 = @"persistentID";
  }

  else
  {
    if (!v7) {
      goto LABEL_18;
    }
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v7));
    uint64_t v15 = @"storeID";
  }

  if (v7) {
    int v16 = v4;
  }
  else {
    int v16 = 0;
  }
  if (v16 == 1)
  {
    __int16 v17 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    id v19 = -[NSURLQueryItem initWithName:value:](v17, "initWithName:value:", v15, v18);

    __int16 v27 = v19;
    int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
    id v21 = _urlForPlayingItem(v3, v20);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    goto LABEL_21;
  }

LABEL_18:
  id v23 = sub_100007CDC();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    id v26 = v1;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Unable to play item: %@",  (uint8_t *)&v25,  0xCu);
  }

  id v22 = 0LL;
LABEL_21:

  return v22;
}

id _urlForPlayingItem(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSURLComponents);
    -[NSURLComponents setScheme:](v5, "setScheme:", @"com.apple.TVMusic");
    -[NSURLComponents setHost:](v5, "setHost:", @"play");
    int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/%@", v3));
    -[NSURLComponents setPath:](v5, "setPath:", v6);

    -[NSURLComponents setQueryItems:](v5, "setQueryItems:", v4);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v5, "URL"));
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

id _urlForPlayingStoreAlbum(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a1));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  id v7 = -[NSURLQueryItem initWithName:value:](v4, "initWithName:value:", @"storeID", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v7));

  if (v3)
  {
    id v9 = objc_alloc(&OBJC_CLASS___NSURLQueryItem);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 absoluteString]);
    id v11 = -[NSURLQueryItem initWithName:value:](v9, "initWithName:value:", @"artworkURL", v10);
    [v8 addObject:v11];
  }

  id v12 = _urlForPlayingItem(@"album", v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

void sub_10000CD30(uint64_t a1, char *a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_100007CDC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (char *)[*(id *)(a1 + 32) recentlyAddedCount];
    *(_DWORD *)__int128 buf = 134218240;
    id v23 = v8;
    __int16 v24 = 2048;
    int v25 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "_getRecentlyAddedSection maybeCallCompletion: count=%ld, numItems=%ld",  buf,  0x16u);
  }

  id v9 = *(void **)(a1 + 32);
  id v10 = (char *)[v9 recentlyAddedCount] + 1;
  [v9 setRecentlyAddedCount:v10];
  if (v10 == a2)
  {
    id v11 = sub_100007CDC();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      id v23 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "_getRecentlyAddedSection: calling completion with %ld items",  buf,  0xCu);
    }

    id v13 = [[TVTopShelfItemCollection alloc] initWithItems:v5];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"RecentlyAddedSection" value:&stru_100014E90 table:0]);
    [v13 setTitle:v15];

    int v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sectionCompletionQueue]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    void v19[2] = sub_10000CF4C;
    v19[3] = &unk_100014C00;
    id v17 = *(id *)(a1 + 40);
    id v20 = v13;
    id v21 = v17;
    id v18 = v13;
    dispatch_async(v16, v19);
  }
}

uint64_t sub_10000CF4C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000CF5C(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  3LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 results]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10000D370;
  v44[3] = &unk_100014C78;
  id v6 = a1[5];
  v44[4] = a1[4];
  id v45 = v6;
  id v7 = v4;
  id v46 = v7;
  [v5 enumerateItemsUsingBlock:v44];

  uint64_t v32 = (uint64_t)[a1[5] count];
  if (v32 < 1)
  {
    __int16 v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] sectionCompletionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000D620;
    block[3] = &unk_1000148F8;
    id v34 = a1[7];
    dispatch_async(v29, block);

    id v8 = v34;
  }

  else
  {
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v8 = a1[5];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v9)
    {
      id v10 = v9;
      id v30 = v3;
      uint64_t v11 = *(void *)v41;
      do
      {
        id v12 = 0LL;
        id v31 = v10;
        do
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)v12);
          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", v30));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v14]);

          unsigned __int8 v39 = 0;
          if (v15
            && (uint64_t v16 = objc_claimAutoreleasedReturnValue([a1[4] _artworkCatalogForGenericObject:v15 title:0 isMusicVideo:&v39])) != 0)
          {
            id v17 = (void *)v16;
            uint64_t v18 = v11;
            id v19 = v8;
            id v20 = v7;
            uint64_t v21 = 2LL * v39;
            +[TVTopShelfSectionedContent imageSizeForImageShape:]( &OBJC_CLASS___TVTopShelfSectionedContent,  "imageSizeForImageShape:",  v21);
            objc_msgSend(v17, "setFittingSize:");
            [v13 setImageShape:v21];
            id v22 = sub_100007CDC();
            id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              [v17 scaledFittingSize];
              __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
              *(_DWORD *)__int128 buf = 138412290;
              v48 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Loading artwork of size %@", buf, 0xCu);
            }

            id v25 = a1[4];
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472LL;
            v35[2] = sub_10000D508;
            v35[3] = &unk_100014CA0;
            v35[4] = v13;
            id v37 = a1[6];
            uint64_t v38 = v32;
            id v36 = a1[5];
            [v25 _getURLForArtworkCatalog:v17 mpObject:v15 completionHandler:v35];

            id v7 = v20;
            id v8 = v19;
            uint64_t v11 = v18;
            id v10 = v31;
          }

          else
          {
            id v26 = sub_100007CDC();
            __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = (void *)objc_claimAutoreleasedReturnValue([v13 title]);
              *(_DWORD *)__int128 buf = 138412290;
              v48 = v28;
              _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "No artwork for item %@",  buf,  0xCu);
            }

            (*((void (**)(void))a1[6] + 2))();
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }

      while (v10);
      id v3 = v30;
    }
  }
}

void sub_10000D370(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  id v7 = _urlForPlayingGenericObject(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 identifiers]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 library]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v10 persistentID]));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);

    id v13 = [[TVTopShelfSectionedItem alloc] initWithIdentifier:v12];
    id v14 = *(void **)(a1 + 32);
    id v19 = 0LL;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 _artworkCatalogForGenericObject:v6 title:&v19]);
    id v16 = v19;
    [v13 setTitle:v16];
    id v17 = [[TVTopShelfAction alloc] initWithURL:v8];
    [v13 setPlayAction:v17];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 playAction]);
    [v13 setDisplayAction:v18];

    [*(id *)(a1 + 40) addObject:v13];
    if (v15) {
      [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v12];
    }
  }

  if ([*(id *)(a1 + 40) count] == (id)3) {
    *a4 = 1;
  }
}

uint64_t sub_10000D508(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setImageURL:a2 forTraits:1];
    return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 40));
  }

  else
  {
    id v4 = sub_100007CDC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) title]);
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Could not load artwork for item %@",  (uint8_t *)&v7,  0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

uint64_t sub_10000D620(uint64_t a1)
{
  id v2 = sub_100007CDC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "_getRecentlyAddedSection: no items found, calling completion with nil",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000D850( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10000D87C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || (id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 bodyData]), v10, !v10))
  {
    id v7 = sub_100007CDC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Invalid top albums response: %@, error: %@",  buf,  0x16u);
    }

    id v9 = 0LL;
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _topAlbumsSectionForStoreResponse:v5]);
  }

  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1[4] sectionCompletionQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  void v15[2] = sub_10000DA0C;
  v15[3] = &unk_100014C00;
  id v13 = a1[5];
  id v16 = v9;
  id v17 = v13;
  id v14 = v9;
  dispatch_async(v12, v15);
}

uint64_t sub_10000DA0C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void sub_10000DE68(id a1)
{
  os_log_t v1 = os_log_create("com.apple.TVMusic", "TVMusicTopShelfExtension");
  id v2 = (void *)qword_100018FC0;
  qword_100018FC0 = (uint64_t)v1;
}

uint64_t sub_10000DE98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000DEA4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Got URL request: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithCompletion:");
}