@interface NEProcessInfo
+ (BOOL)is64bitCapable;
+ (id)copyDNSUUIDs;
+ (id)copyNEHelperUUIDs;
+ (id)copyUUIDsForBundleID:(id)a3 uid:(unsigned int)a4;
+ (id)copyUUIDsForExecutable:(id)a3;
+ (id)copyUUIDsForExecutableWithoutCache:(id)a3;
+ (id)copyUUIDsForPID:(int)a3;
+ (id)copyUUIDsFromExecutable:(uint64_t)a1;
+ (uint64_t)copyUUIDForSingleArch:(uint64_t)a1;
+ (void)clearUUIDCache;
+ (void)initGlobals;
- (NEProcessInfo)init;
@end

@implementation NEProcessInfo

- (NEProcessInfo)init
{
}

+ (id)copyUUIDsForBundleID:(id)a3 uid:(unsigned int)a4
{
  v4 = (objc_class *)MEMORY[0x189603FA8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v5 UTF8String];
  uint64_t v7 = NEHelperCacheCopyAppUUIDMappingForUIDExtended();
  v8 = (void *)v7;
  if (v7 && MEMORY[0x1895ADD58](v7) == MEMORY[0x1895F9220])
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke;
    applier[3] = &unk_18A08E400;
    id v11 = v6;
    xpc_array_apply(v8, applier);
  }

  return v6;
}

+ (id)copyUUIDsForExecutableWithoutCache:(id)a3
{
  id v3 = a3;
  +[NEProcessInfo initGlobals]();
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v5 = (dispatch_queue_s *)g_queue;
    uint64_t v9 = MEMORY[0x1895F87A8];
    uint64_t v10 = 3221225472LL;
    id v11 = __52__NEProcessInfo_copyUUIDsForExecutableWithoutCache___block_invoke;
    v12 = &unk_18A08F098;
    id v13 = v3;
    id v6 = v4;
    id v14 = v6;
    dispatch_sync(v5, &v9);
    if (objc_msgSend(v6, "count", v9, v10, v11, v12)) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)copyUUIDsForExecutable:(id)a3
{
  id v3 = a3;
  +[NEProcessInfo initGlobals]();
  id v4 = 0LL;
  if (v3 && g_executableUUIDMapping)
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
    id v6 = (dispatch_queue_s *)g_queue;
    uint64_t v9 = MEMORY[0x1895F87A8];
    uint64_t v10 = 3221225472LL;
    id v11 = __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke;
    v12 = &unk_18A08F098;
    id v13 = v3;
    id v7 = v5;
    id v14 = v7;
    dispatch_sync(v6, &v9);
    if (objc_msgSend(v7, "count", v9, v10, v11, v12)) {
      id v4 = v7;
    }
    else {
      id v4 = 0LL;
    }
  }

  return v4;
}

+ (void)clearUUIDCache
{
}

+ (id)copyDNSUUIDs
{
  id v2 = +[NEProcessInfo copyUUIDsForExecutable:]( &OBJC_CLASS___NEProcessInfo,  "copyUUIDsForExecutable:",  @"/usr/sbin/mDNSResponder");
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v3 addObjectsFromArray:v2];
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

+ (id)copyNEHelperUUIDs
{
  id v2 = +[NEProcessInfo copyUUIDsForExecutable:]( &OBJC_CLASS___NEProcessInfo,  "copyUUIDsForExecutable:",  @"/usr/libexec/nehelper");
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v3 addObjectsFromArray:v2];
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

+ (BOOL)is64bitCapable
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v7 = 0;
  size_t v6 = 4LL;
  if (sysctlbyname("hw.cpu64bit_capable", &v7, &v6, 0LL, 0LL))
  {
    ne_log_obj();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v4 = __error();
      id v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_1876B1000, v2, OS_LOG_TYPE_ERROR, "Failed to get 64 bit capability: %s", buf, 0xCu);
    }
  }

  return v7 != 0;
}

+ (id)copyUUIDsForPID:(int)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  bzero(buffer, 0x400uLL);
  if (proc_pidpath(a3, buffer, 0x400u) < 0) {
    return 0LL;
  }
  [NSString stringWithUTF8String:buffer];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = +[NEProcessInfo copyUUIDsForExecutable:](&OBJC_CLASS___NEProcessInfo, "copyUUIDsForExecutable:", v4);

  return v5;
}

+ (void)initGlobals
{
  if (initGlobals_mapping_init[0] != -1) {
    dispatch_once(initGlobals_mapping_init, &__block_literal_global_13983);
  }
}

uint64_t __31__NEProcessInfo_clearUUIDCache__block_invoke()
{
  return [(id)g_executableUUIDMapping removeAllObjects];
}

void __28__NEProcessInfo_initGlobals__block_invoke()
{
  v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("NEProcessInfo queue", v0);
  id v2 = (void *)g_queue;
  g_queue = (uint64_t)v1;

  uint64_t v3 = [objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:0];
  id v4 = (void *)g_executableUUIDMapping;
  g_executableUUIDMapping = v3;
}

void __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObjectsFromArray:v5];

    ne_log_obj();
    size_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = 136315650;
      id v11 = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v2;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_debug_impl(&dword_1876B1000, v6, OS_LOG_TYPE_DEBUG, "%s: cached %@ UUID %@", (uint8_t *)&v10, 0x20u);
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)+[NEProcessInfo copyUUIDsFromExecutable:]( (uint64_t)NEProcessInfo,  (const char *)[v2 UTF8String]);
    if (v8)
    {
      size_t v6 = v8;
      [(id)g_executableUUIDMapping setObject:v8 forKeyedSubscript:v2];
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }

    else
    {
      ne_log_obj();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        id v11 = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v2;
        _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%s: failed to get UUIDs for %@",  (uint8_t *)&v10,  0x16u);
      }

      size_t v6 = 0LL;
    }
  }
}

+ (id)copyUUIDsFromExecutable:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (!a2) {
    return 0LL;
  }
  int v3 = open(a2, 0);
  if (v3 < 0)
  {
    ne_log_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = __error();
      v27 = strerror(*v26);
      host_info_out[0] = 136315650;
      *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      LOWORD(host_info_out[3]) = 2080;
      *(void *)((char *)&host_info_out[3] + 2) = a2;
      HIWORD(host_info_out[5]) = 2080;
      *(void *)&host_info_out[6] = v27;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "%s: cannot open %s: %s",  (uint8_t *)host_info_out,  0x20u);
    }

    return 0LL;
  }

  int v4 = v3;
  if (read(v3, &v40, 4uLL) != 4)
  {
    ne_log_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v28 = __error();
      v29 = strerror(*v28);
      host_info_out[0] = 136315650;
      *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      LOWORD(host_info_out[3]) = 2080;
      *(void *)((char *)&host_info_out[3] + 2) = a2;
      HIWORD(host_info_out[5]) = 2080;
      *(void *)&host_info_out[6] = v29;
      _os_log_error_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_ERROR,  "%s: cannot read magic for %s: %s",  (uint8_t *)host_info_out,  0x20u);
    }

    goto LABEL_14;
  }

  lseek(v4, 0LL, 0);
  if ((v40 + 17958194) < 2)
  {
    uint64_t v5 = +[NEProcessInfo copyUUIDForSingleArch:]((uint64_t)&OBJC_CLASS___NEProcessInfo, v4);
    size_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v46 = v5;
      [MEMORY[0x189603F18] arrayWithObjects:&v46 count:1];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      ne_log_obj();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        host_info_out[0] = 136315138;
        *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
        _os_log_error_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_ERROR,  "%s: failed to get UUID for Single Arch",  (uint8_t *)host_info_out,  0xCu);
      }

      id v7 = 0LL;
    }

    goto LABEL_23;
  }

  id v7 = 0LL;
  if (v40 != -1095041334) {
    goto LABEL_23;
  }
  uint64_t v10 = objc_opt_self();
  __int128 v52 = 0u;
  memset(host_info_out, 0, sizeof(host_info_out));
  mach_msg_type_number_t host_info_outCnt = 12;
  host_t v11 = MEMORY[0x1895AC984](v10);
  if (host_info(v11, 1, host_info_out, &host_info_outCnt))
  {
    ne_log_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      id v13 = "%s: cannot get host_info";
LABEL_45:
      _os_log_error_impl(&dword_1876B1000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
      goto LABEL_48;
    }

    goto LABEL_48;
  }

  if (read(v4, v43, 8uLL) != 8)
  {
    ne_log_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      id v13 = "%s: failed to read file";
      goto LABEL_45;
    }

+ (uint64_t)copyUUIDForSingleArch:(uint64_t)a1
{
  v14[2] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  if (read(a2, v8, 0x1CuLL) == 28)
  {
    if (v8[0] == -17958193) {
      lseek(a2, 4LL, 1);
    }
    if (v9)
    {
      uint64_t v3 = 0LL;
      while (read(a2, v7, 8uLL) == 8)
      {
        if (v7[0] == 27)
        {
          if (read(a2, v14, 0x10uLL) != 16) {
            return 0LL;
          }
          uint64_t v4 = [objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v14];
          ne_log_obj();
          uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            host_t v11 = "+[NEProcessInfo copyUUIDForSingleArch:]";
            __int16 v12 = 2112;
            uint64_t v13 = v4;
            _os_log_debug_impl(&dword_1876B1000, v5, OS_LOG_TYPE_DEBUG, "%s: got UUID %@", buf, 0x16u);
          }

          return v4;
        }

        lseek(a2, v7[1] - 8LL, 1);
      }
    }
  }

  return 0LL;
}

void __52__NEProcessInfo_copyUUIDsForExecutableWithoutCache___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  id v3 = +[NEProcessInfo copyUUIDsFromExecutable:]( (uint64_t)NEProcessInfo,  (const char *)[v2 UTF8String]);
  if (v3)
  {
    [(id)g_executableUUIDMapping setObject:v3 forKeyedSubscript:v2];
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }

  else
  {
    ne_log_obj();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      size_t v6 = "+[NEProcessInfo copyUUIDsForExecutableWithoutCache:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v2;
      _os_log_error_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_ERROR,  "%s: failed to get UUIDs for %@",  (uint8_t *)&v5,  0x16u);
    }
  }
}

uint64_t __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && MEMORY[0x1895ADD58](v4) == MEMORY[0x1895F92F8])
  {
    size_t v6 = *(void **)(a1 + 32);
    __int16 v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    [v6 addObject:v7];
  }

  return 1LL;
}

@end