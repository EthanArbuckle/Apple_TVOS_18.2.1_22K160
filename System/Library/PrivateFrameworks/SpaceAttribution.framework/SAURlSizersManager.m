@interface SAURlSizersManager
+ (id)addURLSizerConfiguration:(id)a3;
+ (id)getURLSizerConfiguration:(id)a3;
+ (id)setUniqueIDForURLSizer:(id)a3;
+ (void)callURLSizer:(id)a3 withResults:(id)a4 error:(id)a5;
+ (void)removeURLSizerHandler:(id)a3;
@end

@implementation SAURlSizersManager

+ (id)setUniqueIDForURLSizer:(id)a3
{
  id v3 = a3;
  v4 = 0LL;
  while (1)
  {
    v5 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));

    id v6 = (id)qword_10005AAA8;
    objc_sync_enter(v6);
    v7 = (void *)qword_10005AAA8;
    if (!qword_10005AAA8)
    {
      v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      v9 = (void *)qword_10005AAA8;
      qword_10005AAA8 = (uint64_t)v8;

      v7 = (void *)qword_10005AAA8;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v4]);

    if (!v10) {
      break;
    }
    objc_sync_exit(v6);
  }

  [(id)qword_10005AAA8 setObject:v3 forKey:v4];
  objc_sync_exit(v6);

  [v3 setSizerID:v4];
  return v4;
}

+ (id)getURLSizerConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAA8;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AAA8 objectForKey:v3]);
  objc_sync_exit(v4);

  if (!v5)
  {
    uint64_t v7 = SALog(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000327EC(v3, v8);
    }
  }

  return v5;
}

+ (id)addURLSizerConfiguration:(id)a3
{
  id v18 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "setUniqueIDForURLSizer:"));
  id obj = (id)qword_10005AAA0;
  objc_sync_enter(obj);
  if (!qword_10005AAA0)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v6 = (void *)qword_10005AAA0;
    qword_10005AAA0 = (uint64_t)v5;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "urls", obj));
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AAA0 objectForKeyedSubscript:v11]);
        if (!v13)
        {
          v14 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
          [(id)qword_10005AAA0 setObject:v14 forKeyedSubscript:v11];

          v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_10005AAA0 objectForKeyedSubscript:v11]);
        }

        [v13 addObject:v4];

        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v8);
  }

  objc_sync_exit(obja);
  return v4;
}

+ (void)removeURLSizerHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)qword_10005AAA8;
  objc_sync_enter(v4);
  uint64_t v5 = qword_10005AAA8;
  if (qword_10005AAA8
    && (uint64_t v5 = objc_claimAutoreleasedReturnValue([(id)qword_10005AAA8 objectForKeyedSubscript:v3]),
        (uint64_t v6 = v5) != 0))
  {
    [(id)qword_10005AAA8 removeObjectForKey:v3];
    objc_sync_exit(v4);

    id obj = (id)qword_10005AAA0;
    objc_sync_enter(obj);
    context = objc_autoreleasePoolPush();
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v7 = (id)qword_10005AAA0;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    __int128 v22 = (void *)v6;
    uint64_t v9 = 0LL;
    if (v8)
    {
      uint64_t v10 = *(void *)v30;
      do
      {
        uint64_t v11 = 0LL;
        v12 = v9;
        do
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [(id)qword_10005AAA0 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * (void)v11)]);

          [v9 removeObject:v3];
          uint64_t v11 = (char *)v11 + 1;
          v12 = v9;
        }

        while (v8 != v11);
        id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }

      while (v8);
    }

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v13 = [(id)qword_10005AAA0 copy];
    id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v17]);
          BOOL v19 = [v18 count] == 0;

          if (v19) {
            [(id)qword_10005AAA0 removeObjectForKey:v17];
          }
        }

        id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }

      while (v14);
    }

    objc_autoreleasePoolPop(context);
    objc_sync_exit(obj);

    id v4 = v22;
  }

  else
  {
    uint64_t v20 = SALog(v5);
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100032874((uint64_t)v3, v21);
    }

    objc_sync_exit(v4);
  }
}

+ (void)callURLSizer:(id)a3 withResults:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = SALog(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100032958(v11, v12, v13);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 sizerID]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 replyController]);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10001FDCC;
  v30[3] = &unk_10004CEF8;
  id v16 = v14;
  id v31 = v16;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteObjectProxyWithErrorHandler:v30]);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10001FE38;
  v26[3] = &unk_10004CF48;
  id v27 = v16;
  id v28 = v7;
  id v29 = v8;
  id v18 = v8;
  id v19 = v7;
  id v20 = v16;
  [v17 callURLSizerHandlerWithResults:v18 error:v9 withHandlerResultsBlock:v26];

  uint64_t v22 = SALog(v21);
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_1000328E4(v23, v24, v25);
  }
}

@end