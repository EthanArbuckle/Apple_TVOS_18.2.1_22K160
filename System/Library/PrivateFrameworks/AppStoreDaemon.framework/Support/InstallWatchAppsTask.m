@interface InstallWatchAppsTask
- (void)main;
@end

@implementation InstallWatchAppsTask

- (void)main
{
  v3 = dispatch_group_create();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v56 = v4;
  if ([*(id *)&self->super._success count] == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super._success firstObject]);
    id v6 = sub_10029A328((uint64_t)&OBJC_CLASS___InstallWatchAppsTask, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      uint64_t v8 = ASDLogHandleForCategory(14LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
        *(_DWORD *)buf = 138412546;
        v78 = v10;
        __int16 v79 = 2114;
        id v80 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[%@] Active installation already exists: %{public}@",  buf,  0x16u);
      }

      [v56 addObject:v7];
      -[Task completeWithSuccess](self, "completeWithSuccess");
      id v11 = 0LL;
      goto LABEL_39;
    }

    v37 = self;
    v38 = (void *)objc_claimAutoreleasedReturnValue([v5 buyParams]);
    id v39 = sub_1002E3218(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    if ([v5 isUserInitiated])
    {
      id v11 = 0LL;
    }

    else
    {
      uint64_t error = (uint64_t)v37->super._error;
      v42 = (void *)objc_claimAutoreleasedReturnValue([v5 itemID]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 stringValue]);
      id v75 = 0LL;
      char v44 = sub_1002E2DEC(error, v43, v40, (uint64_t)&v75);
      id v11 = v75;

      if ((v44 & 1) == 0)
      {
        uint64_t v50 = ASDLogHandleForCategory(2LL);
        v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
          *(_DWORD *)buf = 138412546;
          v78 = v52;
          __int16 v79 = 2114;
          id v80 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "[%@] Redownload request throttled with error: %{public}@",  buf,  0x16u);
        }

        -[Task completeWithError:](v37, "completeWithError:", v11);
        goto LABEL_38;
      }
    }

    dispatch_group_enter(v3);
    uint64_t v45 = ASDLogHandleForCategory(2LL);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue([v5 logKey]);
      *(_DWORD *)buf = 138412290;
      v78 = v47;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "[%@] Starting purchase for redownload",  buf,  0xCu);
    }

    id v48 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472LL;
    v69[2] = sub_10029A490;
    v69[3] = &unk_1003F0720;
    id v70 = v5;
    v71 = v37;
    id v72 = v40;
    id v73 = v56;
    v74 = v3;
    sub_100199B84((uint64_t)v49, v70, v69);

LABEL_38:
    self = v37;
LABEL_39:

    v4 = v56;
    goto LABEL_40;
  }

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = *(id *)&self->super._success;
  id v59 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
  id v11 = 0LL;
  if (!v59) {
    goto LABEL_28;
  }
  uint64_t v12 = *(void *)v66;
  uint64_t v57 = *(void *)v66;
  v55 = v3;
  do
  {
    for (i = 0LL; i != v59; i = (char *)i + 1)
    {
      if (*(void *)v66 != v12) {
        objc_enumerationMutation(obj);
      }
      v14 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)i);
      id v15 = sub_10029A328((uint64_t)&OBJC_CLASS___InstallWatchAppsTask, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if (!v16)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v14 buyParams]);
        id v21 = sub_1002E3218(v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

        if ([v14 isUserInitiated])
        {
          id v23 = v11;
          goto LABEL_19;
        }

        v24 = self;
        v25 = self->super._error;
        v26 = (void *)objc_claimAutoreleasedReturnValue([v14 itemID]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 stringValue]);
        id v64 = v11;
        char v28 = sub_1002E2DEC((uint64_t)v25, v27, v22, (uint64_t)&v64);
        id v23 = v64;

        if ((v28 & 1) != 0)
        {
          self = v24;
          v3 = v55;
          v4 = v56;
LABEL_19:
          dispatch_group_enter(v3);
          uint64_t v29 = ASDLogHandleForCategory(2LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
            *(_DWORD *)buf = 138412290;
            v78 = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "[%@] Starting purchases for redownload",  buf,  0xCu);
          }

          id v32 = sub_1001995C0((uint64_t)&OBJC_CLASS___PurchaseManager);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472LL;
          v60[2] = sub_10029A7BC;
          v60[3] = &unk_1003F0720;
          v60[4] = v14;
          v60[5] = self;
          id v61 = v22;
          id v62 = v4;
          v63 = v3;
          sub_100199B84((uint64_t)v33, v14, v60);
        }

        else
        {
          uint64_t v34 = ASDLogHandleForCategory(2LL);
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
            *(_DWORD *)buf = 138412546;
            v78 = v36;
            __int16 v79 = 2114;
            id v80 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[%@] Redownload request throttled with error: %{public}@",  buf,  0x16u);
          }

          self = v24;
          v3 = v55;
          v4 = v56;
        }

        uint64_t v12 = v57;

        id v11 = v23;
        goto LABEL_26;
      }

      uint64_t v17 = ASDLogHandleForCategory(14LL);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v14 logKey]);
        *(_DWORD *)buf = 138412546;
        v78 = v19;
        __int16 v79 = 2114;
        id v80 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%@] Active installation already exists: %{public}@",  buf,  0x16u);
      }

      [v4 addObject:v16];
LABEL_26:
    }

    id v59 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
  }

  while (v59);
LABEL_28:

  -[Task completeWithSuccess](self, "completeWithSuccess");
LABEL_40:
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  -[Task lock](self, "lock");
  v53 = (NSArray *)[v4 copy];
  purchaseInfo = self->_purchaseInfo;
  self->_purchaseInfo = v53;

  -[Task unlock](self, "unlock");
}

- (void).cxx_destruct
{
}

@end