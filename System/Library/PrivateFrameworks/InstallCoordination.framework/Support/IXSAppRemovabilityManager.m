@interface IXSAppRemovabilityManager
+ (id)sharedInstance;
+ (id)stringForRemovability:(unint64_t)a3;
- (BOOL)_onQueue_writeRemovabilityWithError:(id *)a3;
- (BOOL)clearRemovabilityStateForIdentity:(id)a3 error:(id *)a4;
- (BOOL)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 error:(id *)a6;
- (IXDataStoreClock)removabilityChangeClock;
- (IXSAppRemovabilityManager)init;
- (NSMutableDictionary)allAppRemovability;
- (NSURL)removabilityURL;
- (OS_dispatch_queue)queue;
- (id)removabilityDataWithChangeClock:(id *)a3;
- (id)removabilityInfoForAllIdentities;
- (id)removabilityMetadataForAppWithIdentity:(id)a3;
- (unint64_t)removabilityForAppWithIdentity:(id)a3 client:(unint64_t)a4;
- (void)_enumerateRemovability:(id)a3;
- (void)_onQueue_handleStateChangeForIdentity:(id)a3 updatedRemovability:(unint64_t)a4;
- (void)_onQueue_removeLegacyRemovabilityFiles;
- (void)setAllAppRemovability:(id)a3;
- (void)setRemovabilityChangeClock:(id)a3;
@end

@implementation IXSAppRemovabilityManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000731BC;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8FD0 != -1) {
    dispatch_once(&qword_1000E8FD0, block);
  }
  return (id)qword_1000E8FD8;
}

- (IXSAppRemovabilityManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IXSAppRemovabilityManager;
  v2 = -[IXSAppRemovabilityManager init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordinationd.IXSAppRemovabilityManager.queue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    BOOL v22 = 0;
    id v21 = 0LL;
    v7 = sub_10002E78C(&v21, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (IXDataStoreClock *)v21;
    v10 = (NSMutableDictionary *)[v8 mutableCopy];
    allAppRemovability = v2->_allAppRemovability;
    v2->_allAppRemovability = v10;

    removabilityChangeClock = v2->_removabilityChangeClock;
    v2->_removabilityChangeClock = v9;
    v13 = v9;

    id v14 = [v8 count];
    v15 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100073320;
    block[3] = &unk_1000CEFB0;
    id v19 = v14;
    BOOL v20 = v22;
    v18 = v2;
    dispatch_sync(v15, block);
  }

  return v2;
}

+ (id)stringForRemovability:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"unknown";
  }
  else {
    return off_1000CF098[a3 - 1];
  }
}

- (void)_onQueue_handleStateChangeForIdentity:(id)a3 updatedRemovability:(unint64_t)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    BOOL v22 = "-[IXSAppRemovabilityManager _onQueue_handleStateChangeForIdentity:updatedRemovability:]";
    __int16 v23 = 2112;
    v24 = @"com.apple.installcoordination.AppRemovabilityChanged";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Posting distributed notification %@ because removability for %@ has changed",  buf,  0x20u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  v20[0] = v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[IXSAppRemovabilityManager removabilityChangeClock]( self,  "removabilityChangeClock",  kCFBundleIdentifierKey,  @"RemovabilityStoreClock"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 notificationDictionary]);
  v20[1] = v13;
  v19[2] = @"RemovabilityVal";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  v20[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

  if (([v6 isPersonalPersonaPlaceholder] & 1) == 0)
  {
    id v16 = [v15 mutableCopy];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
    [v16 setObject:v17 forKeyedSubscript:@"PersonaUniqueString"];

    id v18 = [v16 copy];
    v15 = v18;
  }

  [v11 postNotificationName:@"com.apple.installcoordination.AppRemovabilityChanged" object:0 userInfo:v15 deliverImmediately:1];
}

- (NSURL)removabilityURL
{
  id v2 = sub_10002DF40();
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!v3) {
    sub_100085D98(0LL, v4);
  }
  return (NSURL *)v3;
}

- (id)removabilityMetadataForAppWithIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_100073818;
  id v16 = sub_100073828;
  id v17 = 0LL;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100073830;
  block[3] = &unk_1000CCF40;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (unint64_t)removabilityForAppWithIdentity:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 1LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100073984;
  v11[3] = &unk_1000CEFD8;
  v11[4] = self;
  id v12 = v6;
  v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(v7, v11);

  unint64_t v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)setRemovability:(unint64_t)a3 forAppWithIdentity:(id)a4 byClient:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = sub_100073818;
  v45 = sub_100073828;
  id v46 = 0LL;
  if (a3 - 2 < 2)
  {
    v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100073E10;
    v29[3] = &unk_1000CF000;
    v29[4] = self;
    unint64_t v33 = a5;
    unint64_t v34 = a3;
    id v30 = v10;
    v31 = &v47;
    v32 = &v41;
    dispatch_sync(v13, v29);

    id v12 = v30;
    goto LABEL_6;
  }

  if (!a3)
  {
    unint64_t v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100085E3C();
    }

    id v17 = sub_10003556C( (uint64_t)"-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]",  223LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Setting app removability to unknown is not allowed",  v16,  v28);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_13;
  }

  if (a3 != 1)
  {
    id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100085DB0(a3, v20, v21);
    }

    id v23 = sub_10003556C( (uint64_t)"-[IXSAppRemovabilityManager setRemovability:forAppWithIdentity:byClient:error:]",  227LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Setting app removability to an unrecognized value (%lu) is not allowed",  v22,  a3);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v23);
LABEL_13:
    v24 = (void *)v42[5];
    v42[5] = v18;

    goto LABEL_14;
  }

  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100073CDC;
  block[3] = &unk_1000CF000;
  void block[4] = self;
  unint64_t v39 = a5;
  uint64_t v40 = 1LL;
  id v36 = v10;
  v37 = &v47;
  v38 = &v41;
  dispatch_sync(v11, block);

  id v12 = v36;
LABEL_6:

LABEL_14:
  int v25 = *((unsigned __int8 *)v48 + 24);
  if (a6 && !*((_BYTE *)v48 + 24))
  {
    *a6 = (id) v42[5];
    int v25 = *((unsigned __int8 *)v48 + 24);
  }

  BOOL v26 = v25 != 0;
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v26;
}

- (void)_onQueue_removeLegacyRemovabilityFiles
{
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  id v3 = sub_10002E1EC();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v26 = 0LL;
  unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:&v26];
  id v7 = v26;

  if ((v6 & 1) == 0)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100085EAC();
    }
  }

  id v10 = sub_10002E108();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v25 = 0LL;
  unsigned __int8 v13 = [v12 removeItemAtURL:v11 error:&v25];
  id v14 = v25;

  if ((v13 & 1) == 0)
  {
    uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100085EAC();
    }
  }

  id v17 = sub_10002E024();
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v24 = 0LL;
  unsigned __int8 v20 = [v19 removeItemAtURL:v18 error:&v24];
  id v21 = v24;

  if ((v20 & 1) == 0)
  {
    uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100085EAC();
    }
  }
}

- (BOOL)_onQueue_writeRemovabilityWithError:(id *)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager removabilityChangeClock](self, "removabilityChangeClock"));
  [v6 increment];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager allAppRemovability](self, "allAppRemovability"));
  id v8 = sub_10002E310(v7, v6);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager removabilityURL](self, "removabilityURL"));
    id v25 = 0LL;
    unsigned __int8 v11 = [v9 writeToURL:v10 options:268435457 error:&v25];
    id v12 = v25;

    if ((v11 & 1) != 0)
    {
      id v13 = 0LL;
      goto LABEL_13;
    }

    uint64_t v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100085FA4();
    }

    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager removabilityURL](self, "removabilityURL"));
    id v22 = sub_10003556C( (uint64_t)"-[IXSAppRemovabilityManager _onQueue_writeRemovabilityWithError:]",  289LL,  @"IXErrorDomain",  1uLL,  v12,  0LL,  @"Failed to write app removability data to URL %@",  v21,  (uint64_t)v20);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v22);

    if (a3) {
      goto LABEL_11;
    }
  }

  else
  {
    id v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100085F34();
    }

    id v17 = sub_10003556C( (uint64_t)"-[IXSAppRemovabilityManager _onQueue_writeRemovabilityWithError:]",  279LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to convert app removability and change clock to data",  v16,  v24);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v17);
    id v12 = 0LL;
    if (a3)
    {
LABEL_11:
      if (v13)
      {
        id v13 = v13;
        *a3 = v13;
      }
    }
  }

- (void)_enumerateRemovability:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000743D4;
  block[3] = &unk_1000CD568;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (id)removabilityInfoForAllIdentities
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100074514;
  v6[3] = &unk_1000CF050;
  id v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v3 = v7;
  -[IXSAppRemovabilityManager _enumerateRemovability:](self, "_enumerateRemovability:", v6);
  id v4 = -[NSMutableDictionary copy](v3, "copy");

  return v4;
}

- (BOOL)clearRemovabilityStateForIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007470C;
  block[3] = &unk_1000CD058;
  void block[4] = self;
  id v8 = v6;
  id v18 = v8;
  id v19 = &v20;
  dispatch_sync(v7, block);

  int v9 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((_BYTE *)v21 + 24))
  {
    id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008602C((uint64_t)v8, v11, v12);
    }

    id v14 = sub_10003556C( (uint64_t)"-[IXSAppRemovabilityManager clearRemovabilityStateForIdentity:error:]",  358LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Failed to find removability entry for %@",  v13,  (uint64_t)v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v14);
    int v9 = *((unsigned __int8 *)v21 + 24);
  }

  BOOL v15 = v9 != 0;

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)removabilityDataWithChangeClock:(id *)a3
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_100073818;
  id v19 = sub_100073828;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_100073818;
  uint64_t v13 = sub_100073828;
  id v14 = 0LL;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSAppRemovabilityManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100074B7C;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  void block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v16[5];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (NSMutableDictionary)allAppRemovability
{
  return self->_allAppRemovability;
}

- (void)setAllAppRemovability:(id)a3
{
}

- (IXDataStoreClock)removabilityChangeClock
{
  return self->_removabilityChangeClock;
}

- (void)setRemovabilityChangeClock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end