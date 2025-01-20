@interface DASProcessor
+ (void)initialize;
- (id)_dump:(id)a3;
- (void)_nameAll:(id)a3;
- (void)dumpAllWithCompletion:(id)a3;
- (void)nameAllWithCompletion:(id)a3;
- (void)nameAndDumpAllWithCompletion:(id)a3;
- (void)stitchWithInfo:(id)a3 completion:(id)a4;
@end

@implementation DASProcessor

+ (void)initialize
{
  if (qword_1000153F8 != -1) {
    dispatch_once(&qword_1000153F8, &stru_1000105B8);
  }
}

- (void)nameAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  sub_10000B9A0();
  if ((_DWORD)v5)
  {
    mach_port_name_t v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[DASRenderServerInfo infoFromServerWithPort:]( &OBJC_CLASS___DASRenderServerInfo,  "infoFromServerWithPort:",  v5));
    mach_port_deallocate(mach_task_self_, v6);
    -[DASProcessor _nameAll:](self, "_nameAll:", v7);
    if (v4) {
      v4[2](v4, 0LL);
    }
  }

  else
  {
    id v8 = sub_10000661C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "could not find default render server",  v12,  2u);
    }

    if (v4)
    {
      NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
      v14 = @"could not find default render server";
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  5LL,  v10));
      ((void (**)(id, void *))v4)[2](v4, v11);
    }
  }
}

- (void)nameAndDumpAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, os_log_s *, void))a3;
  sub_10000B9A0();
  if ((_DWORD)v5)
  {
    mach_port_name_t v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[DASRenderServerInfo infoFromServerWithPort:]( &OBJC_CLASS___DASRenderServerInfo,  "infoFromServerWithPort:",  v5));
    mach_port_deallocate(mach_task_self_, v6);
    -[DASProcessor _nameAll:](self, "_nameAll:", v7);
    if (v4)
    {
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[DASProcessor _dump:](self, "_dump:", v7));
      v4[2](v4, v8, 0LL);
    }

    else
    {
      id v11 = sub_10000661C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "ignoring archive request because no completion handler was supplied",  (uint8_t *)&v12,  2u);
      }
    }

    goto LABEL_10;
  }

  id v9 = sub_10000661C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "could not find default render server",  (uint8_t *)&v12,  2u);
  }

  if (v4)
  {
    NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
    v14 = @"could not find default render server";
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSMachErrorDomain,  5LL,  v7));
    ((void (**)(id, os_log_s *, os_log_s *))v4)[2](v4, 0LL, v8);
LABEL_10:
  }
}

- (void)dumpAllWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  if (!v4)
  {
    id v9 = sub_10000661C();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }

    __int16 v14 = 0;
    id v11 = "ignoring archive request because no completion handler was supplied";
    __int16 v12 = (uint8_t *)&v14;
LABEL_10:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_7;
  }

  sub_10000B9A0();
  if (!(_DWORD)v5)
  {
    id v13 = sub_10000661C();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    id v11 = "could not find default render server";
    __int16 v12 = buf;
    goto LABEL_10;
  }

  mach_port_name_t v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[DASRenderServerInfo infoFromServerWithPort:]( &OBJC_CLASS___DASRenderServerInfo,  "infoFromServerWithPort:",  v5));
  mach_port_deallocate(mach_task_self_, v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DASProcessor _dump:](self, "_dump:", v7));
  v4[2](v4, v8, 0LL);

LABEL_8:
}

- (void)stitchWithInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v49 = (void (**)(id, void *))a4;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  context = objc_autoreleasePoolPush();
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v55 = v5;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 contexts]);
  id v6 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v77;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v77 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
        id v11 = objc_autoreleasePoolPush();
        [sub_100008724() begin];
        __int16 v12 = objc_autoreleasePoolPush();
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithObject:",  v10));
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_10000ADF0;
        v74[3] = &unk_100010600;
        id v75 = v13;
        id v14 = v13;
        v15 = objc_retainBlock(v74);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v10 description]);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v10));
        sub_1000081B4(v16, v17, v55, v15, 0LL);

        [v14 removeObject:v10];
        id v18 = [v14 copy];
        [v54 setObject:v18 forKey:v10];

        objc_autoreleasePoolPop(v12);
        [sub_100008724() commit];
        objc_autoreleasePoolPop(v11);
      }

      id v7 = [obj countByEnumeratingWithState:&v76 objects:v85 count:16];
    }

    while (v7);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v55 contexts]);
  id v20 = [v19 mutableCopy];

  __int128 v72 = 0u;
  __int128 v73 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v55 contexts]);
  id v22 = [v21 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v71;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v71 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v70 + 1) + 8LL * (void)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v54 objectForKey:v26]);
        if ([v27 count])
        {
          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          id v28 = v27;
          id v29 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v67;
            do
            {
              for (k = 0LL; k != v30; k = (char *)k + 1)
              {
                if (*(void *)v67 != v31) {
                  objc_enumerationMutation(v28);
                }
                [v20 removeObject:*(void *)(*((void *)&v66 + 1) + 8 * (void)k)];
              }

              id v30 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
            }

            while (v30);
          }
        }

        else
        {
          [v20 removeObject:v26];
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }

    while (v23);
  }

  if (![v20 count])
  {
    id v33 = sub_10000661C();
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v55;
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "failed to find any roots to dump in %@",  buf,  0xCu);
    }
  }

  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  id v50 = v20;
  id v35 = [v50 countByEnumeratingWithState:&v62 objects:v80 count:16];
  if (v35)
  {
    id v36 = v35;
    id obja = *(id *)v63;
    do
    {
      for (m = 0LL; m != v36; m = (char *)m + 1)
      {
        if (*(id *)v63 != obja) {
          objc_enumerationMutation(v50);
        }
        v38 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)m);
        v39 = objc_autoreleasePoolPush();
        [sub_100008724() begin];
        v40 = objc_autoreleasePoolPush();
        v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableOrderedSet orderedSetWithObject:]( &OBJC_CLASS___NSMutableOrderedSet,  "orderedSetWithObject:",  v38));
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_10000ADFC;
        v60[3] = &unk_100010600;
        id v42 = v41;
        id v61 = v42;
        v43 = objc_retainBlock(v60);
        v44 = (void *)objc_claimAutoreleasedReturnValue([v38 description]);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObject:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithObject:", v38));
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_10000AE08;
        v56[3] = &unk_100010710;
        v56[4] = v38;
        id v46 = v55;
        id v57 = v46;
        id v58 = v53;
        id v59 = v42;
        id v47 = v42;
        sub_1000081B4(v44, v45, v46, v43, v56);

        objc_autoreleasePoolPop(v40);
        [sub_100008724() commit];
        objc_autoreleasePoolPop(v39);
      }

      id v36 = [v50 countByEnumeratingWithState:&v62 objects:v80 count:16];
    }

    while (v36);
  }

  objc_autoreleasePoolPop(context);
  v49[2](v49, v53);
}

- (void)_nameAll:(id)a3
{
  id v3 = a3;
  v4 = objc_autoreleasePoolPush();
  id v5 = sub_10000661C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "naming layers of all contexts", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 contexts]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000AB78;
  v16[3] = &unk_100010738;
  id v17 = v7;
  id v9 = v7;
  objc_msgSend(v8, "bs_each:", v16);

  objc_msgSend(v9, "bs_each:", &stru_100010778);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10000ABD0;
  id v14 = &unk_1000107A0;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v10 = v15;
  objc_msgSend(v9, "bs_each:", &v11);
  usleep(0x493E0u);
  objc_msgSend(v10, "bs_each:", &stru_1000107E0, v11, v12, v13, v14);

  objc_autoreleasePoolPop(v4);
}

- (id)_dump:(id)a3
{
  id v3 = a3;
  id v4 = sub_10000661C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "archiving all display hierarchies", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 parseErrors]);
  id v9 = [v8 mutableCopy];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 displays]);
  id v11 = [v10 count];

  if (!v11)
  {
    id v12 = sub_10000661C();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v3 raw]);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "failed to find any displays to dump : info=%@",  buf,  0xCu);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 displays]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 array]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100007820;
  v21[3] = &unk_1000108C8;
  id v16 = v3;
  id v22 = v16;
  id v23 = v9;
  id v17 = v6;
  id v24 = v17;
  id v18 = v9;
  objc_msgSend(v15, "bs_each:", v21);

  objc_autoreleasePoolPop(v7);
  return v17;
}

@end