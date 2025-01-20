@interface ODRDeveloperToolsClient
- (void)getSimulatedBandwidthWithReply:(id)a3;
- (void)purgeAllTagsInBundleWithID:(id)a3 replyBlock:(id)a4;
- (void)purgeTagWithName:(id)a3 inBundleWithID:(id)a4 replyBlock:(id)a5;
- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5;
- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4;
- (void)tagStatusForBundle:(id)a3 replyBlock:(id)a4;
@end

@implementation ODRDeveloperToolsClient

- (void)tagStatusForBundle:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100260520;
  v22 = sub_100260530;
  v23 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v7 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1002D9DC8(v8, 0LL);
  id v10 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100260538;
  v14[3] = &unk_1003EED28;
  id v12 = v9;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  v17 = &v18;
  [v11 readUsingSession:v14];

  v6[2](v6, v19[5], 0LL);
  _Block_object_dispose(&v18, 8);
}

- (void)purgeAllTagsInBundleWithID:(id)a3 replyBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  uint64_t v7 = ASDLogHandleForCategory(19LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = "-[ODRDeveloperToolsClient purgeAllTagsInBundleWithID:replyBlock:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s BundleID [%{public}@]", buf, 0x16u);
  }

  id v9 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v32 = sub_100260520;
  v33 = sub_100260530;
  id v34 = 0LL;
  id v11 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100260B2C;
  v27[3] = &unk_1003EED90;
  id v13 = v10;
  id v28 = v13;
  v29 = buf;
  [v12 readUsingSession:v27];

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v14 = *(id *)(*(void *)&buf[8] + 40LL);
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v17);
        id v19 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = sub_1001F7970(v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        sub_1001CC040((uint64_t)v20, v22, 1LL);

        v17 = (char *)v17 + 1;
      }

      while (v15 != v17);
      id v15 = [v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }

    while (v15);
  }

  v6[2](v6, 0LL);
  _Block_object_dispose(buf, 8);
}

- (void)purgeTagWithName:(id)a3 inBundleWithID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  v33 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v32 = (void (**)(id, void))a5;
  uint64_t v8 = ASDLogHandleForCategory(19LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = "-[ODRDeveloperToolsClient purgeTagWithName:inBundleWithID:replyBlock:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2114;
    v50 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}s TagName [%{public}@] BundleID [%{public}@]",  buf,  0x20u);
  }

  id v10 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v33);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v50 = sub_100260520;
  v51 = sub_100260530;
  id v52 = 0LL;
  id v12 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100260FF4;
  v38[3] = &unk_1003EC7E0;
  v41 = buf;
  id v31 = v7;
  id v39 = v31;
  id v30 = v11;
  id v40 = v30;
  [v13 readUsingSession:v38];

  uint64_t v14 = ASDLogHandleForCategory(19LL);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)v43 = 134218498;
    id v44 = v16;
    __int16 v45 = 2114;
    id v46 = v31;
    __int16 v47 = 2114;
    v48 = v33;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "There are [%ld] tags with name [%{public}@] for bundleID [%{public}@]",  v43,  0x20u);
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v17 = *(id *)(*(void *)&buf[8] + 40LL);
  id v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
        uint64_t v22 = ASDLogHandleForCategory(19LL);
        __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = sub_1001F7970(v21);
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          *(_DWORD *)v43 = 138543362;
          id v44 = v25;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Requesting purge of asset pack [%{public}@]",  v43,  0xCu);
        }

        id v26 = sub_1001C9810((uint64_t)&OBJC_CLASS___ODRManager);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        id v28 = sub_1001F7970(v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        sub_1001CC040((uint64_t)v27, v29, 1LL);
      }

      id v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v18);
  }

  v32[2](v32, 0LL);
  _Block_object_dispose(buf, 8);
}

- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_1002D92D0((uint64_t)&OBJC_CLASS___ODRApplication, v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = ASDLogHandleForCategory(19LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v25 = [v7 length];
    __int16 v26 = 2114;
    v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[DT] Importing %{iec-bytes}lu manifest for %{public}@",  buf,  0x16u);
  }

  uint64_t v14 = sub_100290554(objc_alloc(&OBJC_CLASS___ODRApplicationImportTask), v11);
  id v15 = objc_alloc(&OBJC_CLASS___ODRManifest);
  id v16 = sub_1002D9D08((uint64_t)v11);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = sub_10020C9E0(v15, (uint64_t)v7, v17, 0LL);

  if (v14) {
    objc_setProperty_atomic(v14, v19, v18, 48LL);
  }
  objc_initWeak((id *)buf, v14);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1002612BC;
  v21[3] = &unk_1003EEDB8;
  objc_copyWeak(&v23, (id *)buf);
  id v20 = v9;
  id v22 = v20;
  [v14 setCompletionBlock:v21];
  sub_1001E2DEC((uint64_t)&OBJC_CLASS___ODRTaskQueue, v14, -1LL);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)getSimulatedBandwidthWithReply:(id)a3
{
  id v5 = a3;
  id v4 = sub_100231EC0((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager);
  (*((void (**)(id, id, void))a3 + 2))(v5, v4, 0LL);
}

- (void)setSimulatedBandwidth:(unint64_t)a3 withReply:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  sub_100231E50((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager, a3);
  id v5 = sub_100231EC0((uint64_t)&OBJC_CLASS___ODRSimulatedDownloadsManager);
  v6[2](v6, v5, 0LL);
}

@end