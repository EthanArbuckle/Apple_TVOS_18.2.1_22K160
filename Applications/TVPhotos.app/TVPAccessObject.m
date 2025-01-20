@interface TVPAccessObject
+ (id)_filterAppositePhotoAssetFromAssets:(id)a3;
+ (id)_filterAppositeVideoAssetFromAssets:(id)a3;
+ (id)_imageFetchRecordForAccessObject:(id)a3 imageToken:(id)a4;
+ (id)accessObjectWithAppleAccount:(id)a3;
+ (void)_cancelFetchForAccessObject:(id)a3 assetID:(id)a4;
+ (void)_fetchImageForAccessObject:(id)a3 assetID:(id)a4 priority:(int)a5 completionHandler:(id)a6;
+ (void)_postProcessFetchForAccessObject:(id)a3 imageToken:(id)a4 withHandler:(id)a5;
+ (void)_processNextFromFetchQueue;
+ (void)cancelLoadForItemWithPropertyID:(id)a3 synchronizer:(id)a4;
+ (void)clearHistoryForPersonID:(id)a3;
+ (void)initialize;
- (ACAccount)appleAccount;
- (TVPAOSynchronizer)synchronizer;
- (void)_queueOperation:(id)a3;
- (void)fetchImageForAssetID:(id)a3 completionHandler:(id)a4;
- (void)runSetup;
- (void)setAppleAccount:(id)a3;
- (void)setSynchronizer:(id)a3;
- (void)tearDown;
@end

@implementation TVPAccessObject

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVPAccessObject, a2) == a1)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v3 = (void *)qword_100103310;
    qword_100103310 = (uint64_t)v2;

    v4 = objc_alloc_init(&OBJC_CLASS___TVPMyPSPlatform);
    MSCoreMediaStreamInitialize();

    v5 = objc_alloc_init(&OBJC_CLASS___TVPSharedPSPlatform);
    MSASInitialize();

    uint64_t v8 = MSASPlatform(v6, v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 albumSharingDaemon]);
    [v9 start];
  }

+ (void)clearHistoryForPersonID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10004C9E4;
    v4[3] = &unk_1000C9528;
    id v5 = v3;
    +[TVPAOSynchronizer flushWithCompletion:](&OBJC_CLASS___TVPAOSynchronizer, "flushWithCompletion:", v4);
  }
}

+ (void)cancelLoadForItemWithPropertyID:(id)a3 synchronizer:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004CAAC;
  v7[3] = &unk_1000CB838;
  id v8 = a3;
  id v9 = a1;
  id v6 = v8;
  [a4 queueOperation:v7];
}

+ (id)accessObjectWithAppleAccount:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAppleAccount:v4];

  return v5;
}

- (void)runSetup
{
}

- (void)tearDown
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [(id)qword_100103310 count]));
  id v4 = (void *)qword_100103310;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004CC4C;
  v6[3] = &unk_1000CB860;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
  [(id)qword_100103310 removeObjectsInArray:v5];
  [v5 enumerateObjectsUsingBlock:&stru_1000CB8A0];
}

- (void)fetchImageForAssetID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v13 = 1;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject _imageForAssetID:canLoad:](self, "_imageForAssetID:canLoad:", v6, &v13));
  if (v9 || !v13)
  {
    if (v7) {
      v7[2](v7, v9);
    }
  }

  else
  {
    id v10 = (void *)objc_opt_class(self, v8);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004CE10;
    v11[3] = &unk_1000CB8C8;
    v12 = v7;
    [v10 _fetchImageForAccessObject:self assetID:v6 priority:1 completionHandler:v11];
  }
}

+ (id)_filterAppositePhotoAssetFromAssets:(id)a3
{
  id v3 = a3;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10004D010;
  v26 = sub_10004D020;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10004D010;
  v20 = sub_10004D020;
  id v21 = 0LL;
  +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  v15[0] = 0LL;
  v15[1] = v15;
  v15[2] = 0x2020000000LL;
  v15[3] = 0LL;
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = -1LL;
  unsigned int v4 = +[TVSDevice supports1080p](&OBJC_CLASS___TVSDevice, "supports1080p");
  double v5 = 792.0;
  if (v4) {
    double v5 = 1188.0;
  }
  double v6 = 1408.0;
  if (v4) {
    double v6 = 2112.0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  float v7 = v6 * v5;
  v11[2] = sub_10004D028;
  v11[3] = &unk_1000CB8F0;
  int v12 = 52428800;
  float v13 = v7;
  void v11[4] = v14;
  v11[5] = &v16;
  v11[6] = v15;
  v11[7] = &v22;
  [v3 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = (void *)v17[5];
  if (!v8) {
    uint64_t v8 = (void *)v23[5];
  }
  id v9 = v8;
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

+ (id)_filterAppositeVideoAssetFromAssets:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10004D010;
  v11 = sub_10004D020;
  id v12 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004D2B8;
  v6[3] = &unk_1000CB208;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)_fetchImageForAccessObject:(id)a3 assetID:(id)a4 priority:(int)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  float v13 = (void *)objc_claimAutoreleasedReturnValue([v10 _imageTokenForAssetID:v11]);
  if (v13)
  {
    v14 = (TVPImageFetchRecord *)objc_claimAutoreleasedReturnValue([a1 _imageFetchRecordForAccessObject:v10 imageToken:v13]);
    if (v14)
    {
      v15 = v14;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10004D5E4;
      v29[3] = &unk_1000CB918;
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[TVPImageFetchRecord completionHandler](v14, "completionHandler"));
      id v30 = v16;
      id v31 = v12;
      -[TVPImageFetchRecord setCompletionHandler:](v15, "setCompletionHandler:", v29);
      if (-[TVPImageFetchRecord priority](v15, "priority") >= v7
        || (-[TVPImageFetchRecord setPriority:](v15, "setPriority:", v7),
            -[TVPImageFetchRecord isActive](v15, "isActive")))
      {

LABEL_10:
        goto LABEL_11;
      }

      [(id)qword_100103310 removeObject:v15];
    }

    else
    {
      v15 = -[TVPImageFetchRecord initWithAccessObject:imageToken:assetID:]( objc_alloc(&OBJC_CLASS___TVPImageFetchRecord),  "initWithAccessObject:imageToken:assetID:",  v10,  v13,  v11);
      -[TVPImageFetchRecord setPriority:](v15, "setPriority:", v7);
      -[TVPImageFetchRecord setCompletionHandler:](v15, "setCompletionHandler:", v12);
    }

    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x2020000000LL;
    id v28 = [(id)qword_100103310 count];
    v17 = (void *)qword_100103310;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    id v21 = sub_10004D644;
    uint64_t v22 = &unk_1000CB940;
    v15 = v15;
    v23 = v15;
    uint64_t v24 = &v25;
    [v17 enumerateObjectsUsingBlock:&v19];
    objc_msgSend((id)qword_100103310, "insertObject:atIndex:", v15, v26[3], v19, v20, v21, v22);
    objc_msgSend((id)objc_opt_class(a1, v18), "_processNextFromFetchQueue");

    _Block_object_dispose(&v25, 8);
    goto LABEL_10;
  }

  (*((void (**)(id, void))v12 + 2))(v12, 0LL);
LABEL_11:
}

+ (void)_postProcessFetchForAccessObject:(id)a3 imageToken:(id)a4 withHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (uint64_t (**)(id, unsigned __int8 *))a5;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _imageFetchRecordForAccessObject:v9 imageToken:v10]);
  if (!v11) {
    sub_100079DB8();
  }
  float v13 = v12;
  unsigned __int8 v30 = [v12 isActive];
  uint64_t v14 = v11[2](v11, &v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if ([v13 isActive] && !v30)
  {
    if (_TVSLogInternalLogLevel >= 5)
    {
      if (pthread_main_np()) {
        id v16 = @"Main:";
      }
      else {
        id v16 = &stru_1000CC6C8;
      }
      pthread_t v17 = pthread_self();
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 imageToken]);
      id v19 = [v13 priority];
      uint64_t v20 = @"SUCCESS";
      if (!v15) {
        uint64_t v20 = @"FAIL";
      }
      id v28 = v19;
      v29 = v20;
      v26 = @"P";
      uint64_t v27 = v18;
      uint64_t v24 = v16;
      pthread_t v25 = v17;
      _TVSLogBase(v5, &_os_log_default, 1LL, 0LL, 5LL, @"P");
    }

    objc_msgSend((id)qword_100103310, "removeObject:", v13, v24, v25, v26, v27, v28, v29);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 completionHandler]);

    if (v21)
    {
      v23 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v13 completionHandler]);
      ((void (**)(void, void *))v23)[2](v23, v15);
    }

    objc_msgSend((id)objc_opt_class(a1, v22), "_processNextFromFetchQueue");
  }
}

+ (void)_cancelFetchForAccessObject:(id)a3 assetID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)qword_100103310;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  uint64_t v14 = sub_10004D998;
  v15 = &unk_1000CB968;
  id v8 = v5;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &v12));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v10, v12, v13, v14, v15));

  if ([v11 count])
  {
    [(id)qword_100103310 removeObjectsInArray:v11];
    [v11 enumerateObjectsUsingBlock:&stru_1000CB988];
  }
}

- (void)_queueOperation:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!v4) {
    sub_100079DE0();
  }
  id v5 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject synchronizer](self, "synchronizer"));

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAccessObject synchronizer](self, "synchronizer"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004DB34;
    v8[3] = &unk_1000CB9B0;
    id v9 = v5;
    [v7 queueOperation:v8];
  }

  else
  {
    v5[2](v5);
  }
}

+ (void)_processNextFromFetchQueue
{
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 2LL));
  id v3 = (void *)qword_100103310;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10004DDC8;
  v18[3] = &unk_1000CB9D8;
  id v4 = v2;
  id v19 = v4;
  uint64_t v20 = &v22;
  id v21 = &v26;
  [v3 enumerateObjectsUsingBlock:v18];
  uint64_t v5 = v27[3];
  if ((unint64_t)[v4 count] + v5 <= 3)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100103310 firstObject]);
    if ([v6 isActive])
    {
      if ([v4 count] != (id)2)
      {

        goto LABEL_10;
      }

      int v7 = *((unsigned __int8 *)v23 + 24);

      if (!v7) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    while ([v4 count])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessObject]);

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10004DE9C;
      v15[3] = &unk_1000CB968;
      id v11 = v9;
      id v16 = v11;
      id v12 = v10;
      id v17 = v12;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v15));
      [v4 filterUsingPredicate:v13];

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tvs_arrayByMappingObjectsUsingBlock:", &stru_1000CBA18));
      [v11 _loadImageForImageTokens:v14];
    }
  }

+ (id)_imageFetchRecordForAccessObject:(id)a3 imageToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)qword_100103310;
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_10004E05C;
  id v17 = &unk_1000CB968;
  id v18 = v5;
  id v19 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &v14));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v10, v14, v15, v16, v17));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);

  return v12;
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
}

- (TVPAOSynchronizer)synchronizer
{
  return (TVPAOSynchronizer *)objc_loadWeakRetained((id *)&self->_synchronizer);
}

- (void)setSynchronizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end