@interface ODRAppReviewClient
- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5;
@end

@implementation ODRAppReviewClient

- (void)registerManifest:(id)a3 forBundleID:(id)a4 replyBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void))a5;
  id v9 = a4;
  v10 = sub_10020C9E0(objc_alloc(&OBJC_CLASS___ODRManifest), (uint64_t)v7, v9, 0LL);
  v11 = sub_1002D9790((uint64_t)&OBJC_CLASS___ODRApplication, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!sub_1002DA7CC((uint64_t)v12)
    || (id v13 = sub_1002DA0C8((uint64_t)v12), (v14 = objc_claimAutoreleasedReturnValue(v13)) == 0)
    || (v15 = (void *)v14,
        id v16 = sub_1002DA4EC((uint64_t)v12),
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16),
        v17,
        v15,
        !v17))
  {
    id v18 = [v12 mutableCopy];
    id v19 = sub_10020CB14(v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    sub_1002DB674((uint64_t)v18, v20);

    id v21 = sub_10020CAA4(v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 stringValue]);
    sub_1002DB7B8((uint64_t)v18, v23);

    id v24 = [v18 copy];
    v12 = v24;
  }

  uint64_t v25 = ASDLogHandleForCategory(19LL);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v42 = [v7 length];
    __int16 v43 = 2114;
    v44 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[App Review] Importing %{iec-bytes}lu manifest for %{public}@",  buf,  0x16u);
  }

  id v27 = sub_1002D9DC8(v12, 0LL);
  if (!v27)
  {
    uint64_t v28 = ASDLogHandleForCategory(19LL);
    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      id v35 = sub_1002D9D08((uint64_t)v12);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138543362;
      id v42 = v36;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "[App Review] We failed to copy the tag manifest for %{public}@, importing just the manifest data",  buf,  0xCu);
    }
  }

  id v30 = sub_1001B53D0((uint64_t)&OBJC_CLASS___ODRDatabaseStore);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10020DA38;
  v37[3] = &unk_1003ECCF0;
  id v38 = v27;
  id v39 = v10;
  id v40 = v12;
  id v32 = v12;
  v33 = v10;
  id v34 = v27;
  [v31 modifyUsingTransaction:v37];

  v8[2](v8, 0LL);
}

@end