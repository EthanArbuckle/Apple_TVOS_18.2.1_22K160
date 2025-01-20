@interface _ApplicationContext
- (void)launchApplicationWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation _ApplicationContext

- (void)launchApplicationWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_1001BF6D0((char *)self);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  objc_opt_self(&OBJC_CLASS____ApplicationContext);
  os_unfair_lock_lock_with_options(&unk_1004621D0, 0x10000LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
  if (!v10
    || (v11 = (void *)qword_1004621D8,
        v12 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]),
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v12]),
        v12,
        !v13))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1004621D0);

    goto LABEL_7;
  }

  [v13 timeIntervalSinceNow];
  double v15 = v14;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1004621D0);
  if (v15 < -15.0)
  {
LABEL_7:
    id v39 = v6;
    id v19 = v9;
    objc_opt_self(&OBJC_CLASS____ApplicationContext);
    os_unfair_lock_lock_with_options(&unk_1004621D0, 0x10000LL);
    v20 = (void *)qword_1004621D8;
    if (!qword_1004621D8)
    {
      v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v22 = (void *)qword_1004621D8;
      qword_1004621D8 = (uint64_t)v21;

      v20 = (void *)qword_1004621D8;
    }

    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys", v7));
    id v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (i = 0LL; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1004621D8 objectForKeyedSubscript:v28]);
          v30 = v29;
          if (v29)
          {
            [v29 timeIntervalSinceNow];
            if (v31 < -15.0) {
              [(id)qword_1004621D8 removeObjectForKey:v28];
            }
          }
        }

        id v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }

      while (v25);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue([v19 bundleID]);
    if (v32)
    {
      v33 = objc_alloc_init(&OBJC_CLASS___NSDate);
      [(id)qword_1004621D8 setObject:v33 forKeyedSubscript:v32];
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1004621D0);

    id v7 = v38;
    id v6 = v39;
    if (v39) {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v39));
    }
    else {
      v18 = 0LL;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    v35 = sub_1001BF6D0((char *)self);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleID]);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1001BFAF8;
    v42[3] = &unk_1003EB230;
    id v43 = v38;
    [v34 openApplication:v37 withOptions:v18 completion:v42];

    goto LABEL_25;
  }

  if (v7)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001BFB54;
    block[3] = &unk_1003EA158;
    id v41 = v7;
    dispatch_async(v17, block);

    v18 = v41;
LABEL_25:
  }
}

@end