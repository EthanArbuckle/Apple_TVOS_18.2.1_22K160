id getRepositoryPath(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  v5 = a1;
  if (v5 && (v6 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"getRepositoryPath",  @"ERROR: Invalid string passed to %s",  v1,  v2,  v3,  v4,  (uint64_t)"getRepositoryPath");
    v7 = 0LL;
  }

  return v7;
}

void sub_100002D6C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MASecureMobileAssetTypes);
  v2 = (void *)qword_10000CD00;
  qword_10000CD00 = (uint64_t)v1;
}

void sub_100003344( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003380( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_autoreleasePoolPush();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"main",  @"Starting with MobileAsset-%s (built %s %s)",  v4,  v5,  v6,  v7,  (uint64_t)"1");
  v8 = objc_alloc_init(&OBJC_CLASS___MAManifestStorageServiceDelegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v9 setDelegate:v8];
  [v9 resume];

  objc_autoreleasePoolPop(v3);
  return 0;
}

id logInfo()
{
  if (qword_10000CD10 != -1) {
    dispatch_once(&qword_10000CD10, &stru_100008308);
  }
  return (id)qword_10000CD08;
}

void sub_1000035B4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileassetd", "Notice");
  v2 = (void *)qword_10000CD08;
  qword_10000CD08 = (uint64_t)v1;
}

id logError()
{
  if (qword_10000CD20 != -1) {
    dispatch_once(&qword_10000CD20, &stru_100008328);
  }
  return (id)qword_10000CD18;
}

void sub_100003624(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileassetd", "Error");
  v2 = (void *)qword_10000CD18;
  qword_10000CD18 = (uint64_t)v1;
}

id logDebug()
{
  if (qword_10000CD30 != -1) {
    dispatch_once(&qword_10000CD30, &stru_100008348);
  }
  return (id)qword_10000CD28;
}

void sub_100003694(id a1)
{
  os_log_t v1 = os_log_create("com.apple.mobileassetd", "Debug");
  v2 = (void *)qword_10000CD28;
  qword_10000CD28 = (uint64_t)v1;
}

void _MobileAssetLog( uint64_t a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a4;
  if (byte_10000CD38 | byte_10000CD39)
  {
    *(void *)buf = &a9;
    v12 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v11,  &a9);
    v13 = v12;
    v14 = @"Unable to allocate log message";
    if (v12) {
      v14 = v12;
    }
    v15 = v14;

    if (byte_10000CD38) {
      NSLog(@"%@", v15);
    }
    if (byte_10000CD39)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleWithStandardOutput]( &OBJC_CLASS___NSFileHandle,  "fileHandleWithStandardOutput"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v15, "dataUsingEncoding:", 2LL));
      [v16 writeData:v17];

      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleWithStandardOutput]( &OBJC_CLASS___NSFileHandle,  "fileHandleWithStandardOutput"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:2]);
      [v18 writeData:v19];
    }
  }

  if (!byte_10000CD3A)
  {
    if (a2 == 7)
    {
      id v26 = logDebug();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

      if (v28)
      {
        *(void *)buf = &a9;
        v23 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v11,  &a9);
        id v29 = logDebug();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          sub_10000515C();
        }
        goto LABEL_21;
      }
    }

    else if (a2 == 3)
    {
      id v20 = logError();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        *(void *)buf = &a9;
        v23 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v11,  &a9);
        id v24 = logError();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1000050EC();
        }
LABEL_21:
      }
    }

    else
    {
      id v30 = logInfo();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

      if (v32)
      {
        v23 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v11,  &a9);
        id v33 = logInfo();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&buf[4] = a3;
          __int16 v35 = 2114;
          v36 = v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", buf, 0x16u);
        }

        goto LABEL_21;
      }
    }
  }
}

  ;
}

  ;
}

void sub_100003B88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:completion:]_block_invoke",  @"Storing manifest (stage = %i)",  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 64));
  uint64_t v9 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) storeManifest:*(void *)(a1 + 40) infoPlist:*(void *)(a1 + 48) stage:*(unsigned __int8 *)(a1 + 64)]);
  id v14 = (id)v9;
  if (v9) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:completion:]_block_invoke",  @"Store failed: %@",  v10,  v11,  v12,  v13,  v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_100003CE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) commitStagedManifestsForSelectors:*(void *)(a1 + 40)]);
  id v15 = (id)v9;
  if (v9) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:completion:]_block_invoke",  @"Commit failed: %@",  v10,  v11,  v12,  v13,  v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100003E50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) invalidateManifestForAssetType:*(void *)(a1 + 32) specifier:*(void *)(a1 + 40)]);
  id v14 = (id)v9;
  if (v9) {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:completion:]_block_invoke",  @"Remove failed: %@",  v10,  v11,  v12,  v13,  v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

void sub_10000445C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

void sub_100004470(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_DWORD *)a5 = a4;
  if (!a4)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a2, a3));
    id v14 = 0LL;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v6,  0LL,  0LL,  &v14));
    id v8 = v14;
    uint64_t v9 = *(void **)(a5 + 8);
    *(void *)(a5 + 8) = v7;

    if (!*(void *)(a5 + 8))
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"_plist_trust_callback",  @"Failed to deserialize info plist: %@",  v10,  v11,  v12,  v13,  (uint64_t)v8);
      *(_DWORD *)a5 = 79;
    }
  }
}

LABEL_35:
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService _errorWithCode:](v62, "_errorWithCode:", 11LL));
LABEL_36:
  uint64_t v4 = v56;
LABEL_37:

  free(v57);
  return v53;
}

void sub_100004AB8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
}

LABEL_11:
  return v18;
}

void sub_1000050EC()
{
}

void sub_10000515C()
{
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}