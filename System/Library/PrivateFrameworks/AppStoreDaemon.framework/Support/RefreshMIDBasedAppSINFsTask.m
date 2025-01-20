@interface RefreshMIDBasedAppSINFsTask
- (RefreshMIDBasedAppSINFsTask)init;
- (void)main;
@end

@implementation RefreshMIDBasedAppSINFsTask

- (RefreshMIDBasedAppSINFsTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RefreshMIDBasedAppSINFsTask;
  v2 = -[Task init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    v4 = *(void **)&v2->super._success;
    *(void *)&v2->super._success = v3;
  }

  return v2;
}

- (void)main
{
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1002C5750;
  v45[3] = &unk_1003F0AA0;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v46 = v3;
  +[ApplicationProxy enumerateApplicationsOfType:usingBlock:]( &OBJC_CLASS___ApplicationProxy,  "enumerateApplicationsOfType:usingBlock:",  0LL,  v45);
  uint64_t v4 = ASDLogHandleForCategory(41LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  v38 = self;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)&self->super._success;
    id v7 = [v3 count];
    *(_DWORD *)buf = 138412546;
    uint64_t v48 = v6;
    self = v38;
    __int16 v49 = 2048;
    id v50 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%@] Attempting to update %ld MID app(s)",  buf,  0x16u);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v42;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleID]);
        unsigned int v15 = [v12 isAppClip];
        uint64_t v16 = ASDLogHandleForCategory(41LL);
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v18)
          {
            uint64_t v19 = *(void *)&self->super._success;
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = v19;
            __int16 v49 = 2114;
            id v50 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] Skipping MID based clip",  buf,  0x16u);
          }
        }

        else
        {
          if (v18)
          {
            uint64_t v20 = *(void *)&self->super._success;
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = v20;
            __int16 v49 = 2114;
            id v50 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] MID refresh update requesting SINF update",  buf,  0x16u);
          }

          v21 = objc_alloc(&OBJC_CLASS___ASDManagedApplicationRequestOptions);
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 storeItemID]));
          v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v12 storeExternalVersionID]));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleVersion]);
          v25 = -[ASDManagedApplicationRequestOptions initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:]( v21,  "initWithItemIdentifer:externalVersionIdentifier:bundleIdentifier:bundleVersion:skipDownloads:",  v22,  v23,  v14,  v24,  0LL);

          self = v38;
          v26 = sub_100240B98((id *)objc_alloc(&OBJC_CLASS___ManagedApplicationTask), v25, 0LL);
          id v40 = 0LL;
          -[Task runSubTask:returningError:](v38, "runSubTask:returningError:", v26, &v40);
          v17 = (os_log_s *)v40;
          uint64_t v27 = ASDLogHandleForCategory(41LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          v29 = v28;
          if (v17)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = *(void *)&v38->super._success;
              *(_DWORD *)buf = 138412802;
              uint64_t v48 = v30;
              __int16 v49 = 2114;
              id v50 = v14;
              __int16 v51 = 2114;
              v52[0] = v17;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[%@] [%{public}@] MID refresh update resulted in error: %{public}@",  buf,  0x20u);
            }
          }

          else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            if (v26)
            {
              int v31 = (_BYTE)v26[3] & 1;
              id v32 = v26[21];
            }

            else
            {
              int v31 = 0;
              id v32 = 0LL;
            }

            uint64_t v33 = *(void *)&v38->super._success;
            *(_DWORD *)buf = 138413058;
            uint64_t v48 = v33;
            __int16 v49 = 2114;
            id v50 = v14;
            __int16 v51 = 1024;
            LODWORD(v52[0]) = v31;
            WORD2(v52[0]) = 2048;
            *(void *)((char *)v52 + 6) = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%@] [%{public}@] MID refresh update complete with status: %d changeType: %ld",  buf,  0x26u);
          }
        }

        objc_autoreleasePoolPop(v13);
        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
      id v9 = v34;
    }

    while (v34);
  }

  uint64_t v35 = ASDLogHandleForCategory(41LL);
  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = *(void *)&self->super._success;
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = v37;
    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[%@] MID update triggered migration completed",  buf,  0xCu);

LABEL_28:
    LOBYTE(self->super._keepAlive) = 1;
    goto LABEL_29;
  }

  if (self) {
    goto LABEL_28;
  }
LABEL_29:
}

- (void).cxx_destruct
{
}

@end