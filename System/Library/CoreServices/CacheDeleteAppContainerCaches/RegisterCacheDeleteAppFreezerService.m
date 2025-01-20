@interface RegisterCacheDeleteAppFreezerService
@end

@implementation RegisterCacheDeleteAppFreezerService

void __RegisterCacheDeleteAppFreezerService_block_invoke(id a1)
{
  dispatch_queue_attr_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v1);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobile.cache_delete_app_freezer_queue", v2);
  v4 = (void *)qword_1000108C0;
  qword_1000108C0 = (uint64_t)v3;

  dispatch_async((dispatch_queue_t)qword_1000108C0, &__block_literal_global_2);
}

void __RegisterCacheDeleteAppFreezerService_block_invoke_2(id a1)
{
}

__CFDictionary *__cdecl __RegisterCacheDeleteAppFreezerService_block_invoke_4(id a1, int a2, __CFDictionary *a3)
{
  v4 = a3;
  v5 = v4;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = &off_10000CE58;
  if (a2 >= 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
    unsigned int v7 = [v6 isEqualToString:@"/private/var"];

    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = __RegisterCacheDeleteAppFreezerService_block_invoke_14;
      v11[3] = &unk_10000C410;
      v11[4] = &v12;
      dispatch_sync((dispatch_queue_t)qword_1000108C0, v11);
    }
  }

  v18[0] = @"CACHE_DELETE_VOLUME";
  v18[1] = @"CACHE_DELETE_AMOUNT";
  uint64_t v8 = v13[5];
  v19[0] = @"/private/var";
  v19[1] = v8;
  v9 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  2LL));
  _Block_object_dispose(&v12, 8);

  return v9;
}

__CFDictionary *__cdecl __RegisterCacheDeleteAppFreezerService_block_invoke_2_18(id a1, int a2, __CFDictionary *a3)
{
  v4 = a3;
  v5 = v4;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  if (a2 >= 4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v4,  "objectForKeyedSubscript:",  @"CACHE_DELETE_VOLUME"));
    unsigned int v7 = [v6 isEqualToString:@"/private/var"];

    if (v7)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = __RegisterCacheDeleteAppFreezerService_block_invoke_3_20;
      v12[3] = &unk_10000C410;
      v12[4] = &v13;
      dispatch_sync((dispatch_queue_t)qword_1000108C0, v12);
    }
  }

  v17[0] = @"CACHE_DELETE_VOLUME";
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:"));
  v18[0] = v8;
  v17[1] = @"CACHE_DELETE_AMOUNT";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14[3]));
  v18[1] = v9;
  v10 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));

  _Block_object_dispose(&v13, 8);
  return v10;
}

__CFDictionary *__cdecl __RegisterCacheDeleteAppFreezerService_block_invoke_4_21(id a1, int a2, __CFDictionary *a3)
{
  return 0LL;
}

@end