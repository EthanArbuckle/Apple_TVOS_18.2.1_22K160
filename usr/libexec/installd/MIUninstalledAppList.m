@interface MIUninstalledAppList
+ (id)sharedList;
- (MIUninstalledAppList)init;
- (NSDictionary)uninstalledDictionary;
- (NSMutableDictionary)uninstalledList;
- (OS_dispatch_queue)listQueue;
- (id)_mapPath;
- (id)_onQueue_uninstalledList;
- (void)_onQueue_setUninstalledList:(id)a3;
- (void)addIdentifier:(id)a3;
- (void)preflightUninstalledMap;
- (void)removeIdentifiers:(id)a3;
- (void)setUninstalledList:(id)a3;
@end

@implementation MIUninstalledAppList

- (MIUninstalledAppList)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MIUninstalledAppList;
  v2 = -[MIUninstalledAppList init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileInstallation.UninstalledAppListQueue", v4);
    listQueue = v2->_listQueue;
    v2->_listQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

+ (id)sharedList
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038884;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095B98 != -1) {
    dispatch_once(&qword_100095B98, block);
  }
  return (id)qword_100095B90;
}

- (id)_mapPath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDirectory]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 URLByAppendingPathComponent:@"UninstalledApplications.plist" isDirectory:0]);

  return v4;
}

- (id)_onQueue_uninstalledList
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithContentsOfURL:",  v4));
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));
    if (!v6)
    {
      v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v7);
    }
  }

  return -[MIUninstalledAppList uninstalledList](self, "uninstalledList");
}

- (void)_onQueue_setUninstalledList:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4 && [v4 count])
  {
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList uninstalledList](self, "uninstalledList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    unsigned __int8 v8 = [v6 writeToURL:v7 atomically:1];
  }

  else
  {
    -[MIUninstalledAppList setUninstalledList:](self, "setUninstalledList:", 0LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    id v15 = 0LL;
    unsigned __int8 v11 = [v9 removeItemAtURL:v10 error:&v15];
    id v12 = v15;

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v14 = __error();
        strerror(*v14);
        MOLogWrite(v13);
      }
    }
  }
}

- (void)preflightUninstalledMap
{
  if (!sub_100038C14())
  {
    dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList _mapPath](self, "_mapPath"));
    id v9 = 0LL;
    unsigned __int8 v5 = [v3 removeItemAtURL:v4 error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      uint64_t v7 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        unsigned __int8 v8 = __error();
        strerror(*v8);
        MOLogWrite(v7);
      }
    }
  }

- (NSDictionary)uninstalledDictionary
{
  uint64_t v7 = 0LL;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = sub_100038D54;
  unsigned __int8 v11 = sub_100038D64;
  id v12 = 0LL;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100038D6C;
  v6[3] = &unk_100080F48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)addIdentifier:(id)a3
{
  id v5 = a3;
  if (sub_100038C14())
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100038E40;
    block[3] = &unk_100080ED0;
    block[4] = self;
    id v7 = v5;
    dispatch_sync(v4, block);
  }
}

- (void)removeIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUninstalledAppList listQueue](self, "listQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100038F48;
  block[3] = &unk_100080ED0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (OS_dispatch_queue)listQueue
{
  return self->_listQueue;
}

- (NSMutableDictionary)uninstalledList
{
  return self->_uninstalledList;
}

- (void)setUninstalledList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end