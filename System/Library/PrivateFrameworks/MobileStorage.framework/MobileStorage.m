CFMutableDictionaryRef create_dict()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
}

id copyVolumePartition(void *a1)
{
  io_registry_entry_t entry = 0;
  copyBSDName(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    mach_port_t v3 = *MEMORY[0x1896086B0];
    v4 = IOBSDNameMatching( *MEMORY[0x1896086B0], 0, (const char *)[v1 UTF8String]);
    io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
    io_registry_entry_t entry = MatchingService;
    if (MatchingService)
    {
      io_object_t v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        id v9 = 0LL;
        CFProperty = 0LL;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }

      if (exchange_with_parent_matching_class(&entry, "AppleAPFSContainer")
        && exchange_with_parent_matching_class(&entry, "AppleAPFSMedia")
        && exchange_with_parent_matching_class(&entry, "AppleAPFSContainerScheme")
        && exchange_with_parent_matching_class(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty( entry,  @"BSD Name",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
        if (CFProperty)
        {
          v8 = (void *)[objc_alloc(NSString) initWithFormat:@"/dev/%@", CFProperty];
          if (v8)
          {
            id v9 = v8;
            goto LABEL_14;
          }
        }
      }

      else
      {
        CFProperty = 0LL;
      }

      id v9 = 0LL;
LABEL_14:
      io_object_t v6 = entry;
      if (!entry) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }

  id v9 = 0LL;
  CFProperty = 0LL;
LABEL_18:

  return v9;
}

id copyBSDName(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
    v4 = @"/dev/r";
    if (([v3 hasPrefix:@"/dev/r"] & 1) != 0
      || (v4 = @"/dev/", [v3 hasPrefix:@"/dev/"]))
    {
      uint64_t v5 = objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length"));

      id v3 = (id)v5;
    }

    id v6 = v3;
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

uint64_t exchange_with_parent_matching_class(io_object_t *a1, const char *a2)
{
  uint64_t result = 0LL;
  io_registry_entry_t parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      uint64_t result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0LL;
      }
    }

    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1LL;
    }
  }

  return result;
}

id copyRelativeMountPath(void *a1)
{
  return a1;
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id isNSArray(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

id isNSURL(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0LL;
  }

  return v2;
}

uint64_t determine_filesystem_type()
{
  v0 = (void *)MEMORY[0x1895F8858]();
  id v2 = v1;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v3 = v0;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_registry_entry_t entry = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }

    id v3 = 0LL;
    goto LABEL_32;
  }

  copyBSDName(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (!v4
    || (mach_port_t v6 = *MEMORY[0x1896086B0],
        id v7 = v4,
        v8 = IOBSDNameMatching(v6, 0, (const char *)[v7 UTF8String]),
        io_service_t MatchingService = IOServiceGetMatchingService(v6, v8),
        (*(_DWORD *)io_registry_entry_t entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }

  io_object_t v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }

  if (!exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSMedia"))
  {
    char v22 = 0;
    v12 = 0LL;
LABEL_45:
    id CFProperty = 0LL;
    goto LABEL_46;
  }

  v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v12 = (void *)IORegistryEntrySearchCFProperty( *(io_registry_entry_t *)entry,  "IOService",  @"Content Hint",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  if (!v2)
  {
    id CFProperty = 0LL;
    goto LABEL_55;
  }

  if (!exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSContainer")
    || !exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    char v22 = 0;
    goto LABEL_45;
  }

  id CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, @"BSD Name", v11, 0);
  isNSString(CFProperty);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    [@"/dev/" stringByAppendingString:CFProperty];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      id CFProperty = v15;
      void *v2 = CFProperty;
LABEL_55:
      char v22 = 1;
      goto LABEL_46;
    }

    goto LABEL_44;
  }

  char v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry) {
    IOObjectRelease(*(io_object_t *)entry);
  }

  if ((v22 & 1) != 0)
  {
    uint64_t v19 = 6LL;
    goto LABEL_53;
  }

LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", @"/dev/", *(void *)entry) & 1) == 0)
  {
    uint64_t v16 = [@"/dev" stringByAppendingString:v3];

    id v3 = (id)v16;
  }

  id v3 = v3;
  int v17 = open((const char *)[v3 UTF8String], 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v26 = 1024;
      int v27 = v20;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to open %@: %{errno}d",  entry,  0x12u);
    }

    v35 = v35;
    v36 = 0;
    *a5 = v35;
    goto LABEL_21;
  }

  normalizePrivateVar(v12);
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  306LL,  -2,  0LL,  @"Failed to normalize %@.",  v24,  v25,  v26,  (uint64_t)v12);
    goto LABEL_19;
  }

  normalizePrivateVar(@"/Developer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v27 hasPrefix:v28];

  if (v29)
  {
    normalizePrivateVar(@"/Developer");
    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
    char v31 = [v23 hasPrefix:v30];

    if ((v31 & 1) == 0)
    {
      createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  315LL,  -2,  0LL,  @"Invalid program path: %@",  v32,  v33,  v34,  (uint64_t)v23);
LABEL_19:
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }

  v35 = 0LL;
  v36 = 1;
LABEL_21:

  return v36;
}

LABEL_32:
    uint64_t v19 = 0LL;
    goto LABEL_53;
  }

  int v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        uint64_t v19 = 5LL;
      }

      else if (v29 == 0x2020205441465845LL)
      {
        uint64_t v19 = 4LL;
      }

      else
      {
        uint64_t v19 = 1LL;
      }
    }

    else if (v30 == 11080)
    {
      uint64_t v19 = 2 * (v31 == 4);
    }

    else if (v31 == 5 && v30 == 22600)
    {
      uint64_t v19 = 3LL;
    }

    else
    {
      uint64_t v19 = 0LL;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v26 = 1024;
      int v27 = v21;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to read %@ volume header: %{errno}d",  entry,  0x12u);
      uint64_t v19 = 0LL;
    }
  }

  close(v18);
LABEL_53:

  return v19;
}

  return v28;
}

BOOL isDeveloperModeEnabled()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  size_t v4 = 8LL;
  uint64_t v5 = 0LL;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0LL, 0LL)) {
    return v5 == 1;
  }
  v0 = __error();
  BOOL v1 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0LL;
  if (v1)
  {
    int v3 = *v0;
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to read developer mode status: %{darwin.errno}d",  buf,  8u);
    return 0LL;
  }

  return result;
}

BOOL systemSupportsRestrictedExecutionMode(BOOL *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v12 = 0;
  size_t v11 = 4LL;
  if (sysctlbyname("security.codesigning.config", &v12, &v11, 0LL, 0LL))
  {
    int v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "security.codesigning.config";
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to read sysctl (%s): %{darwin.errno}d",  buf,  0x12u);
    }

    createMobileStorageError( (uint64_t)"systemSupportsRestrictedExecutionMode",  773LL,  -2,  0LL,  @"Failed to read sysctl (%s): %{darwin.errno}d",  v5,  v6,  v7,  (uint64_t)"security.codesigning.config");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a2 && v8)
    {
      id v8 = v8;
      *a2 = v8;
    }
  }

  else
  {
    id v8 = 0LL;
    if (a1) {
      *a1 = (v12 & 0x2000000) != 0;
    }
  }

  BOOL v9 = v8 == 0LL;

  return v9;
}

id createMobileStorageError( uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  v14 = (objc_class *)MEMORY[0x189607940];
  id v15 = a5;
  int v16 = (void *)[[v14 alloc] initWithFormat:v15 arguments:&a9];

  id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
  int v18 = v17;
  if (v16) {
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x1896075E0]];
  }
  if (v13) {
    [v18 setObject:v13 forKeyedSubscript:*MEMORY[0x189607798]];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      [NSString stringWithUTF8String:a1];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v19 forKeyedSubscript:@"FunctionName"];
    }

    if ((_DWORD)a2)
    {
      [MEMORY[0x189607968] numberWithInt:a2];
      int v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setObject:v20 forKeyedSubscript:@"SourceLine"];
    }
  }

  [MEMORY[0x189607870] errorWithDomain:@"com.apple.MobileStorage.ErrorDomain" code:a3 userInfo:v18];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t allowInvalidatingAttestations()
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ((os_parse_boot_arg_int() & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v5 = " not";
      __int16 v6 = 2080;
      uint64_t v7 = "allow_msm_to_invalidate_attestations";
      __int16 v8 = 2048;
      uint64_t v9 = 0LL;
      v0 = (os_log_s *)MEMORY[0x1895F8DA0];
      BOOL v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      uint32_t v2 = 32;
LABEL_6:
      _os_log_impl(&dword_18826F000, v0, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = "allow_msm_to_invalidate_attestations";
    v0 = (os_log_s *)MEMORY[0x1895F8DA0];
    BOOL v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
    uint32_t v2 = 12;
    goto LABEL_6;
  }

  return 0LL;
}

BOOL is_disk_image(io_registry_entry_t a1)
{
  BOOL v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"Protocol Characteristics",  (CFAllocatorRef)*MEMORY[0x189604DB0],  3u);
  if (!v1) {
    return 0LL;
  }
  uint32_t v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, @"Physical Interconnect");
  if (Value) {
    BOOL v4 = CFStringCompare(Value, @"Virtual Interface", 0LL) == kCFCompareEqualTo;
  }
  else {
    BOOL v4 = 0LL;
  }
  CFRelease(v2);
  return v4;
}

id get_mounted_media_entries()
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  uint64_t v49 = 0LL;
  v50 = 0LL;
  id v42 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v42)
  {
    int v0 = getfsstat(0LL, 0, 2);
    if (v0 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v7;
        _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

      v43 = 0LL;
    }

    else
    {
      int v1 = v0;
      unint64_t v2 = 0LL;
      v43 = 0LL;
      do
      {
        unint64_t v3 = 2168LL * v1;
        if (v2 > v3)
        {
          if (v43) {
            goto LABEL_22;
          }
          goto LABEL_21;
        }

        if (v43) {
          free(v43);
        }
        unint64_t v2 = v3 + 2168;
        BOOL v4 = (statfs *)malloc(v3 + 2168);
        if (!v4)
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            int v8 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v8;
            _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory: %{errno}d",  buf,  8u);
          }

LABEL_21:
          v43 = 0LL;
          goto LABEL_22;
        }

        v43 = v4;
        int v1 = getfsstat(v4, v3 + 2168, 2);
      }

      while ((v1 & 0x80000000) == 0);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
      }

LABEL_22:
      if (v1 > 0)
      {
        uint64_t v9 = (void *)MGCopyAnswer();
        int v10 = [v9 BOOLValue];

        if (((v10 | os_variant_is_recovery()) & 1) == 0)
        {
          int v12 = cryptex_copy_list_4MSM();
          if ((v12 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              id v13 = strerror(v12);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v12;
              LOWORD(v56) = 2080;
              *(void *)((char *)&v56 + 2) = v13;
              _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to copy cryptex list (%d (%s)), non-fatal.",  buf,  0x12u);
            }

            uint64_t v49 = 0LL;
          }
        }

        uint64_t v14 = 0LL;
        id v15 = 0LL;
        uint64_t v16 = v1;
        *(void *)&__int128 v11 = 136315138LL;
        __int128 v41 = v11;
        while (1)
        {
          *(void *)buf = 0LL;
          *(void *)&__int128 v56 = buf;
          *((void *)&v56 + 1) = 0x2020000000LL;
          char v57 = 0;
          create_map_entry((uint64_t)&v43[v14], v50, v49);
          id v17 = (void *)objc_claimAutoreleasedReturnValue();
          int v18 = v17;
          if (!v17) {
            break;
          }
          [v17 objectForKeyedSubscript:@"MountPath"];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            int v27 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = @"MountPath";
              v24 = v27;
              v25 = "Map entry missing value for key %@.";
              uint32_t v26 = 12;
LABEL_37:
              _os_log_impl(&dword_18826F000, v24, OS_LOG_TYPE_DEFAULT, v25, v53, v26);
            }

            goto LABEL_38;
          }

          id v20 = v19;
          [v18 objectForKeyedSubscript:@"DiskImageType"];
          int v21 = (void *)objc_claimAutoreleasedReturnValue();
          int v22 = [v21 isEqualToString:@"Cryptex"];

          if (v22)
          {
            *(_BYTE *)(v56 + 24) = 1;
          }

          else
          {
            v45[0] = MEMORY[0x1895F87A8];
            v45[1] = 3221225472LL;
            v45[2] = __get_mounted_media_entries_block_invoke;
            v45[3] = &unk_18A212978;
            id v32 = v20;
            id v46 = v32;
            id v47 = v18;
            v48 = buf;
            [&unk_18A216090 enumerateObjectsUsingBlock:v45];

            if (!*(_BYTE *)(v56 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                get_mounted_media_entries_cold_1(v51, (uint64_t)v32, &v52);
              }
              v28 = 0LL;
              uint64_t v29 = 0LL;
              __int16 v30 = 0LL;
              char v31 = 0LL;
              uint64_t v44 = (uint64_t)v15;
              id v20 = v32;
              goto LABEL_60;
            }
          }

          uint64_t v44 = objc_msgSend(v18, "objectForKeyedSubscript:", @"DeviceNode", v41);

          if (v44)
          {
            [v18 objectForKeyedSubscript:@"DeviceType"];
            char v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              if ([@"DiskImage" isEqualToString:v31])
              {
                image_file_path_name((uint64_t)v43[v14].f_mntfromname);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  [v18 setObject:v33 forKeyedSubscript:@"BackingImage"];
                  [v18 objectForKeyedSubscript:@"ImageSignature"];
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    __int16 v30 = 0LL;
                    uint64_t v29 = v33;
LABEL_59:
                    [v42 setObject:v18 forKeyedSubscript:v44];
                    goto LABEL_60;
                  }

                  image_file_path_name((uint64_t)v43[v14].f_mntfromname);
                  uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v29)
                  {
                    signatureFromPath(v29);
                    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v30)
                    {
                      v28 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initDataWithHexString:v30];
                      if (v28)
                      {
                        [v18 setObject:v28 forKeyedSubscript:@"ImageSignature"];
                        goto LABEL_59;
                      }

                      v38 = (os_log_s *)MEMORY[0x1895F8DA0];
                      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v53 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( &dword_18826F000,  v38,  OS_LOG_TYPE_DEFAULT,  "Failed to convert signature from %@",  v53,  0xCu);
                      }
                    }

                    else
                    {
                      v37 = (os_log_s *)MEMORY[0x1895F8DA0];
                      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v53 = 138412290;
                        f_mntonname = v29;
                        _os_log_impl( &dword_18826F000,  v37,  OS_LOG_TYPE_DEFAULT,  "Failed to recover signature from %@",  v53,  0xCu);
                      }

                      __int16 v30 = 0LL;
                    }

                    goto LABEL_58;
                  }

                  v36 = (os_log_s *)MEMORY[0x1895F8DA0];
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                  {
LABEL_56:
                    *(_DWORD *)v53 = v41;
                    f_mntonname = (const __CFString *)v43[v14].f_mntonname;
                    _os_log_impl( &dword_18826F000,  v36,  OS_LOG_TYPE_DEFAULT,  "Failed to get backing image path for %s",  v53,  0xCu);
                  }
                }

                else
                {
                  v36 = (os_log_s *)MEMORY[0x1895F8DA0];
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_56;
                  }
                }
              }

              __int16 v30 = 0LL;
              uint64_t v29 = 0LL;
LABEL_58:
              v28 = 0LL;
              goto LABEL_59;
            }

            v35 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = @"DeviceType";
              _os_log_impl(&dword_18826F000, v35, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v53, 0xCu);
            }
          }

          else
          {
            v34 = (os_log_s *)MEMORY[0x1895F8DA0];
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = @"DeviceNode";
              _os_log_impl(&dword_18826F000, v34, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v53, 0xCu);
            }

            uint64_t v44 = 0LL;
          }

          v28 = 0LL;
          uint64_t v29 = 0LL;
          __int16 v30 = 0LL;
          char v31 = 0LL;
LABEL_60:
          _Block_object_dispose(buf, 8);

          ++v14;
          __int16 v6 = (void *)v44;
          id v15 = (void *)v44;
          if (!--v16) {
            goto LABEL_76;
          }
        }

        v23 = (os_log_s *)MEMORY[0x1895F8DA0];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v53 = 0;
          v24 = v23;
          v25 = "Failed to create map entry.";
          uint32_t v26 = 2;
          goto LABEL_37;
        }

LABEL_38:
        v28 = 0LL;
        uint64_t v29 = 0LL;
        id v20 = 0LL;
        __int16 v30 = 0LL;
        char v31 = 0LL;
        uint64_t v44 = (uint64_t)v15;
        goto LABEL_60;
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v39 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v39;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to get mount information: %{errno}d",  buf,  8u);
    }

    __int16 v6 = 0LL;
LABEL_76:
    if (v43) {
      free(v43);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }

    __int16 v6 = 0LL;
  }

  if (v50) {
    cryptex_msm_array_destroy();
  }

  return v42;
}

void sub_188271EC8(_Unwind_Exception *a1)
{
}

id create_map_entry(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  if (!a1 || (uint64_t v3 = a3, (v4 = a2) == 0LL) && a3)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      id v8 = 0LL;
      uint64_t v9 = 0LL;
      int v10 = 0LL;
      __int128 v11 = 0LL;
      BOOL v4 = 0LL;
      int v12 = 0LL;
      id v13 = 0LL;
      id v14 = 0LL;
      id v15 = 0LL;
LABEL_8:
      uint64_t v16 = 0LL;
      goto LABEL_9;
    }

    *(_WORD *)buf = 0;
    __int16 v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v7 = "Invalid intput.";
LABEL_6:
    _os_log_impl(&dword_18826F000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    goto LABEL_7;
  }

  uint64_t v18 = [objc_alloc(NSString) initWithCString:a1 + 1112 encoding:4];
  if (!v18)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    __int16 v6 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v7 = "Failed to create string.";
    goto LABEL_6;
  }

  id v15 = (void *)v18;
  uint64_t v19 = (void *)[objc_alloc(NSString) initWithCString:a1 + 88 encoding:4];
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }

    id v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = 0LL;
    __int128 v11 = 0LL;
    BOOL v4 = 0LL;
    int v12 = 0LL;
    id v13 = 0LL;
    id v14 = 0LL;
    goto LABEL_8;
  }

  id v14 = v19;
  uint64_t v20 = [v14 UTF8String];
  if (!v20)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v36 = (os_log_s *)MEMORY[0x1895F8DA0];
      v37 = "Failed to get C string.";
LABEL_51:
      _os_log_impl(&dword_18826F000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    }

LABEL_52:
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = 0LL;
    __int128 v11 = 0LL;
    BOOL v4 = 0LL;
    int v12 = 0LL;
    id v13 = 0LL;
    goto LABEL_8;
  }

  int v21 = (char *)v20;
  uint64_t v22 = [objc_alloc(NSString) initWithCString:a1 + 72 encoding:4];
  if (!v22)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v36 = (os_log_s *)MEMORY[0x1895F8DA0];
      v37 = "Failed to create string.";
      goto LABEL_51;
    }

    goto LABEL_52;
  }

  id v13 = (void *)v22;
  id v23 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v23)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }

    id v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = 0LL;
    __int128 v11 = 0LL;
    BOOL v4 = 0LL;
    int v12 = 0LL;
    goto LABEL_8;
  }

  uint64_t v16 = v23;
  __s2 = v21;
  objc_msgSend(v23, "setObject:forKeyedSubscript:", @"MassStorage");
  [v16 setObject:v15 forKeyedSubscript:@"DeviceNode"];
  [v16 setObject:v14 forKeyedSubscript:@"MountPath"];
  [v16 setObject:v13 forKeyedSubscript:@"FilesystemType"];
  [v16 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"IsMounted"];
  v24 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v15];
  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v15;
      __int16 v61 = 2080;
      id v62 = (id)(a1 + 88);
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create URL (%@ / %s).",  buf,  0x16u);
    }

    id v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = 0LL;
    __int128 v11 = 0LL;
    goto LABEL_62;
  }

  __int128 v11 = v24;
  mach_port_t mainPort = *MEMORY[0x1896086B0];
  id v25 = [v24 lastPathComponent];
  matching = IOBSDNameMatching(mainPort, 0, (const char *)[v25 UTF8String]);

  if (!matching)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v11 lastPathComponent];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create a BSD matching dictionary for %@.",  buf,  0xCu);
    }

    id v8 = 0LL;
    uint64_t v9 = 0LL;
    int v10 = 0LL;
LABEL_62:
    BOOL v4 = 0LL;
    int v12 = 0LL;
    goto LABEL_9;
  }

  io_service_t MatchingService = IOServiceGetMatchingService(mainPort, matching);
  mach_port_t mainPorta = MatchingService;
  if (!MatchingService || !is_disk_image(MatchingService)) {
    goto LABEL_99;
  }
  [v16 setObject:@"DiskImage" forKeyedSubscript:@"DeviceType"];
  if (!strcmp("/Developer", __s2))
  {
    int v39 = @"Developer";
    v40 = kMSMDiskImageTypeKey;
LABEL_98:
    [v16 setObject:v39 forKeyedSubscript:*v40];
    goto LABEL_99;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    __int128 v41 = kMSMDiskImageTypePersonalizedAutomation;
LABEL_97:
    int v39 = *v41;
    v40 = kMSMDiskImagePersonalizedImageType;
    goto LABEL_98;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    __int128 v41 = kMSMDiskImageTypePersonalizedDemo;
    goto LABEL_97;
  }

  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    __int128 v41 = kMSMDiskImageTypePersonalizedDebug;
    goto LABEL_97;
  }

  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedFactory;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedFieldService;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedFieldServiceDiagnostic;
    }

    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedFieldServiceRepair;
    }

    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedQuality;
    }

    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          CFDictionaryRef matchinga = 0LL;
          uint64_t v9 = 0LL;
          int v10 = 0LL;
          goto LABEL_100;
        }

        [v16 setObject:@"Cryptex" forKeyedSubscript:@"DiskImageType"];
        if (v3)
        {
          while (1)
          {
            uint64_t string = cryptex_msm_get_string();
            if (string)
            {
              v28 = (const char *)string;
              size_t v29 = strlen((const char *)(a1 + 1112));
              if (strnstr(v28, (const char *)(a1 + 1112), v29))
              {
                uint64_t v30 = cryptex_msm_get_string();
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = cryptex_msm_get_string();
                  if (v32) {
                    break;
                  }
                }
              }
            }

            v4 += 8;
            if (!--v3) {
              goto LABEL_37;
            }
          }

          [NSString stringWithUTF8String:v32];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 setObject:v51 forKeyedSubscript:@"CryptexName"];

          [NSString stringWithUTF8String:v31];
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 setObject:v52 forKeyedSubscript:@"CryptexVersion"];
        }

LABEL_37:
        uint64_t v33 = [v16 objectForKeyedSubscript:@"CryptexName"];
        if (!v33
          || (v34 = (void *)v33,
              [v16 objectForKeyedSubscript:@"CryptexVersion"],
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              v35,
              v34,
              !v35))
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v15;
            __int16 v61 = 2112;
            id v62 = v14;
            _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).",  buf,  0x16u);
          }

          id v8 = 0LL;
          CFDictionaryRef matchinga = 0LL;
          uint64_t v9 = 0LL;
          int v10 = 0LL;
          BOOL v4 = 0LL;
          int v12 = 0LL;
LABEL_108:
          io_object_t v48 = mainPorta;
          if (!mainPorta) {
            goto LABEL_110;
          }
          goto LABEL_109;
        }

LABEL_99:
        CFDictionaryRef matchinga = 0LL;
        uint64_t v9 = 0LL;
        int v10 = 0LL;
        BOOL v4 = 0LL;
LABEL_100:
        int v12 = 0LL;
        goto LABEL_101;
      }

      [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      __int128 v41 = kMSMDiskImageTypePersonalizedRepair;
    }

    goto LABEL_97;
  }

  uint64_t v42 = [v14 stringByAppendingPathComponent:@"Library/Frameworks/DTRemoteServices.framework"];
  if (!v42)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }

    int v12 = 0LL;
    BOOL v4 = 0LL;
    goto LABEL_86;
  }

  BOOL v4 = (char *)v42;
  [MEMORY[0x189604030] fileURLWithPath:v42 isDirectory:0];
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle for DTRemoteServices.framework.",  buf,  2u);
    }

    int v12 = 0LL;
LABEL_86:
    int v10 = 0LL;
    uint64_t v9 = 0LL;
    CFDictionaryRef matchinga = 0LL;
    goto LABEL_95;
  }

  uint64_t v44 = (void *)*MEMORY[0x189604E18];
  CFDictionaryRef matchinga = Unique;
  uint64_t v45 = CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x189604E18]);
  if (v45)
  {
    int v12 = (void *)v45;
    uint64_t v46 = [v14 stringByAppendingPathComponent:@"version.plist"];
    if (v46)
    {
      uint64_t v9 = (void *)v46;
      [MEMORY[0x1896078A8] defaultManager];
      id v47 = (void *)objc_claimAutoreleasedReturnValue();
      int __s2a = [v47 fileExistsAtPath:v9];

      if (__s2a)
      {
        int v10 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v9];
        if (v10)
        {
LABEL_76:
          [v16 setObject:v12 forKeyedSubscript:@"PersonalizedImageVersion"];
          [v16 setObject:v10 forKeyedSubscript:@"PersonalizedImageVersionInfo"];
          [v16 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
          [v16 setObject:@"DeveloperDiskImage" forKeyedSubscript:@"PersonalizedImageType"];
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0) {
            uint64_t v49 = MEMORY[0x189604A88];
          }
          else {
            uint64_t v49 = MEMORY[0x189604A80];
          }
          [v16 setObject:v49 forKeyedSubscript:@"IsReadOnly"];
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0) {
            uint64_t v50 = MEMORY[0x189604A88];
          }
          else {
            uint64_t v50 = MEMORY[0x189604A80];
          }
          [v16 setObject:v50 forKeyedSubscript:@"SupportsContentProtection"];
          id v8 = v16;
          goto LABEL_108;
        }

        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
          create_map_entry_cold_1((uint64_t)v9, (uint64_t)v12);
        }
      }

      int v10 = 0LL;
      goto LABEL_76;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v44;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to query bundle key %@.",  buf,  0xCu);
    }

    int v12 = 0LL;
  }

  int v10 = 0LL;
  uint64_t v9 = 0LL;
LABEL_95:
  id v8 = 0LL;
  io_object_t v48 = mainPorta;
LABEL_109:
  IOObjectRelease(v48);
LABEL_110:
  if (matchinga) {
    CFRelease(matchinga);
  }
LABEL_9:

  return v8;
}

void __get_mounted_media_entries_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (([*(id *)(a1 + 32) hasPrefix:a2] & 1) != 0
    || ([*(id *)(a1 + 40) objectForKeyedSubscript:@"DiskImageType"],
        __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"Cryptex"],
        v6,
        v7))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

id image_file_path_name(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      int v7 = "Invalid input.";
LABEL_9:
      _os_log_impl(&dword_18826F000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }

LABEL_10:
    int v5 = 0LL;
    unint64_t v2 = 0LL;
    id v4 = 0LL;
LABEL_11:
    uint64_t v3 = 0LL;
    goto LABEL_12;
  }

  uint64_t v1 = [objc_alloc(NSString) initWithUTF8String:a1];
  if (!v1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      int v7 = "Failed to create string.";
      goto LABEL_9;
    }

    goto LABEL_10;
  }

  unint64_t v2 = (void *)v1;
  id v9 = 0LL;
  [MEMORY[0x18960F238] imageURLFromDevice:v1 error:&v9];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v9;
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to retrieve image URL: %@",  buf,  0xCu);
    }

    int v5 = 0LL;
    goto LABEL_11;
  }

  [v3 path];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

  return v8;
}

    uint64_t v22 = v22;
    *a5 = v22;
    goto LABEL_11;
  }

  id v23 = 0LL;
LABEL_12:

  return v23;
}

id signatureFromPath(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[v1 count] >= 4)
  {
    id v3 = objc_alloc(NSString);
    objc_msgSend(v1, "objectAtIndexedSubscript:", objc_msgSend(v1, "count") - 3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndexedSubscript:", objc_msgSend(v1, "count") - 2);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v2 = (void *)[v3 initWithFormat:@"%@%@", v4, v5];
  }

  else
  {
    unint64_t v2 = 0LL;
  }

  return v2;
}

id get_attached_ptp_entries()
{
  kern_return_t v9;
  __int16 v10;
  void *Value;
  id v12;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;
  id v17 = *MEMORY[0x1895F89C0];
  properties = 0LL;
  existing = 0;
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v0)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (CFMutableDictionaryRef v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:]( v1,  "setObject:forKeyedSubscript:",  &unk_18A2160A8,  @"bInterfaceClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &unk_18A2160C0,  @"bInterfaceSubClass"),  -[__CFDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &unk_18A2160C0,  @"bInterfaceProtocol"),  !IOServiceGetMatchingServices(*MEMORY[0x1896086B0], v2, &existing))
      && (io_object_t v6 = IOIteratorNext(existing)) != 0)
    {
      io_object_t v7 = v6;
      id v4 = 0LL;
      id v3 = 0LL;
      id v8 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        id v9 = IORegistryEntryCreateCFProperties(v7, &properties, 0LL, 0);
        if (v9)
        {
          int v10 = v9;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v16) = v10 & 0x3FFF;
            _os_log_impl( &dword_18826F000,  v8,  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryCreateCFProperties failed: 0x%04x",  buf,  8u);
          }
        }

        else
        {
          Value = (void *)CFDictionaryGetValue(properties, @"locationID");

          if (Value)
          {
            uint64_t v12 = objc_alloc_init(MEMORY[0x189603FC8]);

            if (v12)
            {
              [v12 setObject:Value forKeyedSubscript:@"LocationID"];
              [v12 setObject:@"PTPCamera" forKeyedSubscript:@"DeviceType"];
              [v0 setObject:v12 forKeyedSubscript:@"PTPNode"];
              id v3 = v12;
            }

            else
            {
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18826F000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }

              id v3 = 0LL;
            }

            id v4 = Value;
          }

          else
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v16 = "locationID";
              _os_log_impl(&dword_18826F000, v8, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }

            id v4 = 0LL;
          }
        }

        if (properties) {
          CFRelease(properties);
        }
        properties = 0LL;
        IOObjectRelease(v7);
        io_object_t v7 = IOIteratorNext(existing);
      }

      while (v7);
    }

    else
    {
      id v3 = 0LL;
      id v4 = 0LL;
    }

    if (existing) {
      IOObjectRelease(existing);
    }
  }

  else
  {
    id v4 = 0LL;
    id v3 = 0LL;
  }

  return v0;
}

id get_attached_media_entries()
{
  kern_return_t MatchingServices;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  io_object_t v12;
  io_object_t v13;
  os_log_s *v14;
  kern_return_t v15;
  __int16 v16;
  os_log_s *v17;
  const char *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  os_log_s *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  int v36;
  id v37;
  void *v38;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  uint8_t v44;
  _BYTE v45[15];
  uint8_t v46;
  _BYTE v47[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v50[4];
  uint64_t v51;
  uint8_t v52[4];
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  _BYTE v58[2168];
  uint64_t v59;
  v59 = *MEMORY[0x1895F89C0];
  properties = 0LL;
  existing = 0;
  bzero(v58, 0x878uLL);
  mach_port_t v0 = *MEMORY[0x1896086B0];
  CFMutableDictionaryRef v1 = IOServiceMatching("IOMedia");
  MatchingServices = IOServiceGetMatchingServices(v0, v1, &existing);
  id v3 = 0LL;
  id v4 = 0LL;
  int v5 = 0LL;
  io_object_t v6 = 0LL;
  io_object_t v7 = 0LL;
  id v8 = 0LL;
  id v9 = 0LL;
  int v10 = 0LL;
  if (!MatchingServices)
  {
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    if (v11)
    {
      id v3 = v11;
      uint64_t v12 = IOIteratorNext(existing);
      if (v12)
      {
        id v13 = v12;
        uint64_t v42 = v3;
        v43 = 0LL;
        int v10 = 0LL;
        id v9 = 0LL;
        id v8 = 0LL;
        io_object_t v7 = 0LL;
        io_object_t v6 = 0LL;
        int v5 = 0LL;
        id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
        __int128 v41 = 1;
        while (1)
        {
          if (!is_disk_image(v13))
          {
            id v15 = IORegistryEntryCreateCFProperties(v13, &properties, 0LL, 0);
            if (v15)
            {
              uint64_t v16 = v15;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v55) = v16 & 0x3FFF;
                id v17 = v14;
                uint64_t v18 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                uint64_t v19 = 8;
LABEL_9:
                _os_log_impl(&dword_18826F000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
              }
            }

            else
            {
              if (properties)
              {
                CFDictionaryGetValue(properties, @"BSD Name");
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

                isNSString(v20);
                int v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  uint64_t v22 = (void *)[objc_alloc(NSString) initWithFormat:@"/dev/%@", v20];

                  if (v22)
                  {
                    CFDictionaryGetValue(properties, @"Content");
                    id v23 = (void *)objc_claimAutoreleasedReturnValue();

                    isNSString(v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                    {
                      if ([@"C12A7328-F81F-11D2-BA4B-00A0C93EC93B" isEqualToString:v23])
                      {
                        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                          get_attached_media_entries_cold_1(&v46, v47, v25);
                        }
LABEL_32:
                        int v5 = v22;
                        io_object_t v7 = v23;
                        id v8 = v20;
                        goto LABEL_33;
                      }

                      if ([@"Apple_partition_map" isEqualToString:v23])
                      {
                        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                          get_attached_media_entries_cold_2(&v44, v45, v27);
                        }
                        goto LABEL_32;
                      }

                      CFDictionaryGetValue(properties, @"Removable");
                      v28 = (void *)objc_claimAutoreleasedReturnValue();

                      isNSNumber(v28);
                      size_t v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        if (([v28 BOOLValue] & 1) == 0
                          && (serviceIsAttachedToRemovableDevice(v13) & 1) == 0)
                        {
                          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                            get_attached_media_entries_cold_4(v52, (uint64_t)v20, &v53);
                          }
                          int v5 = v22;
                          io_object_t v7 = v23;
                          id v8 = v20;
LABEL_60:
                          int v10 = v28;
LABEL_33:
                          id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                          goto LABEL_34;
                        }

                        CFDictionaryGetValue(properties, @"Leaf");
                        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

                        isNSNumber(v30);
                        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v31)
                        {
                          if (([v30 BOOLValue] & 1) == 0)
                          {
                            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
                              get_attached_media_entries_cold_3(v50, (uint64_t)v20, &v51);
                            }
                            int v5 = v22;
                            io_object_t v7 = v23;
                            id v8 = v20;
                            id v9 = v30;
                            goto LABEL_60;
                          }

                          v40 = v30;
                          CFDictionaryGetValue(properties, @"Writable");
                          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

                          uint64_t v33 = isNSNumber(v32);
                          if (v33)
                          {
                            v34 = (void *)v33;
                            v35 = [v32 BOOLValue];

                            v41 &= v35 ^ 1;
                          }

                          v36 = determine_filesystem_type();
                          if (v36 == 4 || (v36 & 3) == 1)
                          {
                            int v5 = v22;
                            [v5 UTF8String];
                            if ((unint64_t)__strlcpy_chk() >= 0x400)
                            {
                              int v10 = v28;
                              id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                              if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_73;
                              }
LABEL_72:
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_18826F000, v14, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                              goto LABEL_73;
                            }

                            int v5 = v5;
                            [v5 UTF8String];
                            if ((unint64_t)__strlcpy_chk() >= 0x400)
                            {
                              int v10 = v28;
                              id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                              if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_73;
                              }
                              goto LABEL_72;
                            }

                            if ((unint64_t)__strlcpy_chk() >= 0x10)
                            {
                              int v10 = v28;
                              id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
                                goto LABEL_72;
                              }
LABEL_73:
                              io_object_t v6 = v32;
                              io_object_t v7 = v23;
                              id v8 = v20;
                              id v9 = v40;
                              goto LABEL_34;
                            }

                            create_map_entry((uint64_t)v58, 0LL, 0LL);
                            v37 = (id)objc_claimAutoreleasedReturnValue();

                            if (!v37)
                            {
                              int v10 = v28;
                              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412290;
                                v55 = (const char *)v5;
                                id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                                _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create map entry for %@.",  buf,  0xCu);
                                v43 = 0LL;
                                goto LABEL_73;
                              }

                              v43 = 0LL;
                              io_object_t v6 = v32;
                              io_object_t v7 = v23;
                              id v8 = v20;
                              id v9 = v40;
                              goto LABEL_33;
                            }
                          }

                          else
                          {
                            v37 = objc_alloc_init(MEMORY[0x189603FC8]);

                            if (!v37)
                            {
                              int v10 = v28;
                              id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                              if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl( &dword_18826F000,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
                              }

                              v43 = 0LL;
                              int v5 = v22;
                              goto LABEL_73;
                            }

                            [v37 setObject:@"MassStorage" forKeyedSubscript:@"DeviceType"];
                            [v37 setObject:v22 forKeyedSubscript:@"DeviceNode"];
                            [v37 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"IsMounted"];
                            [MEMORY[0x189607968] numberWithBool:v41 & 1];
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            [v37 setObject:v38 forKeyedSubscript:@"IsReadOnly"];
                          }

                          [v42 setObject:v37 forKeyedSubscript:v22];
                          v43 = v37;
                          int v5 = v22;
                          io_object_t v6 = v32;
                          io_object_t v7 = v23;
                          id v8 = v20;
                          id v9 = v30;
                          goto LABEL_60;
                        }

                        id v9 = v30;
                        int v10 = v28;
                        id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v55 = (const char *)v20;
                          __int128 v56 = 2080;
                          char v57 = "Leaf";
                          uint32_t v26 = v14;
LABEL_26:
                          _os_log_impl( &dword_18826F000,  v26,  OS_LOG_TYPE_DEFAULT,  "The attached media object %@ does not have a '%s' flag.",  buf,  0x16u);
                        }
                      }

                      else
                      {
                        int v10 = v28;
                        id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v55 = (const char *)v20;
                          __int128 v56 = 2080;
                          char v57 = "Removable";
                          uint32_t v26 = v14;
                          goto LABEL_26;
                        }
                      }
                    }

                    else
                    {
                      id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v55 = (const char *)v20;
                        __int128 v56 = 2080;
                        char v57 = "Content";
                        uint32_t v26 = v14;
                        goto LABEL_26;
                      }
                    }

                    int v5 = v22;
                    io_object_t v7 = v23;
                  }

                  else
                  {
                    id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_18826F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }

                    int v5 = 0LL;
                  }
                }

                else
                {
                  id v14 = (os_log_s *)MEMORY[0x1895F8DA0];
                  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v55 = "BSD Name";
                    _os_log_impl(&dword_18826F000, v14, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                  }
                }

                id v8 = v20;
                goto LABEL_34;
              }

              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                id v17 = v14;
                uint64_t v18 = "Failed to retrieve any properties for the matched service.";
                uint64_t v19 = 2;
                goto LABEL_9;
              }
            }
          }

LABEL_34:
          IOObjectRelease(v13);
          if (properties) {
            CFRelease(properties);
          }
          properties = 0LL;
          id v13 = IOIteratorNext(existing);
          if (!v13)
          {
            id v3 = v42;
            id v4 = v43;
            goto LABEL_82;
          }
        }
      }
    }

    else
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Failed to create dictionary.",  buf,  2u);
      }

      id v3 = 0LL;
    }

    id v4 = 0LL;
    int v5 = 0LL;
    io_object_t v6 = 0LL;
    io_object_t v7 = 0LL;
    id v8 = 0LL;
    id v9 = 0LL;
    int v10 = 0LL;
  }

LABEL_82:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v3;
}

uint64_t serviceIsAttachedToRemovableDevice(io_object_t a1)
{
  kern_return_t ParentEntry;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  id v13 = &v12;
  id v14 = 0x2020000000LL;
  id v15 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  id v9 = (void (*)(void))__serviceIsAttachedToRemovableDevice_block_invoke;
  int v10 = &unk_18A2129A0;
  id v11 = &v12;
  CFMutableDictionaryRef v2 = v8;
  id v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v19 = ParentEntry & 0x3FFF;
        _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "IORegistryEntryGetParentEntry failed: 0x%04x",  buf,  8u);
      }
    }
  }

LABEL_3:
  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_188273E60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

id get_attached_entries()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v0)
  {
    get_attached_ptp_entries();
    CFMutableDictionaryRef v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1) {
      [v0 addEntriesFromDictionary:v1];
    }
    get_attached_media_entries();
    CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2) {
      [v0 addEntriesFromDictionary:v2];
    }
    get_mounted_media_entries();
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      [v0 addEntriesFromDictionary:v3];
    }
  }

  return v0;
}

id lookup_mass_storage_entry(void *a1)
{
  CFMutableDictionaryRef v1 = (void *)objc_claimAutoreleasedReturnValue();
  CFMutableDictionaryRef v2 = v1;
  if (v1
    && [v1 count]
    && ([v2 objectAtIndex:0],
        uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(),
        isNSDictionary(v3),
        id v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    [v2 objectAtIndex:0];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v5 = 0LL;
  }

  return v5;
}

id lookup_map_entries(void *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v30 = a2;
  id v29 = a3;
  if (!v5 || !v30 || !v29)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }

    goto LABEL_26;
  }

  uint64_t v6 = get_attached_entries();
  if (!v6)
  {
    BOOL v23 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v23) {
      lookup_map_entries_cold_1(v23, v24, v25);
    }
LABEL_26:
    id v28 = 0LL;
    uint32_t v26 = 0LL;
    int v10 = 0LL;
    id v7 = 0LL;
    goto LABEL_32;
  }

  id v7 = (id)v6;
  id v28 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v28)
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v7 = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v32 = 0LL;
      int v10 = 0LL;
      uint64_t v11 = *(void *)v34;
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        uint64_t v13 = 0LL;
        uint64_t v31 = v9;
        do
        {
          id v14 = v10;
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v7);
          }
          [v7 objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * v13)];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 objectForKeyedSubscript:@"DeviceType"];
          int v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if ([v10 isEqual:v5])
            {
              uint64_t v16 = v11;
              id v17 = v7;
              id v18 = v5;
              [v15 objectForKeyedSubscript:v30];
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

              uint64_t v20 = isNSString(v19);
              if (v20)
              {
                int v21 = (void *)v20;
                int v22 = [v19 isEqual:v29];

                if (v22) {
                  [v28 addObject:v15];
                }
              }

              uint64_t v32 = v19;
              id v5 = v18;
              id v7 = v17;
              uint64_t v11 = v16;
              uint64_t v9 = v31;
            }
          }

          else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = @"DeviceType";
            _os_log_impl(&dword_18826F000, v12, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          ++v13;
        }

        while (v9 != v13);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }

      while (v9);
    }

    else
    {
      uint64_t v32 = 0LL;
      int v10 = 0LL;
    }

    uint32_t v26 = v32;
  }

  else
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }

    id v28 = 0LL;
    uint32_t v26 = 0LL;
    int v10 = 0LL;
  }

id lookup_disk_image_entries(void *a1)
{
  return lookup_map_entries(@"DiskImage", @"DiskImageType", a1);
}

id lookup_mount_entry(void *a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  get_attached_entries();
  CFMutableDictionaryRef v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v20 = v3;
      id v7 = 0LL;
      uint64_t v8 = *(void *)v22;
LABEL_4:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        [v4 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v9)];
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        isNSDictionary(v10);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          uint64_t v12 = [v10 objectForKeyedSubscript:@"MountPath"];

          id v7 = (void *)v12;
        }

        uint64_t v13 = isNSString(v7);
        if (v13)
        {
          id v14 = (void *)v13;
          char v15 = [v7 isEqualToString:v1];

          if ((v15 & 1) != 0) {
            break;
          }
        }

        if (v6 == ++v9)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v6) {
            goto LABEL_4;
          }
          int v10 = 0LL;
          break;
        }
      }

      uint64_t v3 = v20;
    }

    else
    {
      id v7 = 0LL;
      int v10 = 0LL;
    }
  }

  else
  {
    BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v16) {
      lookup_map_entries_cold_1(v16, v17, v18);
    }
    id v7 = 0LL;
    int v10 = 0LL;
  }

  return v10;
}

void __serviceIsAttachedToRemovableDevice_block_invoke(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0LL, 0);
  if (CFProperty)
  {
    uint64_t v6 = CFProperty;
    if (CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x189604DE8]))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      *a3 = 1;
    }

    CFRelease(v6);
  }

id makePathWithSignature(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)[objc_alloc(NSString) initHexStringWithData:v3];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      uint64_t v8 = 0LL;
      id v7 = 0LL;
      uint64_t v9 = 0LL;
      goto LABEL_10;
    }

    *(_WORD *)buf = 0;
    int v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v11 = "Failed to create hex string with data.";
    uint32_t v12 = 2;
LABEL_8:
    _os_log_impl(&dword_18826F000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
    goto LABEL_9;
  }

  if ([v5 length] != 256 && objc_msgSend(v6, "length") != 96 && objc_msgSend(v6, "length") != 40)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109378;
    int v16 = [v6 length];
    __int16 v17 = 2112;
    id v18 = v3;
    int v10 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v11 = "Unsupported signature length: %d characters (%@)";
    uint32_t v12 = 18;
    goto LABEL_8;
  }

  objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"%@/%@/%@", v4, v7, v8];
LABEL_10:
  id v13 = v9;

  return v13;
}

uint64_t path_is_bad(const char *a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400) {
    goto LABEL_18;
  }
  *(void *)buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v21 = 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  char v15 = __path_contains_links_block_invoke;
  int v16 = &unk_18A212A08;
  __int16 v17 = buf;
  id v18 = a1;
  CFMutableDictionaryRef v2 = v14;
  [MEMORY[0x1896078A8] defaultManager];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFileSystemRepresentation:a1 length:strlen(a1)];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 pathComponents];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    uint64_t v7 = [v6 count];
    if (v7)
    {
      do
      {
        [NSString pathWithComponents:v6];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
          uint64_t v11 = [v10 fileSystemRepresentation];
          if (!((unsigned int (*)(void *, uint64_t))v15)(v2, v11))
          {

            break;
          }

          [v6 removeLastObject];
        }
      }

      while (--v7);
    }
  }

  int v12 = *(unsigned __int8 *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  if (v12 || !realpath_DARWIN_EXTSN(a1, __s1) || (uint64_t result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }

    return 1LL;
  }

  return result;
}

void sub_188274A00(_Unwind_Exception *a1)
{
}

uint64_t remove_item_at_path(const char *a1, removefile_flags_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int value = 0;
  id v4 = removefile_state_alloc();
  if (v4)
  {
    uint64_t v5 = v4;
    if (removefile_state_set(v4, 3u, removefile_error_callback)
      && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      int v19 = v6;
      __int16 v20 = 2080;
      char v21 = v8;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      id v10 = __error();
      uint64_t v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v19 = v9;
      __int16 v20 = 2080;
      char v21 = v11;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "removefile_state_set failed: %d (%s)",  buf,  0x12u);
    }

    if (removefile(a1, v5, a2))
    {
      uint64_t v12 = 0LL;
      if (*__error() != 2 || value) {
        goto LABEL_17;
      }
    }

    else if (value)
    {
      uint64_t v12 = 0LL;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }

    uint64_t v12 = 1LL;
    goto LABEL_17;
  }

  uint64_t v12 = 0LL;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *__error();
    id v14 = __error();
    char v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    int v19 = v13;
    __int16 v20 = 2080;
    char v21 = v15;
    _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "removefile_state_alloc failed: %d (%s)",  buf,  0x12u);
    return 0LL;
  }

  return v12;
}

uint64_t removefile_error_callback(_removefile_state *a1, const char *a2, int *a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int dst = 0;
  memset(&v18, 0, sizeof(v18));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v5;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "removefile_state_get failed: %{errno}d",  buf,  8u);
    }

    int dst = 2;
    goto LABEL_17;
  }

  if (dst == 1)
  {
    if (lstat(a2, &v18))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *__error();
        uint64_t v7 = __error();
        uint64_t v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        char v21 = a2;
        __int16 v22 = 1024;
        int v23 = v6;
        __int16 v24 = 2080;
        uint64_t v25 = v8;
        int v9 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v10 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl(&dword_18826F000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Cu);
      }
    }

    else
    {
      if ((v18.st_flags & 2) == 0) {
        goto LABEL_17;
      }
      if (lchflags(a2, v18.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v11 = *__error();
        uint64_t v12 = __error();
        int v13 = strerror(*v12);
        *(_DWORD *)buf = 136315650;
        char v21 = a2;
        __int16 v22 = 1024;
        int v23 = v11;
        __int16 v24 = 2080;
        uint64_t v25 = v13;
        int v9 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v10 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }

      if (!unlink(a2)) {
        return 0LL;
      }
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = *__error();
        char v15 = __error();
        int v16 = strerror(*v15);
        *(_DWORD *)buf = 136315650;
        char v21 = a2;
        __int16 v22 = 1024;
        int v23 = v14;
        __int16 v24 = 2080;
        uint64_t v25 = v16;
        int v9 = (os_log_s *)MEMORY[0x1895F8DA0];
        id v10 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }

LABEL_17:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0LL;
}

  if (v37) {
    goto LABEL_28;
  }
  v38 = v38;
  int v39 = 0LL;
  *a5 = v38;
LABEL_29:
  v43 = v39;

  return v43;
}

id copyGroupContainerPath(void *a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  CFMutableDictionaryRef v2 = v1;
  if (!v1)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "Invalid input.";
      uint32_t v9 = 2;
LABEL_8:
      _os_log_impl(&dword_18826F000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    }

LABEL_9:
    int v6 = 0LL;
    goto LABEL_10;
  }

  id v3 = v1;
  [v3 UTF8String];
  uint64_t v4 = container_system_group_path_for_identifier();
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 1024;
      int v14 = 1;
      uint64_t v7 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v8 = "Failed to copy system group container (%@): %d";
      uint32_t v9 = 18;
      goto LABEL_8;
    }

    goto LABEL_9;
  }

  int v5 = (void *)v4;
  int v6 = (void *)[objc_alloc(NSString) initWithUTF8String:v4];
  free(v5);
LABEL_10:

  return v6;
}

  return v13;
}

id copyWorkingDirectory()
{
  if (copyWorkingDirectory_onceToken != -1) {
    dispatch_once(&copyWorkingDirectory_onceToken, &__block_literal_global);
  }
  return (id)copyWorkingDirectory_retval;
}

void __copyWorkingDirectory_block_invoke()
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"backingStore"];
  id v1 = (void *)copyWorkingDirectory_retval;
  copyWorkingDirectory_retval = v0;
}

uint64_t mobileStorageErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = v6;
  uint64_t v8 = 0LL;
  if (v5 && v6)
  {
    uint64_t v9 = *MEMORY[0x189607798];
    do
    {
      [v5 domain];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 isEqualToString:v7])
      {
        uint64_t v11 = [v5 code];

        if (v11 == a3)
        {
          uint64_t v8 = 1LL;
          goto LABEL_10;
        }
      }

      else
      {
      }

      [v5 userInfo];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v12 objectForKeyedSubscript:v9];

      id v5 = (id)v13;
    }

    while (v13);
    uint64_t v8 = 0LL;
  }

id copyDeviceTreeProperty(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  CFTypeRef CFProperty = 0LL;
  if (a1 && v3)
  {
    io_registry_entry_t v6 = IORegistryEntryFromPath( *MEMORY[0x1896086A8], (const char *)[a1 fileSystemRepresentation]);
    if (v6)
    {
      io_object_t v7 = v6;
      CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0LL, 0);
      IOObjectRelease(v7);
    }

    else
    {
      CFTypeRef CFProperty = 0LL;
    }
  }

  return CFProperty;
}

id copyDeviceTreeInt(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  io_registry_entry_t v6 = v5;
  io_object_t v7 = 0LL;
  unsigned int v13 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v8 = v5;
  if (a2)
  {
    copyDeviceTreeProperty(a1, a2);
    io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = isNSData(v7);
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = [v7 length];

      if (v11 == 4)
      {
        [v7 getBytes:&v13 length:4];
        [MEMORY[0x189607968] numberWithInt:v13];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
    }

LABEL_6:
    uint64_t v8 = v6;
  }

LABEL_7:
  return v8;
}

    int v14 = v14;
    *a4 = v14;
    goto LABEL_8;
  }

  uint64_t v15 = 0LL;
LABEL_9:

  return v15;
}

uint64_t exchange_with_first_child_of_class(io_object_t *a1, const char *a2)
{
  uint64_t v2 = 0LL;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    if (MEMORY[0x1895BFF54](*a1, "IOService", &iterator))
    {
      uint64_t v2 = 0LL;
    }

    else
    {
      while (1)
      {
        uint64_t v5 = IOIteratorNext(iterator);
        uint64_t v2 = v5;
        if (!(_DWORD)v5) {
          break;
        }
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          uint64_t v2 = 1LL;
          break;
        }

        IOObjectRelease(v2);
      }
    }

    if (iterator) {
      IOObjectRelease(iterator);
    }
  }

  return v2;
}

uint64_t __path_contains_links_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    uint64_t result = 1LL;
    if ((v8.st_mode & 0xF000) != 0xA000) {
      return result;
    }
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  if (*__error() == 2) {
    return 1LL;
  }
  BOOL v3 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0LL;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *__error();
    io_registry_entry_t v6 = __error();
    io_object_t v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = v7;
    _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0LL;
  }

  return result;
}

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

id MobileStorageCopyDevices(const __CFDictionary *a1)
{
  return MobileStorageCopyDevicesWithError(a1, 0LL);
}

id MobileStorageCopyDevicesWithError(const __CFDictionary *a1, void *a2)
{
  if (a1 && (Value = (void *)CFDictionaryGetValue(a1, @"PerformLosslessQuery")) != 0LL)
  {
    uint64_t v4 = Value;
    isNSNumber(Value);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyDevicesWithError",  42LL,  -3,  0LL,  @"Invalid value for option %@: %@",  v6,  v7,  v8,  (uint64_t)@"PerformLosslessQuery");
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x189604A80];
  }

  [v4 BOOLValue];
  get_attached_entries();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    __int16 v13 = v9;
    [v9 allValues];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    id v15 = 0LL;
    goto LABEL_12;
  }

  createMobileStorageError( (uint64_t)"MobileStorageCopyDevicesWithError",  53LL,  -2,  0LL,  @"Failed to retrieve attached device list.",  v10,  v11,  v12,  v18);
LABEL_9:
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v16;
  id v14 = 0LL;
  if (a2 && v16)
  {
    id v15 = v16;
    id v14 = 0LL;
    *a2 = v15;
  }

LABEL_12:
  return v14;
}

  if (!v31) {
    *a4 = v30;
  }
LABEL_14:
  if (v25) {
    CFRelease(v25);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (cf) {
    CFRelease(cf);
  }
  cf = 0LL;

  return v31;
}
}

CFTypeRef MobileStorageMount( const void *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MobileStorageMountWithError(a1, a2, 0LL, a4, a5, a6, a7, a8);
}

CFTypeRef MobileStorageMountWithError( const void *a1, const __CFDictionary *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0LL;
  if (!a1 || !a2)
  {
    createMobileStorageError( (uint64_t)"MobileStorageMountWithError",  96LL,  -3,  0LL,  @"Invalid input(s).",  a6,  a7,  a8,  (uint64_t)v49);
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    dict = 0LL;
LABEL_19:
    id v29 = 0LL;
    goto LABEL_20;
  }

  dict = create_dict();
  if (!dict)
  {
    uint64_t v25 = @"Failed to create dictionary.";
    uint64_t v26 = 103LL;
LABEL_17:
    int v28 = -2;
LABEL_18:
    createMobileStorageError((uint64_t)"MobileStorageMountWithError", v26, v28, 0LL, v25, v11, v12, v13, (uint64_t)v49);
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  Value = (void *)CFDictionaryGetValue(a2, @"DiskImageType");
  isNSString(Value);
  int v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    uint64_t v25 = @"Invalid value for required option %@: %@";
    uint64_t v49 = @"DiskImageType";
    uint64_t v26 = 109LL;
    goto LABEL_17;
  }

  __int16 v17 = (void *)CFDictionaryGetValue(a2, @"ImageSignature");
  isNSData(v17);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    uint64_t v25 = @"Invalid value for required option %@: %@";
    uint64_t v49 = @"ImageSignature";
    uint64_t v26 = 115LL;
    goto LABEL_17;
  }

  int v19 = (void *)CFDictionaryGetValue(a2, @"ImageTrustCache");
  __int16 v20 = v19;
  if (v19)
  {
    isNSData(v19);
    char v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      uint64_t v25 = @"Invalid value for option %@: %@";
      uint64_t v49 = @"ImageTrustCache";
      uint64_t v26 = 121LL;
      goto LABEL_42;
    }
  }

  if ([Value isEqualToString:@"Cryptex"])
  {
    isNSData(v20);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      uint64_t v25 = @"Invalid value for required option %@: %@";
      uint64_t v49 = @"ImageTrustCache";
      uint64_t v26 = 127LL;
      goto LABEL_42;
    }

    int v23 = (void *)CFDictionaryGetValue(a2, @"ImageInfoPlist");
    __int16 v24 = v23;
    if (v23)
    {
      isNSData(v23);
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
      {
        uint64_t v25 = @"Invalid value for option %@: %@";
        uint64_t v49 = @"ImageInfoPlist";
        uint64_t v26 = 133LL;
LABEL_42:
        int v28 = -3;
        goto LABEL_18;
      }
    }
  }

  else
  {
    __int16 v24 = 0LL;
  }

  CFDictionarySetValue(dict, @"RequestType", @"Mount");
  CFDictionarySetValue(dict, @"DeviceType", @"DiskImage");
  CFDictionarySetValue(dict, @"DiskImagePath", a1);
  CFDictionarySetValue(dict, @"DiskImageType", Value);
  CFDictionarySetValue(dict, @"ImageSignature", v17);
  if (v20) {
    CFDictionarySetValue(dict, @"ImageTrustCache", v20);
  }
  if (v24) {
    CFDictionarySetValue(dict, @"ImageInfoPlist", v24);
  }
  v38 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  dict,  (uint64_t)a2,  &cf,  v34,  v35,  v36,  v37);
  id v29 = v38;
  if (!v38)
  {
    createMobileStorageError( (uint64_t)"MobileStorageMountWithError",  166LL,  -2,  (void *)cf,  @"Failed to receive response message from server.",  v39,  v40,  v41,  (uint64_t)v49);
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    BOOL v30 = 1;
    if (!a3) {
      goto LABEL_24;
    }
LABEL_21:
    if (v30 && v27) {
      *a3 = v27;
    }
LABEL_24:
    CFTypeRef v31 = 0LL;
    CFTypeRef v32 = 0LL;
    if (!v29) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }

  uint64_t v42 = CFDictionaryGetValue(v38, @"DetailedError");
  if (v42)
  {
    v43 = v42;
    CFStringGetTypeID();
    CFGetTypeID(v43);
  }

  uint64_t v44 = (void *)CFDictionaryGetValue(v29, @"MountPath");
  isNSString(v44);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError( (uint64_t)"MobileStorageMountWithError",  179LL,  -2,  0LL,  @"Invalid value for %@: %@",  v46,  v47,  v48,  (uint64_t)@"MountPath");
    int v27 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v30 = v44 == 0LL;
    if (!a3) {
      goto LABEL_24;
    }
    goto LABEL_21;
  }

  CFTypeRef v31 = CFRetain(v44);
  int v27 = 0LL;
LABEL_25:
  CFRelease(v29);
  CFTypeRef v32 = v31;
LABEL_26:
  if (dict) {
    CFRelease(dict);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v32;
}

uint64_t MobileStorageUnmount(const __CFString *a1, uint64_t a2)
{
  return MobileStorageUnmountWithError(a1, a2, 0LL);
}

uint64_t MobileStorageUnmountWithError(const __CFString *a1, uint64_t a2, void *a3)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v10 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageUnmountWithError",  224LL,  -2,  0LL,  @"Failed to create dictionary.",  v7,  v8,  v9,  (uint64_t)v29);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = 0LL;
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  CFDictionarySetValue(dict, @"RequestType", @"Unmount");
  CFDictionarySetValue(v10, @"MountPath", a1);
  id v15 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v10,  a2,  &cf,  v11,  v12,  v13,  v14);
  int v19 = v15;
  if (!v15)
  {
    int v23 = (void *)cf;
    __int16 v24 = @"Failed to receive response message from server.";
    uint64_t v25 = 237LL;
    goto LABEL_14;
  }

  Value = CFDictionaryGetValue(v15, @"DetailedError");
  if (Value)
  {
    char v21 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v21);
  }

  uint64_t v26 = CFDictionaryGetValue(v19, @"Status");
  if (!v26)
  {
    __int16 v24 = @"Invalid value for %@: %@";
    id v29 = @"Status";
    uint64_t v25 = 250LL;
LABEL_13:
    int v23 = 0LL;
LABEL_14:
    createMobileStorageError((uint64_t)"MobileStorageUnmountWithError", v25, -2, v23, v24, v16, v17, v18, (uint64_t)v29);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_17;
    }
LABEL_15:
    if (v22) {
      *a3 = v22;
    }
LABEL_17:
    uint64_t v27 = 0xFFFFFFFFLL;
    if (!v19) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  if (!CFEqual(v26, @"Success"))
  {
    __int16 v24 = @"Failed to unmount %@: %@";
    id v29 = a1;
    uint64_t v25 = 256LL;
    goto LABEL_13;
  }

  uint64_t v27 = 0LL;
  __int16 v22 = 0LL;
LABEL_18:
  CFRelease(v19);
LABEL_19:
  if (v10) {
    CFRelease(v10);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v27;
}

uint64_t MobileStorageSync(const __CFString *a1, uint64_t a2)
{
  return MobileStorageSyncWithError(a1, a2, 0LL);
}

uint64_t MobileStorageSyncWithError(const __CFString *a1, uint64_t a2, void *a3)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v10 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageSyncWithError",  300LL,  -2,  0LL,  @"Failed to create dictionary.",  v7,  v8,  v9,  (uint64_t)v29);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v19 = 0LL;
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  CFDictionarySetValue(dict, @"RequestType", @"Sync");
  CFDictionarySetValue(v10, @"MountPath", a1);
  id v15 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v10,  a2,  &cf,  v11,  v12,  v13,  v14);
  int v19 = v15;
  if (!v15)
  {
    int v23 = (void *)cf;
    __int16 v24 = @"Failed to receive response message from server.";
    uint64_t v25 = 313LL;
    goto LABEL_14;
  }

  Value = CFDictionaryGetValue(v15, @"DetailedError");
  if (Value)
  {
    char v21 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v21);
  }

  uint64_t v26 = CFDictionaryGetValue(v19, @"Status");
  if (!v26)
  {
    __int16 v24 = @"Invalid value for %@: %@";
    id v29 = @"Status";
    uint64_t v25 = 326LL;
LABEL_13:
    int v23 = 0LL;
LABEL_14:
    createMobileStorageError((uint64_t)"MobileStorageSyncWithError", v25, -2, v23, v24, v16, v17, v18, (uint64_t)v29);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_17;
    }
LABEL_15:
    if (v22) {
      *a3 = v22;
    }
LABEL_17:
    uint64_t v27 = 0xFFFFFFFFLL;
    if (!v19) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  if (!CFEqual(v26, @"Success"))
  {
    __int16 v24 = @"Failed to sync %@: %@";
    id v29 = a1;
    uint64_t v25 = 332LL;
    goto LABEL_13;
  }

  uint64_t v27 = 0LL;
  __int16 v22 = 0LL;
LABEL_18:
  CFRelease(v19);
LABEL_19:
  if (v10) {
    CFRelease(v10);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v27;
}

uint64_t MobileStorageRollPersonalizationNonceWithError(const __CFDictionary *a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRollPersonalizationNonceWithError",  365LL,  -2,  0LL,  @"Failed to create dictionary.",  v4,  v5,  v6,  (uint64_t)v35);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v22 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_21;
  }

  CFDictionaryGetValue(a1, @"PersonalizedImageType");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    isNSString(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      createMobileStorageError( (uint64_t)"MobileStorageRollPersonalizationNonceWithError",  372LL,  -3,  0LL,  @"Invalid value for options key: %@",  v11,  v12,  v13,  (uint64_t)@"PersonalizedImageType");
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      __int16 v22 = 0LL;
      goto LABEL_21;
    }

    CFDictionarySetValue(dict, @"PersonalizedImageType", v9);
  }

  CFDictionarySetValue(dict, @"RequestType", @"RollPersonalizationNonce");
  uint64_t v18 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  dict,  (uint64_t)a1,  &cf,  v14,  v15,  v16,  v17);
  __int16 v22 = v18;
  if (v18)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v18, @"DetailedError");
    if (Value)
    {
      __int16 v24 = Value;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v24)) {
        uint64_t v26 = v24;
      }
      else {
        uint64_t v26 = 0LL;
      }
    }

    else
    {
      uint64_t v26 = 0LL;
    }

    CFTypeRef v31 = CFDictionaryGetValue(v22, @"Status");
    if (v31)
    {
      if (CFEqual(v31, @"Success"))
      {
        uint64_t v27 = 0LL;
        uint64_t v32 = 1LL;
LABEL_24:
        CFRelease(v22);
        uint64_t v33 = v32;
        goto LABEL_25;
      }

      id v29 = @"Failed to roll personalization nonce: %@";
      uint64_t v35 = v26;
      uint64_t v30 = 401LL;
    }

    else
    {
      id v29 = @"Invalid value for %@: %@";
      uint64_t v35 = @"Status";
      uint64_t v30 = 395LL;
    }

    int v28 = 0LL;
  }

  else
  {
    int v28 = (void *)cf;
    id v29 = @"Failed to receive response message from server.";
    uint64_t v30 = 382LL;
  }

  createMobileStorageError( (uint64_t)"MobileStorageRollPersonalizationNonceWithError",  v30,  -2,  v28,  v29,  v19,  v20,  v21,  (uint64_t)v35);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  if (a2) {
    *a2 = v27;
  }
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  if (v22) {
    goto LABEL_24;
  }
LABEL_25:
  if (dict) {
    CFRelease(dict);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v33;
}

uint64_t MobileStorageRollCryptexNonceWithError(uint64_t a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v8 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRollCryptexNonceWithError",  433LL,  -2,  0LL,  @"Failed to create dictionary.",  v5,  v6,  v7,  (uint64_t)v30);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = 0LL;
    if (!a2)
    {
LABEL_19:
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      if (!v17) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }

LABEL_18:
    *a2 = v22;
    goto LABEL_19;
  }

  CFDictionarySetValue(dict, @"RequestType", @"RollCryptexNonce");
  uint64_t v13 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v8,  a1,  &cf,  v9,  v10,  v11,  v12);
  uint64_t v17 = v13;
  if (!v13)
  {
    int v23 = (void *)cf;
    __int16 v24 = @"Failed to receive response message from server.";
    uint64_t v25 = 441LL;
    goto LABEL_17;
  }

  Value = (const __CFString *)CFDictionaryGetValue(v13, @"DetailedError");
  if (Value)
  {
    uint64_t v19 = Value;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v19)) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  uint64_t v26 = CFDictionaryGetValue(v17, @"Status");
  if (!v26)
  {
    __int16 v24 = @"Invalid value for %@: %@";
    uint64_t v30 = @"Status";
    uint64_t v25 = 454LL;
LABEL_16:
    int v23 = 0LL;
LABEL_17:
    createMobileStorageError( (uint64_t)"MobileStorageRollCryptexNonceWithError",  v25,  -2,  v23,  v24,  v14,  v15,  v16,  (uint64_t)v30);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a2) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  if (!CFEqual(v26, @"Success"))
  {
    __int16 v24 = @"Failed to roll cryptex nonce: %@";
    uint64_t v30 = v21;
    uint64_t v25 = 460LL;
    goto LABEL_16;
  }

  __int16 v22 = 0LL;
  uint64_t v27 = 1LL;
LABEL_20:
  CFRelease(v17);
  uint64_t v28 = v27;
LABEL_21:
  if (v8) {
    CFRelease(v8);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v28;
}

  if (a2 && !v28) {
    *a2 = v27;
  }
  if (v22) {
    CFRelease(v22);
  }
  if (dict) {
    CFRelease(dict);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v28;
}

  if (a5 && !v19) {
    *a5 = v18;
  }

  return v19;
}

CFTypeRef MobileStorageCopyPersonalizationNonceWithError(const __CFDictionary *a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  if (dict)
  {
    CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (!v8) {
      goto LABEL_5;
    }
    isNSString(v8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      CFDictionarySetValue(dict, @"PersonalizedImageType", v9);
LABEL_5:
      CFDictionarySetValue(dict, @"RequestType", @"CopyPersonalizationNonce");
      uint64_t v18 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  dict,  (uint64_t)a1,  &cf,  v14,  v15,  v16,  v17);
      __int16 v22 = v18;
      if (v18)
      {
        Value = CFDictionaryGetValue(v18, @"DetailedError");
        if (Value)
        {
          __int16 v24 = Value;
          CFTypeID TypeID = CFStringGetTypeID();
          if (TypeID == CFGetTypeID(v24)) {
            uint64_t v26 = (uint64_t)v24;
          }
          else {
            uint64_t v26 = 0LL;
          }
        }

        else
        {
          uint64_t v26 = 0LL;
        }

        uint64_t v32 = (void *)CFDictionaryGetValue(v22, @"PersonalizationNonce");
        isNSData(v32);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          CFTypeRef v28 = CFRetain(v32);
          uint64_t v27 = 0LL;
          goto LABEL_18;
        }

        uint64_t v30 = @"Failed to retrieve personalization nonce: %@";
        uint64_t v35 = v26;
        uint64_t v31 = 522LL;
        id v29 = 0LL;
      }

      else
      {
        id v29 = (void *)cf;
        uint64_t v30 = @"Failed to receive response message from server.";
        uint64_t v31 = 510LL;
      }

      createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationNonceWithError",  v31,  -2,  v29,  v30,  v19,  v20,  v21,  v35);
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      CFTypeRef v28 = 0LL;
      goto LABEL_18;
    }

    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationNonceWithError",  500LL,  -3,  0LL,  @"Invalid value for options key: %@",  v11,  v12,  v13,  (uint64_t)@"PersonalizedImageType");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v28 = 0LL;
    __int16 v22 = 0LL;
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationNonceWithError",  493LL,  -2,  0LL,  @"Failed to create dictionary.",  v4,  v5,  v6,  v35);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v28 = 0LL;
    __int16 v22 = 0LL;
    uint64_t v9 = 0LL;
  }

void *MobileStorageCopyPersonalizationIdentifiersWithError(const __CFDictionary *a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, @"RequestType", @"CopyPersonalizationIdentifiers");
    CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v9;
    if (v9)
    {
      isNSString(v9);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError",  565LL,  -3,  0LL,  @"Invalid value for options key: %@",  v16,  v17,  v18,  (uint64_t)@"PersonalizedImageType");
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
        int v23 = 0LL;
        if (!a2) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }

      CFDictionarySetValue(v8, @"PersonalizedImageType", v14);
    }

    uint64_t v19 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v8,  (uint64_t)a1,  &cf,  v10,  v11,  v12,  v13);
    int v23 = v19;
    if (!v19)
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError",  573LL,  -2,  (void *)cf,  @"Failed to receive response message from server.",  v20,  v21,  v22,  v41);
LABEL_12:
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = 0LL;
      if (!a2) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }

    Value = (void *)CFDictionaryGetValue(v19, @"Error");
    uint64_t v25 = isNSString(Value);
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      int v27 = CFEqual(Value, @"UnknownCommand");

      if (v27)
      {
        createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError",  579LL,  -5,  0LL,  @"Unsupported command: %@",  v28,  v29,  v30,  (uint64_t)@"QueryPersonalizationIdentifiers");
        goto LABEL_12;
      }
    }

    uint64_t v32 = CFDictionaryGetValue(v23, @"DetailedError");
    if (v32)
    {
      uint64_t v33 = v32;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v33)) {
        uint64_t v35 = (uint64_t)v33;
      }
      else {
        uint64_t v35 = 0LL;
      }
    }

    else
    {
      uint64_t v35 = 0LL;
    }

    uint64_t v36 = (void *)CFDictionaryGetValue(v23, @"PersonalizationIdentifiers");
    isNSDictionary(v36);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      uint64_t v15 = (void *)CFRetain(v36);
      uint64_t v31 = 0LL;
      if (!a2) {
        goto LABEL_27;
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError",  590LL,  -2,  0LL,  @"Failed to retrieve personalization identifiers: %@",  v37,  v38,  v39,  v35);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a2) {
        goto LABEL_27;
      }
    }
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError",  556LL,  -2,  0LL,  @"Failed to create dictionary.",  v5,  v6,  v7,  v41);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0LL;
    int v23 = 0LL;
    uint64_t v14 = 0LL;
    if (!a2) {
      goto LABEL_27;
    }
  }

LABEL_25:
  if (!v15) {
    *a2 = v31;
  }
LABEL_27:
  if (v23) {
    CFRelease(v23);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v15;
}

void *MobileStorageCopyCryptexNonceWithError(uint64_t a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, @"RequestType", @"CopyCryptexNonce");
    uint64_t v13 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v8,  a1,  &cf,  v9,  v10,  v11,  v12);
    uint64_t v17 = v13;
    if (v13)
    {
      Value = CFDictionaryGetValue(v13, @"DetailedError");
      if (Value)
      {
        uint64_t v19 = Value;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v19)) {
          uint64_t v21 = (uint64_t)v19;
        }
        else {
          uint64_t v21 = 0LL;
        }
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      __int16 v24 = (void *)CFDictionaryGetValue(v17, @"CryptexNonce");
      isNSData(v24);
      int v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        int v23 = (void *)CFRetain(v24);
        uint64_t v22 = 0LL;
        if (!a2) {
          goto LABEL_18;
        }
      }

      else
      {
        createMobileStorageError( (uint64_t)"MobileStorageCopyCryptexNonceWithError",  642LL,  -2,  0LL,  @"Failed to retrieve cryptex nonce: %@",  v25,  v26,  v27,  v21);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a2) {
          goto LABEL_18;
        }
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyCryptexNonceWithError",  630LL,  -2,  (void *)cf,  @"Failed to receive response message from server.",  v14,  v15,  v16,  v29);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      int v23 = 0LL;
      if (!a2) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyCryptexNonceWithError",  622LL,  -2,  0LL,  @"Failed to create dictionary.",  v5,  v6,  v7,  v29);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = 0LL;
    uint64_t v17 = 0LL;
    if (!a2) {
      goto LABEL_18;
    }
  }

  if (!v23) {
    *a2 = v22;
  }
LABEL_18:
  if (v17) {
    CFRelease(v17);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v23;
}

void *MobileStorageCopyPersonalizationManifestWithError( const void *a1, const void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0LL;
  if (!a1 || !a2)
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationManifestWithError",  673LL,  -2,  0LL,  @"Invalid input(s).",  a6,  a7,  a8,  v37);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = 0LL;
    uint64_t v16 = 0LL;
    goto LABEL_11;
  }

  dict = create_dict();
  uint64_t v16 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationManifestWithError",  679LL,  -2,  0LL,  @"Failed to create dictionary.",  v13,  v14,  v15,  v37);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = 0LL;
LABEL_11:
    uint64_t v25 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  CFDictionarySetValue(dict, @"RequestType", @"CopyPersonalizationManifest");
  CFDictionarySetValue(v16, @"PersonalizedImageType", a1);
  CFDictionarySetValue(v16, @"ImageSignature", a2);
  uint64_t v21 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v16,  a3,  &cf,  v17,  v18,  v19,  v20);
  uint64_t v25 = v21;
  if (v21)
  {
    Value = CFDictionaryGetValue(v21, @"DetailedError");
    if (Value)
    {
      uint64_t v27 = Value;
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v27)) {
        uint64_t v29 = (uint64_t)v27;
      }
      else {
        uint64_t v29 = 0LL;
      }
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    uint64_t v33 = (void *)CFDictionaryGetValue(v25, @"ImageSignature");
    isNSData(v33);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      uint64_t v31 = (void *)CFRetain(v33);
      uint64_t v30 = 0LL;
      if (!a4) {
        goto LABEL_14;
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationManifestWithError",  701LL,  -2,  0LL,  @"Failed to retrieve personalization manifest: %@",  v34,  v35,  v36,  v29);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4) {
        goto LABEL_14;
      }
    }
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyPersonalizationManifestWithError",  689LL,  -2,  (void *)cf,  @"Failed to receive response message from server.",  v22,  v23,  v24,  v37);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
  }

uint64_t MobileStorageCopyDeveloperModeStatusWithError(uint64_t a1, void *a2)
{
  CFTypeRef cf = 0LL;
  dict = create_dict();
  uint64_t v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, @"RequestType", @"CopyDeveloperModeStatus");
    uint64_t v13 = (const __CFDictionary *)call_and_response( "com.apple.mobile.storage_mounter.xpc",  v8,  a1,  &cf,  v9,  v10,  v11,  v12);
    uint64_t v17 = v13;
    if (v13)
    {
      Value = CFDictionaryGetValue(v13, @"DetailedError");
      if (Value)
      {
        uint64_t v19 = Value;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v19)) {
          uint64_t v21 = (uint64_t)v19;
        }
        else {
          uint64_t v21 = 0LL;
        }
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      uint64_t v24 = (void *)CFDictionaryGetValue(v17, @"DeveloperModeStatus");
      uint64_t v23 = isNSNumber(v24);

      if (v23)
      {
        uint64_t v23 = [v24 BOOLValue];
        uint64_t v22 = 0LL;
        if (!a2) {
          goto LABEL_18;
        }
      }

      else
      {
        createMobileStorageError( (uint64_t)"MobileStorageCopyDeveloperModeStatusWithError",  753LL,  -2,  0LL,  @"Failed to retrieve developer mode status: %@",  v25,  v26,  v27,  v21);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a2) {
          goto LABEL_18;
        }
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"MobileStorageCopyDeveloperModeStatusWithError",  741LL,  -2,  (void *)cf,  @"Failed to receive response message from server.",  v14,  v15,  v16,  v29);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = 0LL;
      if (!a2) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageCopyDeveloperModeStatusWithError",  733LL,  -2,  0LL,  @"Failed to create dictionary.",  v5,  v6,  v7,  v29);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = 0LL;
    uint64_t v17 = 0LL;
    if (!a2) {
      goto LABEL_18;
    }
  }

  if ((v23 & 1) == 0) {
    *a2 = v22;
  }
LABEL_18:
  if (v17) {
    CFRelease(v17);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0LL;

  return v23;
}

id MobileStorageCopyAndFixPlist(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  +[PlistProcessor sharedPlistProcessor](&OBJC_CLASS___PlistProcessor, "sharedPlistProcessor");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v5 copyAndFixPlist:v4 forMountPoint:v3 withError:0];

  return v6;
}

CFTypeRef MobileStorageRemoteCopyDevicesWithError(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  dict = create_dict();
  uint64_t v9 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDevicesWithError",  292LL,  -2,  0LL,  @"Failed to create dictionary.",  v6,  v7,  v8,  (uint64_t)v29);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  CFDictionarySetValue(dict, @"Command", @"CopyDevices");
  uint64_t v10 = (const __CFDictionary *)call_and_response_remote();
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v18 = @"Failed to receive response message from server.";
    uint64_t v19 = 300LL;
    goto LABEL_18;
  }

  Value = CFDictionaryGetValue(v10, @"DetailedError");
  if (Value)
  {
    uint64_t v16 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v16);
  }

  uint64_t v20 = (void *)CFDictionaryGetValue(v14, @"Status");
  isNSString(v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    uint64_t v18 = @"Invalid value for %@: %@";
    uint64_t v29 = @"Status";
    uint64_t v19 = 311LL;
    goto LABEL_18;
  }

  if (([v20 isEqualToString:@"Complete"] & 1) == 0)
  {
    uint64_t v18 = @"Status is not complete.";
    uint64_t v19 = 316LL;
    goto LABEL_18;
  }

  uint64_t v22 = (void *)CFDictionaryGetValue(v14, @"EntryList");
  if (!v22)
  {
    CFTypeRef v25 = objc_alloc_init(MEMORY[0x189603F18]);
    goto LABEL_16;
  }

  uint64_t v23 = v22;
  isNSArray(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    uint64_t v18 = @"Invalid value for %@: %@";
    uint64_t v29 = @"EntryList";
    uint64_t v19 = 322LL;
LABEL_18:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDevicesWithError",  v19,  -2,  0LL,  v18,  v11,  v12,  v13,  (uint64_t)v29);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_21;
    }
LABEL_19:
    if (v17) {
      *a3 = v17;
    }
LABEL_21:
    CFTypeRef v26 = 0LL;
    CFTypeRef v27 = 0LL;
    if (!v14) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  CFTypeRef v25 = CFRetain(v23);
LABEL_16:
  CFTypeRef v26 = v25;
  uint64_t v17 = 0LL;
LABEL_22:
  CFRelease(v14);
  CFTypeRef v27 = v26;
LABEL_23:
  if (v9) {
    CFRelease(v9);
  }

  return v27;
}

CFTypeRef MobileStorageRemoteCopyMountedImageSignaturesWithError(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  dict = create_dict();
  uint64_t v9 = dict;
  if (!dict)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyMountedImageSignaturesWithError",  358LL,  -2,  0LL,  @"Failed to create dictionary.",  v6,  v7,  v8,  (uint64_t)v27);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }

  CFDictionarySetValue(dict, @"Command", @"LookupImage");
  CFDictionarySetValue(v9, @"ImageType", @"Personalized");
  uint64_t v10 = (const __CFDictionary *)call_and_response_remote();
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v18 = @"Failed to receive response message from server.";
    uint64_t v19 = 367LL;
    goto LABEL_17;
  }

  Value = CFDictionaryGetValue(v10, @"DetailedError");
  if (Value)
  {
    uint64_t v16 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v16);
  }

  uint64_t v20 = (void *)CFDictionaryGetValue(v14, @"Status");
  isNSString(v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    uint64_t v18 = @"Invalid value for %@: %@";
    CFTypeRef v27 = @"Status";
    uint64_t v19 = 378LL;
    goto LABEL_17;
  }

  if (([v20 isEqualToString:@"Complete"] & 1) == 0)
  {
    uint64_t v18 = @"Status is not complete.";
    uint64_t v19 = 383LL;
    goto LABEL_17;
  }

  uint64_t v22 = (void *)CFDictionaryGetValue(v14, @"ImageSignature");
  uint64_t v17 = v22;
  if (!v22)
  {
    CFTypeRef v24 = objc_alloc_init(MEMORY[0x189603F18]);
    goto LABEL_21;
  }

  isNSArray(v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    uint64_t v18 = @"Invalid value for %@: %@";
    CFTypeRef v27 = @"EntryList";
    uint64_t v19 = 389LL;
LABEL_17:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyMountedImageSignaturesWithError",  v19,  -2,  0LL,  v18,  v11,  v12,  v13,  (uint64_t)v27);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3) {
      goto LABEL_20;
    }
LABEL_18:
    if (v17) {
      *a3 = v17;
    }
LABEL_20:
    CFTypeRef v24 = 0LL;
    CFTypeRef v25 = 0LL;
    if (!v14) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  CFTypeRef v24 = CFRetain(v17);
  uint64_t v17 = 0LL;
LABEL_21:
  CFRelease(v14);
  CFTypeRef v25 = v24;
LABEL_22:
  if (v9) {
    CFRelease(v9);
  }

  return v25;
}

uint64_t MobileStorageRemoteMountWithError(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v13 = v9;
  if (!v7 || !v8 || !v9)
  {
    createMobileStorageError( (uint64_t)"mountRemoteImage",  239LL,  -3,  0LL,  @"Invalid input(s).",  v10,  v11,  v12,  v136);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
LABEL_10:
    uint64_t v19 = 0LL;
LABEL_11:
    id v34 = v33;
    char v35 = 0;
    id v36 = v34;
    goto LABEL_12;
  }

  [v9 objectForKeyedSubscript:@"DiskImageType"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    createMobileStorageError( (uint64_t)"mountRemoteImage",  245LL,  -3,  0LL,  @"Missing required option: %@",  v16,  v17,  v18,  (uint64_t)@"DiskImageType");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  [v13 objectForKeyedSubscript:@"ImageSignature"];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v19);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    createMobileStorageError( (uint64_t)"mountRemoteImage",  251LL,  -3,  0LL,  @"Missing required option: %@",  v21,  v22,  v23,  (uint64_t)@"ImageSignature");
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  v141 = v14;
  v139 = v19;
  id v150 = v7;
  id v24 = v8;
  id v25 = v13;
  v157 = 0LL;
  [MEMORY[0x1896078A8] defaultManager];
  CFTypeRef v26 = (void *)objc_claimAutoreleasedReturnValue();
  id v156 = 0LL;
  id v152 = v24;
  uint64_t v27 = [v26 attributesOfItemAtPath:v24 error:&v156];
  id v28 = v156;

  v154 = (void *)v27;
  if (v27)
  {
    uint64_t v32 = v28;
  }

  else
  {
    uint64_t v44 = createMobileStorageError( (uint64_t)"stream_image",  156LL,  -2,  0LL,  @"Failed to retrieve image attributes.",  v29,  v30,  v31,  v136);

    uint64_t v32 = (void *)v44;
  }

  [v154 objectForKey:*MEMORY[0x189607548]];
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v148);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = a4;
  v142 = v25;
  if (!v45)
  {
    createMobileStorageError( (uint64_t)"stream_image",  161LL,  -2,  0LL,  @"Failed to retrieve image size.",  v46,  v47,  v48,  v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0LL;
    v69 = 0LL;
    v71 = 0LL;
    v144 = 0LL;
    v146 = 0LL;
LABEL_35:

    id v72 = v70;
    char v73 = 0;
    uint64_t v32 = v72;
    goto LABEL_36;
  }

  [v25 objectForKeyedSubscript:@"DiskImageType"];
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v146);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError( (uint64_t)"stream_image",  167LL,  -3,  0LL,  @"Missing required options: %@",  v49,  v50,  v51,  (uint64_t)@"DiskImageType");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0LL;
    v69 = 0LL;
    v71 = 0LL;
    v144 = 0LL;
    goto LABEL_35;
  }

  [v25 objectForKeyedSubscript:@"ImageSignature"];
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v144);
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError( (uint64_t)"stream_image",  173LL,  -3,  0LL,  @"Missing required options: %@",  v52,  v53,  v54,  (uint64_t)@"ImageSignature");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0LL;
    v69 = 0LL;
    goto LABEL_31;
  }

  id v55 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v55)
  {
    createMobileStorageError( (uint64_t)"stream_image",  179LL,  -2,  0LL,  @"Failed to create dictionary.",  v56,  v57,  v58,  v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0LL;
LABEL_34:
    v69 = 0LL;
    v71 = 0LL;
    uint64_t v45 = 0LL;
    goto LABEL_35;
  }

  v59 = v55;
  [v55 setObject:@"ReceiveBytes" forKeyedSubscript:@"Command"];
  [v59 setObject:v144 forKeyedSubscript:@"ImageSignature"];
  [v59 setObject:v146 forKeyedSubscript:@"ImageType"];
  [v59 setObject:v148 forKeyedSubscript:@"ImageSize"];
  [v152 UTF8String];
  v60 = call_and_response_remote();
  v137 = v59;
  if (!v60)
  {
    createMobileStorageError( (uint64_t)"stream_image",  192LL,  -2,  v157,  @"Failed to send/receive XPC message.",  v61,  v62,  v63,  v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }

  v64 = v60;
  [v60 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v45);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v69 = v64;
    createMobileStorageError( (uint64_t)"stream_image",  198LL,  -2,  0LL,  @"An error occured while sending message: %@",  v66,  v67,  v68,  (uint64_t)v45);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
    v71 = 0LL;
    goto LABEL_35;
  }

  v69 = v64;
  [v64 objectForKeyedSubscript:@"Status"];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v71);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v119)
  {
    v129 = @"Invalid response message.";
    uint64_t v130 = 205LL;
LABEL_82:
    createMobileStorageError((uint64_t)"stream_image", v130, -2, 0LL, v129, v120, v121, v122, v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }

  if (([v71 isEqualToString:@"Complete"] & 1) == 0)
  {
    v129 = @"Status is not complete.";
    uint64_t v130 = 210LL;
    goto LABEL_82;
  }

  id v72 = 0LL;
  char v73 = 1;
LABEL_36:
  if (v157) {
    CFRelease(v157);
  }

  id v77 = v72;
  if ((v73 & 1) == 0)
  {
    createMobileStorageError( (uint64_t)"mountRemoteImage",  257LL,  -2,  v77,  @"Failed to stream image.",  v74,  v75,  v76,  v136);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = v139;
    a4 = v140;
    uint64_t v14 = v141;
    goto LABEL_11;
  }

  id v151 = v150;
  id v153 = v152;
  id v78 = v142;
  v157 = 0LL;
  [v78 objectForKeyedSubscript:@"ImageSignature"];
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v149);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = v78;
  v145 = v77;
  if (!v79)
  {
    createMobileStorageError( (uint64_t)"mount_image",  45LL,  -3,  0LL,  @"Missing required options: %@",  v80,  v81,  v82,  (uint64_t)@"ImageSignature");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0LL;
    v98 = 0LL;
    v104 = 0LL;
    v155 = 0LL;
    v147 = 0LL;
    v105 = 0LL;
    uint64_t v14 = v141;
    goto LABEL_75;
  }

  [v78 objectForKeyedSubscript:@"DiskImageType"];
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v155);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = v141;
  if (!v79)
  {
    createMobileStorageError( (uint64_t)"mount_image",  51LL,  -3,  0LL,  @"Missing required options: %@",  v83,  v84,  v85,  (uint64_t)@"DiskImageType");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0LL;
    v98 = 0LL;
    v104 = 0LL;
    v147 = 0LL;
LABEL_67:
    v105 = 0LL;
    goto LABEL_75;
  }

  [v78 objectForKeyedSubscript:@"ImageTrustCache"];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86;
  v147 = v86;
  if (v86)
  {
    isNSData(v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v88)
    {
      createMobileStorageError( (uint64_t)"mount_image",  57LL,  -3,  0LL,  @"Invalid value for option %@: %@",  v89,  v90,  v91,  (uint64_t)@"ImageTrustCache");
LABEL_66:
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0LL;
      v98 = 0LL;
      v104 = 0LL;
      v79 = 0LL;
      goto LABEL_67;
    }
  }

  if (![v155 isEqualToString:@"Cryptex"])
  {
LABEL_51:
    v102 = 0LL;
    goto LABEL_52;
  }

  isNSData(v87);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v92)
  {
    createMobileStorageError( (uint64_t)"mount_image",  63LL,  -3,  0LL,  @"Invalid value for required option %@: %@",  v93,  v94,  v95,  (uint64_t)@"ImageTrustCache");
    goto LABEL_66;
  }

  objc_msgSend(v78, "objectForKeyedSubscript:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v96) {
    goto LABEL_51;
  }
  v97 = v96;
  isNSData(v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v98)
  {
    v105 = v97;
    createMobileStorageError( (uint64_t)"mount_image",  69LL,  -3,  0LL,  @"Invalid value for option %@: %@",  v99,  v100,  v101,  (uint64_t)@"ImageInfoPlist");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0LL;
    goto LABEL_74;
  }

  v87 = v147;
  v102 = v97;
LABEL_52:
  id v106 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v106)
  {
    v105 = v102;
    createMobileStorageError( (uint64_t)"mount_image",  76LL,  -2,  0LL,  @"Failed to create dictionary.",  v107,  v108,  v109,  v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0LL;
    v98 = 0LL;
LABEL_74:
    v104 = 0LL;
    v79 = 0LL;
    goto LABEL_75;
  }

  v110 = v106;
  [v106 setObject:@"MountImage" forKeyedSubscript:@"Command"];
  [v110 setObject:v149 forKeyedSubscript:@"ImageSignature"];
  [v110 setObject:v155 forKeyedSubscript:@"ImageType"];
  if (v87) {
    [v110 setObject:v87 forKeyedSubscript:@"ImageTrustCache"];
  }
  if (v102) {
    [v110 setObject:v102 forKeyedSubscript:@"ImageInfoPlist"];
  }
  [v153 UTF8String];
  v111 = call_and_response_remote();
  v98 = v111;
  v138 = v110;
  if (!v111)
  {
    v105 = v102;
    createMobileStorageError( (uint64_t)"mount_image",  96LL,  -2,  v157,  @"Failed to send/receive XPC message.",  v112,  v113,  v114,  v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_74;
  }

  [v111 objectForKeyedSubscript:@"DetailedError"];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v79);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    v105 = v102;
    createMobileStorageError( (uint64_t)"mount_image",  102LL,  -2,  0LL,  @"An error occured while sending message: %@",  v116,  v117,  v118,  (uint64_t)v79);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0LL;
  }

  else
  {
    [v98 objectForKeyedSubscript:@"Status"];
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v104);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = v102;
    if (v123)
    {
      if ([v104 isEqualToString:@"Complete"])
      {
        char v127 = 1;
        id v128 = v145;
        goto LABEL_76;
      }

      v134 = @"Status is not complete.";
      uint64_t v135 = 114LL;
    }

    else
    {
      v134 = @"Invalid response message.";
      uint64_t v135 = 109LL;
    }

    createMobileStorageError((uint64_t)"mount_image", v135, -2, 0LL, v134, v124, v125, v126, v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_75:
  id v128 = v103;
  char v127 = 0;
LABEL_76:
  if (v157) {
    CFRelease(v157);
  }

  id v36 = v128;
  if ((v127 & 1) == 0)
  {
    createMobileStorageError( (uint64_t)"mountRemoteImage",  263LL,  -2,  v36,  @"Failed mount image.",  v131,  v132,  v133,  v136);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = v139;
    a4 = v140;
    goto LABEL_11;
  }

  id v34 = 0LL;
  char v35 = 1;
  uint64_t v19 = v139;
  a4 = v140;
LABEL_12:

  id v40 = v34;
  if ((v35 & 1) != 0)
  {
    uint64_t v41 = 0LL;
  }

  else
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteMountWithError",  422LL,  -2,  v40,  @"Failed to mount %@ on device: %@",  v37,  v38,  v39,  (uint64_t)v8);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v41 = 0xFFFFFFFFLL;
    if (a4 && v42)
    {
      id v40 = v42;
      *a4 = v40;
    }

    else
    {
      id v40 = v42;
    }
  }

  return v41;
}

uint64_t MobileStorageRemoteUnmountWithError(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a1;
  if (!v9 || !a2)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteUnmountWithError",  453LL,  -3,  0LL,  @"Invalid input(s)",  v6,  v7,  v8,  v35);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
LABEL_9:
    uint64_t v19 = 0LL;
LABEL_10:
    CFTypeRef v26 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_11;
  }

  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v14 = v10;
  if (!v10)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteUnmountWithError",  459LL,  -2,  0LL,  @"Failed to create dictionary.",  v11,  v12,  v13,  v35);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  [v10 setObject:@"UnmountImage" forKeyedSubscript:@"Command"];
  [v14 setObject:a2 forKeyedSubscript:@"MountPath"];
  uint64_t v15 = call_and_response_remote();
  uint64_t v19 = v15;
  if (!v15)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteUnmountWithError",  470LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v16,  v17,  v18,  v35);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  [v15 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v20);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteUnmountWithError",  476LL,  -2,  0LL,  @"An error occured while sending message: %@",  v22,  v23,  v24,  (uint64_t)v20);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    CFTypeRef v26 = 0LL;
  }

  else
  {
    [v19 objectForKeyedSubscript:@"Status"];
    CFTypeRef v26 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v26);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      if ([v26 isEqualToString:@"Complete"])
      {
        id v25 = 0LL;
        uint64_t v27 = 0LL;
        goto LABEL_14;
      }

      uint64_t v33 = @"Status is not complete.";
      uint64_t v34 = 487LL;
    }

    else
    {
      uint64_t v33 = @"Invalid response message.";
      uint64_t v34 = 482LL;
    }

    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", v34, -2, 0LL, v33, v30, v31, v32, v35);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  uint64_t v27 = 0xFFFFFFFFLL;
  if (a4 && v25)
  {
    id v25 = v25;
    *a4 = v25;
  }

  objc_autoreleasePoolPop(v3);
}

  return v7;
}

LABEL_14:
  return v27;
}

uint64_t MobileStorageRemoteRollPersonalizationNonceWithError(void *a1, const __CFDictionary *a2, void *a3)
{
  id v8 = a1;
  if (!v8)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  516LL,  -3,  0LL,  @"Invalid input(s)",  v5,  v6,  v7,  v37);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = 0LL;
    goto LABEL_12;
  }

  id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v12)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  522LL,  -2,  0LL,  @"Failed to create dictionary.",  v9,  v10,  v11,  v37);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    uint64_t v22 = 0LL;
    uint64_t v14 = 0LL;
    id v28 = 0LL;
    a2 = 0LL;
    if (a3)
    {
LABEL_20:
      id v27 = v27;
      uint64_t v33 = 0LL;
      *a3 = v27;
      goto LABEL_25;
    }

LABEL_24:
    uint64_t v33 = 0LL;
    goto LABEL_25;
  }

  if (a2)
  {
    CFDictionaryGetValue(a2, @"PersonalizedImageType");
    uint64_t v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v13;
    if (v13)
    {
      isNSString(v13);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  530LL,  -3,  0LL,  @"Invalid value for options key: %@",  v15,  v16,  v17,  (uint64_t)@"PersonalizedImageType");
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = 0LL;
LABEL_19:
        id v28 = 0LL;
        if (a3) {
          goto LABEL_20;
        }
        goto LABEL_24;
      }

      [v12 setObject:a2 forKeyedSubscript:@"PersonalizedImageType"];
    }
  }

  [v12 setObject:@"RollPersonalizationNonce" forKeyedSubscript:@"Command"];
  uint64_t v18 = call_and_response_remote();
  uint64_t v22 = v18;
  if (!v18)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  544LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v19,  v20,  v21,  v37);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = 0LL;
    goto LABEL_19;
  }

  [v18 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v14);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  550LL,  -2,  0LL,  @"An error occured while sending message: %@",  v24,  v25,  v26,  (uint64_t)v14);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }

  [v22 objectForKeyedSubscript:@"Status"];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v28);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    uint64_t v34 = @"Invalid response message.";
    uint64_t v35 = 557LL;
    goto LABEL_23;
  }

  if (([v28 isEqualToString:@"Complete"] & 1) == 0)
  {
    uint64_t v34 = @"Status is not complete.";
    uint64_t v35 = 562LL;
LABEL_23:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError",  v35,  -2,  0LL,  v34,  v30,  v31,  v32,  v37);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (a3) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }

  id v27 = 0LL;
  uint64_t v33 = 1LL;
LABEL_25:

  return v33;
}

uint64_t MobileStorageRemoteRollCryptexNonceWithError(void *a1, uint64_t a2, void *a3)
{
  id v7 = a1;
  if (!v7)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollCryptexNonceWithError",  591LL,  -3,  0LL,  @"Invalid input(s)",  v4,  v5,  v6,  v33);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = 0LL;
LABEL_8:
    uint64_t v17 = 0LL;
LABEL_9:
    uint64_t v18 = 0LL;
LABEL_10:
    uint64_t v24 = 0LL;
    if (a3) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v25 = 0LL;
    goto LABEL_20;
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v12 = v8;
  if (!v8)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollCryptexNonceWithError",  597LL,  -2,  0LL,  @"Failed to create dictionary.",  v9,  v10,  v11,  v33);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  [v8 setObject:@"RollCryptexNonce" forKeyedSubscript:@"Command"];
  uint64_t v13 = call_and_response_remote();
  uint64_t v17 = v13;
  if (!v13)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollCryptexNonceWithError",  607LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v14,  v15,  v16,  v33);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  [v13 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteRollCryptexNonceWithError",  613LL,  -2,  0LL,  @"An error occured while sending message: %@",  v20,  v21,  v22,  (uint64_t)v18);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }

  [v17 objectForKeyedSubscript:@"Status"];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v24);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if ([v24 isEqualToString:@"Complete"])
    {
      id v23 = 0LL;
      uint64_t v25 = 1LL;
      goto LABEL_20;
    }

    uint64_t v30 = @"Status is not complete.";
    uint64_t v31 = 625LL;
  }

  else
  {
    uint64_t v30 = @"Invalid response message.";
    uint64_t v31 = 620LL;
  }

  createMobileStorageError( (uint64_t)"MobileStorageRemoteRollCryptexNonceWithError",  v31,  -2,  0LL,  v30,  v27,  v28,  v29,  v33);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3) {
    goto LABEL_19;
  }
LABEL_11:
  id v23 = v23;
  uint64_t v25 = 0LL;
  *a3 = v23;
LABEL_20:

  return v25;
}

id MobileStorageRemoteCopyPersonalizationNonceWithError(void *a1, const __CFDictionary *a2, void *a3)
{
  id v8 = a1;
  if (!v8)
  {
    uint64_t v24 = @"Invalid input(s)";
    uint64_t v25 = 655LL;
    int v26 = -3;
LABEL_13:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError",  v25,  v26,  0LL,  v24,  v5,  v6,  v7,  (uint64_t)v37);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    id v35 = 0LL;
    goto LABEL_21;
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v9)
  {
    uint64_t v24 = @"Failed to create dictionary.";
    uint64_t v25 = 661LL;
    int v26 = -2;
    goto LABEL_13;
  }

  uint64_t v10 = v9;
  if (a2)
  {
    CFDictionaryGetValue(a2, @"PersonalizedImageType");
    uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v11;
    if (v11)
    {
      isNSString(v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        uint64_t v27 = @"Invalid value for options key: %@";
        uint64_t v37 = @"PersonalizedImageType";
        uint64_t v28 = 669LL;
        int v29 = -3;
        goto LABEL_18;
      }

      [v10 setObject:a2 forKeyedSubscript:@"PersonalizedImageType"];
    }
  }

  [v10 setObject:@"QueryNonce" forKeyedSubscript:@"Command"];
  uint64_t v16 = call_and_response_remote();
  if (!v16)
  {
    uint64_t v27 = @"Failed to send/receive XPC message.";
    uint64_t v28 = 683LL;
    int v29 = -2;
LABEL_18:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError",  v28,  v29,  0LL,  v27,  v13,  v14,  v15,  (uint64_t)v37);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }

  uint64_t v17 = v16;
  [v16 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v18);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError",  689LL,  -2,  0LL,  @"An error occured while sending message: %@",  v20,  v21,  v22,  (uint64_t)v18);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_19:

    goto LABEL_20;
  }

  [v17 objectForKeyedSubscript:@"PersonalizationNonce"];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v30);
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError",  696LL,  -2,  0LL,  @"Invalid response message.",  v32,  v33,  v34,  (uint64_t)v37);
    id v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

  id v35 = v30;

  id v23 = 0LL;
LABEL_21:
  if (a3 && !v35) {
    *a3 = v23;
  }

  return v35;
}

id MobileStorageRemoteCopyPersonalizationIdentifiersWithError( void *a1, const __CFDictionary *a2, void *a3)
{
  id v8 = a1;
  if (!v8)
  {
    int v26 = @"Invalid input(s)";
    uint64_t v27 = 727LL;
    int v28 = -3;
LABEL_13:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError",  v27,  v28,  0LL,  v26,  v5,  v6,  v7,  (uint64_t)v44);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v9)
  {
    int v26 = @"Failed to create dictionary.";
    uint64_t v27 = 733LL;
    int v28 = -2;
    goto LABEL_13;
  }

  uint64_t v10 = v9;
  if (a2)
  {
    CFDictionaryGetValue(a2, @"PersonalizedImageType");
    uint64_t v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v11;
    if (v11)
    {
      isNSString(v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        uint64_t v34 = @"Invalid value for options key: %@";
        uint64_t v44 = @"PersonalizedImageType";
        uint64_t v35 = 741LL;
        int v36 = -3;
        goto LABEL_20;
      }

      [v10 setObject:a2 forKeyedSubscript:@"PersonalizedImageType"];
    }
  }

  [v10 setObject:@"QueryPersonalizationIdentifiers" forKeyedSubscript:@"Command"];
  uint64_t v16 = call_and_response_remote();
  if (!v16)
  {
    uint64_t v34 = @"Failed to send/receive XPC message.";
    uint64_t v35 = 755LL;
    int v36 = -2;
LABEL_20:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError",  v35,  v36,  0LL,  v34,  v13,  v14,  v15,  (uint64_t)v44);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }

  uint64_t v17 = v16;
  [v16 objectForKeyedSubscript:@"Error"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = isNSString(v18);
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    int v21 = [v18 isEqualToString:@"UnknownCommand"];

    if (v21)
    {
      createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError",  761LL,  -5,  0LL,  @"Unsupported command: %@",  v22,  v23,  v24,  (uint64_t)@"QueryPersonalizationIdentifiers");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_21:

LABEL_22:
      id v37 = 0LL;
      if (!a3) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
  }

  [v17 objectForKeyedSubscript:@"DetailedError"];
  int v29 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError",  767LL,  -2,  0LL,  @"An error occured while sending message: %@",  v31,  v32,  v33,  (uint64_t)v29);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }

  [v17 objectForKeyedSubscript:@"PersonalizationIdentifiers"];
  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v39);
  id v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError",  773LL,  -2,  0LL,  @"Invalid response message.",  v41,  v42,  v43,  (uint64_t)v44);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }

  id v37 = v39;

  uint64_t v25 = 0LL;
  if (!a3) {
    goto LABEL_25;
  }
LABEL_23:
  if (!v37) {
    *a3 = v25;
  }
LABEL_25:

  return v37;
}

void *MobileStorageRemoteCopyCryptexNonceWithError(void *a1, uint64_t a2, void *a3)
{
  id v7 = a1;
  if (!v7)
  {
    int v21 = @"Invalid input(s)";
    uint64_t v22 = 802LL;
    int v23 = -3;
LABEL_9:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError",  v22,  v23,  0LL,  v21,  v4,  v5,  v6,  v30);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v8)
  {
    int v21 = @"Failed to create dictionary.";
    uint64_t v22 = 808LL;
    int v23 = -2;
    goto LABEL_9;
  }

  id v9 = v8;
  [v8 setObject:@"QueryCryptexNonce" forKeyedSubscript:@"Command"];
  uint64_t v10 = call_and_response_remote();
  if (!v10)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError",  818LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v11,  v12,  v13,  v30);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  uint64_t v14 = v10;
  [v10 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError",  824LL,  -2,  0LL,  @"An error occured while sending message: %@",  v17,  v18,  v19,  (uint64_t)v15);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_11:
LABEL_12:
    uint64_t v24 = 0LL;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  [v14 objectForKeyedSubscript:@"CryptexNonce"];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v24);
  int v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError",  831LL,  -2,  0LL,  @"Invalid response message.",  v27,  v28,  v29,  v30);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }

  uint64_t v20 = 0LL;
  if (!a3) {
    goto LABEL_15;
  }
LABEL_13:
  if (!v24) {
    *a3 = v20;
  }
LABEL_15:

  return v24;
}

void *MobileStorageRemoteCopyPersonalizationManifestWithError( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v8 = a1;
  if (!v8 || !a2 || !a3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }

    int v23 = @"Invalid input(s)";
    uint64_t v24 = 860LL;
    int v25 = -3;
    goto LABEL_17;
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }

    int v23 = @"Failed to create dictionary.";
    uint64_t v24 = 866LL;
    int v25 = -2;
LABEL_17:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError",  v24,  v25,  0LL,  v23,  v20,  v21,  v22,  v35);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v10 = 0LL;
    goto LABEL_18;
  }

  uint64_t v10 = v9;
  [v9 setObject:@"QueryPersonalizationManifest" forKeyedSubscript:@"Command"];
  [v10 setObject:a2 forKeyedSubscript:@"PersonalizedImageType"];
  [v10 setObject:a3 forKeyedSubscript:@"ImageSignature"];
  uint64_t v11 = call_and_response_remote();
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 objectForKeyedSubscript:@"DetailedError"];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v13;
        _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "An error occured while sending message: %@",  buf,  0xCu);
      }

      createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError",  884LL,  -2,  0LL,  @"An error occured while sending message: %@",  v15,  v16,  v17,  (uint64_t)v13);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v12 objectForKeyedSubscript:@"ImageSignature"];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      isNSData(v19);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        uint64_t v18 = 0LL;
        goto LABEL_18;
      }

      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Invalid response message.", buf, 2u);
      }

      createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError",  891LL,  -2,  0LL,  @"Invalid response message.",  v32,  v33,  v34,  v35);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v19 = 0LL;
  }

  else
  {
    uint64_t v27 = (void *)[objc_alloc(NSString) initWithFormat:@"Failed to send/receive XPC message."];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v27;
      _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError",  878LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v28,  v29,  v30,  v35);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v12 = 0LL;
  }

uint64_t MobileStorageRemoteCopyDeveloperModeStatusWithError(void *a1, uint64_t a2, void *a3)
{
  id v7 = a1;
  if (!v7)
  {
    uint64_t v21 = @"Invalid input(s)";
    uint64_t v22 = 920LL;
    int v23 = -3;
LABEL_9:
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError",  v22,  v23,  0LL,  v21,  v4,  v5,  v6,  v31);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (!v8)
  {
    uint64_t v21 = @"Failed to create dictionary.";
    uint64_t v22 = 926LL;
    int v23 = -2;
    goto LABEL_9;
  }

  id v9 = v8;
  [v8 setObject:@"QueryDeveloperModeStatus" forKeyedSubscript:@"Command"];
  uint64_t v10 = call_and_response_remote();
  if (!v10)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError",  936LL,  -2,  0LL,  @"Failed to send/receive XPC message.",  v11,  v12,  v13,  v31);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  uint64_t v14 = v10;
  [v10 objectForKeyedSubscript:@"DetailedError"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v15);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError",  942LL,  -2,  0LL,  @"An error occured while sending message: %@",  v17,  v18,  v19,  (uint64_t)v15);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_11:
LABEL_12:
    uint64_t v24 = 0LL;
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }

  [v14 objectForKeyedSubscript:@"DeveloperModeStatus"];
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v26);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError",  949LL,  -2,  0LL,  @"Invalid response message.",  v28,  v29,  v30,  v31);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }

  uint64_t v24 = [v26 BOOLValue];

  uint64_t v20 = 0LL;
  if (!a3) {
    goto LABEL_15;
  }
LABEL_13:
  if ((v24 & 1) == 0) {
    *a3 = v20;
  }
LABEL_15:

  return v24;
}

LABEL_100:
    if (a3)
    {
      id v9 = v9;
      uint64_t v15 = 0;
      *a3 = v9;
    }

    else
    {
      uint64_t v15 = 0;
    }
  }

  else
  {
LABEL_6:
    uint64_t v15 = 1;
  }

LABEL_103:
  return v15;
}

LABEL_80:
  a3 = v112;
  if (v112) {
    goto LABEL_39;
  }
LABEL_40:
  if (cf) {
    CFRelease(cf);
  }

  return (char)a3;
}

LABEL_49:
        uint64_t v46 = v28;
        uint64_t v48 = v27;
        goto LABEL_50;
      }

      uint64_t v75 = 0LL;
    }

    else
    {
      uint64_t v11 = v79;
      [v79 path];
      uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v75 = (void *)MobileStorageMountWithError(v62, (const __CFDictionary *)v84, &cf, v63, v64, v65, v66, v67);

      if (!v75)
      {
        uint64_t v68 = (void *)cf;
        [v79 path];
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        createMobileStorageError( (uint64_t)"-[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:]",  1055LL,  -2,  v68,  @"Failed to mount %@.",  v69,  v70,  v71,  (uint64_t)v58);
        goto LABEL_41;
      }
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      [v11 path];
      char v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)v88 = v73;
      _os_log_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%@ successfully mounted on device.",  buf,  0xCu);
    }

    int v26 = 0LL;
    id v72 = 1;
    goto LABEL_49;
  }

  uint64_t v42 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v43 = (os_log_s *)MEMORY[0x1895F8DA0];
  while (1)
  {
    uint64_t v44 = v29;
    [v30 objectAtIndexedSubscript:v42];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    isNSDictionary(v29);
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v50 = [v30 count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v88 = v42;
        *(_WORD *)&v88[4] = 1024;
        *(_DWORD *)&v88[6] = v50;
        _os_log_debug_impl(&dword_18826F000, v43, OS_LOG_TYPE_DEBUG, "Failed to retrieve entry %d of %d.", buf, 0xEu);
      }

      goto LABEL_31;
    }

    [v29 objectForKeyedSubscript:@"DeviceType"];
    uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();

    isNSString(v46);
    uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v51 = [v30 count];
        *(_DWORD *)buf = 138412802;
        *(void *)v88 = @"DeviceType";
        *(_WORD *)&v88[8] = 1024;
        *(_DWORD *)uint64_t v89 = v42 + 1;
        *(_WORD *)&v89[4] = 1024;
        *(_DWORD *)&v89[6] = v51;
        _os_log_debug_impl(&dword_18826F000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
      }

      goto LABEL_30;
    }

LABEL_30:
    uint64_t v28 = v46;
LABEL_31:
  }

  [v29 objectForKeyedSubscript:@"ImageSignature"];
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();

  isNSData(v48);
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = [v30 count];
      *(_DWORD *)buf = 138412802;
      *(void *)v88 = @"ImageSignature";
      *(_WORD *)&v88[8] = 1024;
      *(_DWORD *)uint64_t v89 = v42 + 1;
      *(_WORD *)&v89[4] = 1024;
      *(_DWORD *)&v89[6] = v52;
      _os_log_debug_impl(&dword_18826F000, v43, OS_LOG_TYPE_DEBUG, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
    }

    goto LABEL_29;
  }

  if (![v85 isEqualToData:v48])
  {
LABEL_29:
    uint64_t v27 = v48;
    goto LABEL_30;
  }

  [v29 objectForKeyedSubscript:@"MountPath"];
  uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v79;
    -[PersonalizedImage mountImage:serverTicket:imageDigest:trustCacheURL:error:].cold.1(v79, (uint64_t)v75);
    int v26 = 0LL;
    id v72 = 1;
  }

  else
  {
    int v26 = 0LL;
    id v72 = 1;
    uint64_t v11 = v79;
  }

LABEL_50:
  if (cf) {
    CFRelease(cf);
  }

  return v72;
}

void lib_auth_install_log_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v3 = (void *)MEMORY[0x1895C0110]();
  uint64_t v4 = (void *)[objc_alloc(NSString) initWithUTF8String:a2];
  if (!v4)
  {
    uint64_t v5 = 0LL;
    goto LABEL_11;
  }

  [@"libauthinstall: " stringByAppendingString:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    uint64_t v4 = 0LL;
    goto LABEL_11;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 fileExistsAtPath:@"/tmp/libauthinstall_logs.txt"];

  if ((v7 & 1) == 0)
  {
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 dataUsingEncoding:4];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = *MEMORY[0x189607500];
    uint64_t v14 = &unk_18A2160D8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 createFileAtPath:@"/tmp/libauthinstall_logs.txt" contents:v11 attributes:v12];

    goto LABEL_10;
  }

  [MEMORY[0x189607898] fileHandleForWritingAtPath:@"/tmp/libauthinstall_logs.txt"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v8;
  if (v8)
  {
    [v8 seekToEndOfFile];
    [v5 dataUsingEncoding:4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 writeData:v9];

    [v4 closeFile];
  }

const char *convertLibAuthInstallError(int a1)
{
  if (a1 > 3099)
  {
    if (a1 <= 3499)
    {
      if (a1 == 3100)
      {
        return "kAMAuthInstallErrorServer_begin";
      }

      else if (a1 == 3194)
      {
        return "kAMAuthInstallTATSUDeclinedAuthorization";
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      switch(a1)
      {
        case 3500:
          uint64_t result = "kAMAuthInstallErrorHTTPInternalServerError";
          break;
        case 3501:
          uint64_t result = "kAMAuthInstallErrorHTTPUnauthorized";
          break;
        case 3502:
        case 3505:
        case 3506:
          return 0LL;
        case 3503:
          uint64_t result = "kAMAuthInstallErrorHTTPForbidden";
          break;
        case 3504:
          uint64_t result = "kAMAuthInstallErrorHTTPNotFound";
          break;
        case 3507:
          uint64_t result = "kAMAuthInstallErrorHTTPProxyAuthNeeded";
          break;
        default:
          if (a1 != 3999) {
            return 0LL;
          }
          uint64_t result = "kAMAuthInstallErrorServer_end";
          break;
      }
    }
  }

  else
  {
    int v1 = a1 - 1;
    uint64_t result = "kAMAuthInstallErrorBadParameter";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "kAMAuthInstallErrorAllocation";
        break;
      case 2:
        uint64_t result = "kAMAuthInstallErrorConversion";
        break;
      case 3:
        uint64_t result = "kAMAuthInstallErrorFile";
        break;
      case 4:
        uint64_t result = "kAMAuthInstallErrorHash";
        break;
      case 5:
        uint64_t result = "kAMAuthInstallErrorCrypto";
        break;
      case 6:
        uint64_t result = "kAMAuthInstallErrorBadBuildIdentity";
        break;
      case 7:
        uint64_t result = "kAMAuthInstallErrorEntryNotFound";
        break;
      case 8:
        uint64_t result = "kAMAuthInstallErrorInvalidImg3Object";
        break;
      case 9:
        uint64_t result = "kAMAuthInstallErrorInvalidFlsObject";
        break;
      case 10:
        uint64_t result = "kAMAuthInstallErrorServerNotReachable";
        break;
      case 11:
        uint64_t result = "kAMAuthInstallErrorServerTimedOut";
        break;
      case 12:
        uint64_t result = "kAMAuthInstallErrorUnimplemented";
        break;
      case 13:
        uint64_t result = "kAMAuthInstallErrorInternal";
        break;
      case 14:
        uint64_t result = "kAMAuthInstallErrorInvalidBbfwFile";
        break;
      case 15:
        uint64_t result = "kAMAuthInstallErrorNetwork";
        break;
      case 16:
        uint64_t result = "kAMAuthInstallErrorBadResponse";
        break;
      case 17:
        uint64_t result = "kAMAuthInstallErrorFusingFailed";
        break;
      case 18:
        uint64_t result = "kAMAuthInstallErrorBBProvisioningFailed";
        break;
      case 19:
        uint64_t result = "kAMAuthInstallErrorAppleConnectNotFound";
        break;
      case 20:
        uint64_t result = "kAMAuthInstallErrorAppleConnectCanceled";
        break;
      case 21:
        uint64_t result = "kAMAuthInstallErrorAppleConnectAuthFailed";
        break;
      case 22:
        uint64_t result = "kAMAuthInstallErrorInvalidImg4Object";
        break;
      case 23:
        uint64_t result = "kAMAuthInstallErrorProvisioningAckFailed";
        break;
      case 24:
        uint64_t result = "kAMAuthInstallErrorUpdaterOperation";
        break;
      default:
        uint64_t result = "kAMAuthInstallErrorGeneric";
        break;
    }
  }

  return result;
}

uint64_t MobileStorageMountPersonalizedBundleWithError(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = -[PersonalizedImage initWithBundleURL:imageVariant:remoteDevice:options:]( objc_alloc(&OBJC_CLASS___PersonalizedImage),  "initWithBundleURL:imageVariant:remoteDevice:options:",  a1,  a2,  0LL,  a3);
  id v9 = v5;
  if (!v5)
  {
    createMobileStorageError( (uint64_t)"MobileStorageMountPersonalizedBundleWithError",  1250LL,  -2,  0LL,  @"Failed to allocate bundle object.",  v6,  v7,  v8,  v18);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  id v19 = 0LL;
  BOOL v10 = -[PersonalizedImage mountImage:](v5, "mountImage:", &v19);
  id v14 = v19;
  if (!v10)
  {
    uint64_t v16 = createMobileStorageError( (uint64_t)"MobileStorageMountPersonalizedBundleWithError",  1255LL,  -2,  v14,  @"Failed to mount image.",  v11,  v12,  v13,  v18);

    id v14 = (id)v16;
    if (!a4)
    {
LABEL_8:
      uint64_t v15 = 0xFFFFFFFFLL;
      goto LABEL_9;
    }

uint64_t MobileStorageRemoteMountPersonalizedBundleWithError( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v12 = a1;
  if (!v12)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError",  1278LL,  -3,  0LL,  @"Invalid input(s).",  v9,  v10,  v11,  v26);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = 0LL;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  uint64_t v13 = -[PersonalizedImage initWithBundleURL:imageVariant:remoteDevice:options:]( objc_alloc(&OBJC_CLASS___PersonalizedImage),  "initWithBundleURL:imageVariant:remoteDevice:options:",  a2,  a3,  v12,  a4);
  uint64_t v17 = v13;
  if (!v13)
  {
    createMobileStorageError( (uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError",  1284LL,  -2,  0LL,  @"Failed to allocate bundle object.",  v14,  v15,  v16,  v26);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  id v27 = 0LL;
  BOOL v18 = -[PersonalizedImage mountImage:](v13, "mountImage:", &v27);
  id v22 = v27;
  if (!v18)
  {
    uint64_t v24 = createMobileStorageError( (uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError",  1289LL,  -2,  v22,  @"Failed to mount image.",  v19,  v20,  v21,  v26);

    id v22 = (id)v24;
    if (!a5)
    {
LABEL_11:
      uint64_t v23 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }

id normalizePrivateVar(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"/private/var"])
  {
    [v1 componentsSeparatedByString:@"/"];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = (void *)[v2 mutableCopy];

    [v3 objectAtIndex:0];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 isEqualToString:&stru_18A214FC8];

    if (v5) {
      [v3 removeObjectAtIndex:0];
    }
    [v3 removeObjectAtIndex:0];
    uint64_t v6 = (void *)NSString;
    [v3 componentsJoinedByString:@"/"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v6 stringWithFormat:@"/%@", v7];

    id v1 = (id)v8;
  }

  return v1;
}

id copyProgramArgs(void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"ProgramArguments"];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    [v1 objectForKeyedSubscript:@"Program"];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  isNSArray(v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
  }

  else
  {
    isNSString(v2);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v2;
        _os_log_impl(&dword_18826F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "Unexpected object: %@", buf, 0xCu);
      }

      uint64_t v7 = 0LL;
      goto LABEL_11;
    }
  }

  isNSArray(v2);
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = [v2 mutableCopy];
LABEL_10:
    uint64_t v7 = (void *)v6;
    goto LABEL_11;
  }

  isNSString(v2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithObjects:", v2, 0);
    goto LABEL_10;
  }

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

CFPropertyListRef call_and_response( const char *a1, const void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0LL;
  size_t length = 0LL;
  if (a1 && a2)
  {
    mach_service = xpc_connection_create_mach_service(a1, 0LL, 2uLL);
    if (mach_service)
    {
      id v12 = mach_service;
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_2);
      xpc_connection_resume(v12);
      CFDataRef Data = CFPropertyListCreateData(0LL, a2, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
      if (!Data)
      {
        createMobileStorageError( (uint64_t)"call_and_response",  134LL,  -2,  0LL,  @"Failed to create dictionary with data.",  v14,  v15,  v16,  v48);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        CFPropertyListRef v30 = 0LL;
        CFErrorRef error = 0LL;
        goto LABEL_27;
      }

      uint64_t v17 = Data;
      xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
      BytePtr = CFDataGetBytePtr(v17);
      size_t v20 = CFDataGetLength(v17);
      xpc_dictionary_set_data(v18, "EncodedDictionary", BytePtr, v20);
      xpc_object_t v21 = xpc_connection_send_message_with_reply_sync(v12, v18);
      if (MEMORY[0x1895C0494]() == MEMORY[0x1895F9250])
      {
        uint64_t v31 = (const UInt8 *)xpc_dictionary_get_data(v21, "EncodedDictionary", &length);
        if (v31)
        {
          uint64_t v35 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          int v36 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v31, length);
          if (v36)
          {
            id v37 = v36;
            CFPropertyListRef v30 = CFPropertyListCreateWithData(v35, v36, 0LL, 0LL, &error);
            uint64_t v26 = 0LL;
            if (!v30)
            {
              createMobileStorageError( (uint64_t)"call_and_response",  171LL,  -2,  error,  @"Failed to create dictionary with data.",  v38,  v39,  v40,  v48);
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
            }

            CFRelease(v37);
            goto LABEL_24;
          }

          uint64_t v45 = @"Failed to create data.";
          uint64_t v46 = 165LL;
        }

        else
        {
          uint64_t v45 = @"Response message missing encoded response.";
          uint64_t v46 = 145LL;
        }

        createMobileStorageError((uint64_t)"call_and_response", v46, -2, 0LL, v45, v32, v33, v34, v48);
      }

      else
      {
        if (MEMORY[0x1895C0494](v21) != MEMORY[0x1895F9268])
        {
          id v22 = (void *)MEMORY[0x1895C0440](v21);
          createMobileStorageError( (uint64_t)"call_and_response",  154LL,  -2,  0LL,  @"Unexpected message: %s",  v23,  v24,  v25,  (uint64_t)v22);
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          free(v22);
LABEL_23:
          CFPropertyListRef v30 = 0LL;
LABEL_24:
          CFRelease(v17);
          if (error) {
            CFRelease(error);
          }
          CFErrorRef error = 0LL;

LABEL_27:
          xpc_connection_cancel(v12);

          if (!a4) {
            goto LABEL_30;
          }
          goto LABEL_28;
        }

        uint64_t string = xpc_dictionary_get_string(v21, (const char *)*MEMORY[0x1895F91B0]);
        createMobileStorageError( (uint64_t)"call_and_response",  150LL,  -2,  0LL,  @"Client error: %s",  v42,  v43,  v44,  (uint64_t)string);
      }

      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }

    id v27 = @"Failed to create connection to %s.";
    uint64_t v48 = (uint64_t)a1;
    uint64_t v28 = 115LL;
    int v29 = -2;
  }

  else
  {
    id v27 = @"Invalid input(s).";
    uint64_t v28 = 109LL;
    int v29 = -3;
  }

  createMobileStorageError((uint64_t)"call_and_response", v28, v29, 0LL, v27, a6, a7, a8, v48);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  CFPropertyListRef v30 = 0LL;
  CFErrorRef error = 0LL;
  if (!a4) {
    goto LABEL_30;
  }
LABEL_28:
  if (!v30) {
    *a4 = v26;
  }
LABEL_30:

  return v30;
}

void __call_and_response_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (MEMORY[0x1895C0494]() == MEMORY[0x1895F9268])
  {
    if (v2 != (id)MEMORY[0x1895F91A0])
    {
      uint64_t v11 = (void *)MEMORY[0x1895C0440](v2);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __call_and_response_block_invoke_cold_1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
      free(v11);
    }
  }

  else
  {
    uint64_t string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1895F91B0]);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      __call_and_response_block_invoke_cold_2((uint64_t)string, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void *call_and_response_remote()
{
  uint64_t v0 = (void *)MEMORY[0x1895F8858]();
  id v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v86 = *MEMORY[0x1895F89C0];
  id v12 = v0;
  if (!v4)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  211LL,  -3,  0LL,  @"Invalid input.",  v9,  v10,  v11,  v78);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0LL;
    uint64_t v82 = 0LL;
    uint64_t v83 = 0LL;
LABEL_16:
    xpc_object_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t v16 = 0LL;
LABEL_17:
    uint64_t v46 = 0LL;
    if (!v2) {
      goto LABEL_39;
    }
    goto LABEL_37;
  }

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v4];
  if (!v16)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  217LL,  -2,  0LL,  @"Failed to create dictionary.",  v13,  v14,  v15,  v78);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0LL;
    uint64_t v82 = 0LL;
    uint64_t v83 = 0LL;
    uint64_t v4 = 0LL;
    xpc_object_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    goto LABEL_17;
  }

  bzero(buffer, 0x1000uLL);
  memset(v84, 0, sizeof(v84));
  pid_t v17 = getpid();
  proc_pidpath(v17, buffer, 0x1000u);
  int v18 = strlen(buffer);
  if ((v18 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v18] == 47) {
        break;
      }
    }

    while (v18-- > 0);
  }

  __strlcpy_chk();
  v79 = v84;
  [NSString stringWithFormat:@"%s"];
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v83 = v16;
  if (!v23)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  223LL,  -2,  0LL,  @"Failed to retrieve process name.",  v20,  v21,  v22,  (uint64_t)v84);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = 0LL;
    uint64_t v4 = 0LL;
    goto LABEL_16;
  }

  [v16 setObject:v23 forKeyedSubscript:@"HostProcessName"];
  [NSString stringWithUTF8String:v8];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = v12;
  id v26 = v24;
  dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
  uint64_t v82 = v23;
  if (!v30)
  {
    uint64_t v47 = @"Failed to create semaphore.";
    uint64_t v48 = 53LL;
LABEL_22:
    createMobileStorageError((uint64_t)"copyRemoteServiceConnection", v48, -2, 0LL, v47, v27, v28, v29, (uint64_t)v79);
    goto LABEL_23;
  }

  if (remote_device_get_state() != 2)
  {
    createMobileStorageError( (uint64_t)"copyRemoteServiceConnection",  58LL,  -2,  0LL,  @"Remote device not connected after %u seconds.",  v31,  v32,  v33,  60LL);
LABEL_23:
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    int v36 = 0LL;
    goto LABEL_24;
  }

  id v34 = v26;
  [v34 UTF8String];
  uint64_t v35 = remote_device_copy_service();
  if (!v35)
  {
    __error();
    uint64_t v49 = __error();
    strerror(*v49);
    uint64_t v47 = @"Failed to connect to remote service %@: %d (%s)";
    v79 = v34;
    uint64_t v48 = 64LL;
    goto LABEL_22;
  }

  int v36 = (void *)v35;
  dispatch_get_global_queue(25LL, 0LL);
  id v37 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void *)xpc_remote_connection_create_with_remote_service();

  if (v16)
  {
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    id v41 = 0LL;
    goto LABEL_25;
  }

  createMobileStorageError( (uint64_t)"copyRemoteServiceConnection",  70LL,  -2,  0LL,  @"Failed to create remote connection.",  v38,  v39,  v40,  (uint64_t)v84);
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  id v41 = v50;

  uint64_t v16 = 0LL;
LABEL_25:
  uint64_t v80 = v2;

  id v42 = v41;
  if (!v16)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  231LL,  -2,  v42,  @"Failed to create remote connection to %s.",  v51,  v52,  v53,  v8);
    v64 = id v63 = v12;

    id v23 = 0LL;
    uint64_t v4 = 0LL;
    xpc_object_t v43 = 0LL;
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
LABEL_35:
    uint64_t v46 = 0LL;
    goto LABEL_36;
  }

  uint64_t v45 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v45)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  237LL,  -2,  v42,  @"Failed to create XPC dictionary (%@).",  v54,  v55,  v56,  (uint64_t)v83);
    v64 = id v63 = v12;

    id v23 = 0LL;
    uint64_t v4 = 0LL;
    xpc_object_t v43 = 0LL;
LABEL_34:
    uint64_t v44 = 0LL;
    goto LABEL_35;
  }

  xpc_object_t v43 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v43)
  {
    createMobileStorageError( (uint64_t)"call_and_response_remote",  243LL,  -2,  0LL,  @"Failed to create xpc dictionary.",  v57,  v58,  v59,  (uint64_t)v79);
    v64 = id v63 = v12;

    id v23 = 0LL;
    uint64_t v4 = 0LL;
    goto LABEL_34;
  }

  if (!v6)
  {
    uint64_t v46 = 0LL;
    goto LABEL_43;
  }

  uint64_t v46 = (void *)xpc_file_transfer_create_with_path();
  if (v46)
  {
    xpc_dictionary_set_value(v43, "XPCRequestRecvTx", v46);
LABEL_43:
    xpc_dictionary_set_value(v43, "XPCRequestDictionary", v45);
    uint64_t v66 = xpc_remote_connection_send_message_with_reply_sync();
    uint64_t v44 = (void *)v66;
    if (v66)
    {
      id v81 = v12;
      if (MEMORY[0x1895C0494](v66) == MEMORY[0x1895F9250])
      {
        id v23 = (id)_CFXPCCreateCFObjectFromXPCObject();
        isNSDictionary(v23);
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          id v23 = v23;
          uint64_t v4 = v23;
LABEL_52:
          id v12 = v81;
          if (!v2) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }

        uint64_t v74 = createMobileStorageError( (uint64_t)"call_and_response_remote",  277LL,  -2,  0LL,  @"Failed to create dictionary from XPC message.",  v75,  v76,  v77,  (uint64_t)v79);
      }

      else
      {
        v70 = (void *)MEMORY[0x1895C0440](v44);
        uint64_t v74 = createMobileStorageError( (uint64_t)"call_and_response_remote",  270LL,  -2,  0LL,  @"Unexpected message: %s",  v71,  v72,  v73,  (uint64_t)v70);

        free(v70);
        id v23 = 0LL;
        uint64_t v4 = 0LL;
      }

      id v42 = (id)v74;
      goto LABEL_52;
    }

    createMobileStorageError( (uint64_t)"call_and_response_remote",  264LL,  -2,  0LL,  @"Failed to receive XPC reply.",  v67,  v68,  v69,  (uint64_t)v79);
    v64 = id v63 = v12;

    id v23 = 0LL;
    uint64_t v4 = 0LL;
    goto LABEL_36;
  }

  createMobileStorageError( (uint64_t)"call_and_response_remote",  253LL,  -2,  0LL,  @"Failed to create xpc file transfer for %s.",  v60,  v61,  v62,  v6);
  v64 = id v63 = v12;

  id v23 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v44 = 0LL;
LABEL_36:
  id v42 = (id)v64;
  id v12 = v63;
  id v2 = v80;
  if (!v80) {
    goto LABEL_39;
  }
LABEL_37:
  if (!v4) {
    void *v2 = v42;
  }
LABEL_39:
  if (v16) {
    xpc_remote_connection_cancel();
  }

  return v4;
}

void __call_and_response_remote_block_invoke(uint64_t a1, int a2)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    __call_and_response_remote_block_invoke_cold_1(a2);
  }
}

uint64_t copy_remote_device_property()
{
  uint64_t v0 = remote_device_copy_property();
  id v1 = (void *)v0;
  if (v0)
  {
    if (MEMORY[0x1895C0494](v0) == MEMORY[0x1895F92F0])
    {
      uint64_t v2 = [MEMORY[0x189607968] numberWithUnsignedLongLong:xpc_uint64_get_value(v1)];
    }

    else
    {
      uint64_t v2 = _CFXPCCreateCFObjectFromXPCObject();
    }

    uint64_t v3 = v2;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void get_mounted_media_entries_cold_1(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1(&dword_18826F000, MEMORY[0x1895F8DA0], (uint64_t)a3, "Skipping %@, as we didn't mount it.", a1);
}

void create_map_entry_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Failed to load version dictionary at %@ (image version: %@).",  (uint8_t *)&v2,  0x16u);
}

void get_attached_media_entries_cold_1(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_18826F000, MEMORY[0x1895F8DA0], a3, "Ignoring EFI partition.", a1);
}

void get_attached_media_entries_cold_2(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_18826F000, MEMORY[0x1895F8DA0], a3, "Ignoring Apple_partition_map partition.", a1);
}

void get_attached_media_entries_cold_3(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1( &dword_18826F000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "The attached media %@ is not a leaf, ignoring.",  a1);
}

void get_attached_media_entries_cold_4(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1( &dword_18826F000,  MEMORY[0x1895F8DA0],  (uint64_t)a3,  "The attached media %@ is not removable, ignoring.",  a1);
}

void lookup_map_entries_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_0(&dword_18826F000, MEMORY[0x1895F8DA0], a3, "Failed to retrieve the list of attached devices.", v3);
}

void __call_and_response_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __call_and_response_block_invoke_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __call_and_response_remote_block_invoke_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "xpc_file_transfer_create_with_path completed with error: %d",  (uint8_t *)v1,  8u);
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x189613F38]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x189613F40]();
}

uint64_t AMAuthInstallRequestSendSync()
{
  return MEMORY[0x189613F48]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x189613F58]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x189613F60]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x189613F68]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator( io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x189608498](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1895FA9D8]();
}

uint64_t cryptex_copy_list_4MSM()
{
  return MEMORY[0x189614CE8]();
}

uint64_t cryptex_msm_array_destroy()
{
  return MEMORY[0x189614CF0]();
}

uint64_t cryptex_msm_get_string()
{
  return MEMORY[0x189614CF8]();
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

void free(void *a1)
{
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FB548](a1, *(void *)&a2, *(void *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FB9A8](a1, *(void *)&a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1895FC5E0]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1895FC6E0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8E8](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x189611ED0]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x189611EE0]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x189611F28]();
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FD108](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1895FDC00](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x1895FDE28]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x189612008]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x189612020]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x189612048]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x189612098]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1896120A8]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}