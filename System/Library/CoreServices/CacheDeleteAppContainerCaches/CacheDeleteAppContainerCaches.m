uint64_t RegisterCacheDeleteAppFreezerService()
{
  if (RegisterCacheDeleteAppFreezerService_onceToken != -1) {
    dispatch_once(&RegisterCacheDeleteAppFreezerService_onceToken, &__block_literal_global);
  }
  return CacheDeleteRegisterInfoCallbacks( @"com.apple.mobile.cache_delete_app_freezer",  &__block_literal_global_8,  &__block_literal_global_19,  0LL,  &__block_literal_global_22);
}

void maybeReenableAppFreezer()
{
  if (isAppFreezerEnabled()) {
    return;
  }
  int v12 = 0;
  v0 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
  if (fsctl("/private/var", 0x40046818uLL, &v12, 0))
  {
    int v1 = *__error();
    uint64_t v2 = CDGetLogHandle("client");
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v11 = strerror(v1);
      *(_DWORD *)buf = 136315394;
      v14 = "/private/var";
      __int16 v15 = 2080;
      v16 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "Failed to determine the state of volume %s: %s",  buf,  0x16u);
    }

LABEL_5:
    setAppFreezeEnabled(1);
    return;
  }

  int v4 = v12 & 0x2204;
  if (v0)
  {
    unsigned __int8 v5 = -[NSUserDefaults BOOLForKey:](v0, "BOOLForKey:", @"AppFreezerDisabledByCDKey");
    if (v4)
    {
LABEL_14:
      if (!v4)
      {
        uint64_t v10 = CDGetLogHandle("client");
        v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SHOULD reenable app freezer as freezer was disabled by CD",  buf,  2u);
        }

        goto LABEL_5;
      }

      goto LABEL_15;
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
    if ((v12 & 0x2204) != 0) {
      goto LABEL_14;
    }
  }

  if ((v5 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v6 = CDGetLogHandle("client");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "SHOULD not reenable app freezer as freezer was not disabled by CD",  buf,  2u);
  }

LABEL_15:
  uint64_t v8 = CDGetLogHandle("client");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SHOULD NOT reenable app freezer", buf, 2u);
  }
}

void sub_1000049C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __RegisterCacheDeleteAppFreezerService_block_invoke_14(uint64_t a1)
{
  if (isAppFreezerEnabled())
  {
    uint64_t v2 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sizeOfFreezeFiles());
    uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    unsigned __int8 v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

BOOL isAppFreezerEnabled()
{
  int v10 = 0;
  size_t v9 = 4LL;
  if (sysctlbyname("vm.freeze_enabled", &v10, &v9, 0LL, 0LL))
  {
    int v0 = *__error();
    uint64_t v1 = CDGetLogHandle("client");
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = strerror(v0);
      *(_DWORD *)buf = 136315138;
      int v12 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "Failed to determine freezer state: %s",  buf,  0xCu);
    }

    int v10 = 0;
LABEL_5:
    uint64_t v3 = CDGetLogHandle("client");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v5 = "App freezer NOT enabled";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (!v10) {
    goto LABEL_5;
  }
  uint64_t v6 = CDGetLogHandle("client");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    unsigned __int8 v5 = "App freezer enabled";
    goto LABEL_10;
  }

LABEL_11:
  return v10 != 0;
}

uint64_t sizeOfFreezeFiles()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = __sizeOfFreezeFiles_block_invoke;
  v2[3] = &unk_10000C498;
  v2[4] = &v3;
  v2[5] = "/private/var/vm/swapfile";
  traverse_directory(@"/private/var/vm", v2);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100004C78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100004E0C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void __RegisterCacheDeleteAppFreezerService_block_invoke_3_20(uint64_t a1)
{
  if (isAppFreezerEnabled())
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sizeOfFreezeFiles();
    setAppFreezeEnabled(0);
  }

void setAppFreezeEnabled(int a1)
{
  HIDWORD(v12) = a1;
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___NSUserDefaults);
  LODWORD(v12) = 0;
  size_t v11 = 4LL;
  uint64_t v3 = CDGetLogHandle("client");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (!v5) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Enabling app freezer";
  }

  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Disabling app freezer";
  }

  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_7:

  if (sysctlbyname("vm.freeze_enabled", &v12, &v11, (char *)&v12 + 4, 4uLL))
  {
    int v7 = *__error();
    uint64_t v8 = CDGetLogHandle("client");
    size_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = strerror(v7);
      *(_DWORD *)buf = 136315138;
      v14 = v10;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to disable app freezing: %s",  buf,  0xCu);
    }
  }

  else if (v2)
  {
    -[NSUserDefaults setBool:forKey:](v2, "setBool:forKey:", a1 ^ 1u, @"AppFreezerDisabledByCDKey", v11, v12);
  }
}

uint64_t __sizeOfFreezeFiles_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = *(const char **)(a1 + 40);
  size_t v7 = strlen(v6);
  if (!strncmp(a2, v6, v7)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += *(void *)(a3 + 8);
  }
  return 1LL;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_autoreleasePoolPush();
  RegisterCacheManagementAssetsService();
  RegisterCacheDeleteAppFreezerService();
  objc_autoreleasePoolPop(v3);
  dispatch_main();
}

void sub_1000056D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_12:
  objc_autoreleasePoolPop(v4);
  return v5 ^ 1;
}

void sub_100005E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

LABEL_4:
  v14 = v9;
LABEL_9:

  return v14;
}

void sub_1000071AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100007618( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1000086EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49, uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void RegisterCacheManagementAssetsService()
{
  if (RegisterCacheManagementAssetsService_once != -1) {
    dispatch_once(&RegisterCacheManagementAssetsService_once, &__block_literal_global_96);
  }
  uint64_t v3 = @"CACHE_DELETE_REQUIRED_ENTITLEMENTS";
  uint64_t v4 = &off_10000CEE8;
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = __RegisterCacheManagementAssetsService_block_invoke_4;
  v1[3] = &unk_10000C820;
  uint64_t v2 = &__block_literal_global_99;
  CacheDeleteRegisterCallback(@"com.apple.mobile.cache_delete_managed_assets", v0, v1);
}

void __RegisterCacheManagementAssetsService_block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 44))
  {
    uint64_t v1 = (void *)qword_1000108D8;
    qword_1000108D8 = 0LL;
  }

  else
  {
    if (*(void *)(a1 + 32)) {
      BOOL v2 = qword_1000108D8 == 0;
    }
    else {
      BOOL v2 = 0;
    }
    if (v2)
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue( +[CacheDeleteManagedAssets cacheDeleteManagedAssetsWithInfo:atUrgency:]( &OBJC_CLASS___CacheDeleteManagedAssets,  "cacheDeleteManagedAssetsWithInfo:atUrgency:"));
      uint64_t v4 = (void *)qword_1000108D8;
      qword_1000108D8 = v3;
    }

    else if (qword_1000108D8)
    {
      if (*(_BYTE *)(a1 + 45)) {
        [(id)qword_1000108D8 cancelPurge];
      }
    }
  }

void *__RegisterCacheManagementAssetsService_block_invoke_4(uint64_t a1, void *a2)
{
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = a2;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"]);
  uint64_t v6 = CDGetLogHandle("client");
  size_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v105 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "com.apple.mobile.cache_delete_managed_assets Callback ENTRY, info: %@",  buf,  0xCu);
  }

  v78 = v4;

  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v91 objects:v106 count:16];
  if (v9)
  {
    id v10 = v9;
    size_t v11 = &CDGetLogHandle_ptr;
    uint64_t v84 = *(void *)v92;
    id v81 = v8;
    uint64_t v80 = a1;
    do
    {
      uint64_t v12 = 0LL;
      id v82 = v10;
      do
      {
        if (*(void *)v92 != v84) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v91 + 1) + 8LL * (void)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v13]);
        uint64_t v15 = objc_opt_class(v11[10]);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v85 = (void *)objc_claimAutoreleasedReturnValue( +[TestTelemetry testTelemetryWithInfo:]( &OBJC_CLASS___TestTelemetry,  "testTelemetryWithInfo:",  v14));
          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_URGENCY"]);
          [v16 integerValue];

          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
          uint64_t v18 = evaluateStringProperty();
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v19));

          uint64_t v21 = CDGetLogHandle("client");
          v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue([v20 mountPoint]);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v105 = 496;
            *(_WORD *)&v105[4] = 2112;
            *(void *)&v105[6] = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%d CacheManagmentAssets volume: %@",  buf,  0x12u);
          }

          if ([v13 isEqualToString:@"CACHE_DELETE_PURGE_OPERATION"])
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
            uint64_t v25 = evaluateNumberProperty();
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

            v27 = (void *)objc_claimAutoreleasedReturnValue([v20 mountPoint]);
            else {
              v28 = "/private/var";
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v28));
            if ([v27 isEqualToString:v29] && v26)
            {
              uint64_t v30 = (uint64_t)[v26 longLongValue];

              if (v30 >= 1)
              {
                uint64_t v31 = (*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
                v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
                if (v32)
                {
                  id v33 = objc_msgSend(v32, "purgeAssets:testObject:", objc_msgSend(v26, "unsignedLongLongValue"), v85);
                  id v34 = (id)(*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
                  v102[0] = @"CACHE_DELETE_AMOUNT";
                  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v33));
                  v102[1] = @"CACHE_DELETE_VOLUME";
                  v103[0] = v35;
                  v36 = (void *)objc_claimAutoreleasedReturnValue([v32 volume]);
                  v103[1] = v36;
                  size_t v11 = &CDGetLogHandle_ptr;
                  v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  2LL));

                  goto LABEL_43;
                }

                v37 = &off_10000CF28;
                id v8 = v81;
                size_t v11 = &CDGetLogHandle_ptr;
LABEL_44:

                [v83 setObject:v37 forKeyedSubscript:@"CACHE_DELETE_PURGE_OPERATION"];
LABEL_63:

                id v10 = v82;
                goto LABEL_64;
              }
            }

            else
            {
            }

            v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Amount doesn't make sense: %lld",  [v26 longLongValue],  v78));
            v100 = @"CACHE_DELETE_ERROR";
            v101 = v32;
            size_t v11 = &CDGetLogHandle_ptr;
            v37 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
LABEL_43:
            id v8 = v81;
            goto LABEL_44;
          }

          if ([v13 isEqualToString:@"CACHE_DELETE_PURGEABLE_OPERATION"])
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue([v20 mountPoint]);
            else {
              v41 = "/private/var";
            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v41));
            unsigned int v43 = [v40 isEqualToString:v42];

            if (v43)
            {
              uint64_t v44 = (*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
              v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              if (v45)
              {
                uint64_t v90 = 0LL;
                v79 = v45;
                v46 = (void *)objc_claimAutoreleasedReturnValue([v45 sizeEligibleAsset:&v90]);
                id v47 = (id)(*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
                uint64_t v48 = CDGetLogHandle("client");
                v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "purgeableAssets:", buf, 2u);
                }

                __int128 v88 = 0u;
                __int128 v89 = 0u;
                __int128 v86 = 0u;
                __int128 v87 = 0u;
                id v50 = v46;
                id v51 = [v50 countByEnumeratingWithState:&v86 objects:v99 count:16];
                if (v51)
                {
                  id v52 = v51;
                  uint64_t v53 = *(void *)v87;
                  do
                  {
                    for (i = 0LL; i != v52; i = (char *)i + 1)
                    {
                      if (*(void *)v87 != v53) {
                        objc_enumerationMutation(v50);
                      }
                      uint64_t v55 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)i);
                      uint64_t v56 = CDGetLogHandle("client");
                      v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)v105 = v55;
                        _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }
                    }

                    id v52 = [v50 countByEnumeratingWithState:&v86 objects:v99 count:16];
                  }

                  while (v52);
                }

                v97[0] = @"CACHE_DELETE_AMOUNT";
                v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v90));
                v97[1] = @"CACHE_DELETE_VOLUME";
                v98[0] = v58;
                v59 = (void *)objc_claimAutoreleasedReturnValue([v79 volume]);
                v98[1] = v59;
                v60 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  2LL));

                size_t v11 = &CDGetLogHandle_ptr;
                v61 = v79;
              }

              else
              {
                v61 = 0LL;
                v60 = &off_10000CF50;
                size_t v11 = &CDGetLogHandle_ptr;
              }
            }

            else
            {
              uint64_t v63 = CDGetLogHandle("client");
              v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                v65 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v105 = 544;
                *(_WORD *)&v105[4] = 2112;
                *(void *)&v105[6] = v65;
                _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%d CacheManagementAssets Purgeable skipping volume: %@",  buf,  0x12u);
              }

              v95[0] = @"CACHE_DELETE_AMOUNT";
              v95[1] = @"CACHE_DELETE_VOLUME";
              v96[0] = &off_10000CE70;
              v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:"));
              v96[1] = v61;
              size_t v11 = &CDGetLogHandle_ptr;
              v60 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v96,  v95,  2LL));
            }

            [v83 setObject:v60 forKeyedSubscript:@"CACHE_DELETE_PURGEABLE_OPERATION"];
          }

          else
          {
            size_t v11 = &CDGetLogHandle_ptr;
            if ([v13 isEqualToString:@"CACHE_DELETE_PURGE_CANCEL_OPERATION"])
            {
              id v62 = (id)(*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
              goto LABEL_63;
            }

            if (![v13 isEqualToString:@"CACHE_DELETE_PERIODIC_OPERATION"])
            {
              if ([v13 isEqualToString:@"CACHE_DELETE_ANALYTICS_REPORT"])
              {
                v71 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                for (int j = 1; j != 5; ++j)
                {
                  uint64_t v73 = (*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
                  v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                  v75 = (void *)objc_claimAutoreleasedReturnValue([v74 analytics]);
                  -[NSMutableDictionary addEntriesFromDictionary:](v71, "addEntriesFromDictionary:", v75);

                  id v76 = (id)(*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
                }

                [v83 setObject:v71 forKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];

                id v8 = v81;
                size_t v11 = &CDGetLogHandle_ptr;
              }

              goto LABEL_63;
            }

            uint64_t v66 = (*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
            v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
            v68 = v67;
            if (v67)
            {
              [v67 periodic:v85];
              id v69 = (id)(*(uint64_t (**)(void))(*(void *)(v80 + 32) + 16LL))();
              v70 = 0LL;
            }

            else
            {
              v70 = &off_10000CF78;
            }

            [v83 setObject:v70 forKeyedSubscript:@"CACHE_DELETE_PERIODIC_OPERATION"];
          }

          id v8 = v81;
          goto LABEL_63;
        }

        uint64_t v38 = CDGetLogHandle("client");
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v105 = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "operation info is not a dictionary: %@",  buf,  0xCu);
        }

        [v83 setObject:&off_10000CF00 forKeyedSubscript:@"CACHE_DELETE_SERVICE_REQUEST_OPERATION"];
LABEL_64:

        uint64_t v12 = (char *)v12 + 1;
      }

      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v91 objects:v106 count:16];
    }

    while (v10);
  }

  return v83;
}

id objc_msgSend_volumeWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeWithPath:");
}