int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  char is_darwinos;
  dispatch_queue_global_t global_queue;
  dispatch_queue_s *v7;
  dispatch_source_t v8;
  void *v9;
  dispatch_source_t v10;
  void *v11;
  void handler[4];
  char v14;
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)&off_100008A40;

  if (qword_10000C110 != -1) {
    dispatch_once(&qword_10000C110, &__block_literal_global_64);
  }
  CacheDeleteRegisterInfoCallbacks( @"com.apple.cache_delete_orphan_dir_handler",  &__block_literal_global_68,  &__block_literal_global_72,  0LL,  0LL);
  is_darwinos = os_variant_is_darwinos("com.apple.deleted_helper");
  xpc_activity_register("com.apple.deleted_helper.daily", XPC_ACTIVITY_CHECK_IN, &__block_literal_global);
  global_queue = dispatch_get_global_queue(17LL, 0LL);
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __main_block_invoke_33;
  handler[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v14 = is_darwinos;
  xpc_set_event_stream_handler("com.apple.dispatch.vfs", v7, handler);

  if ((is_darwinos & 1) == 0) {
    CacheDeleteRegisterInfoCallbacks( @"com.apple.deleted_helper",  &__block_literal_global_51,  &__block_literal_global_53,  0LL,  &__block_literal_global_59);
  }
  signal(15, (void (__cdecl *)(int))1);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, 0LL);
  v9 = (void *)qword_10000C0F8;
  qword_10000C0F8 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C0F8, &__block_literal_global_61);
  dispatch_resume((dispatch_object_t)qword_10000C0F8);
  signal(3, (void (__cdecl *)(int))1);
  v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0LL, 0LL);
  v11 = (void *)qword_10000C0F0;
  qword_10000C0F0 = (uint64_t)v10;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C0F0, &__block_literal_global_63);
  dispatch_resume((dispatch_object_t)qword_10000C0F0);
  objc_autoreleasePoolPop(v3);
  dispatch_main();
}

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  uint64_t v3 = CDGetLogHandle("client");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = 758;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.deleted_helper.daily xpc activity handler ENTRY",  (uint8_t *)&v11,  8u);
  }

  v5 = (void *)os_transaction_create("com.apple.deleted_helper.daily");
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  if (state == 2)
  {
    uint64_t v7 = CDGetLogHandle("client");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      int v12 = 763;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.deleted_helper.daily xpc activity handler calling purge_orphans(kCacheDeleteUrgencyLow)",  (uint8_t *)&v11,  8u);
    }

    purge_orphans(1, 1);
  }

  uint64_t v9 = CDGetLogHandle("client");
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = 766;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.deleted_helper.daily xpc activity handler EXIT",  (uint8_t *)&v11,  8u);
  }
}

uint64_t purge_orphans(signed int a1, char a2)
{
  uint64_t RootVolume = getRootVolume();
  v5 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[CacheDeleteVolume volumeWithMountpoint:]( &OBJC_CLASS___CacheDeleteVolume,  "volumeWithMountpoint:",  v5));

  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v7 = CDGetLogHandle("client");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 mountPoint]);
    id v10 = [v6 freespace];
    *(_DWORD *)buf = 67109890;
    int v28 = 626;
    __int16 v29 = 1024;
    signed int v30 = a1;
    __int16 v31 = 2112;
    v32 = v9;
    __int16 v33 = 2048;
    id v34 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%d purge_orphans ENTRY urgency: %d : %@ freespace: %llu",  buf,  0x22u);
  }

  do
    unsigned __int8 v11 = __ldaxr(purge_orphans_f);
  while (__stlxr(1u, purge_orphans_f));
  if ((v11 & 1) == 0)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __purge_orphans_block_invoke;
    v20[3] = &unk_100008570;
    signed int v21 = a1;
    char v22 = a2;
    v20[4] = &v23;
    iterate_orphans(a1, 0, v20);
    if (os_variant_is_darwinos("com.apple.deleted_helper"))
    {
      uint64_t v12 = CDGetLogHandle("client");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v28 = 640;
        __int16 v29 = 1024;
        signed int v30 = a1;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%d purge_orphans urgency: %d, clearing /tmp/",  buf,  0xEu);
      }

      nuke_dir("/tmp/", 1LL);
    }

    atomic_store(0, purge_orphans_f);
  }

  uint64_t v14 = CDGetLogHandle("client");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 mountPoint]);
    id v17 = [v6 freespace];
    *(_DWORD *)buf = 67109890;
    int v28 = 645;
    __int16 v29 = 1024;
    signed int v30 = a1;
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2048;
    id v34 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%d purge_orphans EXIT urgency: %d : %@ freespace: %llu",  buf,  0x22u);
  }

  uint64_t v18 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v18;
}

void sub_100003A20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __main_block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(_BYTE *)(a1 + 32))
  {
    uint64_t v4 = CDGetLogHandle("client");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v15 = 773;
      __int16 v16 = 2048;
      id v17 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.dispatch.vfs xpc stream handler ENTRY, event: %p",  buf,  0x12u);
    }

    xpc_dictionary_apply(v3, &__block_literal_global_36);
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472LL;
    activity_block[2] = __main_block_invoke_38;
    activity_block[3] = &unk_100008378;
    id v11 = (id)os_transaction_create("com.apple.deleted_helper.low_disk_event");
    id v6 = v3;
    id v12 = v6;
    char v13 = *(_BYTE *)(a1 + 32);
    id v7 = v11;
    _os_activity_initiate( (void *)&_mh_execute_header,  "com.apple.deleted_helper.handle_vfs_xpc",  OS_ACTIVITY_FLAG_DEFAULT,  activity_block);

    uint64_t v8 = CDGetLogHandle("client");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v15 = 819;
      __int16 v16 = 2048;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.dispatch.vfs xpc stream handler EXIT, event: %p",  buf,  0x12u);
    }
  }
}

BOOL __main_block_invoke_34(id a1, const char *a2, OS_xpc_object *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = CDGetLogHandle("client");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\tkey: %s, value: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void __main_block_invoke_38(uint64_t a1)
{
  uint64_t v1 = lowSpaceVolumes();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t RootVolume = getRootVolume();
  signed int v30 = (void *)objc_claimAutoreleasedReturnValue(RootVolume);
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)i);
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int16 v10 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKeyedSubscript:v9]);
        id v11 = [v10 countByEnumeratingWithState:&v32 objects:v48 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (j = 0LL; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
              -[NSMutableSet addObject:](v3, "addObject:", v15);
            }

            id v12 = [v10 countByEnumeratingWithState:&v32 objects:v48 count:16];
          }

          while (v12);
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v36 objects:v49 count:16];
    }

    while (v6);
  }

  unsigned int v16 = -[NSMutableSet containsObject:](v3, "containsObject:", v30);
  uint64_t v17 = CDGetLogHandle("client");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v19)
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      *(void *)v45 = v28;
      *(_WORD *)&v45[8] = 2112;
      *(void *)&v45[10] = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Skipping low disk event %p for %@",  buf,  0x16u);
    }

    goto LABEL_27;
  }

  if (v19)
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48)) {
      signed int v21 = "YES";
    }
    else {
      signed int v21 = "NO";
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v45 = 800;
    *(_WORD *)&v45[4] = 2048;
    *(void *)&v45[6] = v20;
    *(_WORD *)&v45[14] = 2080;
    *(void *)&v45[16] = v21;
    __int16 v46 = 1024;
    int v47 = 4;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%d com.apple.dispatch.vfs xpc stream handler calling purge_orphans event: %p, darwin: %s, urgency: %d",  buf,  0x22u);
  }

  purge_orphans(4, 1);
  if (*(_BYTE *)(a1 + 48))
  {
    v42 = @"CACHE_DELETE_VOLUME";
    v43 = v30;
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
    char v22 = fsPurgeable(v18, 4);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
    uint64_t v25 = (void *)v24;
    if (v24)
    {
      v40[0] = @"CACHE_DELETE_VOLUME";
      v40[1] = @"CACHE_DELETE_AMOUNT";
      v41[0] = v30;
      v41[1] = v24;
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  2LL));
      id v27 = fsPurge(v26, 4LL);
    }

LABEL_27:
  }
}

NSMutableDictionary *fsPurgeable(void *a1, int32_t a2)
{
  id v3 = a1;
  uint64_t v109 = 0LL;
  memset(v108, 0, sizeof(v108));
  memset(v107, 0, sizeof(v107));
  v104 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v5 = evaluateStringProperty();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = mapVolume(v6, 0LL);
  int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    uint64_t v17 = CDGetLogHandle("client");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "No volume specified, returning NULL dictionary",  (uint8_t *)&buf,  2u);
    }

    v103 = 0LL;
    goto LABEL_44;
  }

  else {
    int32_t v9 = 3;
  }
  uint64_t v10 = dword_100006E90[v9 - 1];
  *(void *)&v107[0] = 12LL;
  *((void *)&v107[0] + 1) = v10;
  uint64_t v11 = CDGetLogHandle("client");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 67109376;
    buf.int32_t f_iosize = v9;
    LOWORD(buf.f_blocks) = 2048;
    *(uint64_t *)((char *)&buf.f_blocks + 2) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Reguesting fsPurgeable for urgency %d with APFS_PURGEABLE urgency %0llx",  (uint8_t *)&buf,  0x12u);
  }

  uint64_t v13 = (void *)os_transaction_create("com.apple.deleted_helper.fsPurgeable");
  id v14 = v8;
  if (fsctl((const char *)[v14 UTF8String], 0xC0E84A70uLL, v107, 0))
  {
    if (*__error() != 45)
    {
      uint64_t v41 = CDGetLogHandle("client");
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        v51 = __error();
        v52 = strerror(*v51);
        buf.f_bsize = 136315138;
        *(void *)&buf.int32_t f_iosize = v52;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "APFSIOC_PURGEABLE_GET_DETAILED_STATS: %s",  (uint8_t *)&buf,  0xCu);
      }

LABEL_31:
      v103 = 0LL;
      goto LABEL_42;
    }

    *(void *)&v107[0] = 4LL;
    if (fsctl((const char *)[v14 UTF8String], 0xC0E84A70uLL, v107, 0))
    {
      uint64_t v15 = CDGetLogHandle("client");
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      goto LABEL_31;
    }
  }

  v95 = v13;
  v96 = v8;
  id v97 = v3;
  v103 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v19 = 0LL;
  uint64_t v20 = (uint64_t *)v108;
  do
  {
    signed int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19));
    uint64_t v22 = serviceForFSPurgeableType();
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *v20));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v104, "setObject:forKeyedSubscript:", v24, v23);

      if (!v19)
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *v20));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v103,  "setObject:forKeyedSubscript:",  v25,  @"CACHE_DELETE_AMOUNT");
      }

      uint64_t v26 = CDGetLogHandle("client");
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *v20;
        uint64_t v29 = *(v20 - 13);
        buf.f_bsize = 67109890;
        buf.int32_t f_iosize = v19;
        LOWORD(buf.f_blocks) = 2114;
        *(uint64_t *)((char *)&buf.f_blocks + 2) = (uint64_t)v23;
        WORD1(buf.f_bfree) = 2048;
        *(uint64_t *)((char *)&buf.f_bfree + 4) = v28;
        WORD2(buf.f_bavail) = 2048;
        *(uint64_t *)((char *)&buf.f_bavail + 6) = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[%d] fsPurgeable type: %{public}@, count: %lld bytes for %lld files",  (uint8_t *)&buf,  0x26u);
      }
    }

    ++v19;
    ++v20;
  }

  while (v19 != 13);
  id v30 = v14;
  __int16 v31 = (const char *)[v30 UTF8String];
  memset(&buf, 0, 36);
  *(_OWORD *)v121 = xmmword_100006EA0;
  *(void *)&__int128 v122 = 0LL;
  int v32 = open(v31, 0x100000);
  if (v32 == -1) {
    goto LABEL_41;
  }
  int v33 = v32;
  if (fgetattrlist(v32, v121, &buf, 0x24uLL, 0) < 0) {
    goto LABEL_41;
  }
  int f_bfree_high = HIDWORD(buf.f_bfree);
  int32_t f_iosize = buf.f_iosize;
  close(v33);
  if ((f_bfree_high & 0x4000000) == 0 || (f_iosize & 0x4000000) == 0) {
    goto LABEL_41;
  }
  __int128 v36 = &CDGetLogHandle_ptr;
  __int128 v37 = (const char *)[v30 UTF8String];
  uint64_t v114 = 0x1D4C000000000LL;
  bzero(&buf, 0x878uLL);
  if (statfs(v37, &buf))
  {
    uint64_t v38 = CDGetLogHandle("client");
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
    {
LABEL_29:

      uint64_t v40 = 0LL;
      goto LABEL_40;
    }

    *(_DWORD *)v121 = 67109120;
    *(_DWORD *)&v121[4] = 0;
    v54 = "statfs returned %d";
    v55 = (os_log_s *)v39;
    uint32_t v56 = 8;
LABEL_99:
    _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, v54, v121, v56);
    goto LABEL_29;
  }

  v42 = (char *)malloc(0x1D4C0uLL);
  if (!v42)
  {
    uint64_t v53 = CDGetLogHandle("client");
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue(v53);
    if (!os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)v121 = 134217984;
    *(void *)&v121[4] = 120000LL;
    v54 = "can't malloc %llu bytes";
    v55 = (os_log_s *)v39;
    uint32_t v56 = 12;
    goto LABEL_99;
  }

  v43 = v42;
  uint64_t v110 = 0x100000001LL;
  v115 = v42;
  uint64_t v111 = 0LL;
  id v112 = 0LL;
  __int128 v113 = xmmword_100006E80;
  int v44 = fsctl(buf.f_mntonname, 0xC0384A74uLL, &v110, 0);
  if (v44)
  {
    int v45 = v44;
    uint64_t v40 = 0LL;
    goto LABEL_36;
  }

  id v105 = 0LL;
  v93 = v37;
  uint64_t v40 = 0LL;
  uint64_t v57 = 0LL;
  uint64_t v58 = 0LL;
  int v59 = 1;
  do
  {
    unint64_t v60 = HIDWORD(v114);
    if (HIDWORD(v114)) {
      BOOL v61 = 1;
    }
    else {
      BOOL v61 = v57 == 0;
    }
    if (!v61)
    {
      if ((v59 & 1) != 0) {
        uint64_t v89 = v58;
      }
      else {
        uint64_t v89 = 0LL;
      }
      v40 += v89;
      int v8 = v96;
      id v3 = v97;
      goto LABEL_39;
    }

    if (HIDWORD(v114) < 0x18)
    {
      int v8 = v96;
      id v3 = v97;
      if (!HIDWORD(v114))
      {
        uint64_t v90 = CDGetLogHandle("client");
        v91 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v121 = 136315138;
          *(void *)&v121[4] = v93;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEBUG,  "processCloneMapOnVol buffSize 0 : No clones in volume %s",  v121,  0xCu);
        }
      }

      goto LABEL_39;
    }

    if (HIDWORD(v114) != 24)
    {
      uint64_t v63 = 0LL;
      v98 = v115;
      int v64 = 24;
      unint64_t v94 = HIDWORD(v114);
      while (1)
      {
        v65 = (uint64_t *)&v98[v63];
        if ((v59 & 1) != 0) {
          uint64_t v66 = v58;
        }
        else {
          uint64_t v66 = 0LL;
        }
        uint64_t v67 = v66 + v40;
        uint64_t v62 = *v65;
        uint64_t v58 = v65[1];
        if (*v65 == v57) {
          int v68 = v59;
        }
        else {
          int v68 = 1;
        }
        if (*v65 == v57) {
          uint64_t v67 = v40;
        }
        if (v57)
        {
          int v59 = v68;
          uint64_t v40 = v67;
        }

        uint64_t v106 = v65[2];
        if (v106) {
          break;
        }
LABEL_95:
        uint64_t v63 = (v64 + 32 * v106);
        int v64 = v63 + 24;
        uint64_t v57 = v62;
        if (v63 + 24 >= v60) {
          goto LABEL_96;
        }
      }

      int v99 = v64;
      uint64_t v100 = *v65;
      uint64_t v101 = v65[1];
      uint64_t v102 = v40;
      uint64_t v69 = 0LL;
      while (1)
      {
        v70 = &v65[4 * v69];
        id v105 = (id)v70[3];
        uint64_t v72 = v70[5];
        uint64_t v71 = v70[6];
        if (v72) {
          break;
        }
        int v78 = v71 & 1;
LABEL_83:
        v59 &= v78;
        if (++v69 == v106)
        {
          uint64_t v58 = v101;
          uint64_t v40 = v102;
          unint64_t v60 = v94;
          int v64 = v99;
          uint64_t v62 = v100;
          goto LABEL_95;
        }
      }

      v73 = (void *)objc_claimAutoreleasedReturnValue([v36[7] numberWithUnsignedLongLong:v70[5]]);
      if (qword_10000C120 != -1) {
        dispatch_once(&qword_10000C120, &__block_literal_global_81);
      }
      v74 = (void *)qword_10000C118;
      v75 = (void *)objc_claimAutoreleasedReturnValue([v36[7] numberWithUnsignedLongLong:v72]);
      v76 = (void *)objc_claimAutoreleasedReturnValue([v74 objectForKey:v75]);

      if (v76)
      {
        unsigned int v77 = [v76 BOOLValue];
      }

      else
      {
        __int128 v136 = 0u;
        __int128 v137 = 0u;
        __int128 v134 = 0u;
        __int128 v135 = 0u;
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        __int128 v130 = 0u;
        __int128 v131 = 0u;
        __int128 v128 = 0u;
        __int128 v129 = 0u;
        __int128 v126 = 0u;
        __int128 v127 = 0u;
        __int128 v124 = 0u;
        __int128 v125 = 0u;
        __int128 v122 = 0u;
        __int128 v123 = 0u;
        *(void *)v121 = 1LL;
        *(void *)&v121[8] = 33LL;
        *(void *)&__int128 v123 = v72;
        if (!fsctl(buf.f_mntonname, 0xC1104A71uLL, v121, 0))
        {
          while (1)
          {
            unint64_t v82 = *(void *)&v121[8];
            if ((v121[8] & 8) != 0) {
              break;
            }
            uint64_t v79 = *((void *)&v123 + 1);
            if (!*((void *)&v123 + 1))
            {
              uint64_t v83 = CDGetLogHandle("client");
              v84 = (os_log_s *)objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v117 = 134217984;
                uint64_t v118 = v72;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v84,  OS_LOG_TYPE_DEBUG,  "Finished checking dirstat key %llu",  v117,  0xCu);
              }

              break;
            }

            __int128 v136 = 0u;
            __int128 v137 = 0u;
            __int128 v134 = 0u;
            __int128 v135 = 0u;
            __int128 v132 = 0u;
            __int128 v133 = 0u;
            __int128 v130 = 0u;
            __int128 v131 = 0u;
            __int128 v128 = 0u;
            __int128 v129 = 0u;
            __int128 v126 = 0u;
            __int128 v127 = 0u;
            __int128 v124 = 0u;
            __int128 v125 = 0u;
            __int128 v122 = 0u;
            __int128 v123 = 0u;
            *(void *)v121 = 1LL;
            *(void *)&v121[8] = 33LL;
            *(void *)&__int128 v123 = v79;
            if (fsctl(buf.f_mntonname, 0xC1104A71uLL, v121, 0)) {
              goto LABEL_78;
            }
          }

          uint64_t v85 = (v82 >> 3) & 1;
          __int128 v36 = &CDGetLogHandle_ptr;
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v85));
          if (v86) {
            [(id)qword_10000C118 setObject:v86 forKey:v73];
          }
          unsigned int v77 = [v86 BOOLValue];

          goto LABEL_82;
        }

        uint64_t v79 = v72;
LABEL_78:
        uint64_t v80 = CDGetLogHandle("client");
        v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          int v87 = *__error();
          *(_DWORD *)v117 = 134218240;
          uint64_t v118 = v79;
          __int16 v119 = 1024;
          int v120 = v87;
          _os_log_error_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_ERROR,  "APFSIOC_DIR_STATS_OP for %llu returned errno %u",  v117,  0x12u);
        }

        unsigned int v77 = 0;
      }

      __int128 v36 = &CDGetLogHandle_ptr;
LABEL_82:

      int v78 = v77 | v71;
      goto LABEL_83;
    }

    uint64_t v62 = v57;
LABEL_96:
    uint64_t v111 = v62;
    id v112 = v105;
    HIDWORD(v114) = 120000;
    int v88 = fsctl(buf.f_mntonname, 0xC0384A74uLL, &v110, 0);
    uint64_t v57 = v62;
  }

  while (!v88);
  int v45 = v88;
  int v8 = v96;
  id v3 = v97;
LABEL_36:
  uint64_t v46 = CDGetLogHandle("client");
  int v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    int v92 = *__error();
    *(_DWORD *)v121 = 67109632;
    *(_DWORD *)&v121[4] = v45;
    *(_WORD *)&v121[8] = 1024;
    *(_DWORD *)&v121[10] = v92;
    *(_WORD *)&v121[14] = 1024;
    LODWORD(v122) = HIDWORD(v114);
    _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "err %d, errno %d, buffer_size %u",  v121,  0x14u);
  }

LABEL_39:
  free(v43);
LABEL_40:
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v40));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v104,  "setObject:forKeyedSubscript:",  v48,  @"CACHE_DELETE_PURGEABLE_CLONES");

LABEL_41:
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v103,  "setObject:forKeyedSubscript:",  v104,  @"CACHE_DELETE_ITEMIZED_PURGEABLE");
  uint64_t v13 = v95;
LABEL_42:

  uint64_t v49 = CDGetLogHandle("client");
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 138543362;
    *(void *)&buf.int32_t f_iosize = v103;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "fsPurgeable: %{public}@",  (uint8_t *)&buf,  0xCu);
  }
        }

        unint64_t v82 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v96,  v106,  16LL);
      }

      while (v82);
      uint64_t v15 = v93;
    }

    else
    {
      v51 = [v12 freespace];
      v52 = [v15 unsignedLongLongValue];
      uint64_t v53 = 0;
      uint64_t v83 = a2;
      LODWORD(v100) = dword_100006EB8[(int)a2 + 4] | 0x11;
      do
      {
        *((void *)&v101 + 1) = v52;
        uint64_t v20 = fsctl((const char *)[v11 UTF8String], 0xC0204A45uLL, &v100, 0);
        if (v20) {
          break;
        }
        v54 = [v12 freespace];
        ++v53;
      }

      while ((shouldRetryPurge( (unint64_t)v51,  (unint64_t)v54,  (unint64_t)v52,  *((unint64_t *)&v101 + 1),  v53) & 1) != 0);
      v55 = [v12 freespace];
      uint32_t v56 = v55;
      uint64_t v57 = v55 - v51;
      if (v55 == (_BYTE *)-1LL || v55 <= v51) {
        uint64_t v57 = 0LL;
      }
      if (v53 >= 2) {
        int v59 = v57;
      }
      else {
        int v59 = *((void *)&v101 + 1);
      }
      uint64_t v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v59));
      unint64_t v60 = CDGetLogHandle("client");
      BOOL v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v62 = [v19 unsignedLongLongValue];
        *(_DWORD *)statfs buf = 134218496;
        *(void *)v103 = v62;
        *(_WORD *)&v103[8] = 2048;
        *(void *)&v103[10] = v56;
        *(_WORD *)&v103[18] = 2048;
        *(void *)&v103[20] = v51;
        _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "fsPurge: amountPurged %llu postPurgeFreespace %llu prePurgeFreespace %llu",  buf,  0x20u);
      }

      uint64_t v18 = v61;
    }

LABEL_44:
  return v103;
}

id fsPurge(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = CDGetLogHandle("client");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 67109378;
    *(_DWORD *)v103 = a2;
    *(_WORD *)&v103[4] = 2112;
    *(void *)&v103[6] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "fsPurge: urgency %d, info: %@", buf, 0x12u);
  }

  __int128 v100 = 0u;
  __int128 v101 = 0u;
  id v6 = [v3 mutableCopy];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  uint64_t v8 = evaluateStringProperty();
  int32_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = mapVolume(v9, 0LL);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CacheDeleteVolume volumeWithPath:](&OBJC_CLASS___CacheDeleteVolume, "volumeWithPath:", v11));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  uint64_t v14 = evaluateNumberProperty();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"CACHE_DELETE_SERVICES"]);
  v95 = (void *)v16;
  if (v11 && v15)
  {
    uint64_t v17 = (void *)v16;
    __int128 v100 = 0u;
    __int128 v101 = 0u;
    int v88 = (void *)os_transaction_create("com.apple.deleted_helper.fsPurge");
    if ([v17 count])
    {
      __int128 v98 = 0u;
      __int128 v99 = 0u;
      __int128 v96 = 0u;
      __int128 v97 = 0u;
      uint64_t v18 = v17;
      id v82 = -[os_log_s countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v96,  v106,  16LL);
      if (!v82)
      {
        int v64 = v15;

        uint64_t v63 = &off_100008958;
        goto LABEL_57;
      }

      v93 = v15;
      uint64_t v85 = *(void *)v97;
      uint64_t v83 = a2;
      uint64_t v84 = (int)a2 + 4LL;
      uint64_t v19 = &off_100008958;
      int v20 = -1;
      id v89 = v6;
      v81 = v18;
      do
      {
        for (i = 0LL; i != v82; i = (char *)i + 1)
        {
          if (*(void *)v97 != v85) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v96 + 1) + 8LL * (void)i);
          LODWORD(v100) = dword_100006EB8[v84] | 0x11;
          uint64_t v23 = fsPurgeableTypeForService(v22);
          v91 = (void *)objc_claimAutoreleasedReturnValue(v23);
          if (v91)
          {
            uint64_t v24 = v19;
            uint64_t v25 = CDGetLogHandle("client");
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v27 = [v91 unsignedIntValue];
              *(_DWORD *)statfs buf = 138412802;
              *(void *)v103 = v22;
              *(_WORD *)&v103[8] = 1024;
              *(_DWORD *)&v103[10] = v27;
              *(_WORD *)&v103[14] = 2112;
              *(void *)&v103[16] = v93;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "fsPurge: adding service %@ (%u), amount: %@",  buf,  0x1Cu);
            }

            LODWORD(v100) = v100 | 2;
            DWORD1(v100) = [v91 unsignedIntValue];
            uint64_t v28 = [v12 freespace];
            id v29 = [v93 unsignedLongLongValue];
            int v30 = 1;
            while (1)
            {
              *((void *)&v101 + 1) = v29;
              int v20 = fsctl( (const char *)[v11 UTF8String], 0xC0204A45uLL, &v100, 0);
              if (v20) {
                break;
              }
              id v31 = [v12 freespace];
              char v32 = shouldRetryPurge( (unint64_t)v28,  (unint64_t)v31,  (unint64_t)v29,  *((unint64_t *)&v101 + 1),  v30++);
              if ((v32 & 1) == 0)
              {
                id v86 = v3;
                int v33 = [v12 freespace];
                __int128 v34 = v33;
                if (v33 != (_BYTE *)-1LL && v33 > v28) {
                  int64_t v36 = v33 - v28;
                }
                else {
                  int64_t v36 = 0LL;
                }
                __int128 v37 = (char *)[v24 unsignedLongLongValue];
                int64_t v38 = *((void *)&v101 + 1);
                int64_t v80 = v36;
                if (v30 != 2) {
                  int64_t v38 = v36;
                }
                __int128 v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v37[v38]));

                uint64_t v40 = CDGetLogHandle("client");
                uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  id v42 = [v39 unsignedLongLongValue];
                  *(_DWORD *)statfs buf = 134218496;
                  *(void *)v103 = v42;
                  *(_WORD *)&v103[8] = 2048;
                  *(void *)&v103[10] = v34;
                  *(_WORD *)&v103[18] = 2048;
                  *(void *)&v103[20] = v28;
                  _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "fsPurge: amountPurged %llu postPurgeFreespace %llu prePurgeFreespace %llu",  buf,  0x20u);
                }

                id v43 = [v93 unsignedLongLongValue];
                if (v43 > [v39 unsignedLongLongValue])
                {
                  int v44 = (char *)[v93 unsignedLongLongValue];
                  int64_t v45 = *((void *)&v101 + 1);
                  if (v30 != 2) {
                    int64_t v45 = v80;
                  }
                  uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  &v44[-v45]));

                  int v20 = 0;
                  uint64_t v19 = (_UNKNOWN **)v39;
                  v93 = (void *)v46;
                  id v3 = v86;
                  id v6 = v89;
                  uint64_t v18 = v81;
                  goto LABEL_31;
                }

                uint64_t v19 = (_UNKNOWN **)v39;
                id v3 = v86;
                id v6 = v89;
LABEL_38:

                uint64_t v15 = v93;
                uint64_t v18 = v81;
                goto LABEL_53;
              }
            }

            id v6 = v89;
            goto LABEL_38;
          }

LABEL_53:
    if (!v20)
    {
      [v6 setObject:v19 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      uint64_t v49 = 0LL;
      LODWORD(a2) = v83;
LABEL_60:

      uint64_t v71 = CDGetLogHandle("client");
      uint64_t v72 = (os_log_s *)objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        id v92 = [v19 unsignedLongLongValue];
        unint64_t v94 = v15;
        int v73 = v100;
        v74 = v19;
        id v75 = [v11 UTF8String];
        id v87 = v3;
        v76 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
        uint64_t v77 = evaluateStringProperty();
        id v90 = v6;
        int v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        *(_DWORD *)statfs buf = 134219010;
        *(void *)v103 = v92;
        *(_WORD *)&v103[8] = 1024;
        *(_DWORD *)&v103[10] = a2;
        *(_WORD *)&v103[14] = 1024;
        *(_DWORD *)&v103[16] = v73;
        uint64_t v15 = v94;
        *(_WORD *)&v103[20] = 2082;
        *(void *)&v103[22] = v75;
        uint64_t v19 = v74;
        __int16 v104 = 2114;
        id v105 = v78;
        _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "fsPurge: %llu at urgency %d (flags: 0x%x) on %{public}s (%{public}@)",  buf,  0x2Cu);

        id v3 = v87;
        id v6 = v90;
      }

      id v50 = v6;
      goto LABEL_63;
    }

    uint64_t v63 = v19;
    int v64 = v15;
    a2 = v83;
LABEL_57:
    uint64_t v65 = v100;
    id v66 = [v11 UTF8String];
    uint64_t v67 = __error();
    int v68 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"APFSIOC_PURGE_FILES failed: %@ at urgency %d (0x%x) on %s : %s",  v63,  a2,  v65,  v66,  strerror(*v67));
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v68);
    uint64_t v69 = CDGetLogHandle("client");
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 138543362;
      *(void *)v103 = v49;
      _os_log_error_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    [v6 setObject:v49 forKeyedSubscript:@"CACHE_DELETE_ERROR"];
    [v6 setObject:&off_100008958 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v15 = v64;
    uint64_t v19 = v63;
    goto LABEL_60;
  }

  uint64_t v47 = CDGetLogHandle("client");
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)statfs buf = 138412290;
    *(void *)v103 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "Parameter error, incomplete info dict: %@",  buf,  0xCu);
  }

  uint64_t v49 = 0LL;
  id v50 = 0LL;
  uint64_t v19 = &off_100008958;
LABEL_63:

  return v50;
}

__CFDictionary *__cdecl __main_block_invoke_49(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v5 = fsPurgeable(a3, a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 mutableCopy];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  uint64_t v9 = evaluateNumberProperty();
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 unsignedLongLongValue];

  if (!v7) {
    id v7 = -[__CFDictionary mutableCopy](a3, "mutableCopy");
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v11));
  [v7 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  uint64_t v13 = (__CFDictionary *)[v7 copy];
  return v13;
}

__CFDictionary *__cdecl __main_block_invoke_2(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v4 = *(void *)&a2;
  if (qword_10000C108 != -1) {
    dispatch_once(&qword_10000C108, &__block_literal_global_54);
  }
  if (qword_10000C100)
  {
    if ((_DWORD)v4 == 4)
    {
      id v5 = objc_alloc_init((Class)qword_10000C100);
      unsigned int v6 = [v5 submit];
      uint64_t v7 = CDGetLogHandle("client");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = v8;
      if (v6)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)statfs buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Osanalytics logs submitted successfully.",  buf,  2u);
        }
      }

      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to submit osanalytics logs.",  v23,  2u);
      }

      goto LABEL_15;
    }

LABEL_11:
    purge_orphans(v4, 1);
    goto LABEL_15;
  }

  uint64_t v10 = CDGetLogHandle("client");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v22 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to get OSASubmissionClient NSClassFromString:OSASubmissionClient",  v22,  2u);
  }

  if ((_DWORD)v4 != 4) {
    goto LABEL_11;
  }
LABEL_15:
  id v12 = fsPurge(a3, v4);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = [v13 mutableCopy];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"]);
  uint64_t v16 = evaluateNumberProperty();
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v18 = [v17 unsignedLongLongValue];

  if (!v14) {
    id v14 = -[__CFDictionary copy](a3, "copy");
  }
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v18));
  [v14 setObject:v19 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  int v20 = (__CFDictionary *)[v14 copy];
  return v20;
}

void __main_block_invoke_3(id a1)
{
  qword_10000C100 = (uint64_t)NSClassFromString(@"OSASubmissionClient");
}

__CFDictionary *__cdecl __main_block_invoke_58(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v3 = CDGetLogHandle("client");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)statfs buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PERIODIC ENTRY", buf, 2u);
  }

  purge_orphans(3, 1);
  uint64_t v5 = CDGetLogHandle("client");
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)statfs buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "customerReleaseBuild IS NOT SEED BUILD",  buf,  2u);
  }

  int has_internal_diagnostics = os_variant_has_internal_diagnostics("com.apple.cache_delete");
  uint64_t v8 = CDGetLogHandle("client");
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (has_internal_diagnostics)
  {
    if (v10)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "customerReleaseBuild IS INTERNAL BUILD",  buf,  2u);
    }
  }

  else
  {
    if (v10)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "customerReleaseBuild IS NOT INTERNAL BUILD",  buf,  2u);
    }

    uint64_t v11 = CDGetLogHandle("client");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "unable to get address of MGGetBoolAnswer",  buf,  2u);
    }

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v13 = [&off_100008A68 countByEnumeratingWithState:&v21 objects:buf count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(&off_100008A68);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v18 = CDGetLogHandle("client");
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v25 = 138412290;
            uint64_t v26 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Customer build, clearing %@",  v25,  0xCu);
          }

          traverse_directory(v17, &__block_literal_global_97);
        }

        id v14 = [&off_100008A68 countByEnumeratingWithState:&v21 objects:buf count:16];
      }

      while (v14);
    }
  }

  return 0LL;
}

void __main_block_invoke_60(id a1)
{
  uint64_t v1 = CDGetLogHandle("client");
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "RECEIVED SIGTERM", v3, 2u);
  }

  exit(0);
}

void __main_block_invoke_2_62(id a1)
{
  uint64_t v1 = CDGetLogHandle("client");
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "RECEIVED SIGQUIT", v3, 2u);
  }

  exit(0);
}

void sub_100005F4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_3(uint64_t a1)
{
  do
    unsigned __int8 v1 = __ldaxr((unsigned __int8 *)&RegisterCacheDeleteOrphanDirHandlerService_orphan_dir_iteration_flag);
  while (__stlxr(1u, (unsigned __int8 *)&RegisterCacheDeleteOrphanDirHandlerService_orphan_dir_iteration_flag));
  if ((v1 & 1) == 0)
  {
    signed int v2 = *(_DWORD *)(a1 + 40);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_4;
    v3[3] = &unk_100008500;
    v3[4] = *(void *)(a1 + 32);
    signed int v4 = v2;
    iterate_orphans(v2, 1, v3);
    atomic_store(0, (unsigned __int8 *)&RegisterCacheDeleteOrphanDirHandlerService_orphan_dir_iteration_flag);
  }
}

void iterate_orphans(signed int a1, char a2, void *a3)
{
  uint64_t v5 = a3;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)_MergedGlobals;
  id v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v22;
    *(void *)&__int128 v7 = 138412290LL;
    __int128 v19 = v7;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)_MergedGlobals, "objectForKeyedSubscript:", v11, v19));
        uint64_t v13 = evaluateNumberProperty();
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        unsigned int v15 = [v14 intValue];

        else {
          char v16 = a2;
        }
        if ((v15 & 0xFFFFFFF7) == a1 || (v16 & 1) == 0)
        {
          uint64_t v17 = CDGetLogHandle("client");
          uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)statfs buf = v19;
            uint64_t v26 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "iterate_orphans calling block: %@",  buf,  0xCu);
          }

          v5[2](v5, [v11 UTF8String], (v15 >> 3) & 1);
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v8);
  }
}

void __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += size_dir(a2);
  uint64_t v4 = CDGetLogHandle("client");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    v8[0] = 67109890;
    v8[1] = 671;
    __int16 v9 = 1024;
    int v10 = v6;
    __int16 v11 = 2080;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%d purgeable orphans urgency: %d, path: %s size: %lld ",  (uint8_t *)v8,  0x22u);
  }
}

uint64_t __purge_orphans_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = CDGetLogHandle("client");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)(a1 + 40);
    v11[0] = 67109634;
    v11[1] = 629;
    __int16 v12 = 1024;
    int v13 = v8;
    __int16 v14 = 2080;
    uint64_t v15 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%d purge_orphans urgency: %d, clearing: %s",  (uint8_t *)v11,  0x18u);
  }

  if (*(_BYTE *)(a1 + 44)) {
    return nuke_dir(a2, a3);
  }
  uint64_t v10 = size_dir(a2);
  nuke_dir(a2, a3);
  uint64_t result = size_dir(a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += v10 - result;
  return result;
}

void __getPurgeableInfoByDirKey_block_invoke(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  100LL));
  signed int v2 = (void *)qword_10000C118;
  qword_10000C118 = v1;
}

uint64_t shouldRetryPurge( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  if (a2 >= a1) {
    unint64_t v5 = a2 - a1;
  }
  else {
    unint64_t v5 = 0LL;
  }
  if (v5 >= a3) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if (a5 <= 4 && (double)a4 * 0.3 > (double)v5)
  {
    uint64_t v9 = CDGetLogHandle("client");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218496;
      unint64_t v12 = v5;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      __int16 v15 = 2048;
      unint64_t v16 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "APFS freed much less than reported - suggesting a retry. Actually Freed (%llu), Requested (%llu), Reported (%llu).",  (uint8_t *)&v11,  0x20u);
    }

    return 1LL;
  }

  return result;
}

BOOL __periodic_block_invoke(id a1, const char *a2, $73E2D91FB0D0F26A7F30E74A8C023B7C *a3)
{
  if (a3->var0) {
    a3->var1 = 1;
  }
  else {
    unlink(a2);
  }
  return 1;
}

id objc_msgSend_volumeWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeWithPath:");
}