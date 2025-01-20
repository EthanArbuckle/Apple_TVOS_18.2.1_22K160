@interface TVWMAppUtilities
- (BOOL)imagePreloadingInProgress;
- (BOOL)isRunningAsViewService;
- (BOOL)preloadImages:(id)a3 :(id)a4;
- (BOOL)setItem:(id)a3 :(id)a4;
- (BOOL)shouldSkipVersionCheck;
- (id)_imageProxyFromDictionary:(id)a3;
- (id)getItem:(id)a3;
- (id)lastUpdatedFromOSVersion;
- (void)_preloadImages:(id)a3 completion:(id)a4;
- (void)activateScreenSaverWalkThrough;
- (void)exit;
- (void)setImagePreloadingInProgress:(BOOL)a3;
- (void)setNeedsBecomeActive;
- (void)setShouldSkipVersionCheck:(BOOL)a3;
- (void)suspend;
@end

@implementation TVWMAppUtilities

- (void)setNeedsBecomeActive
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "'setNeedsBecomeActive()' was called in JS",  v2,  2u);
  }

- (void)suspend
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "'suspend()' was called in JS",  v2,  2u);
  }

- (void)exit
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "'exit()' was called in JS!",  v4,  2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:@"TVWhatsNewViewControllerDismissNotification" object:self];
}

- (BOOL)setItem:(id)a3 :(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedWhatsNewPreferences](&OBJC_CLASS___TVSPreferences, "sharedWhatsNewPreferences"));
  unsigned __int8 v8 = [v7 setObject:v5 forKey:v6];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedWhatsNewPreferences](&OBJC_CLASS___TVSPreferences, "sharedWhatsNewPreferences"));
  [v9 synchronize];

  return v8;
}

- (id)getItem:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedWhatsNewPreferences](&OBJC_CLASS___TVSPreferences, "sharedWhatsNewPreferences"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);

  return v5;
}

- (BOOL)isRunningAsViewService
{
  return 1;
}

- (id)lastUpdatedFromOSVersion
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 lastUpdatedFromOSVersion]);

  return v3;
}

- (BOOL)preloadImages:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = -[TVWMAppUtilities imagePreloadingInProgress](self, "imagePreloadingInProgress");
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Image Preloader is busy",  buf,  2u);
    }
  }

  else
  {
    -[TVWMAppUtilities setImagePreloadingInProgress:](self, "setImagePreloadingInProgress:", 1LL);
    -[TVWMAppUtilities setJSValue:forProperty:](self, "setJSValue:forProperty:", v7, @"preloadCompletion");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = [v6 count];
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Preloading %ld images",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100003DAC;
    v10[3] = &unk_100008470;
    objc_copyWeak(&v11, (id *)buf);
    -[TVWMAppUtilities _preloadImages:completion:](self, "_preloadImages:completion:", v6, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

  return v8 ^ 1;
}

- (void)activateScreenSaverWalkThrough
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v2 activateScreenSaverWalkThrough];
}

- (void)_preloadImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v28 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v6 count]));
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVWMAppUtilities _imageProxyFromDictionary:]( self,  "_imageProxyFromDictionary:",  *(void *)(*((void *)&v39 + 1) + 8LL * (void)v11)));
        id v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v12 object]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 absoluteString]);

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_100004270;
          v35[3] = &unk_100008498;
          id v16 = v7;
          id v36 = v16;
          id v37 = v15;
          id v38 = v28;
          id v17 = v15;
          [v13 setWriteCompletionHandler:v35];
          [v16 setObject:v13 forKeyedSubscript:v17];
        }

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v9);
  }

  v18 = v7;
  if ([v7 count])
  {
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
    id v20 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        v23 = 0LL;
        do
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * (void)v23) load];
          v23 = (char *)v23 + 1;
        }

        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }

      while (v21);
    }

    v24 = v28;
  }

  else
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100004308;
    block[3] = &unk_1000084C0;
    v24 = v28;
    id v30 = v28;
    dispatch_async(v26, block);

    v19 = v30;
  }
}

- (id)_imageProxyFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"url"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"width"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"height"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v7);

  if ((isKindOfClass & 1) != 0
    && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v5, v9) & 1) != 0))
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v11 = objc_opt_isKindOfClass(v6, v10) ^ 1;
  }

  else
  {
    char v11 = 1;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v12) & 1) != 0
    && (v11 & 1) == 0
    && (id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4)),
        v13,
        v13))
  {
    [v5 floatValue];
    double v15 = v14;
    [v6 floatValue];
    double v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));
    id v19 = objc_alloc(&OBJC_CLASS___TVImageProxy);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
    id v21 = [v19 initWithObject:v18 imageLoader:v20 groupType:0];

    id v22 = objc_msgSend([TVImageScaleDecorator alloc], "initWithScaleToSize:", v15, v17);
    [v21 setDecorator:v22];
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543362;
      v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Invalid image obj: %{public}@",  (uint8_t *)&v24,  0xCu);
    }

    id v21 = 0LL;
  }

  return v21;
}

- (BOOL)shouldSkipVersionCheck
{
  return self->_shouldSkipVersionCheck;
}

- (void)setShouldSkipVersionCheck:(BOOL)a3
{
  self->_shouldSkipVersionCheck = a3;
}

- (BOOL)imagePreloadingInProgress
{
  return self->_imagePreloadingInProgress;
}

- (void)setImagePreloadingInProgress:(BOOL)a3
{
  self->_imagePreloadingInProgress = a3;
}

@end