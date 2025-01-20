@interface PBAppIconCache
+ (id)_appIconNameForAppInfo:(id)a3;
+ (id)_cacheKeyForBundleIdentifier:(id)a3 scale:(double)a4 lastModifiedDate:(double)a5;
+ (id)_pathForCacheKey:(id)a3 cacheDirectory:(id)a4;
+ (id)_placeholderIconImageForScale:(double)a3;
+ (id)sharedAppSwitcherIconCache;
- (CGSize)iconSize;
- (NSArray)iconScales;
- (NSMutableDictionary)queue_cacheEntryByBundleIdentifier;
- (NSString)cachePath;
- (NSString)name;
- (OS_dispatch_queue)accessQueue;
- (OS_dispatch_queue)workQueue;
- (PBAppIconCache)initWithName:(id)a3 iconSize:(CGSize)a4;
- (PBAppInfoController)appInfoController;
- (id)iconImageForAppWithBundleIdentifier:(id)a3 scale:(double)a4;
- (id)iconImageForApplication:(id)a3 scale:(double)a4;
- (void)_buildAndPruneCache;
- (void)_workQueue_createApplicationIcon:(id)a3 preferExisting:(BOOL)a4;
- (void)_workQueue_removeApplicationIconsForAppInfo:(id)a3;
- (void)_workQueue_removeApplicationIconsForCacheEntry:(id)a3;
- (void)appInfoController:(id)a3 didUpdate:(id)a4;
@end

@implementation PBAppIconCache

+ (id)sharedAppSwitcherIconCache
{
  if (qword_1004708E8 != -1) {
    dispatch_once(&qword_1004708E8, &stru_1003D4AF8);
  }
  return (id)qword_1004708E0;
}

- (PBAppIconCache)initWithName:(id)a3 iconSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___PBAppIconCache;
  v8 = -[PBAppIconCache init](&v38, "init");
  if (v8)
  {
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PBAppIconCache.work", v10);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PBAppIconCache.access", 0LL);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v13;

    v15 = (NSString *)[v7 copy];
    name = v8->_name;
    v8->_name = v15;

    v8->_iconSize.CGFloat width = width;
    v8->_iconSize.CGFloat height = height;
    else {
      v17 = &off_1003FE6E0;
    }
    objc_storeStrong((id *)&v8->_iconScales, v17);
    v18 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 bundleIdentifier]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:v22]);

    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 stringByAppendingPathComponent:@"appIconCache"]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:v7]);

    v26 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%.f-%.f",  *(void *)&v8->_iconSize.width,  *(void *)&v8->_iconSize.height);
    uint64_t v27 = objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:v26]);
    cachePath = v8->_cachePath;
    v8->_cachePath = (NSString *)v27;

    v29 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    char v37 = 0;
    if (!-[NSFileManager fileExistsAtPath:isDirectory:](v29, "fileExistsAtPath:isDirectory:", v8->_cachePath, &v37)
      || !v37)
    {
      -[NSFileManager removeItemAtPath:error:](v29, "removeItemAtPath:error:", v8->_cachePath, 0LL);
      -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v29,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v8->_cachePath,  1LL,  0LL,  0LL);
    }

    v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    queue_cacheEntryByBundleIdentifier = v8->_queue_cacheEntryByBundleIdentifier;
    v8->_queue_cacheEntryByBundleIdentifier = v30;

    v32 = objc_alloc(&OBJC_CLASS___PBAppInfoController);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
    v34 = -[PBAppInfoController initWithInfoStore:filter:delegate:]( v32,  "initWithInfoStore:filter:delegate:",  v33,  &stru_1003D4B18,  0LL);
    appInfoController = v8->_appInfoController;
    v8->_appInfoController = v34;

    -[PBAppIconCache _buildAndPruneCache](v8, "_buildAndPruneCache");
    -[PBAppInfoController setDelegate:](v8->_appInfoController, "setDelegate:", v8);
  }

  return v8;
}

- (id)iconImageForAppWithBundleIdentifier:(id)a3 scale:(double)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_1000A4CC0;
  v19 = sub_1000A4CD0;
  id v20 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000A4CE8;
  v11[3] = &unk_1003D4B40;
  v11[4] = self;
  id v12 = v6;
  double v14 = a4;
  dispatch_queue_t v13 = &v15;
  id v8 = v6;
  dispatch_sync(accessQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)iconImageForApplication:(id)a3 scale:(double)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 bundleIdentifier]);
  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppIconCache iconImageForAppWithBundleIdentifier:scale:]( self,  "iconImageForAppWithBundleIdentifier:scale:",  v6,  a4));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (void)appInfoController:(id)a3 didUpdate:(id)a4
{
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v29 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v29 removedAppInfos]);
  id v6 = [v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
        objc_initWeak(&location, self);
        workQueue = (dispatch_queue_s *)self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000A52AC;
        block[3] = &unk_1003D0418;
        objc_copyWeak(&v44, &location);
        block[4] = v10;
        dispatch_async(workQueue, block);
        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
      }

      id v7 = [v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v7);
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v29 addedAppInfos]);
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (j = 0LL; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)j);
        objc_initWeak(&location, self);
        v18 = (dispatch_queue_s *)self->_workQueue;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_1000A52E0;
        v37[3] = &unk_1003D0418;
        objc_copyWeak(&v38, &location);
        v37[4] = v17;
        dispatch_async(v18, v37);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }

      id v14 = [v12 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }

    while (v14);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v29 oldToNewUpdatedAppInfos]);
  id v19 = [obj countByEnumeratingWithState:&v33 objects:v50 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v34;
    do
    {
      for (k = 0LL; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)k);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v29 oldToNewUpdatedAppInfos]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v23]);

        v26 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppInfo changesFromAppInfo:toAppInfo:]( &OBJC_CLASS___PBAppInfo,  "changesFromAppInfo:toAppInfo:",  v23,  v25));
        if ([v26 containsObject:@"lastModifiedDate"])
        {
          objc_initWeak(&location, self);
          uint64_t v27 = (dispatch_queue_s *)self->_workQueue;
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472LL;
          v30[2] = sub_1000A5318;
          v30[3] = &unk_1003D0418;
          objc_copyWeak(&v32, &location);
          id v31 = v25;
          dispatch_async(v27, v30);

          objc_destroyWeak(&v32);
          objc_destroyWeak(&location);
        }
      }

      id v20 = [obj countByEnumeratingWithState:&v33 objects:v50 count:16];
    }

    while (v20);
  }
}

- (void)_workQueue_createApplicationIcon:(id)a3 preferExisting:(BOOL)a4
{
  BOOL v37 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class(self) _appIconNameForAppInfo:v5];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v35)
  {
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    __int128 v34 = -[_PBAppIconCacheEntry initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS____PBAppIconCacheEntry),  "initWithBundleIdentifier:",  v38);
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id obj = self->_iconScales;
    id v39 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
    if (v39)
    {
      uint64_t v36 = *(void *)v45;
      *(void *)&__int128 v7 = 138543874LL;
      __int128 v32 = v7;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)v8), "doubleValue", v32);
          double v10 = v9;
          dispatch_queue_t v11 = (void *)objc_opt_class(self);
          [v5 lastModifiedDate];
          id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 _cacheKeyForBundleIdentifier:v38 scale:v10 lastModifiedDate:v12]);
          id v14 = [(id)objc_opt_class(self) _pathForCacheKey:v13 cacheDirectory:self->_cachePath];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          if (v37
            && (v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager")),
                unsigned int v17 = [v16 fileExistsAtPath:v15],
                v16,
                v17))
          {
            -[_PBAppIconCacheEntry setCacheKey:forScale:](v34, "setCacheKey:forScale:", v13, v10);
          }

          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleURL]);
            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage tvsui_applicationIconImageForBundleURL:iconName:scale:]( &OBJC_CLASS___UIImage,  "tvsui_applicationIconImageForBundleURL:iconName:scale:",  v18,  v35,  v10));

            id v20 = -[NSURL initFileURLWithPath:](objc_alloc(&OBJC_CLASS___NSURL), "initFileURLWithPath:", v15);
            uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue([UTTypeJPEG identifier]);
            v22 = CGImageDestinationCreateWithURL((CFURLRef)v20, v21, 1uLL, 0LL);

            if (v22)
            {
              v52[0] = kCGImageDestinationLossyCompressionQuality;
              v52[1] = kCGImageDestinationImageMaxPixelSize;
              v53[0] = &off_1003FEAA0;
              double v23 = v10 * self->_iconSize.width;
              if (v23 < v10 * self->_iconSize.height) {
                double v23 = v10 * self->_iconSize.height;
              }
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23));
              v53[1] = v24;
              v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v53,  v52,  2LL));

              CGImageDestinationAddImage(v22, (CGImageRef)[v19 CGImage], v25);
              if (!CGImageDestinationFinalize(v22))
              {
                id v26 = sub_1000F67CC();
                uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  name = self->_name;
                  *(_DWORD *)buf = v32;
                  *(void *)&buf[4] = name;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v38;
                  *(_WORD *)&buf[22] = 2048;
                  __int128 v49 = *(uint64_t (**)(uint64_t, uint64_t))&v10;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "[%{public}@] Failed to cache application icon {bundleID=%@, scale=%.f}",  buf,  0x20u);
                }
              }

              CFRelease(v22);
              -[_PBAppIconCacheEntry setCacheKey:forScale:](v34, "setCacheKey:forScale:", v13, v10);
            }
          }

          uint64_t v8 = (char *)v8 + 1;
        }

        while (v39 != v8);
        id v39 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v54,  16LL);
      }

      while (v39);
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    __int128 v49 = sub_1000A4CC0;
    v50 = sub_1000A4CD0;
    id v51 = 0LL;
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000A5838;
    block[3] = &unk_1003D4B68;
    v43 = buf;
    block[4] = self;
    id v30 = v38;
    id v41 = v30;
    id v31 = v34;
    __int128 v42 = v31;
    dispatch_sync(accessQueue, block);
    -[PBAppIconCache _workQueue_removeApplicationIconsForCacheEntry:]( self,  "_workQueue_removeApplicationIconsForCacheEntry:",  *(void *)(*(void *)&buf[8] + 40LL));

    _Block_object_dispose(buf, 8);
  }
}

- (void)_workQueue_removeApplicationIconsForAppInfo:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  dispatch_queue_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_1000A4CC0;
  id v14 = sub_1000A4CD0;
  id v15 = 0LL;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000A597C;
  block[3] = &unk_1003D0AD8;
  double v9 = &v10;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  dispatch_sync(accessQueue, block);
  -[PBAppIconCache _workQueue_removeApplicationIconsForCacheEntry:]( self,  "_workQueue_removeApplicationIconsForCacheEntry:",  v11[5]);

  _Block_object_dispose(&v10, 8);
}

- (void)_workQueue_removeApplicationIconsForCacheEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v6 = self->_iconScales;
    id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v10), "doubleValue", (void)v14);
          dispatch_queue_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyForScale:"));
          if (v11)
          {
            id v12 = [(id)objc_opt_class(self) _pathForCacheKey:v11 cacheDirectory:self->_cachePath];
            id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            [v5 removeItemAtPath:v13 error:0];
          }

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
      }

      while (v8);
    }
  }
}

- (void)_buildAndPruneCache
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppInfoController appInfos](self->_appInfoController, "appInfos"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000A5E60;
  v30[3] = &unk_1003D0B78;
  void v30[4] = self;
  v18 = v3;
  id v31 = v18;
  [v16 enumerateKeysAndObjectsUsingBlock:v30];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v17 enumeratorAtPath:self->_cachePath]);
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((-[NSMutableSet containsObject:](v18, "containsObject:", v8) & 1) == 0)
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathComponent:]( self->_cachePath,  "stringByAppendingPathComponent:",  v8));
          [v17 removeItemAtPath:v9 error:0];
        }
      }

      id v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }

    while (v5);
  }

  objc_initWeak(&location, self);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v16 objectEnumerator]);
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (j = 0LL; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)j);
        workQueue = (dispatch_queue_s *)self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000A5FCC;
        block[3] = &unk_1003D0418;
        objc_copyWeak(&v20, &location);
        block[4] = v14;
        dispatch_async(workQueue, block);
        objc_destroyWeak(&v20);
      }

      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v32 count:16];
    }

    while (v11);
  }

  objc_destroyWeak(&location);
}

+ (id)_cacheKeyForBundleIdentifier:(id)a3 scale:(double)a4 lastModifiedDate:(double)a5
{
  id v7 = a3;
  uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@-%.f-%f",  v7,  *(void *)&a4,  *(void *)&a5);

  return v8;
}

+ (id)_pathForCacheKey:(id)a3 cacheDirectory:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue([a4 stringByAppendingPathComponent:a3]);
}

+ (id)_placeholderIconImageForScale:(double)a3
{
  return (id)objc_claimAutoreleasedReturnValue( +[UIImage tvsui_placeholderImageWithScale:]( &OBJC_CLASS___UIImage,  "tvsui_placeholderImageWithScale:",  a3));
}

+ (id)_appIconNameForAppInfo:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 alternateIconName]);
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue([v3 primaryIconName]);
  }
  id v7 = v6;

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (NSArray)iconScales
{
  return self->_iconScales;
}

- (PBAppInfoController)appInfoController
{
  return self->_appInfoController;
}

- (NSMutableDictionary)queue_cacheEntryByBundleIdentifier
{
  return self->_queue_cacheEntryByBundleIdentifier;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
}

@end