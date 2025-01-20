@interface SACallbackManager
+ (id)activeHandlers;
+ (id)addAppSizerHandler:(id)a3;
+ (id)setUniqueIDForHandler:(id)a3;
+ (int)handlersCount;
+ (void)callAppSizeHandlersWithResults:(id)a3 error:(id)a4;
+ (void)removeAppSizerHandler:(id)a3;
@end

@implementation SACallbackManager

+ (id)setUniqueIDForHandler:(id)a3
{
  id v3 = a3;
  v4 = 0LL;
  while (1)
  {
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));

    id v6 = (id)qword_10005AA98;
    objc_sync_enter(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AA98 objectForKeyedSubscript:v4]);

    if (!v7) {
      break;
    }
    objc_sync_exit(v6);
  }

  [(id)qword_10005AA98 setObject:v3 forKeyedSubscript:v4];
  objc_sync_exit(v6);

  return v4;
}

+ (id)addAppSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA98;
  objc_sync_enter(v4);
  if (!qword_10005AA98)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v6 = (void *)qword_10005AA98;
    qword_10005AA98 = (uint64_t)v5;
  }

  objc_sync_exit(v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[SACallbackManager setUniqueIDForHandler:]( &OBJC_CLASS___SACallbackManager,  "setUniqueIDForHandler:",  v3));
  uint64_t v8 = SALog(v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100032540();
  }

  return v7;
}

+ (void)removeAppSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AA98;
  objc_sync_enter(v4);
  if (!v3 || !qword_10005AA98)
  {
LABEL_9:
    objc_sync_exit(v4);
    goto LABEL_10;
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AA98 objectForKeyedSubscript:v3]);

  if (!v5)
  {
    uint64_t v9 = SALog(v6);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000325B8((uint64_t)v3, v10);
    }

    goto LABEL_9;
  }

  [(id)qword_10005AA98 removeObjectForKey:v3];
  objc_sync_exit(v4);

  uint64_t v8 = SALog(v7);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEBUG)) {
    sub_10003262C();
  }
LABEL_10:
}

+ (id)activeHandlers
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AA98 allKeys]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

+ (int)handlersCount
{
  return [(id)qword_10005AA98 count];
}

+ (void)callAppSizeHandlersWithResults:(id)a3 error:(id)a4
{
  id v38 = a3;
  id v5 = a4;
  uint64_t v6 = SALog(v5);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000326D8(v7, v8, v9, v10, v11, v12, v13, v14);
  }

  id v15 = (id)qword_10005AA98;
  objc_sync_enter(v15);
  id v16 = [(id)qword_10005AA98 copy];
  objc_sync_exit(v15);

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
  id v19 = v18;
  if (v18)
  {
    v20 = 0LL;
    uint64_t v21 = *(void *)v42;
    do
    {
      v22 = 0LL;
      v23 = v20;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v22);
        uint64_t v25 = SALog(v18);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v46 = v24;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "callAppSizeHandlersWithResults id (%@)",  buf,  0xCu);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKey:v24]);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472LL;
        v40[2] = sub_10001EDD0;
        v40[3] = &unk_10004CEF8;
        v40[4] = v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v20 remoteObjectProxyWithErrorHandler:v40]);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_10001EE3C;
        v39[3] = &unk_10004CF20;
        v39[4] = v24;
        [v27 callAppSizerHandlerWithResults:v38 error:v5 withHandlerResultBlock:v39];

        v22 = (char *)v22 + 1;
        v23 = v20;
      }

      while (v19 != v22);
      id v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      id v19 = v18;
    }

    while (v18);
  }

  uint64_t v29 = SALog(v28);
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_1000326A4(v30, v31, v32, v33, v34, v35, v36, v37);
  }
}

@end