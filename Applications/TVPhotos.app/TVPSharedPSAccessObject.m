@interface TVPSharedPSAccessObject
+ (id)accessObjectWithAppleAccount:(id)a3;
+ (id)delegatePluginForPersonID:(id)a3;
+ (void)initialize;
- (ACAccount)appleAccount;
- (BOOL)isAlbumUnviewedForAlbumID:(id)a3;
- (BOOL)isAssetUnviewedForAssetID:(id)a3;
- (NSCache)mediaURLCache;
- (TVPSharedPSAccessObjectDelegate)delegate;
- (id)_imageForAssetID:(id)a3 canLoad:(BOOL *)a4;
- (id)_imageTokenForAssetID:(id)a3;
- (id)_imageTokenForMSAsset:(id)a3;
- (id)_serverSideModel;
- (id)accessControlsForAlbumID:(id)a3;
- (id)albumForAlbumID:(id)a3;
- (id)albumIDs;
- (id)albums;
- (id)assetForAssetID:(id)a3;
- (id)assetsForAlbumID:(id)a3;
- (id)captionForAssetID:(id)a3;
- (id)commentsForAssetID:(id)a3;
- (id)completionHandler;
- (id)invitationForAlbumID:(id)a3;
- (id)lastViewedCommentDateForAssetID:(id)a3;
- (id)latestAssetForAlbumID:(id)a3;
- (unint64_t)numberOfAssetsForAlbumID:(id)a3;
- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5;
- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4;
- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedAlbums:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindDeletedAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewAlbums:(id)a4 info:(id)a5;
- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7;
- (void)MSASModel:(id)a3 didFinishAcceptingInvitation:(id)a4 forAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5;
- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6;
- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5;
- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6;
- (void)_didFinishRetrievingAsset:(id)a3 inAlbum:(id)a4 imageData:(id)a5 error:(id)a6;
- (void)_loadImageForImageTokens:(id)a3;
- (void)_runSetup;
- (void)_tearDown;
- (void)acceptInvitationForAlbumID:(id)a3 completionHandler:(id)a4;
- (void)addComment:(id)a3 forAssetID:(id)a4;
- (void)pushNotificationServer:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)rejectInvitationForAlbumID:(id)a3;
- (void)removeAlbumForAlbumID:(id)a3;
- (void)removeAssetForAssetID:(id)a3;
- (void)removeCommentForCommentID:(id)a3;
- (void)resolveMediaURLForMSAsset:(id)a3 completionHandler:(id)a4;
- (void)setAlbumIsViewedForAlbumID:(id)a3;
- (void)setAppleAccount:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastViewedCommentDate:(id)a3 forAssetID:(id)a4;
- (void)setMediaURLCache:(id)a3;
- (void)tearDown;
- (void)unsubsribeFromAlbumForAlbumID:(id)a3;
@end

@implementation TVPSharedPSAccessObject

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVPSharedPSAccessObject, a2) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSPlatform);
    MSASInitialize();

    uint64_t v3 = MSASPlatform();
    id v5 = (id)objc_claimAutoreleasedReturnValue(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue([v5 albumSharingDaemon]);
    [v4 start];
  }

+ (id)accessObjectWithAppleAccount:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100102F10 appleAccount]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    [(id)qword_100102F10 tearDown];
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___TVPSharedPSAccessObject;
    id v9 = objc_msgSendSuper2(&v14, "accessObjectWithAppleAccount:", v4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)qword_100102F10;
    qword_100102F10 = v10;
  }

  id v12 = (id)qword_100102F10;

  return v12;
}

- (void)tearDown
{
  if ((TVPSharedPSAccessObject *)qword_100102F10 == self)
  {
    -[TVPSharedPSAccessObject setDelegate:](self, "setDelegate:", 0LL);
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___TVPSharedPSAccessObject;
    -[TVPAccessObject tearDown](&v4, "tearDown");
    uint64_t v3 = (void *)qword_100102F10;
    qword_100102F10 = 0LL;
  }

- (id)albumIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 albumGUIDs]);

  return v3;
}

- (id)albums
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 albums]);

  return v3;
}

- (id)albumForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 albumWithGUID:v4]);

  return v6;
}

- (void)removeAlbumForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v5 deleteAlbumWithGUID:v4];
}

- (id)invitationForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 invitationForAlbumWithGUID:v4]);

  return v6;
}

- (id)accessControlsForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessControlsForAlbumWithGUID:v4]);

  return v6;
}

- (BOOL)isAlbumUnviewedForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  unsigned __int8 v6 = [v5 isAlbumWithGUIDMarkedAsUnviewed:v4];

  return v6;
}

- (void)setAlbumIsViewedForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v5 markAlbumGUIDAsViewed:v4];
}

- (void)acceptInvitationForAlbumID:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject completionHandler](self, "completionHandler"))) {
    sub_100079B10();
  }
  -[TVPSharedPSAccessObject setCompletionHandler:](self, "setCompletionHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 invitationForAlbumWithGUID:v11]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 GUID]);
  [v9 acceptInvitationWithGUID:v10];
}

- (void)rejectInvitationForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 invitationForAlbumWithGUID:v4]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v8 GUID]);
  [v6 rejectInvitationWithGUID:v7];
}

- (void)unsubsribeFromAlbumForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v5 unsubscribeFromAlbumWithGUID:v4];
}

- (unint64_t)numberOfAssetsForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetCollectionGUIDsInAlbumWithGUID:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  id v8 = [v7 count];

  return (unint64_t)v8;
}

- (id)assetForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetCollectionWithGUID:v4]);

  return v6;
}

- (id)assetsForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetCollectionsInAlbumWithGUID:v4]);

  return v6;
}

- (id)latestAssetForAlbumID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetCollectionGUIDsInAlbumWithGUID:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  if ([v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 assetCollectionWithGUID:v9]);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

- (void)removeAssetForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v5 deleteAssetCollectionWithGUID:v4];
}

- (BOOL)isAssetUnviewedForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  unsigned __int8 v6 = [v5 isAssetCollectionWithGUIDMarkedAsUnviewed:v4];

  return v6;
}

- (void)resolveMediaURLForMSAsset:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    if (!v7) {
      sub_100079B38();
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assetCollectionGUID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@_%lu",  v9,  [v6 mediaAssetType]));

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject mediaURLCache](self, "mediaURLCache"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

    if (v12
      && (v13 = (void *)objc_claimAutoreleasedReturnValue([v12 expiration]),
          objc_super v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date")),
          id v15 = [v13 compare:v14],
          v14,
          v13,
          v15 == (id)1))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v12 url]);
      ((void (**)(void, void *, void))v8)[2](v8, v16, 0LL);
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject mediaURLCache](self, "mediaURLCache"));
      [v17 removeObjectForKey:v10];

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v6 assetCollectionGUID]);
      id v20 = [v6 mediaAssetType];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_10001AD8C;
      v21[3] = &unk_1000CA0F8;
      v21[4] = self;
      id v22 = v10;
      v23 = v8;
      [v18 videoURLsForAssetCollectionWithGUID:v19 forMediaAssetType:v20 completionBlock:v21];
    }
  }
}

- (id)commentsForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 commentsForAssetCollectionWithGUID:v4]);

  return v6;
}

- (id)captionForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 captionForAssetCollectionWithGUID:v4]);

  return v6;
}

- (void)addComment:(id)a3 forAssetID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v10 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));

  [v8 addComments:v9 toAssetCollectionWithGUID:v6];
}

- (void)removeCommentForCommentID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v5 deleteCommentWithGUID:v4];
}

- (id)lastViewedCommentDateForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastViewedCommentDateForAssetCollectionWithGUID:v4]);

  return v6;
}

- (void)setLastViewedCommentDate:(id)a3 forAssetID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  [v8 markCommentsForAssetCollectionWithGUID:v6 asViewedWithLastViewedDate:v7];
}

+ (id)delegatePluginForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = [[MSASServerSideModel alloc] initWithPersonID:v3];

  [v4 addObserver:qword_100102F10];
  return v4;
}

- (void)MSASModel:(id)a3 didFindNewAlbums:(id)a4 info:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_TVSLogInternalLogLevel >= 5)
  {
    if (pthread_main_np()) {
      id v12 = @"Main:";
    }
    else {
      id v12 = &stru_1000CC6C8;
    }
    pthread_t v15 = pthread_self();
    v16 = @"P";
    objc_super v14 = v12;
    _TVSLogBase(v5, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001B370;
  v17[3] = &unk_1000CA120;
  v17[4] = &v18;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v17, v14, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject delegate](self, "delegate"));
  [v13 sharedPSAccessObject:self albumsDidAddByAlsoAddingViewableAlbums:v10 viewableAlbumsAdded:*((unsigned __int8 *)v19 + 24)];

  _Block_object_dispose(&v18, 8);
}

- (void)MSASModel:(id)a3 didFindDeletedAlbums:(id)a4 info:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_TVSLogInternalLogLevel >= 5)
  {
    if (pthread_main_np()) {
      id v12 = @"Main:";
    }
    else {
      id v12 = &stru_1000CC6C8;
    }
    pthread_t v17 = pthread_self();
    uint64_t v18 = @"P";
    v16 = v12;
    _TVSLogBase(v5, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10001B564;
  v22[3] = &unk_1000CA120;
  v22[4] = v23;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v22, v16, v17, v18);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  objc_super v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B5A4;
  block[3] = &unk_1000C9BA8;
  block[4] = self;
  id v20 = v10;
  char v21 = v23;
  id v15 = v10;
  dispatch_async(v14, block);

  _Block_object_dispose(v23, 8);
}

- (void)MSASModel:(id)a3 didFindAlbumMetadataChange:(id)a4
{
  id v6 = a4;
  if ([v6 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      _TVSLogBase(v4, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001B744;
    block[3] = &unk_1000C9CC8;
    block[4] = self;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

- (void)MSASModel:(id)a3 didFindNewAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (_TVSLogInternalLogLevel >= 5)
  {
    if (pthread_main_np()) {
      id v15 = @"Main:";
    }
    else {
      id v15 = &stru_1000CC6C8;
    }
    pthread_t v16 = pthread_self();
    v32 = @"P";
    v33 = (void *)objc_claimAutoreleasedReturnValue([v13 GUID]);
    v30 = v15;
    pthread_t v31 = v16;
    _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    id v34 = v14;
    id v35 = v11;
    uint64_t v20 = *(void *)v40;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)i), "personID", v30, v31, v32, v33));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
        char v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aa_personID"));
        unsigned __int8 v25 = [v22 isEqualToString:v24];

        if ((v25 & 1) != 0)
        {
          char v26 = 1;
          goto LABEL_16;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v19) {
        continue;
      }
      break;
    }

    char v26 = 0;
LABEL_16:
    id v14 = v34;
    id v11 = v35;
  }

  else
  {
    char v26 = 0;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BA38;
  block[3] = &unk_1000CA188;
  block[4] = self;
  id v37 = v13;
  char v38 = v26;
  id v29 = v13;
  dispatch_async(v28, block);
}

- (void)MSASModel:(id)a3 didFindDeletedAccessControls:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (_TVSLogInternalLogLevel >= 5)
  {
    if (pthread_main_np()) {
      id v15 = @"Main:";
    }
    else {
      id v15 = &stru_1000CC6C8;
    }
    pthread_t v16 = pthread_self();
    v32 = @"P";
    v33 = (void *)objc_claimAutoreleasedReturnValue([v13 GUID]);
    v30 = v15;
    pthread_t v31 = v16;
    _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v17 = v12;
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    id v34 = v14;
    id v35 = v11;
    uint64_t v20 = *(void *)v40;
    while (2)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)i), "personID", v30, v31, v32, v33));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
        char v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "aa_personID"));
        unsigned __int8 v25 = [v22 isEqualToString:v24];

        if ((v25 & 1) != 0)
        {
          char v26 = 1;
          goto LABEL_16;
        }
      }

      id v19 = [v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v19) {
        continue;
      }
      break;
    }

    char v26 = 0;
LABEL_16:
    id v14 = v34;
    id v11 = v35;
  }

  else
  {
    char v26 = 0;
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BD28;
  block[3] = &unk_1000CA188;
  block[4] = self;
  id v37 = v13;
  char v38 = v26;
  id v29 = v13;
  dispatch_async(v28, block);
}

- (void)MSASModel:(id)a3 didFindAccessControlChange:(id)a4 inAlbum:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v9 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
      _TVSLogBase(v5, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001BEF0;
    block[3] = &unk_1000CA1B0;
    block[4] = self;
    id v14 = v9;
    id v15 = v8;
    dispatch_async(v11, block);
  }
}

- (void)MSASModel:(id)a3 didMarkAlbum:(id)a4 asHavingUnreadContent:(BOOL)a5
{
  id v7 = a4;
  if ([v7 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 GUID]);
      _TVSLogBase(v5, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C0E4;
    block[3] = &unk_1000C9CC8;
    block[4] = self;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)MSASModel:(id)a3 didFindNewAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([v10 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C2AC;
    block[3] = &unk_1000CA1B0;
    block[4] = self;
    id v15 = v10;
    id v16 = v9;
    dispatch_async(v12, block);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  if ([v10 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C474;
    block[3] = &unk_1000CA1B0;
    block[4] = self;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v12, block);
  }
}

- (void)MSASModel:(id)a3 didMarkAssetCollection:(id)a4 asHavingUnreadComments:(BOOL)a5 inAlbum:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if ([v10 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C680;
    block[3] = &unk_1000CA1B0;
    block[4] = self;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v12, block);
  }
}

- (void)MSASModel:(id)a3 didFindLastViewedCommentDate:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([v10 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 GUID]);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);
      _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001C87C;
    block[3] = &unk_1000CA1B0;
    block[4] = self;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v12, block);
  }
}

- (void)MSASModel:(id)a3 didFindDeletedComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v16 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      int v18 = pthread_main_np();
      id v19 = @"Main:";
      if (!v18) {
        id v19 = &stru_1000CC6C8;
      }
      id v29 = v19;
      id v30 = v13;
      uint64_t v20 = self;
      pthread_t v21 = pthread_self();
      v27 = (void *)objc_claimAutoreleasedReturnValue([v15 GUID]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v16 GUID]);
      pthread_t v25 = v21;
      char v26 = @"P";
      self = v20;
      id v13 = v30;
      char v24 = v29;
      _TVSLogBase(v7, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x2020000000LL;
    char v37 = 0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10001CB2C;
    v35[3] = &unk_1000CA218;
    v35[4] = v36;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v35, v24, v25, v26, v27, v28);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CB6C;
    block[3] = &unk_1000CA240;
    block[4] = self;
    id v32 = v15;
    id v33 = v16;
    id v34 = v36;
    dispatch_async(v23, block);

    _Block_object_dispose(v36, 8);
  }
}

- (void)MSASModel:(id)a3 didFindNewComments:(id)a4 forAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([v16 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      int v18 = pthread_main_np();
      id v19 = @"Main:";
      if (!v18) {
        id v19 = &stru_1000CC6C8;
      }
      id v29 = v19;
      id v30 = v13;
      uint64_t v20 = self;
      pthread_t v21 = pthread_self();
      v27 = (void *)objc_claimAutoreleasedReturnValue([v15 GUID]);
      v28 = (void *)objc_claimAutoreleasedReturnValue([v16 GUID]);
      pthread_t v25 = v21;
      char v26 = @"P";
      self = v20;
      id v13 = v30;
      char v24 = v29;
      _TVSLogBase(v7, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    v36[0] = 0LL;
    v36[1] = v36;
    v36[2] = 0x2020000000LL;
    char v37 = 0;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_10001CE28;
    v35[3] = &unk_1000CA218;
    v35[4] = v36;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v35, v24, v25, v26, v27, v28);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001CE68;
    block[3] = &unk_1000CA240;
    block[4] = self;
    id v32 = v15;
    id v33 = v16;
    id v34 = v36;
    dispatch_async(v23, block);

    _Block_object_dispose(v36, 8);
  }
}

- (void)MSASModel:(id)a3 didFindCommentChange:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v12 isViewable])
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      pthread_main_np();
      pthread_self();
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 GUID]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 GUID]);
      _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001D090;
    block[3] = &unk_1000CA268;
    block[4] = self;
    id v18 = v11;
    id v19 = v12;
    id v20 = v10;
    dispatch_async(v14, block);
  }
}

- (void)MSASModel:(id)a3 didFinishAcceptingInvitation:(id)a4 forAlbum:(id)a5 error:(id)a6
{
  id v9 = a6;
  if (_TVSLogInternalLogLevel >= 5)
  {
    id v10 = a5;
    pthread_main_np();
    pthread_self();
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 GUID]);

    _TVSLogBase(v6, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D24C;
  v13[3] = &unk_1000C9CC8;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v13);
}

- (void)MSASModel:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    id v15 = v14;
    if (_TVSLogInternalLogLevel >= 3)
    {
      pthread_main_np();
      pthread_self();
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 assetCollectionGUID]);
      _TVSLogBase(v6, &_os_log_default, 65LL, 0LL, 3LL, @"P");
    }

    id v16 = 0LL;
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
    id v29 = 0LL;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v17,  8LL,  &v29));
    id v15 = v29;

    if (v15 && _TVSLogInternalLogLevel >= 3)
    {
      pthread_main_np();
      pthread_self();
      v23 = (void *)objc_claimAutoreleasedReturnValue([v12 assetCollectionGUID]);
      _TVSLogBase(v6, &_os_log_default, 65LL, 0LL, 3LL, @"P");
    }
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10001D548;
  v24[3] = &unk_1000CA290;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v16;
  id v28 = v15;
  id v18 = v15;
  id v19 = v16;
  id v20 = v13;
  id v21 = v12;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v24);
}

- (void)MSASModel:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D61C;
  block[3] = &unk_1000CA1B0;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)pushNotificationServer:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject delegate](self, "delegate", a3, a4, a5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_personID"));
  [v6 sharedPSAccessObject:self willBeginSyncForPersonID:v8];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001D70C;
  v9[3] = &unk_1000C9528;
  v9[4] = self;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v9);
}

- (void)_runSetup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
  [v3 addListener:self forTopic:@"com.apple.sharedstreams"];

  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___NSCache);
  -[TVPSharedPSAccessObject setMediaURLCache:](self, "setMediaURLCache:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject mediaURLCache](self, "mediaURLCache"));
  [v5 setCountLimit:10];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject delegate](self, "delegate"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_personID"));
  [v6 sharedPSAccessObject:self willBeginSyncForPersonID:v8];

  uint64_t v9 = MSASPlatform();
  id v13 = (id)objc_claimAutoreleasedReturnValue(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 albumSharingDaemon]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aa_personID"));
  [v10 refreshResetSync:0 personID:v12 info:0];
}

- (void)_tearDown
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
  [v3 removeListener:self];

  -[TVPSharedPSAccessObject setMediaURLCache:](self, "setMediaURLCache:", 0LL);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v5 = MSASPlatform();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 albumSharingDaemon]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_personID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001D9D4;
  v11[3] = &unk_1000C9528;
  dispatch_semaphore_t v12 = v4;
  id v10 = v4;
  [v7 forgetEverythingAboutPersonID:v9 completionBlock:v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)_imageForAssetID:(id)a3 canLoad:(BOOL *)a4
{
  if (a4) {
    *a4 = 1;
  }
  return 0LL;
}

- (id)_imageTokenForAssetID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetCollectionWithGUID:v4]);

  id v8 = (void *)objc_opt_class(self, v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 assets]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 _filterAppositePhotoAssetFromAssets:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _imageTokenForMSAsset:](self, "_imageTokenForMSAsset:", v10));
  return v11;
}

- (void)_loadImageForImageTokens:(id)a3
{
  id v4 = a3;
  id v21 = v4;
  if ([v4 count])
  {
    uint64_t v5 = v4;
    do
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  objc_msgSend(v5, "count", v21)));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 asset]);
      [v6 addObject:v8];

      else {
        id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1));
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 assetID]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 assetCollectionWithGUID:v10]);
      dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 albumGUID]);

      if (v12)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_10001DCF8;
        v22[3] = &unk_1000CA2B8;
        v22[4] = self;
        id v14 = v12;
        id v23 = v14;
        id v15 = v6;
        id v24 = v15;
        id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v22));
        uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v16]);

        if ([v15 count])
        {
          id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _serverSideModel](self, "_serverSideModel"));
          [v18 retrieveAssets:v15 inAlbumWithGUID:v14];
        }

        id v4 = (id)v17;
      }

      else
      {
        id v19 = (void *)objc_opt_class(self, v13);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v7 assetID]);
        [v19 _cancelFetchForAccessObject:self assetID:v20];
      }

      uint64_t v5 = v4;
    }

    while ([v4 count]);
  }
}

- (void)_didFinishRetrievingAsset:(id)a3 inAlbum:(id)a4 imageData:(id)a5 error:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  id v11 = (void *)objc_opt_class(self, v10);
  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject _imageTokenForMSAsset:](self, "_imageTokenForMSAsset:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10001DE88;
  v14[3] = &unk_1000CA2E0;
  id v15 = v8;
  id v13 = v8;
  [v11 _postProcessFetchForAccessObject:self imageToken:v12 withHandler:v14];
}

- (id)_serverSideModel
{
  uint64_t v3 = MSASPlatform(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 albumSharingDaemon]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPSharedPSAccessObject appleAccount](self, "appleAccount"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aa_personID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 existingModelForPersonID:v7]);

  return v8;
}

- (id)_imageTokenForMSAsset:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSAsset);
    -[TVPAsset setAsset:](v4, "setAsset:", v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 assetCollectionGUID]);

    -[TVPAsset setAssetID:](v4, "setAssetID:", v5);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (ACAccount)appleAccount
{
  return self->appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (TVPSharedPSAccessObjectDelegate)delegate
{
  return (TVPSharedPSAccessObjectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSCache)mediaURLCache
{
  return self->_mediaURLCache;
}

- (void)setMediaURLCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end