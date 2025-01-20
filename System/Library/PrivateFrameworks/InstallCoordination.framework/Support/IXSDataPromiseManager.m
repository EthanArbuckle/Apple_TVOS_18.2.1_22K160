@interface IXSDataPromiseManager
+ (NSURL)saveDir;
+ (id)savePathForPromise:(id)a3;
+ (id)sharedInstance;
- (IXSDataPromiseManager)init;
- (NSMutableDictionary)uuidToPromiseMap;
- (OS_dispatch_queue)queue;
- (id)_promiseForUUID:(id)a3 ofType:(Class)a4 useQueue:(BOOL)a5;
- (id)promiseForUUID:(id)a3;
- (id)promiseForUUID:(id)a3 ofType:(Class)a4;
- (void)_onQueue_restoreSavedPromises;
- (void)cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:(id)a3 withReason:(id)a4 client:(unint64_t)a5;
- (void)clearAllPromisesForCreator:(unint64_t)a3;
- (void)decommissionPromise:(id)a3;
- (void)enumeratePromises:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)promiseDidReset:(id)a3;
- (void)registerPromise:(id)a3;
@end

@implementation IXSDataPromiseManager

+ (id)savePathForPromise:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 saveDir]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.plist", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v7 isDirectory:0]);

  return v8;
}

+ (NSURL)saveDir
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataDirectoryAbortingOnError]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"DataPromises" isDirectory:1]);
  return (NSURL *)v4;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AB74;
  block[3] = &unk_1000CCB20;
  block[4] = a1;
  if (qword_1000E8FC0 != -1) {
    dispatch_once(&qword_1000E8FC0, block);
  }
  return (id)qword_1000E8FB8;
}

- (IXSDataPromiseManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXSDataPromiseManager;
  v2 = -[IXSDataPromiseManager init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.installcoordinationd.IXSDataPromiseManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](v2, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005AC74;
    v9[3] = &unk_1000CCE58;
    v10 = v2;
    sub_10005A8F0(v7, v9);
  }

  return v2;
}

- (void)_onQueue_restoreSavedPromises
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
  dispatch_assert_queue_V2(v2);

  id v3 = [(id)objc_opt_class(self) saveDir];
  v52 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
  id v68 = 0LL;
  v53 = (void *)objc_claimAutoreleasedReturnValue([v4 urlsForItemsInDirectoryAtURL:v52 ignoringSymlinks:1 error:&v68]);
  id v5 = v68;

  if (v53)
  {
    v6 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uuidToPromiseMap = self->_uuidToPromiseMap;
    self->_uuidToPromiseMap = v6;

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    id obj = v53;
    id v8 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (!v8) {
      goto LABEL_31;
    }
    uint64_t v56 = *(void *)v65;
    while (1)
    {
      id v57 = v8;
      for (i = 0LL; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v65 != v56) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        objc_super v11 = objc_autoreleasePoolPush();
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
        unsigned __int8 v13 = [v12 hasPrefix:@"."];

        if ((v13 & 1) == 0)
        {
          id v63 = v5;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v10,  3LL,  &v63));
          id v15 = v63;

          if (v14)
          {
            v16 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
            id v62 = v15;
            v17 = -[NSKeyedUnarchiver initForReadingFromData:error:](v16, "initForReadingFromData:error:", v14, &v62);
            id v5 = v62;

            if (v17)
            {
              v18 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___IXSDataPromise),  0LL);
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              v20 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v17,  "decodeObjectOfClasses:forKey:",  v19,  NSKeyedArchiveRootObjectKey));
              v21 = v20;
              if (v20)
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue([v20 uniqueIdentifier]);

                if (v22)
                {
                  v23 = self->_uuidToPromiseMap;
                  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 uniqueIdentifier]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v21, v24);
                }

                else
                {
                  v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
                  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    v36 = (void *)objc_claimAutoreleasedReturnValue([v10 lastPathComponent]);
                    *(_DWORD *)buf = 136315650;
                    v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                    __int16 v71 = 2112;
                    v72 = v36;
                    __int16 v73 = 2112;
                    id v74 = v21;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Somehow got promise without unique identifier from %@: %@",  buf,  0x20u);
                  }
                }

                int v29 = 0;
LABEL_26:

                -[NSKeyedUnarchiver finishDecoding](v17, "finishDecoding");
                if (v29)
                {
LABEL_27:
                  v31 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
                  [v31 removeItemAtURL:v10 error:0];
                }

                goto LABEL_29;
              }

              v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v17, "error"));
                *(_DWORD *)buf = 136315650;
                v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                __int16 v71 = 2112;
                v72 = v34;
                __int16 v73 = 2112;
                id v74 = v35;
                _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to decode promise from %@: %@",  buf,  0x20u);
              }

              v21 = 0LL;
            }

            else
            {
              v27 = sub_1000047B4((uint64_t)off_1000E8CA0);
              v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v33 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
                *(_DWORD *)buf = 136315650;
                v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
                __int16 v71 = 2112;
                v72 = v33;
                __int16 v73 = 2112;
                id v74 = v5;
                _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s: Failed to create unarchiver for promise at %@ : %@",  buf,  0x20u);
              }

              v21 = 0LL;
              v19 = 0LL;
            }

            int v29 = 1;
            goto LABEL_26;
          }

          v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
            *(_DWORD *)buf = 136315650;
            v70 = "-[IXSDataPromiseManager _onQueue_restoreSavedPromises]";
            __int16 v71 = 2112;
            v72 = v32;
            __int16 v73 = 2112;
            id v74 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to deserialize promise at %@ : %@",  buf,  0x20u);
          }

          v17 = 0LL;
          v19 = 0LL;
          v21 = 0LL;
          id v5 = v15;
          goto LABEL_27;
        }

- (id)_promiseForUUID:(id)a3 ofType:(Class)a4 useQueue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager promiseForUUID:](self, "promiseForUUID:", v8));
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager uuidToPromiseMap](self, "uuidToPromiseMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v8]);

    if (([v9 isTracked] & 1) == 0)
    {
LABEL_9:

      v9 = 0LL;
      goto LABEL_10;
    }
  }

  if (v9 && (objc_opt_isKindOfClass(v9, a4) & 1) == 0)
  {
    objc_super v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = NSStringFromClass(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = (objc_class *)objc_opt_class(a4);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      int v19 = 136315906;
      v20 = "-[IXSDataPromiseManager _promiseForUUID:ofType:useQueue:]";
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      v24 = v14;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: Found promise for UUID %@ but it was not of class %@, was %@",  (uint8_t *)&v19,  0x2Au);
    }

    goto LABEL_9;
  }

- (id)promiseForUUID:(id)a3 ofType:(Class)a4
{
  return -[IXSDataPromiseManager _promiseForUUID:ofType:useQueue:]( self,  "_promiseForUUID:ofType:useQueue:",  a3,  a4,  1LL);
}

- (id)promiseForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10005B954;
  v16 = sub_10005B964;
  id v17 = 0LL;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B96C;
  block[3] = &unk_1000CCF40;
  id v10 = v4;
  objc_super v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)registerPromise:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_10005BB40;
  unsigned __int8 v13 = &unk_1000CCCB8;
  uint64_t v14 = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(v5, &v10);

  id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier", v10, v11, v12, v13, v14));
    *(_DWORD *)buf = 136315650;
    id v17 = "-[IXSDataPromiseManager registerPromise:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Registered promise %@ for UUID %@",  buf,  0x20u);
  }
}

- (void)enumeratePromises:(id)a3
{
  id v4 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005BCC8;
  block[3] = &unk_1000CD568;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)decommissionPromise:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10005BE3C;
    v6[3] = &unk_1000CCCB8;
    v6[4] = self;
    id v7 = v4;
    sub_10005A8F0(v5, v6);
  }
}

- (void)clearAllPromisesForCreator:(unint64_t)a3
{
  uint64_t v22 = 0LL;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  __int16 v25 = sub_10005B954;
  v26 = sub_10005B964;
  id v27 = 0LL;
  BOOL v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = IXStringForClientID(a3);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 136315394;
    v30 = "-[IXSDataPromiseManager clearAllPromisesForCreator:]";
    __int16 v31 = 2112;
    v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Clearing all promises for creator %@",  buf,  0x16u);
  }

  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005C138;
  block[3] = &unk_1000CCEF8;
  block[4] = self;
  void block[5] = &v22;
  dispatch_sync(v9, block);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = (id)v23[5];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      unsigned __int8 v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v13);
        if (!a3 || [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) creatorIdentifier] == (id)a3)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_10005C18C;
          v16[3] = &unk_1000CCE58;
          v16[4] = v14;
          dispatch_sync(v15, v16);
        }

        unsigned __int8 v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }

    while (v11);
  }

  _Block_object_dispose(&v22, 8);
}

- (void)cancelPromiseForUUIDIfNotAssociatedWithAnyCoordinator:(id)a3 withReason:(id)a4 client:(unint64_t)a5
{
  id v11 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSDataPromiseManager promiseForUUID:](self, "promiseForUUID:", a3));
  v9 = v8;
  if (v8)
  {
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005C2FC;
    block[3] = &unk_1000CD1C8;
    block[4] = self;
    id v13 = v9;
    id v14 = v11;
    unint64_t v15 = a5;
    dispatch_sync(v10, block);
  }
}

- (void)promiseDidBegin:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[IXSDataPromiseManager promiseDidBegin:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Unowned promise began: %@",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)promiseDidComplete:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[IXSDataPromiseManager promiseDidComplete:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Unowned promise completed: %@",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)promiseDidReset:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[IXSDataPromiseManager promiseDidReset:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Unowned promise reset: %@",  (uint8_t *)&v6,  0x16u);
  }
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  id v5 = a3;
  int v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[IXSDataPromiseManager promise:didUpdateProgress:]";
    __int16 v10 = 2048;
    double v11 = a4;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Unowned promise update progress to %f : %@",  (uint8_t *)&v8,  0x20u);
  }
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    __int16 v12 = "-[IXSDataPromiseManager promise:didCancelForReason:client:]";
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2048;
    unint64_t v18 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Unowned promise %@ canceled for reason: %@ client: %lu",  (uint8_t *)&v11,  0x2Au);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)uuidToPromiseMap
{
  return self->_uuidToPromiseMap;
}

- (void).cxx_destruct
{
}

@end