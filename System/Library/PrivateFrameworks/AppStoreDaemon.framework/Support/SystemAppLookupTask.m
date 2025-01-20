@interface SystemAppLookupTask
- (void)main;
@end

@implementation SystemAppLookupTask

- (void)main
{
  v2 = self;
  v3 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [*(id *)&self->super._success count]);
  uint64_t v4 = ASDLogHandleForCategory(14LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)&v2->super._success;
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Looking up system apps for bundle IDs: %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  v7 = (void *)MGGetStringAnswer(@"BuildID");
  v8 = (void *)MGGetStringAnswer(@"SystemImageID");
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10024E578;
  v54[3] = &unk_1003EE6B0;
  id v46 = v7;
  id v55 = v46;
  id v45 = v8;
  id v56 = v45;
  v9 = objc_retainBlock(v54);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  id v10 = *(id *)&v2->super._success;
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (!v11)
  {

    v13 = 0LL;
    goto LABEL_39;
  }

  id v12 = v11;
  v47 = v3;
  id obj = v10;
  v44 = v2;
  v13 = 0LL;
  char v14 = 0;
  uint64_t v49 = *(void *)v51;
  do
  {
    for (i = 0LL; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v51 != v49) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)i);
      id v17 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SystemApp"];
      uint64_t v18 = ((uint64_t (*)(void *, id, uint64_t))v9[2])(v9, v17, v16);
      uint64_t v19 = v18;
      if ((v14 & 1) != 0)
      {
        char v14 = 1;
        goto LABEL_18;
      }

      if (v18 != 2)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v17 results]);
        if ([v20 count])
        {
          unsigned __int8 v21 = [v17 isCatalogFetchedWithinThePastFewDays:1];

          if ((v21 & 1) != 0)
          {
            char v14 = 0;
            goto LABEL_18;
          }
        }

        else
        {
        }
      }

      uint64_t v22 = ASDLogHandleForCategory(14LL);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Downloading MobileAsset catalog",  (uint8_t *)&buf,  2u);
      }

      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v60 = 0x3032000000LL;
      v61 = sub_10024DCC0;
      v62 = sub_10024DCD0;
      id v63 = 0LL;
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
      v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10024DCD8;
      block[3] = &unk_1003ECDF8;
      block[4] = &buf;
      dispatch_sync(v25, block);

      id v26 = *(id *)(*((void *)&buf + 1) + 40LL);
      _Block_object_dispose(&buf, 8);

      id v27 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SystemApp"];
      uint64_t v19 = ((uint64_t (*)(void *, id, uint64_t))v9[2])(v9, v27, v16);
      char v14 = 1;
      id v17 = v27;
      v13 = v26;
LABEL_18:
      uint64_t v28 = ASDLogHandleForCategory(14LL);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      v30 = v29;
      if (v19)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v19;
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "MAAssetQuery failed with error %ld",  (uint8_t *)&buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue([v17 results]);
          id v32 = [v31 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "Received %lu system app asset(s)",  (uint8_t *)&buf,  0xCu);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue([v17 results]);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 firstObject]);

        uint64_t v34 = ASDLogHandleForCategory(14LL);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        v36 = v35;
        if (v30)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v30;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEBUG,  "Discovered matching asset: %{public}@",  (uint8_t *)&buf,  0xCu);
          }

          v37 = objc_alloc(&OBJC_CLASS___SystemAppLookupItem);
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s assetServerUrl](v30, "assetServerUrl"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s attributes](v30, "attributes"));
          v39 = sub_10020D194((id *)&v37->super.isa, v36, v38);
          -[NSMutableArray addObject:](v47, "addObject:", v39);
        }

        else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "Asset for %{public}@ not found in catalog.",  (uint8_t *)&buf,  0xCu);
        }
      }
    }

    id v12 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  }

  while (v12);

  if (!v13)
  {
    v3 = v47;
    v2 = v44;
    goto LABEL_39;
  }

  v3 = v47;
  v2 = v44;
  if (-[NSMutableArray count](v47, "count"))
  {
LABEL_39:
    -[Task lock](v2, "lock");
    v42 = (NSError *)-[NSMutableArray copy](v3, "copy");
    error = v2->super._error;
    v2->super._error = v42;

    -[Task unlock](v2, "unlock");
    -[Task completeWithSuccess](v2, "completeWithSuccess");
    goto LABEL_40;
  }

  uint64_t v40 = ASDLogHandleForCategory(14LL);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "Failed to lookup system app asset(s): %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  -[Task completeWithError:](v44, "completeWithError:", v13);
LABEL_40:
}

- (void).cxx_destruct
{
}

@end