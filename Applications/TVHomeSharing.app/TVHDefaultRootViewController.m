@interface TVHDefaultRootViewController
- (TVHDefaultRootViewController)initWithMediaLibrariesEnviroment:(id)a3;
- (TVHPlaybackManager)playbackManager;
- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4;
- (void)_mediaLibrary:(id)a3 connectionStateDidChange:(unint64_t)a4;
- (void)playbackManager:(id)a3 playbackOfMediaItem:(id)a4 didFailWithError:(id)a5;
- (void)playbackManager:(id)a3 removePlaybackViewControllerAnimated:(BOOL)a4;
- (void)playbackManager:(id)a3 sendKeepAlivesForMediaServerIdentifiers:(id)a4;
- (void)playbackManager:(id)a3 showMediaEntityCollectionForMediaItem:(id)a4 mediaEntityCollectionType:(unint64_t)a5;
- (void)playbackManager:(id)a3 showPlaybackViewController:(id)a4 options:(unint64_t)a5 viewControllersToRemove:(id)a6;
- (void)setPlaybackManager:(id)a3;
@end

@implementation TVHDefaultRootViewController

- (TVHDefaultRootViewController)initWithMediaLibrariesEnviroment:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___TVHPlaybackManager);
  [v4 setPlaybackManager:v5];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHDefaultRootViewController;
  v6 = -[TVHRootViewController initWithMediaLibrariesEnviroment:](&v8, "initWithMediaLibrariesEnviroment:", v4);

  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackManager, v5);
    -[TVHPlaybackManager setDelegate:](v6->_playbackManager, "setDelegate:", v6);
  }

  return v6;
}

- (id)_browseViewControllersWithMediaLibrary:(id)a3 openURL:(id)a4
{
  if (a4)
  {
    v5 = (TVHMediaLibraryViewController *)a3;
    uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TVHURLHandler viewControllersForURL:mediaLibrary:]( &OBJC_CLASS___TVHURLHandler,  "viewControllersForURL:mediaLibrary:",  a4,  v5));
  }

  else
  {
    id v7 = a3;
    v5 = -[TVHMediaLibraryViewController initWithMediaLibrary:]( objc_alloc(&OBJC_CLASS___TVHMediaLibraryViewController),  "initWithMediaLibrary:",  v7);

    v10 = v5;
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  objc_super v8 = (void *)v6;

  return v8;
}

- (void)_mediaLibrary:(id)a3 connectionStateDidChange:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10008CC10;
    v7[3] = &unk_1000FF8F8;
    objc_copyWeak(v9, &location);
    v9[1] = (id)a4;
    id v8 = v6;
    dispatch_async(&_dispatch_main_q, v7);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (void)playbackManager:(id)a3 showPlaybackViewController:(id)a4 options:(unint64_t)a5 viewControllersToRemove:(id)a6
{
}

- (void)playbackManager:(id)a3 removePlaybackViewControllerAnimated:(BOOL)a4
{
}

- (void)playbackManager:(id)a3 sendKeepAlivesForMediaServerIdentifiers:(id)a4
{
  id v5 = a4;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v20 = v7;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController mediaLibrariesEnviroment](self, "mediaLibrariesEnviroment", v20));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 mediaLibrariesManager]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mediaLibraryForMediaServerIdentifier:v11]);

        id v15 = sub_100079F98();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        v17 = v16;
        if (v14)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v14 title]);
            *(_DWORD *)buf = 138412546;
            v26 = v18;
            __int16 v27 = 2112;
            v28 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Sending KeepAlive for media library [%@]. mediaServerIdentifier=%@",  buf,  0x16u);
          }

          id v19 = [v14 enqueueKeepAliveWithCompletionHandler:0];
        }

        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v26 = v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Unable to send KeepAlive as media library not found. mediaServerIdentifier=%@",  buf,  0xCu);
          }
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v8);
  }
}

- (void)playbackManager:(id)a3 showMediaEntityCollectionForMediaItem:(id)a4 mediaEntityCollectionType:(unint64_t)a5
{
}

- (void)playbackManager:(id)a3 playbackOfMediaItem:(id)a4 didFailWithError:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 mediaItem]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mediaServerIdentifier]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHRootViewController mediaLibrariesEnviroment](self, "mediaLibrariesEnviroment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaLibrariesManager]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mediaLibraries]);

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", (void)v21));
        unsigned int v20 = [v19 isEqual:v9];

        if (v20)
        {
          [v18 playbackDidFailWithError:v7];
          goto LABEL_11;
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

- (TVHPlaybackManager)playbackManager
{
  return self->_playbackManager;
}

- (void)setPlaybackManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end