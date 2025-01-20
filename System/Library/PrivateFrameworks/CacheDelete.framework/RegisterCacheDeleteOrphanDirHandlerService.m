@interface RegisterCacheDeleteOrphanDirHandlerService
@end

@implementation RegisterCacheDeleteOrphanDirHandlerService

void __RegisterCacheDeleteOrphanDirHandlerService_block_invoke(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.cache_delete_orphan_dir_handler_queue", v4);
  v3 = (void *)RegisterCacheDeleteOrphanDirHandlerService_orphanDirQueue;
  RegisterCacheDeleteOrphanDirHandlerService_orphanDirQueue = (uint64_t)v2;
}

__CFDictionary *__cdecl __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_2(id a1, int a2, __CFDictionary *a3)
{
  v4 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  uint64_t RootVolume = getRootVolume();
  v7 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned int v8 = [v5 isEqualToString:v7];
  if (a2 == 4) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }

  if (v9)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_3;
    v17[3] = &unk_100008528;
    int v18 = 4;
    v17[4] = &v19;
    dispatch_sync((dispatch_queue_t)RegisterCacheDeleteOrphanDirHandlerService_orphanDirQueue, v17);
  }

  v27[0] = @"CACHE_DELETE_VOLUME";
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  v27[1] = @"CACHE_DELETE_AMOUNT";
  v28[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v20[3]));
  v28[1] = v11;
  v12 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));

  uint64_t v13 = CDGetLogHandle("client");
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v20[3];
    *(_DWORD *)buf = 136315394;
    v24 = "com.apple.cache_delete_orphan_dir_handler";
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, " %s returning purgeable %lld ", buf, 0x16u);
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

__CFDictionary *__cdecl __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_71(id a1, int a2, __CFDictionary *a3)
{
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  uint64_t RootVolume = getRootVolume();
  v7 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  unsigned int v8 = [v5 isEqualToString:v7];

  uint64_t v9 = 0LL;
  if (a2 == 4 && v8) {
    uint64_t v9 = purge_orphans(4, 0);
  }
  v14[0] = @"CACHE_DELETE_VOLUME";
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
  v14[1] = @"CACHE_DELETE_AMOUNT";
  v15[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v9));
  v15[1] = v11;
  v12 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  return v12;
}

@end