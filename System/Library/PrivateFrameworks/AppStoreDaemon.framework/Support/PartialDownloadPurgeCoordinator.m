@interface PartialDownloadPurgeCoordinator
- (PartialDownloadPurgeCoordinator)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)_calculatePurgeableSpace;
- (int64_t)_purgeForDesiredSpace:(int64_t)a3;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
@end

@implementation PartialDownloadPurgeCoordinator

- (PartialDownloadPurgeCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PartialDownloadPurgeCoordinator;
  v2 = -[PartialDownloadPurgeCoordinator init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppPurgeCoordinator.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    id v7 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v8;
  }

  return v2;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024CF8C;
  block[3] = &unk_1003E9BE0;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(dispatchQueue, block);
  v21[0] = &off_10040CA30;
  v21[1] = &off_10040CA60;
  v22[0] = &off_10040CA48;
  v22[1] = &off_10040CA48;
  v21[2] = &off_10040CA78;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18[3]));
  v22[2] = v12;
  v21[3] = &off_10040CA90;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v18[3]));
  v22[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v22,  v21,  4LL));

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  id v8 = a5;
  id v9 = v8;
  int64_t v10 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  if (a4 >= 3)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10024D088;
    block[3] = &unk_1003E9780;
    v15 = &v16;
    block[4] = self;
    id v14 = v8;
    dispatch_sync(dispatchQueue, block);

    int64_t v10 = v17[3];
  }

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  int64_t v5 = 0LL;
  uint64_t v9 = 0LL;
  int64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  if (a4 >= 3)
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10024D160;
    v8[3] = &unk_1003E9BE0;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(dispatchQueue, v8);
    int64_t v5 = v10[3];
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

- (int64_t)_calculatePurgeableSpace
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  databaseStore = self->_databaseStore;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10024D234;
  v5[3] = &unk_1003EAAD0;
  v5[4] = &v6;
  -[AppInstallsDatabaseStore readUsingSession:](databaseStore, "readUsingSession:", v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_purgeForDesiredSpace:(int64_t)a3
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_10024D688;
  v22 = sub_10024D698;
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  databaseStore = self->_databaseStore;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10024D6A0;
  v17[3] = &unk_1003EAAD0;
  v17[4] = &v18;
  -[AppInstallsDatabaseStore readUsingSession:](databaseStore, "readUsingSession:", v17);
  uint64_t v6 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"date",  1LL);
  v24 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));

  [(id)v19[5] sortUsingDescriptors:v7];
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  id v8 = sub_1002EEBC0((uint64_t)&OBJC_CLASS___AppInstallsDatabaseStore);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10024D990;
  v12[3] = &unk_1003EE660;
  v12[4] = &v18;
  v12[5] = &v13;
  v12[6] = a3;
  [v9 modifyUsingTransaction:v12];

  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (void).cxx_destruct
{
}

@end