@interface TVPMyPSAccessObject
+ (id)accessObjectWithAppleAccount:(id)a3;
+ (id)dbCachePathForPersonID:(id)a3;
+ (id)deleterPluginForPersonID:(id)a3;
+ (id)personIDForPollingTriggeredByPushNotification;
+ (id)subscriberPluginForPersonID:(id)a3;
- (MSSubscriber)subscriber;
- (NSArray)assets;
- (TVAssetLibrary)imageManager;
- (TVPMyPSAccessObjectDelegate)delegate;
- (TVPMyPSImageLoadTask)imageLoadTask;
- (id)_assetForAssetID:(id)a3;
- (id)_dateFormatter;
- (id)_imageForAssetID:(id)a3;
- (id)_imageForAssetID:(id)a3 canLoad:(BOOL *)a4;
- (id)_imagePathForAssetID:(id)a3;
- (id)_loadAssetsFromDB;
- (void)_addNewAssetsFromServerAssets:(id)a3;
- (void)_createOrOpenDB;
- (void)_didCompleteCheckForNewAssetCollections;
- (void)_didFinishDeletingAssetCollection:(id)a3 error:(id)a4;
- (void)_didFinishRetrievingAsset:(id)a3 imageData:(id)a4 error:(id)a5;
- (void)_didReceiveDeleteForAssetCollections:(id)a3;
- (void)_didRequestAssetRetrievalForAssetCollections:(id)a3;
- (void)_insertDBAsset:(id)a3;
- (void)_insertDBAssets:(id)a3;
- (void)_loadImageForImageTokens:(id)a3;
- (void)_purgeImageForAssetID:(id)a3;
- (void)_purgeImages;
- (void)_removeAssets:(id)a3;
- (void)_removeDB;
- (void)_removeDBAsset:(id)a3;
- (void)_removeDBAssets:(id)a3;
- (void)_runSetup;
- (void)_tearDown;
- (void)_updateDBAsset:(id)a3 newState:(int)a4;
- (void)_writeImageFromImageData:(id)a3 assetID:(id)a4 completionHandler:(id)a5;
- (void)deleter:(id)a3 didFinishDeletingAssetCollection:(id)a4 error:(id)a5;
- (void)pushNotificationServer:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)removeAssetForAssetID:(id)a3;
- (void)setAssets:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageLoadTask:(id)a3;
- (void)setImageManager:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)subscriber:(id)a3 didFinishRetrievingAsset:(id)a4 error:(id)a5;
- (void)subscriber:(id)a3 didReceiveDeleteForAssetCollections:(id)a4 streamID:(id)a5;
- (void)subscriber:(id)a3 didRequestAssetRetrievalForAssetCollections:(id)a4 streamID:(id)a5;
- (void)subscriberDidCompleteCheckForNewAssetCollections:(id)a3;
- (void)subscriberWillAssignPluginAsDelegateOfSubscriber:(id)a3;
- (void)tearDown;
@end

@implementation TVPMyPSAccessObject

+ (id)accessObjectWithAppleAccount:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103320 appleAccount]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    [(id)qword_100103320 tearDown];
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___TVPMyPSAccessObject;
    id v9 = objc_msgSendSuper2(&v14, "accessObjectWithAppleAccount:", v4);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)qword_100103320;
    qword_100103320 = v10;
  }

  id v12 = (id)qword_100103320;

  return v12;
}

- (void)tearDown
{
  if ((TVPMyPSAccessObject *)qword_100103320 == self)
  {
    -[TVPMyPSAccessObject setDelegate:](self, "setDelegate:", 0LL);
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___TVPMyPSAccessObject;
    -[TVPAccessObject tearDown](&v4, "tearDown");
    v3 = (void *)qword_100103320;
    qword_100103320 = 0LL;
  }

- (void)removeAssetForAssetID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10005D080;
  v20[3] = &unk_1000CBFF0;
  id v21 = v4;
  id v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v20));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSAsset asset](&OBJC_CLASS___MSAsset, "asset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 asset]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 masterAssetHash]);
  [v10 setFileHash:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssetCollection collectionWithMasterAsset:fileName:]( &OBJC_CLASS___MSAssetCollection,  "collectionWithMasterAsset:fileName:",  v10,  0LL));
  uint64_t v14 = MSPlatform();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 theDaemon]);
  v22 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject appleAccount](self, "appleAccount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "aa_personID"));
  [v16 deleteAssetCollections:v17 forPersonID:v19];
}

+ (id)dbCachePathForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"PhotosDB"]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@.db", v11, v3));

  return v12;
}

+ (id)subscriberPluginForPersonID:(id)a3
{
  id v3 = (void *)qword_100103320;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appleAccount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    unsigned __int8 v8 = (void *)qword_100103320;
  }
  else {
    unsigned __int8 v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

+ (id)personIDForPollingTriggeredByPushNotification
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103320 appleAccount]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_personID"));

  return v3;
}

- (void)subscriberWillAssignPluginAsDelegateOfSubscriber:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10005D32C;
  v4[3] = &unk_1000C9CC8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[TVPAccessObject _queueOperation:](v5, "_queueOperation:", v4);
}

- (void)subscriber:(id)a3 didRequestAssetRetrievalForAssetCollections:(id)a4 streamID:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005D3B0;
  v6[3] = &unk_1000C9CC8;
  unsigned int v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[TVPAccessObject _queueOperation:](v7, "_queueOperation:", v6);
}

- (void)subscriber:(id)a3 didFinishRetrievingAsset:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0LL;
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v7 path]);
    id v19 = 0LL;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v11,  8LL,  &v19));
    id v9 = v19;
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10005D4D8;
  v15[3] = &unk_1000CA268;
  v15[4] = self;
  id v16 = v7;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v7;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v15);
}

- (void)subscriber:(id)a3 didReceiveDeleteForAssetCollections:(id)a4 streamID:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005D564;
  v6[3] = &unk_1000C9CC8;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  -[TVPAccessObject _queueOperation:](v7, "_queueOperation:", v6);
}

- (void)subscriberDidCompleteCheckForNewAssetCollections:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10005D5C0;
  v3[3] = &unk_1000C9528;
  v3[4] = self;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v3);
}

+ (id)deleterPluginForPersonID:(id)a3
{
  id v3 = (void *)qword_100103320;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 appleAccount]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    id v8 = (void *)qword_100103320;
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;

  return v9;
}

- (void)deleter:(id)a3 didFinishDeletingAssetCollection:(id)a4 error:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005D6F0;
  v8[3] = &unk_1000CA1B0;
  id v9 = self;
  id v10 = a4;
  id v11 = a5;
  id v6 = v11;
  id v7 = v10;
  -[TVPAccessObject _queueOperation:](v9, "_queueOperation:", v8);
}

- (void)pushNotificationServer:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005D750;
  v5[3] = &unk_1000C9528;
  v5[4] = self;
  -[TVPAccessObject _queueOperation:](self, "_queueOperation:", v5, a4, a5);
}

- (void)_runSetup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject _loadAssetsFromDB](self, "_loadAssetsFromDB"));
  -[TVPMyPSAccessObject setAssets:](self, "setAssets:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
  [v4 addListener:self forTopic:@"com.apple.mediastream.subscription.push"];

  uint64_t v5 = MSPlatform();
  id v9 = (id)objc_claimAutoreleasedReturnValue(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v9 theDaemon]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject appleAccount](self, "appleAccount"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_personID"));
  [v6 pollForSubscriptionUpdatesForPersonID:v8];
}

- (void)_tearDown
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVCKPushNotificationServer sharedInstance]( &OBJC_CLASS___TVCKPushNotificationServer,  "sharedInstance"));
  [v3 removeListener:self];

  uint64_t v4 = MSPlatform();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 theDaemon]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject appleAccount](self, "appleAccount"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "aa_personID"));
  [v6 forgetPersonID:v8];

  -[TVPMyPSAccessObject setSubscriber:](self, "setSubscriber:", 0LL);
  -[TVPMyPSAccessObject _purgeImages](self, "_purgeImages");
}

- (id)_imageForAssetID:(id)a3 canLoad:(BOOL *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject _assetForAssetID:](self, "_assetForAssetID:", a3));
  id v7 = v6;
  if (a4)
  {
    BOOL v8 = [v6 state] == 1 || objc_msgSend(v7, "state") == 0;
    *a4 = v8;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 assetID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject _imageForAssetID:](self, "_imageForAssetID:", v9));

  return v10;
}

- (void)_loadImageForImageTokens:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_arrayByMappingObjectsUsingBlock:", &stru_1000CC030));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject subscriber](self, "subscriber"));
  [v4 retrieveAssets:v5];
}

- (void)_didRequestAssetRetrievalForAssetCollections:(id)a3
{
  id v3 = a3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v47;
    uint64_t v35 = kMSAssetMetadataDateContentCreatedKey;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        if (!objc_msgSend(v7, "wasDeleted", v29, v30, v31, v32))
        {
          id v10 = (TVPMyPSAsset *)objc_claimAutoreleasedReturnValue([v7 derivedAssets]);
          if (!-[TVPMyPSAsset count](v10, "count"))
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 masterAsset]);
            uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v12));

            id v10 = (TVPMyPSAsset *)v13;
          }

          id v14 = objc_msgSend((id)objc_opt_class(self, v11), "_filterAppositePhotoAssetFromAssets:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          if (v15)
          {
            id v16 = objc_alloc_init(&OBJC_CLASS___TVPMyPSAsset);
            -[TVPAsset setAsset:](v16, "setAsset:", v15);
            -[TVPAsset setState:](v16, "setState:", 0LL);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 assetCollectionID]);
            -[TVPAsset setAssetID:](v16, "setAssetID:", v17);

            id v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset asset](v16, "asset"));
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 metadata]);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v35]);

            if (!v20)
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 masterAsset]);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v21 metadata]);
              v20 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v35]);
            }

            -[TVPAsset setDateContentCreated:](v16, "setDateContentCreated:", v20);
            [v33 addObject:v16];

LABEL_23:
          }

          else if (_TVSLogInternalLogLevel >= 5)
          {
            if (pthread_main_np()) {
              v23 = @"Main:";
            }
            else {
              v23 = &stru_1000CC6C8;
            }
            pthread_t v24 = pthread_self();
            id v16 = (TVPMyPSAsset *)objc_claimAutoreleasedReturnValue([v7 assetCollectionID]);
            v31 = @"P";
            v32 = v16;
            v29 = v23;
            pthread_t v30 = v24;
            _TVSLogBase(v34, &_os_log_default, 1LL, 0LL, 5LL, @"P");
            goto LABEL_23;
          }

          goto LABEL_25;
        }

        if (_TVSLogInternalLogLevel < 5) {
          continue;
        }
        if (pthread_main_np()) {
          BOOL v8 = @"Main:";
        }
        else {
          BOOL v8 = &stru_1000CC6C8;
        }
        pthread_t v9 = pthread_self();
        id v10 = (TVPMyPSAsset *)objc_claimAutoreleasedReturnValue([v7 assetCollectionID]);
        v31 = @"P";
        v32 = v10;
        v29 = v8;
        pthread_t v30 = v9;
        _TVSLogBase(v34, &_os_log_default, 1LL, 0LL, 5LL, @"P");
LABEL_25:
      }

      id v4 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }

    while (v4);
  }

  -[TVPMyPSAccessObject _addNewAssetsFromServerAssets:](self, "_addNewAssetsFromServerAssets:", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v25));

  [v26 sortUsingComparator:&stru_1000CC070];
  -[TVPMyPSAccessObject setAssets:](self, "setAssets:", v26);
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_10005E000;
  v44 = sub_10005E010;
  id v45 = 0LL;
  v39[0] = 0LL;
  v39[1] = v39;
  v39[2] = 0x2020000000LL;
  v39[3] = 0LL;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_10005E018;
  v38[3] = &unk_1000CC098;
  v38[4] = self;
  v38[5] = v39;
  v38[6] = &v40;
  [v27 enumerateObjectsWithOptions:2 usingBlock:v38];

  -[TVPMyPSAccessObject _removeAssets:](self, "_removeAssets:", v41[5]);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject delegate](self, "delegate"));
  [v28 assetsDidChangeForMyPSAccessObject:self];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);
}

- (void)_didFinishRetrievingAsset:(id)a3 imageData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSError *)a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10005E30C;
  v23[3] = &unk_1000CBFF0;
  id v12 = v8;
  id v24 = v12;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v23));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 filteredArrayUsingPredicate:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 firstObject]);

  if (!v15)
  {
    id v17 = objc_alloc_init(&OBJC_CLASS___NSError);

    id v10 = v17;
    if (v17) {
      goto LABEL_3;
    }
LABEL_5:
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v15 assetID]);
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10005E37C;
    v19[3] = &unk_1000CC0E8;
    v19[4] = self;
    id v20 = v15;
    objc_copyWeak(&v21, &location);
    -[TVPMyPSAccessObject _writeImageFromImageData:assetID:completionHandler:]( self,  "_writeImageFromImageData:assetID:completionHandler:",  v9,  v18,  v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
    goto LABEL_6;
  }

  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  objc_msgSend( (id)objc_opt_class(self, v16),  "_postProcessFetchForAccessObject:imageToken:withHandler:",  self,  v15,  &stru_1000CC128);
LABEL_6:
}

- (void)_didCompleteCheckForNewAssetCollections
{
  if (_TVSLogInternalLogLevel >= 5)
  {
    if (pthread_main_np()) {
      id v4 = @"Main:";
    }
    else {
      id v4 = &stru_1000CC6C8;
    }
    pthread_t v7 = pthread_self();
    id v8 = @"P";
    id v6 = v4;
    _TVSLogBase(v2, &_os_log_default, 1LL, 0LL, 5LL, @"P");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject delegate](self, "delegate", v6, v7, v8));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  [v9 finishedCheckingChangesForMyPSAccessObject:self photoStreamAssets:v5];
}

- (void)_didReceiveDeleteForAssetCollections:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tvs_arrayByMappingObjectsUsingBlock:", &stru_1000CC168));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005E7B4;
  v10[3] = &unk_1000CBFF0;
  id v11 = v4;
  id v6 = v4;
  pthread_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v10));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v7]);

  -[TVPMyPSAccessObject _removeAssets:](self, "_removeAssets:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject delegate](self, "delegate"));
  [v9 assetsDidChangeForMyPSAccessObject:self];
}

- (void)_didFinishDeletingAssetCollection:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005E904;
  v11[3] = &unk_1000CBFF0;
  id v12 = v5;
  id v7 = v5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v11));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 filteredArrayUsingPredicate:v8]);

  -[TVPMyPSAccessObject _removeAssets:](self, "_removeAssets:", v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject delegate](self, "delegate"));
  [v10 assetsDidChangeForMyPSAccessObject:self];
}

- (id)_assetForAssetID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005EA60;
  v11[3] = &unk_1000CBFF0;
  id v12 = v4;
  id v6 = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v11));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);

  return v9;
}

- (void)_addNewAssetsFromServerAssets:(id)a3
{
  id v4 = a3;
  id v24 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));

  if ([v6 count])
  {
    id v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v29 + 1) + 8 * (void)i) assetID]);
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", &__kCFBooleanTrue, v13);
        }

        id v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v10);
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v15 = v4;
  id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)j);
        if (v20)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v25 + 1) + 8 * (void)j) assetID]);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v21));

          if (!v22)
          {
            [v6 addObject:v20];
            -[NSMutableArray addObject:](v14, "addObject:", v20);
          }
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v17);
  }

  if (-[NSMutableArray count](v14, "count")) {
    -[TVPMyPSAccessObject _insertDBAssets:](v24, "_insertDBAssets:", v14);
  }
  id v23 = [v6 copy];
  -[TVPMyPSAccessObject setAssets:](v24, "setAssets:", v23);
}

- (void)_removeAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject assets](self, "assets"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10005EE80;
    v10[3] = &unk_1000CBFF0;
    id v6 = v4;
    id v11 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v10));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v7]);
    -[TVPMyPSAccessObject setAssets:](self, "setAssets:", v8);

    -[TVPMyPSAccessObject _removeDBAssets:](self, "_removeDBAssets:", v6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005EEA0;
    v9[3] = &unk_1000CC190;
    v9[4] = self;
    [v6 enumerateObjectsUsingBlock:v9];
  }
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (TVPMyPSAccessObjectDelegate)delegate
{
  return (TVPMyPSAccessObjectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVAssetLibrary)imageManager
{
  return self->_imageManager;
}

- (void)setImageManager:(id)a3
{
}

- (MSSubscriber)subscriber
{
  return (MSSubscriber *)objc_loadWeakRetained((id *)&self->_subscriber);
}

- (void)setSubscriber:(id)a3
{
}

- (TVPMyPSImageLoadTask)imageLoadTask
{
  return self->_imageLoadTask;
}

- (void)setImageLoadTask:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_createOrOpenDB
{
  id v3 = (void *)objc_opt_class(self, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject appleAccount](self, "appleAccount"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 dbCachePathForPersonID:v5]);

  id v7 = v6;
  p_db = &self->_db;
  if (!sqlite3_open((const char *)[v7 UTF8String], p_db))
  {
    errmsg = 0LL;
    if (sqlite3_exec( *p_db,  "CREATE TABLE IF NOT EXISTS asset (id TEXT PRIMARY KEY, state INTEGER NOT NULL, dateContentCreated DATETIME, ms_asset BLOB)",  0LL,  0LL,  &errmsg))
    {
      sqlite3_free(errmsg);
      sqlite3_close(*p_db);
      *p_db = 0LL;
    }
  }
}

- (id)_loadAssetsFromDB
{
  db = self->_db;
  if (!db)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    return v4;
  }

  if (!qword_100103328)
  {
    id v4 = 0LL;
    if (sqlite3_prepare_v2( db,  "SELECT id, state, dateContentCreated, ms_asset FROM asset",  -1,  (sqlite3_stmt **)&qword_100103328,  0LL))
    {
      return v4;
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (sqlite3_step((sqlite3_stmt *)qword_100103328) == 100)
  {
    do
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___TVPMyPSAsset);
      if (sqlite3_column_type((sqlite3_stmt *)qword_100103328, 0) == 3)
      {
        id v7 = sqlite3_column_text((sqlite3_stmt *)qword_100103328, 0);
        if (v7)
        {
          id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
          -[TVPAsset setAssetID:](v6, "setAssetID:", v8);
        }
      }

      if (sqlite3_column_type((sqlite3_stmt *)qword_100103328, 1) == 1) {
        -[TVPAsset setState:](v6, "setState:", sqlite3_column_int((sqlite3_stmt *)qword_100103328, 1));
      }
      if (sqlite3_column_type((sqlite3_stmt *)qword_100103328, 2) == 3)
      {
        id v9 = sqlite3_column_text((sqlite3_stmt *)qword_100103328, 2);
        if (v9)
        {
          id v10 = v9;
          id v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject _dateFormatter](self, "_dateFormatter"));
          id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 dateFromString:v12]);
          -[TVPAsset setDateContentCreated:](v6, "setDateContentCreated:", v13);
        }
      }

      if (sqlite3_column_type((sqlite3_stmt *)qword_100103328, 3) == 4)
      {
        id v14 = sqlite3_column_blob((sqlite3_stmt *)qword_100103328, 3);
        int v15 = sqlite3_column_bytes((sqlite3_stmt *)qword_100103328, 3);
        if (v14)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v14, v15));
          if (v17)
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___MSAsset, v16);
            uint64_t v26 = 0LL;
            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v18,  v17,  &v26));
            -[TVPAsset setAsset:](v6, "setAsset:", v19);
          }
        }
      }

      uint64_t v20 = objc_claimAutoreleasedReturnValue(-[TVPAsset assetID](v6, "assetID"));
      if (v20)
      {
        id v21 = (void *)v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAsset asset](v6, "asset"));

        if (v22) {
          [v5 addObject:v6];
        }
      }

      int v23 = sqlite3_step((sqlite3_stmt *)qword_100103328);
    }

    while (v23 == 100);
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 sortedArrayUsingComparator:&stru_1000CC1B0]);

  return v24;
}

- (void)_removeDB
{
  if (qword_100103330)
  {
    sqlite3_finalize((sqlite3_stmt *)qword_100103330);
    qword_100103330 = 0LL;
  }

  if (qword_100103338)
  {
    sqlite3_finalize((sqlite3_stmt *)qword_100103338);
    qword_100103338 = 0LL;
  }

  if (qword_100103328)
  {
    sqlite3_finalize((sqlite3_stmt *)qword_100103328);
    qword_100103328 = 0LL;
  }

  if (qword_100103340)
  {
    sqlite3_finalize(0LL);
    qword_100103340 = 0LL;
  }

  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0LL;
  }

  id v4 = (void *)objc_opt_class(self, a2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject appleAccount](self, "appleAccount"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v4 dbCachePathForPersonID:v6]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v7 removeItemAtPath:v8 error:0];
}

- (void)_updateDBAsset:(id)a3 newState:(int)a4
{
  id v6 = a3;
  db = self->_db;
  if (db)
  {
    uint64_t v13 = v6;
    id v8 = (sqlite3_stmt *)qword_100103338;
    if (!qword_100103338)
    {
      int v12 = sqlite3_prepare_v2( db,  "UPDATE asset SET state = ? WHERE id = ?",  -1,  (sqlite3_stmt **)&qword_100103338,  0LL);
      id v6 = v13;
      if (v12) {
        goto LABEL_7;
      }
      id v8 = (sqlite3_stmt *)qword_100103338;
    }

    int v9 = sqlite3_bind_int(v8, 1, a4);
    id v10 = (sqlite3_stmt *)qword_100103338;
    id v11 = objc_claimAutoreleasedReturnValue([v13 assetID]);
    LODWORD(v10) = sqlite3_bind_text(v10, 2, (const char *)[v11 UTF8String], -1, 0);

    sqlite3_reset((sqlite3_stmt *)qword_100103338);
    id v6 = v13;
  }

- (void)_insertDBAssets:(id)a3
{
  id v4 = a3;
  db = self->_db;
  if (db)
  {
    sqlite3_exec(db, "BEGIN TRANSACTION", 0LL, 0LL, 0LL);
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          -[TVPMyPSAccessObject _insertDBAsset:]( self,  "_insertDBAsset:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }

      while (v8);
    }

    sqlite3_exec(self->_db, "COMMIT TRANSACTION", 0LL, 0LL, 0LL);
  }
}

- (void)_removeDBAssets:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    db = self->_db;
    if (db)
    {
      sqlite3_exec(db, "BEGIN TRANSACTION", 0LL, 0LL, 0LL);
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          id v10 = 0LL;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            -[TVPMyPSAccessObject _removeDBAsset:]( self,  "_removeDBAsset:",  *(void *)(*((void *)&v11 + 1) + 8LL * (void)v10),  (void)v11);
            id v10 = (char *)v10 + 1;
          }

          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v8);
      }

      sqlite3_exec(self->_db, "COMMIT TRANSACTION", 0LL, 0LL, 0LL);
    }
  }
}

- (void)_removeDBAsset:(id)a3
{
  id v4 = a3;
  id v5 = (sqlite3_stmt *)qword_100103340;
  id v8 = v4;
  if (!qword_100103340)
  {
    if (sqlite3_prepare_v2(self->_db, "DELETE FROM asset WHERE id = ?", -1, (sqlite3_stmt **)&qword_100103340, 0LL)) {
      goto LABEL_6;
    }
    id v5 = (sqlite3_stmt *)qword_100103340;
    id v4 = v8;
  }

  id v6 = objc_claimAutoreleasedReturnValue([v4 assetID]);
  int v7 = sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, 0);

  if (!v7) {
    sqlite3_step((sqlite3_stmt *)qword_100103340);
  }
  sqlite3_reset((sqlite3_stmt *)qword_100103340);
LABEL_6:
}

- (id)_dateFormatter
{
  if (qword_100103350 != -1) {
    dispatch_once(&qword_100103350, &stru_1000CC1D0);
  }
  return (id)qword_100103348;
}

- (void)_insertDBAsset:(id)a3
{
  id v4 = a3;
  db = self->_db;
  if (db)
  {
    id v6 = (sqlite3_stmt *)qword_100103330;
    if (qword_100103330) {
      goto LABEL_3;
    }
    if (!sqlite3_prepare_v2( db,  "INSERT INTO asset (id, state, dateContentCreated, ms_asset) values (?, ?, ?, ?)",  -1,  (sqlite3_stmt **)&qword_100103330,  0LL))
    {
      id v6 = (sqlite3_stmt *)qword_100103330;
LABEL_3:
      id v7 = objc_claimAutoreleasedReturnValue([v4 assetID]);
      int v8 = sqlite3_bind_text(v6, 1, (const char *)[v7 UTF8String], -1, 0);

      int v9 = sqlite3_bind_int((sqlite3_stmt *)qword_100103330, 2, (int)[v4 state]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 dateContentCreated]);

      if (v10)
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPMyPSAccessObject _dateFormatter](self, "_dateFormatter"));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 dateContentCreated]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringFromDate:v12]);

        __int128 v14 = (sqlite3_stmt *)qword_100103330;
        id v15 = v13;
        int v16 = sqlite3_bind_text(v14, 3, (const char *)[v15 UTF8String], -1, 0);
      }

      else
      {
        int v16 = sqlite3_bind_null((sqlite3_stmt *)qword_100103330, 3);
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);

      if (v17)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 asset]);
        id v24 = 0LL;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v18,  1LL,  &v24));
        id v20 = v24;

        id v21 = (sqlite3_stmt *)qword_100103330;
        id v22 = v19;
        int v23 = sqlite3_bind_blob(v21, 4, [v22 bytes], (int)objc_msgSend(v22, "length"), 0);

        if (v8) {
          goto LABEL_16;
        }
      }

      else
      {
        int v23 = sqlite3_bind_null((sqlite3_stmt *)qword_100103330, 4);
        if (v8)
        {
LABEL_16:
          sqlite3_reset((sqlite3_stmt *)qword_100103330);
          goto LABEL_17;
        }
      }

      if (!v9 && !v16 && !v23) {
        sqlite3_step((sqlite3_stmt *)qword_100103330);
      }
      goto LABEL_16;
    }
  }

- (id)_imagePathForAssetID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  id v5 = v4;
  if (v3) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assetPathForKey:v3 inGroupOfType:4]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)_imageForAssetID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  id v5 = v4;
  if (v3) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assetForKey:v3 inGroupOfType:4]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)_purgeImageForAssetID:(id)a3
{
  id v4 = a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  if (v4) {
    [v3 removeAssetForKey:v4 inGroupOfType:4];
  }
}

- (void)_purgeImages
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  [v2 purgeAssetsInGroupOfType:4];
}

- (void)_writeImageFromImageData:(id)a3 assetID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_10005E000;
  void v23[4] = sub_10005E010;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[TVAssetLibrary sharedInstance](&OBJC_CLASS___TVAssetLibrary, "sharedInstance"));
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVImage imageWithData:](&OBJC_CLASS___TVImage, "imageWithData:", v8));
  [v11 setRotationEnabled:1];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int128 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100060028;
  v17[3] = &unk_1000CC248;
  id v18 = v9;
  id v19 = v11;
  id v20 = v10;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  objc_copyWeak(&v22, &location);
  id v21 = v23;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  objc_destroyWeak(&location);
}

@end