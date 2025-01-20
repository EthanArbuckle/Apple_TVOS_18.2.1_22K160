@interface MSUDataAccessorSymbolicPathResolver
+ (id)resolvedSymbol:(id)a3 error:(id *)a4;
+ (id)symbolicPathResolver;
- (MSUDataAccessorSymbolicPathResolver)init;
- (id)resolve:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)overrideSymbol:(id)a3 resolvedPath:(id)a4;
@end

@implementation MSUDataAccessorSymbolicPathResolver

+ (id)symbolicPathResolver
{
  return objc_alloc_init(&OBJC_CLASS___MSUDataAccessorSymbolicPathResolver);
}

+ (id)resolvedSymbol:(id)a3 error:(id *)a4
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v48 = a4;
  id v47 = 0LL;
  id v46 = 0LL;
  char v45 = 1;
  v51 = (dispatch_once_t *)&resolvedSymbol_error__onceToken;
  id v50 = 0LL;
  objc_storeStrong(&v50, &__block_literal_global_0);
  if (*v51 != -1) {
    dispatch_once(v51, v50);
  }
  objc_storeStrong(&v50, 0LL);
  id v28 = (id)resolvedSymbol_error__symbolCache;
  objc_sync_enter(v28);
  id v44 = (id)[(id)resolvedSymbol_error__symbolCache objectForKeyedSubscript:location[0]];
  if (v44)
  {
    objc_storeStrong(&v46, v44);
  }

  else if ([location[0] isEqualToString:@"ecid"])
  {
    id v43 = 0LL;
    id v42 = v47;
    id v27 =  +[MSUDataAccessor ioreg:property:error:]( &OBJC_CLASS___MSUDataAccessor,  "ioreg:property:error:",  @"IODeviceTree:/chosen/manifest-properties",  @"ECID",  &v42);
    objc_storeStrong(&v47, v42);
    id v43 = v27;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v43 length] == 8)
    {
      uint64_t v41 = 0LL;
      uint64_t v41 = *(void *)[v43 bytes];
      id v4 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%llX",  v41);
      id v5 = v46;
      id v46 = v4;
    }

    else
    {
      id v40 = (id)MGCopyAnswer();
      if (v40)
      {
        id v6 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%llX",  objc_msgSend(v40, "longLongValue"));
        id v7 = v46;
        id v46 = v6;
      }

      objc_storeStrong(&v40, 0LL);
    }

    objc_storeStrong(&v43, 0LL);
  }

  else if ([location[0] isEqualToString:@"boardid"])
  {
    id v39 = (id)MGCopyAnswer();
    if (v39)
    {
      id v8 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%X",  objc_msgSend(v39, "intValue"));
      id v9 = v46;
      id v46 = v8;
    }

    objc_storeStrong(&v39, 0LL);
  }

  else if ([location[0] isEqualToString:@"chipid"])
  {
    id v38 = (id)MGCopyAnswer();
    if (v38)
    {
      id v10 = (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%X",  objc_msgSend(v38, "intValue"));
      id v11 = v46;
      id v46 = v10;
    }

    objc_storeStrong(&v38, 0LL);
  }

  else if ([location[0] isEqualToString:@"hwmodel"])
  {
    id v37 = v47;
    id v26 = +[MSUDataAccessor hardwareModelWithError:](&OBJC_CLASS___MSUDataAccessor, "hardwareModelWithError:", &v37);
    objc_storeStrong(&v47, v37);
    id v12 = v46;
    id v46 = v26;
  }

  else if ([location[0] isEqualToString:@"nsih"])
  {
    id v24 = +[MSUDataAccessor sharedDataAccessor](&OBJC_CLASS___MSUDataAccessor, "sharedDataAccessor");
    id v36 = v47;
    v25 = (void *)[v24 copyBootManifestHashWithError:&v36];
    objc_storeStrong(&v47, v36);
    id v13 = v46;
    id v46 = v25;
  }

  else if ([location[0] isEqualToString:@"volguuid"])
  {
    id v35 = v47;
    id v23 = +[MSUDataAccessor bootUUIDWithError:](&OBJC_CLASS___MSUDataAccessor, "bootUUIDWithError:", &v35);
    objc_storeStrong(&v47, v35);
    id v14 = v46;
    id v46 = v23;
  }

  else if (([location[0] isEqualToString:@"preboot"] & 1) != 0 {
         || ([location[0] isEqualToString:@"sourcepreboot"] & 1) != 0)
  }
  {
    objc_storeStrong(&v46, @"/private/preboot");
  }

  else if (([location[0] isEqualToString:@"iscpreboot"] & 1) == 0 {
         && ([location[0] isEqualToString:@"hardware"] & 1) == 0)
  }
  {
    if ([location[0] isEqualToString:@"bootobjectspath"])
    {
      id v34 = 0LL;
      id obj = v47;
      id v22 =  +[MSUDataAccessor ioreg:property:error:]( &OBJC_CLASS___MSUDataAccessor,  "ioreg:property:error:",  @"IODeviceTree:/chosen",  @"boot-objects-path",  &obj);
      objc_storeStrong(&v47, obj);
      id v34 = v22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v21 = objc_msgSend( NSString, "stringWithUTF8String:", objc_msgSend(v34, "bytes"));
        id v15 = (id)objc_msgSend(@"/", "stringByAppendingPathComponent:");
        id v16 = v46;
        id v46 = v15;
      }

      objc_storeStrong(&v34, 0LL);
    }

    else if (([location[0] isEqualToString:@"cryptex1ticketpath"] & 1) == 0)
    {
      os_log_t oslog = (os_log_t)MSUDASharedLogger();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v54, (uint64_t)location[0]);
        _os_log_error_impl(&dword_186203000, oslog, type, "Unknown symbol:%@", v54, 0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }
  }

  if (v46)
  {
    if ((v45 & 1) != 0 && !v44) {
      [(id)resolvedSymbol_error__symbolCache setObject:v46 forKeyedSubscript:location[0]];
    }
  }

  else if (v48)
  {
    id v30 = 0LL;
    v52[0] = *MEMORY[0x189607490];
    v53[0] = @"Path symbol resolution failure";
    v52[1] = @"symbol";
    v53[1] = location[0];
    id v20 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
    id v30 = (id)[v20 mutableCopy];

    if (v47) {
      [v30 setObject:v47 forKeyedSubscript:*MEMORY[0x189607798]];
    }
    id v19 = (id)[MEMORY[0x189607870] errorWithDomain:@"MSUDAError" code:6007 userInfo:v30];
    id *v48 = v19;
    objc_storeStrong(&v30, 0LL);
  }

  objc_storeStrong(&v44, 0LL);
  objc_sync_exit(v28);

  id v18 = v46;
  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(location, 0LL);
  return v18;
}

void __60__MSUDataAccessorSymbolicPathResolver_resolvedSymbol_error___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  v1 = (void *)resolvedSymbol_error__symbolCache;
  resolvedSymbol_error__symbolCache = (uint64_t)v0;
}

- (MSUDataAccessorSymbolicPathResolver)init
{
  SEL v7 = a2;
  id v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSUDataAccessorSymbolicPathResolver;
  id v8 = -[MSUDataAccessorSymbolicPathResolver init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    overrides = v8->_overrides;
    v8->_overrides = v2;
  }

  id v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  id v4 = self;
  SEL v3 = a2;
  objc_storeStrong((id *)&self->_overrides, 0LL);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___MSUDataAccessorSymbolicPathResolver;
  -[MSUDataAccessorSymbolicPathResolver dealloc](&v2, sel_dealloc);
}

- (void)overrideSymbol:(id)a3 resolvedPath:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id v5 = v8->_overrides;
  objc_sync_enter(v5);
  if (v6) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_overrides, "setObject:forKeyedSubscript:", v6, location[0]);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](v8->_overrides, "removeObjectForKey:", location[0]);
  }
  objc_sync_exit(v5);

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)resolve:(id)a3 error:(id *)a4
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  v61 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v59 = a4;
  id v58 = 0LL;
  uint64_t v51 = 0LL;
  v52 = &v51;
  int v53 = 838860800;
  int v54 = 48;
  uint64_t v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  id v57 = 0LL;
  id v50 = 0LL;
  id v49 = 0LL;
  id v48 = 0LL;
  id v22 = (id)[MEMORY[0x189607A00] regularExpressionWithPattern:@"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])" options:0 error:&v48];
  objc_storeStrong(&v50, v48);
  id v49 = v22;
  if (v50)
  {
    id v47 = MSUDASharedLogger();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v77, (uint64_t)@"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])");
      _os_log_error_impl(&dword_186203000, (os_log_t)v47, type, "bad regex:%@", v77, 0xCu);
    }

    objc_storeStrong(&v47, 0LL);
    id v21 = (void *)MEMORY[0x189607870];
    v75[0] = *MEMORY[0x189607490];
    v76[0] = @"bad regex";
    v75[1] = *MEMORY[0x189607798];
    v76[1] = v50;
    v75[2] = @"regex";
    v76[2] = @"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])";
    id v20 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:3];
    id v4 = (id)objc_msgSend( v21,  "errorWithDomain:code:userInfo:",  @"MSUDASymbolicPathResolverError",  102);
    id v5 = (void *)v52[5];
    v52[5] = (uint64_t)v4;
  }

  else if (v49)
  {
    uint64_t v41 = 0LL;
    id v42 = &v41;
    int v43 = 0x20000000;
    int v44 = 32;
    uint64_t v45 = 0LL;
    id v40 = 0LL;
    id v40 = (id)[MEMORY[0x189607940] string];
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v18 = v42[3];
    uint64_t v19 = [location[0] length];
    uint64_t v67 = v18;
    uint64_t v66 = v19;
    uint64_t v68 = v18;
    uint64_t v69 = v19;
    uint64_t v38 = v18;
    uint64_t v39 = v19;
    id v17 = v49;
    id v16 = location[0];
    uint64_t v30 = MEMORY[0x1895F87A8];
    int v31 = -1040187392;
    int v32 = 0;
    v33 = __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke;
    id v34 = &__block_descriptor_72_e8_32s40s48s56r64r_e37_v32__0__NSTextCheckingResult_8Q16_B24l;
    v37[1] = &v41;
    id v35 = location[0];
    id v36 = v40;
    v37[0] = v61;
    v37[2] = &v51;
    objc_msgSend(v17, "enumerateMatchesInString:options:range:usingBlock:", v16, 0, v38, v39, &v30);
    if ([location[0] length] != v42[3])
    {
      id v29 = 0LL;
      id v13 = location[0];
      id v14 = (os_log_s *)v42[3];
      uint64_t v15 = [location[0] length];
      uint64_t v6 = v42[3];
      v63 = v14;
      uint64_t v62 = v15 - v6;
      v64 = v14;
      uint64_t v65 = v15 - v6;
      oslog[1] = v14;
      oslog[2] = (os_log_t)(v15 - v6);
      id v29 = (id)objc_msgSend(v13, "substringWithRange:", v14, v15 - v6);
      [v40 appendString:v29];
      objc_storeStrong(&v29, 0LL);
    }

    if (v52[5])
    {
      oslog[0] = (os_log_t)MSUDASharedLogger();
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v74, v52[5], (uint64_t)v40);
        _os_log_error_impl( &dword_186203000,  oslog[0],  v27,  "error %@ ; discarding incomplete unresolved path: %@",
          v74,
          0x16u);
      }

      objc_storeStrong((id *)oslog, 0LL);
    }

    else
    {
      objc_storeStrong(&v58, v40);
    }

    objc_storeStrong(v37, 0LL);
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v35, 0LL);
    objc_storeStrong(&v40, 0LL);
    _Block_object_dispose(&v41, 8);
  }

  else
  {
    os_log_t v26 = (os_log_t)MSUDASharedLogger();
    os_log_type_t v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)@"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])");
      _os_log_error_impl(&dword_186203000, v26, v25, "could not alloc/init regex:%@", v73, 0xCu);
    }

    objc_storeStrong((id *)&v26, 0LL);
    id v12 = (void *)MEMORY[0x189607870];
    v71[0] = *MEMORY[0x189607490];
    v72[0] = @"could not alloc/init regex";
    v71[1] = @"regex";
    v72[1] = @"(\\\\\\\\)|(\\\\\\[)|(\\\\\\])|(\\[\\w+\\])";
    id v11 = (id)[MEMORY[0x189603F68] dictionaryWithObjects:v72 forKeys:v71 count:2];
    id v7 = (id)objc_msgSend( v12,  "errorWithDomain:code:userInfo:",  @"MSUDASymbolicPathResolverError",  101);
    id v8 = (void *)v52[5];
    v52[5] = (uint64_t)v7;
  }

  if (v59) {
    id *v59 = (id) v52[5];
  }
  if (v58)
  {
    os_log_t v24 = (os_log_t)MSUDASharedLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v70, (uint64_t)location[0], (uint64_t)v58);
      _os_log_debug_impl( &dword_186203000,  v24,  OS_LOG_TYPE_DEBUG,  "returning resolved path for symbolic path %@: %@",  v70,  0x16u);
    }

    objc_storeStrong((id *)&v24, 0LL);
  }

  id v10 = v58;
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v50, 0LL);
  _Block_object_dispose(&v51, 8);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

void __53__MSUDataAccessorSymbolicPathResolver_resolve_error___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v47 = a3;
  id v46 = a4;
  uint64_t v45 = a1;
  if (location[0])
  {
    uint64_t v43 = [location[0] range];
    uint64_t v44 = v4;
    if (v43 != *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
    {
      id v42 = 0LL;
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      uint64_t v38 = [location[0] range];
      uint64_t v39 = v5;
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      location[7] = v18;
      location[6] = (id)(v38 - v6);
      location[8] = v18;
      location[9] = (id)(v38 - v6);
      id v40 = v18;
      uint64_t v41 = v38 - v6;
      id v42 = (id)objc_msgSend(v19, "substringWithRange:", v18, v38 - v6);
      [*(id *)(a1 + 40) appendString:v42];
      objc_storeStrong(&v42, 0LL);
    }

    id v37 = 0LL;
    id v17 = *(void **)(a1 + 32);
    uint64_t v35 = [location[0] range];
    uint64_t v36 = v7;
    id v37 = (id)objc_msgSend(v17, "substringWithRange:", v35, v7);
    uint64_t v33 = [location[0] rangeAtIndex:1];
    uint64_t v34 = v8;
    if (v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v31 = [location[0] rangeAtIndex:2];
      uint64_t v32 = v9;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v29 = [location[0] rangeAtIndex:3];
        uint64_t v30 = v10;
        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v27 = [location[0] rangeAtIndex:4];
          uint64_t v28 = v11;
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v12 = [v37 length];
            id location[3] = (id)1;
            id location[2] = (id)(v12 - 2);
            location[4] = (id)1;
            location[5] = (id)(v12 - 2);
            v25[1] = (id)1;
            v25[2] = (id)(v12 - 2);
            id v26 = (id)objc_msgSend(v37, "substringWithRange:", 1, v12 - 2);
            v25[0] = 0LL;
            v25[0] = (id)[*(id *)(*(void *)(a1 + 48) + 8) objectForKeyedSubscript:v26];
            if (!v25[0])
            {
              uint64_t v15 = (id *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
              id v24 = *v15;
              id v16 =  +[MSUDataAccessorSymbolicPathResolver resolvedSymbol:error:]( &OBJC_CLASS___MSUDataAccessorSymbolicPathResolver,  "resolvedSymbol:error:",  v26,  &v24);
              objc_storeStrong(v15, v24);
              id v13 = v25[0];
              v25[0] = v16;

              if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
              {
                *id v46 = 1;
              }

              else if (v25[0])
              {
                [*(id *)(a1 + 40) appendString:v25[0]];
              }
            }

            objc_storeStrong(v25, 0LL);
            objc_storeStrong(&v26, 0LL);
          }
        }

        else
        {
          [*(id *)(a1 + 40) appendString:@"]"];
        }
      }

      else
      {
        [*(id *)(a1 + 40) appendString:@"["];
      }
    }

    else
    {
      [*(id *)(a1 + 40) appendString:@"\\""];
    }

    uint64_t v23 = [location[0] range];
    [location[0] range];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v23 + v14;
    objc_storeStrong(&v37, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end