@interface TVPhotosTopShelfMemoryManager
- (ACAccountStore)accountStore;
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)isSharedAlbumsEnabled;
- (NSString)primaryAccountUsername;
- (PHPhotoLibrary)photoLibrary;
- (TVPhotosTopShelfMemoryManager)init;
- (id)_createDataSourceManager;
- (id)fetchMemoryItems;
- (void)_accountDidChangeWithIdenfitier:(id)a3;
- (void)_accountStoreDidChange:(id)a3;
- (void)_updateiCloudPhotoEnabledWithAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setIsCloudPhotoLibraryEnabled:(BOOL)a3;
- (void)setIsSharedAlbumsEnabled:(BOOL)a3;
- (void)setPrimaryAccountUsername:(id)a3;
@end

@implementation TVPhotosTopShelfMemoryManager

- (TVPhotosTopShelfMemoryManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVPhotosTopShelfMemoryManager;
  v2 = -[TVPhotosTopShelfMemoryManager init](&v14, "init");
  if (v2)
  {
    v3 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](&OBJC_CLASS___PHPhotoLibrary, "sharedPhotoLibrary"));
    id v13 = 0LL;
    unsigned __int8 v4 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:]( v3,  "openAndWaitWithUpgrade:error:",  0LL,  &v13);
    id v5 = v13;
    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Open photo library error %@",  buf,  0xCu);
    }

    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = v3;
    v7 = v3;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v2->_accountStore, "aa_primaryAppleAccount"));
    -[TVPhotosTopShelfMemoryManager _updateiCloudPhotoEnabledWithAccount:]( v2,  "_updateiCloudPhotoEnabledWithAccount:",  v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v11 addObserver:v2 selector:"_accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
  }

  return v2;
}

- (id)fetchMemoryItems
{
  v34 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 10LL);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager _createDataSourceManager](self, "_createDataSourceManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v29 dataSource]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 entries]);

  id obj = v4;
  id v32 = [v4 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v48;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v5;
        v6 = *(void **)(*((void *)&v47 + 1) + 8 * v5);
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        __int128 v46 = 0u;
        id v35 = (id)objc_claimAutoreleasedReturnValue([v6 memories]);
        id v7 = [v35 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v44 != v9) {
                objc_enumerationMutation(v35);
              }
              v11 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue([v11 primaryAsset]);
              if (v12)
              {
                id v13 = [[PHResourceLocalAvailabilityRequest alloc] initWithAsset:v12 requestType:1];
                id v14 = objc_alloc_init(&OBJC_CLASS___PHResourceLocalAvailabilityRequestOptions);
                [v14 setTreatLivePhotoAsStill:1];
                id v15 = [v13 resourceAvailabilityForOptions:v14 resourceInfo:0];
                if (v15)
                {
                  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
                  unsigned int v17 = [v16 BOOLForKey:@"TVPhotosTopShelfForceHeadBoardDownload"];

                  if (!v17) {
                    goto LABEL_26;
                  }
                }

                v37 = objc_alloc(&OBJC_CLASS___TVPhotosTopShelfMemoryItem);
                v39 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedTitle]);
                v36 = (void *)objc_claimAutoreleasedReturnValue([v39 localizedUppercaseString]);
                id v40 = v13;
                v18 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDateText]);
                v19 = (void *)objc_claimAutoreleasedReturnValue([v11 assetCollection]);
                id v38 = v15;
                id v20 = v14;
                v21 = (void *)objc_claimAutoreleasedReturnValue([v19 localIdentifier]);
                id v22 = v8;
                uint64_t v23 = v9;
                v24 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
                v25 = -[TVPhotosTopShelfMemoryItem initWithTitle:subtitle:memoryIdentifier:keyAssetIdentifier:]( v37,  "initWithTitle:subtitle:memoryIdentifier:keyAssetIdentifier:",  v36,  v18,  v21,  v24);

                uint64_t v9 = v23;
                id v8 = v22;

                id v14 = v20;
                id v13 = v40;

                -[NSMutableArray addObject:](v34, "addObject:", v25);
                if (v38)
                {
LABEL_26:
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue([v12 localIdentifier]);
                    *(_DWORD *)buf = 138412290;
                    v52 = v26;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "[TVPhotosTopShelfExtension] Downloading is required for top shelf asset with identifier: %@",  buf,  0xCu);
                  }

                  v41[0] = _NSConcreteStackBlock;
                  v41[1] = 3221225472LL;
                  v41[2] = sub_100004E5C;
                  v41[3] = &unk_100008250;
                  id v42 = v12;
                  [v13 retrieveRequiredResourcesWithOptions:v14 completionHandler:v41];
                }
              }
            }

            id v8 = [v35 countByEnumeratingWithState:&v43 objects:v53 count:16];
          }

          while (v8);
        }

        uint64_t v5 = v33 + 1;
      }

      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    }

    while (v32);
  }

  id v27 = -[NSMutableArray copy](v34, "copy");
  return v27;
}

- (id)_createDataSourceManager
{
  id v3 = objc_alloc(&OBJC_CLASS___PXMemoriesFeedWidgetDataSourceManager);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager photoLibrary](self, "photoLibrary"));
  id v5 = [v3 initWithPhotoLibrary:v4];

  [v5 setMaxCount:10];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v7 = [v6 BOOLForKey:@"TVPhotosTopShelfFavoritesDemoMode"];

  [v5 setOnlyFavorites:v7];
  [v5 startGeneratingMemories];
  [v5 generateAdditionalEntriesIfPossible];
  return v5;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:ACAccountTypeIdentifierKey]);

  if ([v6 isEqualToString:ACAccountTypeIdentifierAppleAccount])
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000050FC;
    block[3] = &unk_100008278;
    id v8 = v4;
    objc_copyWeak(&v9, &location);
    dispatch_async(&_dispatch_main_q, block);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
}

- (void)_accountDidChangeWithIdenfitier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotosTopShelfMemoryManager accountStore](self, "accountStore"));
  id v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_primaryAppleAccount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    -[TVPhotosTopShelfMemoryManager _updateiCloudPhotoEnabledWithAccount:]( self,  "_updateiCloudPhotoEnabledWithAccount:",  v8);
  }

  else if (!v8)
  {
    -[TVPhotosTopShelfMemoryManager setPrimaryAccountUsername:](self, "setPrimaryAccountUsername:", 0LL);
  }

  +[TVPhotosTopShelfContentProvider topShelfContentDidChange]( &OBJC_CLASS___TVPhotosTopShelfContentProvider,  "topShelfContentDidChange");
}

- (void)_updateiCloudPhotoEnabledWithAccount:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 username]);
  -[TVPhotosTopShelfMemoryManager setPrimaryAccountUsername:](self, "setPrimaryAccountUsername:", v4);

  id v5 = [v7 isEnabledForDataclass:kAccountDataclassCloudPhotos];
  if ((_DWORD)v5 != -[TVPhotosTopShelfMemoryManager isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled")) {
    -[TVPhotosTopShelfMemoryManager setIsCloudPhotoLibraryEnabled:](self, "setIsCloudPhotoLibraryEnabled:", v5);
  }
  id v6 = [v7 isEnabledForDataclass:kAccountDataclassSharedStreams];
  if ((_DWORD)v6 != -[TVPhotosTopShelfMemoryManager isSharedAlbumsEnabled](self, "isSharedAlbumsEnabled")) {
    -[TVPhotosTopShelfMemoryManager setIsSharedAlbumsEnabled:](self, "setIsSharedAlbumsEnabled:", v6);
  }
}

- (NSString)primaryAccountUsername
{
  return self->_primaryAccountUsername;
}

- (void)setPrimaryAccountUsername:(id)a3
{
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return self->_isCloudPhotoLibraryEnabled;
}

- (void)setIsCloudPhotoLibraryEnabled:(BOOL)a3
{
  self->_isCloudPhotoLibraryEnabled = a3;
}

- (BOOL)isSharedAlbumsEnabled
{
  return self->_isSharedAlbumsEnabled;
}

- (void)setIsSharedAlbumsEnabled:(BOOL)a3
{
  self->_isSharedAlbumsEnabled = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end