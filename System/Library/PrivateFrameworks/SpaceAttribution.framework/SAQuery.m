@interface SAQuery
+ (BOOL)getAppPathForContainer:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 personaString:(id)a6 existingQuery:(container_query_s *)a7 block:(id)a8;
+ (id)getFSPurgeableInfo:(id)a3 options:(int)a4;
+ (id)getLSBundleRecordForBundle:(id)a3;
+ (id)getVendorNameForBundleSet:(id)a3;
+ (id)getVendorNameFromBundleRecord:(id)a3;
+ (id)guesstimateBundleId:(id)a3;
+ (void)enumerateAppPathsOnVolume:(id)a3;
+ (void)enumerateWithContainerQuery:(unint64_t)a3 existingQuery:(container_query_s *)a4 outQuery:(container_query_s *)a5 block:(id)a6;
+ (void)installedAppGroupsAtVolume:(id)a3;
+ (void)installedAppsAtVolume:(BOOL)a3 sortForUrgency:(int)a4 options:(int)a5 block:(id)a6;
@end

@implementation SAQuery

+ (void)installedAppsAtVolume:(BOOL)a3 sortForUrgency:(int)a4 options:(int)a5 block:(id)a6
{
  char v6 = a5;
  id v8 = a6;
  uint64_t v9 = recentlyUsedAppsDictionary();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000277D0;
  v12[3] = &unk_10004D328;
  int v15 = a4;
  char v16 = v6 & 1;
  id v13 = (id)objc_claimAutoreleasedReturnValue(v9);
  id v14 = v8;
  id v10 = v8;
  id v11 = v13;
  +[SAQuery enumerateAppPathsOnVolume:](&OBJC_CLASS___SAQuery, "enumerateAppPathsOnVolume:", v12);
}

+ (void)installedAppGroupsAtVolume:(id)a3
{
  id v3 = a3;
  v4 = objc_autoreleasePoolPush();
  uint64_t v5 = container_query_create();
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 1;
  if (v5)
  {
    uint64_t v6 = v5;
    container_query_set_class(v5, 7LL);
    container_query_operation_set_flags(v6, &_mh_execute_header);
    container_query_set_include_other_owners(v6, 1LL);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100027D24;
    v23[3] = &unk_10004D350;
    v25 = v26;
    v24 = (os_log_s *)v3;
    int iterate_results_sync = container_query_iterate_results_sync(v6, v23);
    uint64_t last_error = container_query_get_last_error(v6);
    uint64_t v9 = container_error_copy_unlocalized_description(last_error);
    id v10 = (void *)v9;
    if (iterate_results_sync)
    {
      uint64_t v11 = SALog(v9);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100033C18();
      }
    }

    else
    {
      uint64_t v22 = SALog(v9);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100033C78();
      }
    }

    free(v10);
    container_query_free(v6);
    id v14 = v24;
  }

  else
  {
    uint64_t v13 = SALog(0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100033BE8(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  _Block_object_dispose(v26, 8);
  objc_autoreleasePoolPop(v4);
}

+ (id)getLSBundleRecordForBundle:(id)a3
{
  return +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  a3,  1LL,  0LL);
}

+ (void)enumerateAppPathsOnVolume:(id)a3
{
  uint64_t v4 = 0LL;
  id v3 = a3;
  +[SAQuery enumerateWithContainerQuery:existingQuery:outQuery:block:]( &OBJC_CLASS___SAQuery,  "enumerateWithContainerQuery:existingQuery:outQuery:block:",  2LL,  0LL,  &v4,  v3);
  +[SAQuery enumerateWithContainerQuery:existingQuery:outQuery:block:]( &OBJC_CLASS___SAQuery,  "enumerateWithContainerQuery:existingQuery:outQuery:block:",  4LL,  v4,  0LL,  v3);

  if (v4) {
    container_query_free(v4);
  }
}

+ (void)enumerateWithContainerQuery:(unint64_t)a3 existingQuery:(container_query_s *)a4 outQuery:(container_query_s *)a5 block:(id)a6
{
  id v9 = a6;
  context = objc_autoreleasePoolPush();
  id v10 = (container_query_s *)container_query_create();
  uint64_t v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v13 = v12;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  char v46 = 1;
  if (v10)
  {
    v33 = a4;
    container_query_set_class(v10, a3);
    container_query_operation_set_flags(v10, &_mh_execute_header);
    container_query_set_include_other_owners(v10, 1LL);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_100028154;
    v41[3] = &unk_10004D378;
    id v14 = v11;
    v42 = (os_log_s *)v14;
    uint64_t v15 = v13;
    v43 = v15;
    v44 = v45;
    int iterate_results_sync = container_query_iterate_results_sync(v10, v41);
    uint64_t last_error = container_query_get_last_error(v10);
    uint64_t v18 = container_error_copy_unlocalized_description(last_error);
    uint64_t v19 = (void *)v18;
    if (iterate_results_sync)
    {
      uint64_t v20 = SALog(v18);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100033C18();
      }
    }

    else
    {
      uint64_t v31 = SALog(v18);
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100033C78();
      }
    }

    free(v19);
    id v32 = -[NSMutableArray count](v14, "count");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000282F4;
    block[3] = &unk_10004D3A0;
    v36 = v15;
    v37 = v14;
    unint64_t v39 = a3;
    v40 = v33;
    id v38 = v9;
    dispatch_apply((size_t)v32, 0LL, block);
    if (a5) {
      *a5 = v10;
    }
    else {
      container_query_free(v10);
    }

    v23 = v42;
  }

  else
  {
    uint64_t v22 = SALog(v12);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100033BE8(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }

  _Block_object_dispose(v45, 8);
  objc_autoreleasePoolPop(context);
}

+ (BOOL)getAppPathForContainer:(id)a3 identifier:(id)a4 containerClass:(unint64_t)a5 personaString:(id)a6 existingQuery:(container_query_s *)a7 block:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v38 = 0LL;
  unint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  char v41 = 1;
  if (a5 == 4)
  {
    uint64_t v37 = 0LL;
    uint64_t v17 = (id *)&v37;
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[LSApplicationExtensionRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSApplicationExtensionRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v14,  1LL,  &v37));
  }

  else
  {
    uint64_t v36 = 0LL;
    uint64_t v17 = (id *)&v36;
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v14,  1LL,  &v36));
  }

  uint64_t v19 = (void *)v18;
  id v20 = *v17;
  uint64_t v21 = v20;
  if (!v19 || v20)
  {
    uint64_t v25 = SALog(v20);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100033DA8();
    }
    BOOL v23 = 1;
  }

  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100028610;
    v27[3] = &unk_10004D3C8;
    uint64_t v28 = v19;
    char v34 = 0;
    BOOL v35 = a5 == 4;
    id v29 = v15;
    v33 = a7;
    id v30 = v14;
    id v32 = &v38;
    id v31 = v16;
    uint64_t v22 = objc_retainBlock(v27);
    ((void (*)(void *, id))v22[2])(v22, v13);
    BOOL v23 = *((_BYTE *)v39 + 24) != 0;

    uint64_t v24 = v28;
  }

  _Block_object_dispose(&v38, 8);
  return v23;
}

+ (id)getFSPurgeableInfo:(id)a3 options:(int)a4
{
  id v5 = a3;
  unsigned int valuePtr = (a4 >> 2) & 1;
  if ((a4 & 4) != 0) {
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }
  else {
    CFNumberRef v6 = 0LL;
  }
  id v7 = objc_claimAutoreleasedReturnValue([v5 path]);
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)[v7 UTF8String], 0x8000100u);

  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"CACHE_DELETE_VOLUME", v8);
  if (v6) {
    CFDictionarySetValue(Mutable, @"CACHE_DELETE_NO_CACHE", v6);
  }
  id v10 = (id)CacheDeleteCopyItemizedPurgeableSpaceWithInfo(Mutable);
  id v11 = [v10 copy];
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v10) {
    CFRelease(v10);
  }

  return v11;
}

+ (id)getVendorNameFromBundleRecord:(id)a3
{
  id v3 = a3;
  if ([v3 developerType] == 1)
  {
    uint64_t v4 = @"Apple";
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    {
      id v6 = v3;
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 containingBundleRecord]);
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
        id v9 = (id)objc_claimAutoreleasedReturnValue([v6 containingBundleRecord]);
      }
      else {
        id v9 = 0LL;
      }
    }

    else
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
      if ((objc_opt_isKindOfClass(v3, v10) & 1) != 0) {
        id v9 = v3;
      }
      else {
        id v9 = 0LL;
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 iTunesMetadata]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 artistName]);

    if (v12) {
      uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 artistName]);
    }
    else {
      uint64_t v4 = @"Unknown";
    }
  }

  return v4;
}

+ (id)guesstimateBundleId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getLSBundleRecordForBundle:](&OBJC_CLASS___SAQuery, "getLSBundleRecordForBundle:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SAQuery getVendorNameFromBundleRecord:](&OBJC_CLASS___SAQuery, "getVendorNameFromBundleRecord:", v4));

  id v6 = [v5 hasPrefix:@"Apple Inc."];
  if ((_DWORD)v6)
  {
    uint64_t v7 = SALog(v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      v12 = "+[SAQuery guesstimateBundleId:]";
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: Shorten Apple Inc for %@",  (uint8_t *)&v11,  0x16u);
    }

    id v9 = @"Apple";
  }

  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)getVendorNameForBundleSet:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_1000292A0;
  uint64_t v21 = sub_1000292B0;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](&OBJC_CLASS___NSMutableSet, "setWithCapacity:", 5LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000292B8;
  v16[3] = &unk_10004D080;
  v16[4] = &v17;
  [v3 enumerateObjectsUsingBlock:v16];
  if ([(id)v18[5] count])
  {
    uint64_t v10 = 0LL;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000LL;
    __int16 v13 = sub_1000292A0;
    id v14 = sub_1000292B0;
    id v15 = 0LL;
    uint64_t v4 = (void *)v18[5];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100029330;
    v9[3] = &unk_10004D3F0;
    v9[4] = &v10;
    [v4 enumerateObjectsUsingBlock:v9];
    id v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    uint64_t v6 = SALog(0LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000340BC();
    }

    id v5 = 0LL;
  }

  _Block_object_dispose(&v17, 8);

  return v5;
}

@end