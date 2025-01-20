LABEL_16:
  return v23;
}

  return v17;
}

LABEL_36:
          ++v5;
          if (!--v19) {
            goto LABEL_40;
          }
        }

        *v22++ = v23;
        goto LABEL_36;
      }
    }

    else
    {
      memcpy(v21, v5, v12 - v5);
    }

    v10 = 0;
LABEL_40:
    [NSString stringWithUTF8String:v21];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v24];

    goto LABEL_41;
  }

  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m",  "+[NSArray(ZhuGe) arrayFromShellCommandString:]",  98LL,  @"Quotation %c is not paired in command %@!",  v7,  v8,  v9,  (char)v10);
  v25 = 0LL;
LABEL_43:
  v3 = v27;
LABEL_45:

  return v25;
}

uint64_t getIOConnection(uint64_t (*a1)(void), void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  v13 = v9;
  *(void *)existing = 0LL;
  if (!a5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  24LL,  @"error p-pointer is nil!",  v10,  v11,  v12,  v68);
    goto LABEL_49;
  }

  *a5 = 0LL;
  if (!a1)
  {
    v16 = @"pServiceMatchingMethod pointer is NULL!";
    uint64_t v17 = 30LL;
LABEL_12:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  v17,  v16,  v10,  v11,  v12,  v68);
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = 45LL;
    goto LABEL_48;
  }

  if (!v9)
  {
    v16 = @"service pointer is nil!";
    uint64_t v17 = 36LL;
    goto LABEL_12;
  }

  if (a1 == MEMORY[0x189608580])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = IOServiceMatching((const char *)[v13 UTF8String]);
      goto LABEL_23;
    }

    uint64_t v22 = objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  44LL,  @"Argument type %@ is incorrect for IOServiceMatching!",  v23,  v24,  v25,  v22);
    goto LABEL_47;
  }

  if (a1 == MEMORY[0x189608590])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = IOServiceNameMatching((const char *)[v13 UTF8String]);
      goto LABEL_23;
    }

    uint64_t v26 = objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  52LL,  @"Argument type %@ is incorrect for IOServiceNameMatching!",  v27,  v28,  v29,  v26);
    goto LABEL_47;
  }

  if ((char *)a1 == (char *)MEMORY[0x189607C80])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = IOBSDNameMatching( *MEMORY[0x1896086A8], 0, (const char *)[v13 UTF8String]);
      goto LABEL_23;
    }

    uint64_t v49 = objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  60LL,  @"Argument type %@ is incorrect for IOBSDNameMatching!",  v50,  v51,  v52,  v49);
LABEL_47:
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = 9LL;
    goto LABEL_48;
  }

  if (a1 != MEMORY[0x189608508])
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  75LL,  @"Unsupported service matching method!",  v10,  v11,  v12,  v68);
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = 75LL;
LABEL_48:
    [v14 errorWithZhuGeErrorCode:v15 underlyingError:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_49;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v53 = objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  68LL,  @"Argument type %@ is incorrect for IORegistryEntryIDMatching!",  v54,  v55,  v56,  v53);
    goto LABEL_47;
  }

  v18 = IORegistryEntryIDMatching([v13 unsignedLongLongValue]);
LABEL_23:
  if (!v18)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  81LL,  @"Failed to create a matching dict for service %@!",  v19,  v20,  v21,  (uint64_t)v13);
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = 24LL;
    goto LABEL_48;
  }

  uint64_t MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x1896086A8], v18, &existing[1]);
  if ((_DWORD)MatchingServices)
  {
    mach_error_t v34 = MatchingServices;
    [MEMORY[0x189607968] numberWithInt:MatchingServices];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:mach_error_string(v34)];
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  90LL,  @"Failed to get IO service iterator for %@ due to %@(%@)!",  v36,  v37,  v38,  (uint64_t)v13);

    v39 = (void *)MEMORY[0x189607870];
    [NSString stringWithUTF8String:mach_error_string(v34)];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 errorWithZhuGeErrorCode:20 underlyingError:v40];
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_49;
  }

  if (!existing[1])
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  96LL,  @"Failed to get a valid IO service iterator for %@!",  v31,  v32,  v33,  (uint64_t)v13);
    v14 = (void *)MEMORY[0x189607870];
    uint64_t v15 = 20LL;
    goto LABEL_48;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  101LL,  @"Got IO service iterator for %@!",  v31,  v32,  v33,  (uint64_t)v13);
  uint64_t v41 = IOIteratorNext(existing[1]);
  if ((_DWORD)v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = 5LL;
    v44 = (task_port_t *)MEMORY[0x1895FBBE0];
    do
    {
      if (a3 && *a3 && (((uint64_t (*)(uint64_t, void))*a3)(v42, a3[1]) & 1) == 0)
      {
        IOObjectRelease(v42);
      }

      else
      {
        uint64_t v43 = IOServiceOpen(v42, *v44, a4, existing);
        IOObjectRelease(v42);
        if ((_DWORD)v43) {
          BOOL v45 = 1;
        }
        else {
          BOOL v45 = existing[0] == 0;
        }
        if (!v45)
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:a4];
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  115LL,  @"Got IO connection for %@ with type %@.",  v65,  v66,  v67,  (uint64_t)v13);

          goto LABEL_49;
        }

        if (existing[0])
        {
          IOServiceClose(existing[0]);
          existing[0] = 0;
        }
      }

      uint64_t v42 = IOIteratorNext(existing[1]);
    }

    while ((_DWORD)v42);
    if (!(_DWORD)v43)
    {
      if (existing[0]) {
        goto LABEL_49;
      }
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  130LL,  @"Failed to open a valid IO connection for %@!",  v46,  v47,  v48,  (uint64_t)v13);
      v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = 25LL;
      goto LABEL_48;
    }
  }

  else
  {
    uint64_t v43 = 5LL;
  }

  [MEMORY[0x189607968] numberWithInt:v43];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:mach_error_string(v43)];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeIO.m",  "getIOConnection",  123LL,  @"Failed to open IO connection for %@ due to %@(%@)!",  v60,  v61,  v62,  (uint64_t)v13);

  v63 = (void *)MEMORY[0x189607870];
  [NSString stringWithUTF8String:mach_error_string(v43)];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 errorWithZhuGeErrorCode:25 underlyingError:v64];
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  if (existing[0])
  {
    IOServiceClose(existing[0]);
    existing[0] = 0;
  }

LABEL_49:
  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  uint64_t v57 = existing[0];

  return v57;
}

                  uint64_t v65 = v73;
                  v64 = v210;
                  uint64_t v29 = v229;
LABEL_50:

                  goto LABEL_51;
                }
              }

              objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v73, "count"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              [MEMORY[0x189607968] numberWithInt:(v82 + 1)];
              v206 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  773LL,  @"Flexible key %@ only has %@ subkeys while requring %@ subkeys!",  v126,  v127,  v128,  (uint64_t)v14);

              [MEMORY[0x189607870] errorWithZhuGeErrorCode:17 underlyingError:0];
              *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_102:
              v241 = 0LL;
              v238 = 0LL;
              v236 = 0LL;
              v237 = 0LL;
              v239 = 0LL;
              uint64_t v27 = 0LL;
              mach_error_t v34 = &unk_18A31F0D0;
              v35 = &unk_18A31F0D0;
              a8 = v231;
              v30 = v222;
              uint64_t v32 = (void *)v223;
              uint64_t v31 = v226;
              uint64_t v29 = v229;
LABEL_103:
              uint64_t v28 = v228;
              goto LABEL_148;
            }

            ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  761LL,  @"Flexible key %@ is missing subkey(s)!",  v77,  v78,  v79,  (uint64_t)v14);
            [MEMORY[0x189607870] errorWithZhuGeErrorCode:17 underlyingError:0];
            v142 = (id)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  755LL,  @"Flexible key %@ got a nil subkey!",  v74,  v75,  v76,  (uint64_t)v14);
            v142 = v210;
          }

          *a8 = v142;
          goto LABEL_102;
        }

uint64_t initPthreadRecursiveMutex(pthread_mutex_t *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.__sig = 0LL;
  *(void *)v3.__opaque = 0LL;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = pthread_mutexattr_init(&v3);
  if (!(_DWORD)result)
  {
    uint64_t result = pthread_mutexattr_settype(&v3, 2);
    if (!(_DWORD)result) {
      return pthread_mutex_init(a1, &v3);
    }
  }

  return result;
}

uint64_t isZhuGeInInternalBuild()
{
  if (isZhuGeInInternalBuild_aToken != -1) {
    dispatch_once(&isZhuGeInInternalBuild_aToken, &__block_literal_global);
  }
  return isZhuGeInInternalBuild_inInternalBuild;
}

uint64_t __isZhuGeInInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isZhuGeInInternalBuild_inInternalBuild = result;
  return result;
}

uint64_t isZhuGeInFactoryBuild()
{
  if (isZhuGeInFactoryBuild_aToken != -1) {
    dispatch_once(&isZhuGeInFactoryBuild_aToken, &__block_literal_global_2);
  }
  return isZhuGeInFactoryBuild_inFactoryBuild;
}

uint64_t __isZhuGeInFactoryBuild_block_invoke()
{
  uint64_t result = os_variant_has_factory_content();
  isZhuGeInFactoryBuild_inFactoryBuild = result;
  return result;
}

uint64_t islibtraceSimulatingCustomerBuild()
{
  if (islibtraceSimulatingCustomerBuild_aToken != -1) {
    dispatch_once(&islibtraceSimulatingCustomerBuild_aToken, &__block_literal_global_3);
  }
  return islibtraceSimulatingCustomerBuild_isSimulating;
}

uint64_t __islibtraceSimulatingCustomerBuild_block_invoke()
{
  uint64_t result = os_parse_boot_arg_int();
  if ((_DWORD)result) {
    islibtraceSimulatingCustomerBuild_isSimulating = 0;
  }
  return result;
}

uint64_t getZhuGeDebugOption()
{
  unsigned int v6 = 0;
  uint64_t v5 = 0LL;
  getNVRAMVariableValueString(@"zhuge_debug");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    [MEMORY[0x189607A08] scannerWithString:v0];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v1 scanInt:&v6] && (objc_msgSend(v1, "isAtEnd") & 1) != 0)
    {
      v2 = v1;
      goto LABEL_7;
    }

    objc_msgSend(MEMORY[0x189607A08], "scannerWithString:", v0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v2 scanHexInt:&v6] && objc_msgSend(v2, "isAtEnd"))
    {
LABEL_7:
      uint64_t v3 = v6;
      uint64_t v5 = v6;
      if (v6) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    v2 = 0LL;
  }

  else {
    uint64_t v3 = 0LL;
  }
LABEL_13:

  return v3;
}

id getNVRAMVariableValueString(void *a1)
{
  v1 = a1;
  if (v1)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/options");
    if (v2)
    {
      io_object_t v3 = v2;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, v1, (CFAllocatorRef)*MEMORY[0x189604DB0], 0);
      if (CFProperty)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v5 = CFProperty;
LABEL_9:
          unsigned int v6 = v5;
LABEL_11:
          IOObjectRelease(v3);
          goto LABEL_12;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [NSString stringFromData:CFProperty];
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
      }

      unsigned int v6 = 0LL;
      goto LABEL_11;
    }
  }

  unsigned int v6 = 0LL;
  CFProperty = 0LL;
LABEL_12:

  return v6;
}

uint64_t hasZhuGeLogConditionalPrint()
{
  return hasZhuGeLogConditionalPrint_itHas;
}

uint64_t __hasZhuGeLogConditionalPrint_block_invoke()
{
  uint64_t result = getZhuGeDebugOption();
  hasZhuGeLogConditionalPrint_itHas = result & 1;
  return result;
}

uint64_t hasZhuGeLogPrefixFileFuncLine()
{
  if (hasZhuGeLogPrefixFileFuncLine_aToken != -1) {
    dispatch_once(&hasZhuGeLogPrefixFileFuncLine_aToken, &__block_literal_global_32);
  }
  return hasZhuGeLogPrefixFileFuncLine_itHas;
}

uint64_t __hasZhuGeLogPrefixFileFuncLine_block_invoke()
{
  uint64_t result = getZhuGeDebugOption();
  hasZhuGeLogPrefixFileFuncLine_itHas = (result & 4) != 0;
  return result;
}

uint64_t hasZhuGeLogPrefixPidTid()
{
  if (hasZhuGeLogPrefixPidTid_aToken != -1) {
    dispatch_once(&hasZhuGeLogPrefixPidTid_aToken, &__block_literal_global_33);
  }
  return hasZhuGeLogPrefixPidTid_itHas;
}

uint64_t __hasZhuGeLogPrefixPidTid_block_invoke()
{
  uint64_t result = getZhuGeDebugOption();
  hasZhuGeLogPrefixPidTid_itHas = (result & 2) != 0;
  return result;
}

uint64_t doesZhuGeDeemRestoreOSAsInternal()
{
  if (doesZhuGeDeemRestoreOSAsInternal_aToken != -1) {
    dispatch_once(&doesZhuGeDeemRestoreOSAsInternal_aToken, &__block_literal_global_34);
  }
  return doesZhuGeDeemRestoreOSAsInternal_deemItAsInternal;
}

uint64_t __doesZhuGeDeemRestoreOSAsInternal_block_invoke()
{
  uint64_t result = getZhuGeDebugOption();
  doesZhuGeDeemRestoreOSAsInternal_deemItAsInternal = (result & 8) != 0;
  return result;
}

uint64_t isZhuGeInRestoreOS()
{
  if (isZhuGeInRestoreOS_aToken != -1) {
    dispatch_once(&isZhuGeInRestoreOS_aToken, &__block_literal_global_36);
  }
  return isZhuGeInRestoreOS_isInRestoreOS;
}

void __isZhuGeInRestoreOS_block_invoke()
{
  char v0 = os_parse_boot_arg_int();
  [MEMORY[0x189603F68] dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    uint64_t v4 = v1;
    [v1 objectForKeyedSubscript:@"ReleaseType"];
    io_registry_entry_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    char v3 = [v2 isEqualToString:@"Restore"];

    v1 = v4;
  }

  else
  {
    char v3 = 0;
  }

  isZhuGeInRestoreOS_isInRestoreOS = v0 & v3;
}

id getZhuGeOS()
{
  if (getZhuGeOS_aToken != -1) {
    dispatch_once(&getZhuGeOS_aToken, &__block_literal_global_47);
  }
  return (id)getZhuGeOS_osString;
}

void __getZhuGeOS_block_invoke()
{
  char v0 = (void *)getZhuGeOS_osString;
  getZhuGeOS_osString = (uint64_t)@"TVOS";
}

uint64_t isInZhuGeService()
{
  if (isInZhuGeService_aToken != -1) {
    dispatch_once(&isInZhuGeService_aToken, &__block_literal_global_50);
  }
  return isInZhuGeService_isInXPCService;
}

void __isInZhuGeService_block_invoke()
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 processName];
  char v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v0 isEqualToString:@"ZhuGeService"])
  {
    [v5 environment];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 objectForKeyedSubscript:@"XPC_SERVICE_NAME"];
    io_registry_entry_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    int v3 = [v2 isEqualToString:@"com.apple.ZhuGeService"];

    uint64_t v4 = v5;
    if (v3) {
      isInZhuGeService_isInXPCService = 1;
    }
  }

  else
  {

    uint64_t v4 = v5;
  }
}

uint64_t isZhuGeStdoutRedirected()
{
  if (isZhuGeStdoutRedirected_aToken != -1) {
    dispatch_once(&isZhuGeStdoutRedirected_aToken, &__block_literal_global_63);
  }
  return isZhuGeStdoutRedirected_isStdoutRedirected;
}

uint64_t __isZhuGeStdoutRedirected_block_invoke()
{
  uint64_t result = isatty(1);
  isZhuGeStdoutRedirected_isStdoutRedirected = (_DWORD)result == 0;
  return result;
}

id getObfuscatedString(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  v7 = v3;
  *(_OWORD *)md = 0u;
  __int128 v35 = 0u;
  if (!a2)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getObfuscatedString",  505LL,  @"error p-pointer is nil!",  v4,  v5,  v6,  v32);
    v13 = 0LL;
    v14 = 0LL;
    uint64_t v15 = 0LL;
    v16 = 0LL;
    uint64_t v17 = 0LL;
LABEL_13:
    id v19 = 0LL;
    goto LABEL_14;
  }

  *a2 = 0LL;
  if (!v3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getObfuscatedString",  511LL,  @"aString pointer is nil!",  v4,  v5,  v6,  v32);
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = 45LL;
    goto LABEL_7;
  }

  if ((unint64_t)[v3 length] >= 0x100)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getObfuscatedString",  517LL,  @"aString length is too long for 2 hex number expression!",  v8,  v9,  v10,  v32);
    uint64_t v11 = (void *)MEMORY[0x189607870];
    uint64_t v12 = 37LL;
LABEL_7:
    [v11 errorWithZhuGeErrorCode:v12 underlyingError:0];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0LL;
    v14 = 0LL;
LABEL_8:
    uint64_t v15 = 0LL;
    v16 = 0LL;
    uint64_t v17 = 0LL;
    id v19 = 0LL;
    *a2 = v18;
    goto LABEL_14;
  }

  if (getObfuscatedString_aToken != -1) {
    dispatch_once(&getObfuscatedString_aToken, &__block_literal_global_71);
  }
  uint64_t v20 = [(id)getObfuscatedString_obfuscatedCache getCacheForKey:v7];
  if (v20)
  {
    uint64_t v17 = (void *)v20;
    v13 = 0LL;
    v14 = 0LL;
    uint64_t v15 = 0LL;
    v16 = 0LL;
    goto LABEL_13;
  }

  id v22 = [v7 dataUsingEncoding:4];
  CC_SHA256((const void *)[v22 bytes], objc_msgSend(v22, "length"), md);
  [MEMORY[0x189603F48] dataWithBytes:md length:32];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  [v23 base64EncodedDataWithOptions:4];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  [NSString stringFromData:v13];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 stringByTrimmingCharactersInString:@"="];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v14 length] != 43)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getObfuscatedString",  547LL,  @"tmpString length is incorrect!",  v25,  v26,  v27,  v32);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:37 underlyingError:0];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }

  objc_msgSend(v14, "substringToIndex:", (unint64_t)objc_msgSend(v14, "length") >> 1);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v15, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithFormat:@"%@%02zX%@", v15, objc_msgSend(v7, "length"), v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  id v33 = 0LL;
  char v28 = [(id)getObfuscatedString_obfuscatedCache setCache:v17 forKey:v7 withError:&v33];
  id v19 = v33;
  if ((v28 & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getObfuscatedString",  560LL,  @"Failed to cache string for %@!",  v29,  v30,  v31,  (uint64_t)v7);
    id v19 = v19;
    *a2 = v19;

    uint64_t v17 = 0LL;
  }

LABEL_14:
  return v17;
}

void __getObfuscatedString_block_invoke()
{
  char v0 = -[ZhuGeCacheArmory initWithName:andCapacity:andCacheType:]( objc_alloc(&OBJC_CLASS___ZhuGeCacheArmory),  "initWithName:andCapacity:andCacheType:",  @"gOS",  &unk_18A31EFE0,  objc_opt_class());
  v1 = (void *)getObfuscatedString_obfuscatedCache;
  getObfuscatedString_obfuscatedCache = (uint64_t)v0;
}

id getElucidatedStringLen(void *a1, void *a2)
{
  id v3 = a1;
  v7 = v3;
  int v24 = 0;
  if (!a2)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getElucidatedStringLen",  580LL,  @"error p-pointer is nil!",  v4,  v5,  v6,  v23);
    v16 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_15;
  }

  *a2 = 0LL;
  if (!v3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getElucidatedStringLen",  586LL,  @"aObfuscatedString pointer is nil!",  v4,  v5,  v6,  v23);
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = 45LL;
LABEL_11:
    [v17 errorWithZhuGeErrorCode:v18 underlyingError:0];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v11 = 0LL;
LABEL_14:
    *a2 = v19;
    goto LABEL_15;
  }

  if ([v3 length] != 45)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getElucidatedStringLen",  592LL,  @"aObfuscatedString length is incorrect!",  v8,  v9,  v10,  v23);
    uint64_t v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = 37LL;
    goto LABEL_11;
  }

  objc_msgSend(v7, "substringWithRange:", 21, 2);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607A08] scannerWithString:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v12 scanHexInt:&v24] || (objc_msgSend(v12, "isAtEnd") & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getElucidatedStringLen",  602LL,  @"Failed to convert %@ to hex number!",  v13,  v14,  v15,  (uint64_t)v11);
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = 59LL;
LABEL_13:
    [v20 errorWithZhuGeErrorCode:v21 underlyingError:0];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0LL;
    goto LABEL_14;
  }

  if (!v24)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getElucidatedStringLen",  608LL,  @"string length should not be zero!",  v13,  v14,  v15,  v23);
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = 37LL;
    goto LABEL_13;
  }

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v16;
}

uint64_t isObjectNSStringAndZhuGeNull(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v2 = [v1 isEqualToString:@"ZHUGE_NULL"];
  }
  else {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t isObjectNilOrZhuGeNull(void *a1)
{
  if (a1) {
    return isObjectNSStringAndZhuGeNull(a1);
  }
  else {
    return 1LL;
  }
}

uint64_t isObjectValidAndAllZero(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || (isObjectNSStringAndZhuGeNull(v1) & 1) != 0) {
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (![v2 length]) {
      goto LABEL_3;
    }
    [v2 stringByReplacingOccurrencesOfString:@"0" withString:&stru_18A317680];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 length];

    if (!v6)
    {
      uint64_t v3 = 1LL;
      goto LABEL_4;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [MEMORY[0x189607968] BOOLFromData:v2 needNegate:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v7 BOOLValue];

    goto LABEL_4;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v3 = [v2 isEqual:&unk_18A31EFF8];
    goto LABEL_4;
  }

LABEL_3:
  uint64_t v3 = 0LL;
LABEL_4:

  return v3;
}

id getFDRDataByFDRClassWithError(void *a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v9 = a2;
  uint64_t v23 = 0LL;
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getFDRDataByFDRClassWithError",  872LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v22);
    goto LABEL_12;
  }

  *a3 = 0LL;
  if (!v5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getFDRDataByFDRClassWithError",  878LL,  @"FDRClass pointer is nil!",  v6,  v7,  v8,  v22);
    id v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = 45LL;
    goto LABEL_15;
  }

  if (!libFDRLibraryCore() || !getAMFDRSealingMapCopyLocalDataForClassSymbolLoc())
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getFDRDataByFDRClassWithError",  884LL,  @"Failed to link libFDR dylib!",  v10,  v11,  v12,  v22);
    id v19 = (void *)MEMORY[0x189607870];
    uint64_t v20 = 13LL;
LABEL_15:
    [v19 errorWithZhuGeErrorCode:v20 underlyingError:0];
    uint64_t v17 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  if (!v9)
  {
    int v24 = @"CopyAllowUnsealed";
    v25[0] = MEMORY[0x189604A88];
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  AMFDRSealingMapCopyLocalDataForClassSymbolLoc = (uint64_t (*)(id, id, void **))getAMFDRSealingMapCopyLocalDataForClassSymbolLoc();
  if (!AMFDRSealingMapCopyLocalDataForClassSymbolLoc) {
    getFDRDataByFDRClassWithError_cold_1();
  }
  uint64_t v17 = (void *)AMFDRSealingMapCopyLocalDataForClassSymbolLoc(v5, v9, &v23);
  if (!v17 || v23)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "getFDRDataByFDRClassWithError",  895LL,  @"Failed to get FDR data for class %@!",  v14,  v15,  v16,  (uint64_t)v5);

    uint64_t v18 = v23;
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:15 underlyingError:v23];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    uint64_t v17 = 0LL;
  }

id MGQuery(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  if (!a2)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1541LL,  @"error p-pointer is nil!",  v4,  v5,  v6,  v23);
    goto LABEL_7;
  }

  *a2 = 0LL;
  if (!v3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1547LL,  @"MGkey pointer is nil!",  v4,  v5,  v6,  v23);
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = 45LL;
LABEL_10:
    [v20 errorWithZhuGeErrorCode:v21 underlyingError:0];
    uint64_t v11 = 0LL;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }

  if ((MGIsQuestionValid() & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1554LL,  @"%@ is not a vaild MobileGestalt key!",  v8,  v9,  v10,  (uint64_t)v7);
    uint64_t v20 = (void *)MEMORY[0x189607870];
    uint64_t v21 = 3LL;
    goto LABEL_10;
  }

  uint64_t v11 = (void *)MGCopyAnswerWithError();
  if (!v11)
  {
    [MEMORY[0x189607968] numberWithInt:0];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m",  "MGQuery",  1561LL,  @"Failed to query MobileGestalt for %@, MobileGestalt error code %@!",  v13,  v14,  v15,  (uint64_t)v7);

    uint64_t v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = (void *)NSString;
    [MEMORY[0x189607968] numberWithInt:0];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringWithFormat:@"Failed to query MobileGestalt for %@, MobileGestalt error code %@!", v7, v18];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithZhuGeErrorCode:4 underlyingError:v19];
    *a2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    uint64_t v11 = 0LL;
  }

LABEL_11:
  return v11;
}

uint64_t libFDRLibraryCore()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0LL;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000LL;
  uint64_t v0 = libFDRLibraryCore_frameworkLibrary;
  uint64_t v5 = libFDRLibraryCore_frameworkLibrary;
  if (!libFDRLibraryCore_frameworkLibrary)
  {
    __int128 v6 = xmmword_18A317358;
    uint64_t v7 = 0LL;
    uint64_t v0 = _sl_dlopen();
    v3[3] = v0;
    libFDRLibraryCore_frameworkLibrary = v0;
  }

  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_188F32874( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t getAMFDRSealingMapCopyLocalDataForClassSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_ptr;
  uint64_t v6 = getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_ptr;
  if (!getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_block_invoke;
    v2[3] = &unk_18A317338;
    v2[4] = &v3;
    __getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F32920( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *__getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libFDRLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }

  uint64_t result = dlsym(v2, "AMFDRSealingMapCopyLocalDataForClass");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  getAMFDRSealingMapCopyLocalDataForClassSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}
}

LABEL_40:
          v58 = 1;
          goto LABEL_43;
        }
      }

      uint64_t v52 = 1;
      if (!v50) {
        goto LABEL_28;
      }
      goto LABEL_40;
    }

    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  118LL,  @"Value config of revalue %@ is not an array",  v35,  v36,  v37,  v18);

    uint64_t v15 = v31;
LABEL_60:
    uint64_t v16 = v77;
    goto LABEL_61;
  }

  v73 = 0;
LABEL_69:

  uint64_t v66 = v73 & 1;
  ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  190LL,  @"Wasn't successful to find a matched revalue pattern!",  v67,  v68,  v69,  v71);
LABEL_70:
  uint64_t v12 = v72;
  uint64_t v7 = v74;
LABEL_71:

  return v66;
}

            if (!v64)
            {

              goto LABEL_47;
            }

            id v33 = v85 + 1;
            self = v80;
          }

          while (v85 + 1 != v82);
          v82 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
          if (v82) {
            continue;
          }
          break;
        }
      }

      else
      {
        v84 = 0LL;
        uint64_t v18 = 0LL;
        id v19 = 0LL;
        uint64_t v20 = 0LL;
        v79 = 0LL;
      }

      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m",  "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]",  304LL,  @"Key %@ may need further check",  v73,  v74,  v75,  (uint64_t)v10);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:73 underlyingError:0];
      *v77 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:
      uint64_t v16 = v79;
      uint64_t v17 = v84;
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m",  "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]",  223LL,  @"key pointer is nil!",  v7,  v8,  v9,  v76);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = 0LL;
      uint64_t v18 = 0LL;
      id v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v16 = 0LL;
      *a4 = v21;
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m",  "-[ZhuGeArmoryHelperArmory propertiesOfKey:withError:]",  217LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v76);
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    id v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v16 = 0LL;
  }

LABEL_51:
        uint64_t v31 = v226;
      }

      else
      {
        uint64_t v29 = v229;
      }

      if (v255) {
        v94 = v255;
      }
      else {
        v94 = @"ZHUGE_NULL";
      }
      [v228 addObject:v94];
      [v29 setArgument:&v255 atIndex:i];
    }

    v227 = v65;
    v210 = v64;
    uint64_t v22 = v234;
    uint64_t v32 = (void *)v223;
    v63 = v228;
  }

  objc_msgSend(v63, "componentsJoinedByString:", @", ");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  [v95 stringByReplacingOccurrencesOfString:@"ZHUGE_NULL" withString:@"nil"];
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  800LL,  @"Arguments were set for key %@: (%@)",  v96,  v97,  v98,  (uint64_t)v14);

  [v22 objectForKeyedSubscript:@"Timeout"];
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    [v22 objectForKeyedSubscript:@"Timeout"];
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v101 = objc_opt_isKindOfClass();

    if ((v101 & 1) == 0)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  806LL,  @"Preference of key %@ has a non-number timeout!",  v102,  v103,  v104,  (uint64_t)v14);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
      v241 = 0LL;
      v238 = 0LL;
      v236 = 0LL;
      v237 = 0LL;
      v239 = 0LL;
      uint64_t v27 = 0LL;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      mach_error_t v34 = &unk_18A31F0D0;
      __int128 v35 = &unk_18A31F0D0;
      a8 = v231;
      uint64_t v30 = v222;
      goto LABEL_103;
    }

    v218 = [v22 objectForKeyedSubscript:@"Timeout"];
  }

  else
  {
    v218 = 0LL;
  }

  [v22 objectForKeyedSubscript:@"RetryNumber"];
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v105)
  {
    [v22 objectForKeyedSubscript:@"RetryNumber"];
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v107 = objc_opt_isKindOfClass();

    if ((v107 & 1) == 0)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  817LL,  @"Preference of key %@ has a non-number retry number!",  v108,  v109,  v110,  (uint64_t)v14);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
      v241 = 0LL;
      v238 = 0LL;
      v236 = 0LL;
      v237 = 0LL;
      v239 = 0LL;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      mach_error_t v34 = &unk_18A31F0D0;
      __int128 v35 = &unk_18A31F0D0;
      a8 = v231;
LABEL_83:
      uint64_t v30 = v222;
      uint64_t v32 = (void *)v223;
      uint64_t v31 = v226;
      uint64_t v25 = v227;
      char v28 = v228;
      uint64_t v29 = v229;
      uint64_t v26 = v210;
      uint64_t v27 = (void *)v218;
      goto LABEL_18;
    }

    [v22 objectForKeyedSubscript:@"RetryNumber"];
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v111 intValue] & 0x80000000) != 0) {
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  824LL,  @"Preference of key %@ has an invalid retry number: %@!",  v112,  v113,  v114,  (uint64_t)v14);
    }
  }

  else
  {
    v111 = &unk_18A31F0D0;
  }

  [v22 objectForKeyedSubscript:@"RetryInterval"];
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v115)
  {
    v121 = &unk_18A31F0D0;
    goto LABEL_79;
  }

  [v22 objectForKeyedSubscript:@"RetryInterval"];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v117 = objc_opt_isKindOfClass();

  if ((v117 & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  831LL,  @"Preference of key %@ has a non-number retry interval!",  v118,  v119,  v120,  (uint64_t)v14);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    v239 = 0LL;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    __int128 v35 = &unk_18A31F0D0;
    a8 = v231;
    mach_error_t v34 = v111;
    goto LABEL_83;
  }

  [v22 objectForKeyedSubscript:@"RetryInterval"];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v121 intValue] & 0x80000000) != 0) {
    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  838LL,  @"Preference of key %@ has an invalid retry interval: %@!",  v122,  v123,  v124,  (uint64_t)v14);
  }
LABEL_79:
  v129 = v218;
  if (!v218)
  {
    v224 = v121;
    [v235 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = isObjectNilOrZhuGeNull(v130);

    if ((v131 & 1) != 0)
    {
      v129 = 0LL;
    }

    else
    {
      [v235 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v133 = objc_opt_isKindOfClass();

      if ((v133 & 1) == 0)
      {
        mach_error_t v34 = v111;
        uint64_t v32 = (void *)v223;
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  848LL,  @"Method %@ of key %@ has a non-number timeout",  v134,  v135,  v136,  v223);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
        v241 = 0LL;
        v238 = 0LL;
        v236 = 0LL;
        v237 = 0LL;
        v239 = 0LL;
        uint64_t v27 = 0LL;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = v231;
        uint64_t v31 = v226;
        uint64_t v25 = v227;
        uint64_t v30 = v222;
        char v28 = v228;
        uint64_t v29 = v229;
        uint64_t v26 = v210;
        goto LABEL_97;
      }

      v129 = [v235 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
    }

    v121 = v224;
  }

  v219 = (void *)v129;
  [v235 objectForKeyedSubscript:@"ACTION_RETRY"];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isObjectNilOrZhuGeNull(v137) & 1) != 0)
  {
    v221 = v111;
LABEL_89:
    v138 = (void *)v223;
    goto LABEL_111;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v224 = v121;
    mach_error_t v34 = v111;
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  864LL,  @"Method %@ of key %@ has a non-dictionary retry!",  v139,  v140,  v141,  v223);
    goto LABEL_94;
  }

  if (([v111 intValue] & 0x80000000) == 0)
  {
    v221 = v111;
    goto LABEL_108;
  }

  v224 = v121;
  [v137 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = isObjectNilOrZhuGeNull(v143);

  if ((v144 & 1) == 0)
  {
    [v137 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v146 = objc_opt_isKindOfClass();

    if ((v146 & 1) != 0)
    {
      [v137 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      v221 = v150;
      if (([v150 intValue] & 0x80000000) != 0) {
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  880LL,  @"Configuration of key %@ has an invalid retry number: %@!",  v151,  v152,  v153,  (uint64_t)v14);
      }
      goto LABEL_107;
    }

    mach_error_t v34 = v111;
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  873LL,  @"Method %@ of key %@ has a non-number retry number",  v147,  v148,  v149,  v223);
LABEL_94:
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    v239 = 0LL;
    a8 = v231;
    uint64_t v30 = v222;
    uint64_t v32 = (void *)v223;
    uint64_t v31 = v226;
    uint64_t v25 = v227;
    char v28 = v228;
    uint64_t v29 = v229;
    uint64_t v26 = v210;
    uint64_t v27 = v219;
LABEL_97:
    __int128 v35 = v224;
    goto LABEL_18;
  }

  v221 = v111;
LABEL_107:
  v121 = v224;
LABEL_108:
  v138 = (void *)v223;
  v224 = v121;
  [v137 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = isObjectNilOrZhuGeNull(v154);

  if ((v155 & 1) == 0)
  {
    [v137 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v195 = objc_opt_isKindOfClass();

    if ((v195 & 1) != 0)
    {
      [v137 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];
      v199 = (void *)objc_claimAutoreleasedReturnValue();

      v121 = v199;
      if (([v199 intValue] & 0x80000000) != 0) {
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  896LL,  @"Configuration of key %@ has an invalid retry interval: %@!",  v200,  v201,  v202,  (uint64_t)v243);
      }
      goto LABEL_89;
    }

    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  889LL,  @"Method %@ of key %@ has a non-number retry interval",  v196,  v197,  v198,  v223);
    mach_error_t v34 = v221;
    goto LABEL_94;
  }

  v121 = v224;
LABEL_111:

  v156 = v219;
  if (!v219 || ([v219 intValue] & 0x80000000) != 0)
  {

    v156 = &unk_18A31F0E8;
  }

  if (([v221 intValue] & 0x80000000) != 0)
  {

    v221 = &unk_18A31F0B8;
    v157 = 1;
  }

  else
  {
    v157 = (int)[v221 intValue] < 1;
  }

  v214 = v157;
  if (([v121 intValue] & 0x80000000) != 0)
  {

    v121 = &unk_18A31F100;
  }

  v158 = [v156 unsignedLongLongValue];
  v220 = (uint64_t)v156;
  if (v158 == -1) {
    timeout = -1LL;
  }
  else {
    timeout = dispatch_time(0LL, 1000000 * v158);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v159 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  v241 = dispatch_queue_create("ZhuGe_Action_Retry_Serial_Queue", v159);

  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", (int)(objc_msgSend(v221, "intValue") + 1));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", (int)(objc_msgSend(v221, "intValue") + 1));
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  mach_error_t v34 = v221;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", (int)(objc_msgSend(v221, "intValue") + 1));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  [v221 intValue];
  v163 = 0LL;
  v164 = MEMORY[0x189604A80];
  do
  {
    [v160 setObject:@"ZHUGE_NULL" atIndexedSubscript:v163];
    [v161 setObject:@"ZHUGE_NULL" atIndexedSubscript:v163];
    [v162 setObject:v164 atIndexedSubscript:v163++];
  }

  while (v163 <= (int)[v221 intValue]);
  v216 = v162;
  v217 = v161;
  [v221 intValue];
  v165 = 0LL;
  v215 = v160;
  v166 = v229;
  while (1)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __79__ZhuGeArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke;
    block[3] = &unk_18A317378;
    v212 = v166;
    v245 = v212;
    v252 = v230;
    v167 = v216;
    v246 = v167;
    v253 = v165;
    v211 = v222;
    v247 = v211;
    v168 = v138;
    v248 = v168;
    v249 = v243;
    v169 = v160;
    v250 = v169;
    v170 = v217;
    v251 = v170;
    v171 = dispatch_block_create((dispatch_block_flags_t)0LL, block);
    dispatch_async(v241, v171);
    v238 = v169;
    v236 = v167;
    v237 = v170;
    v225 = v171;
    if (dispatch_block_wait(v171, timeout))
    {
      v172 = v167;
      v173 = v165;
      [v172 setObject:MEMORY[0x189604A88] atIndexedSubscript:v165];
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  984LL,  @"%@ms timeout for method %@ of key %@!",  v174,  v175,  v176,  v220);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:62 underlyingError:0];
      v177 = 0LL;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      v178 = v168;
      goto LABEL_138;
    }

    v240 = v168;
    v179 = v166;
    v180 = v170;
    [v169 objectAtIndexedSubscript:v165];
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v182 = objc_opt_isKindOfClass();
    if ((v182 & 1) != 0)
    {
      [v169 objectAtIndexedSubscript:v165];
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v207 isEqualToString:@"ZHUGE_NULL"])
      {
        v183 = 0LL;
LABEL_131:

        goto LABEL_132;
      }
    }

    [v169 objectAtIndexedSubscript:v165];
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v182 & 1) != 0) {
      goto LABEL_131;
    }
LABEL_132:

    *a8 = v183;
    v184 = v180;
    v185 = [v180 objectAtIndexedSubscript:v165];
    objc_opt_class();
    v209 = (void *)v185;
    v186 = objc_opt_isKindOfClass();
    v166 = v179;
    if ((v186 & 1) != 0)
    {
      [v184 objectAtIndexedSubscript:v165];
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v208 isEqualToString:@"ZHUGE_NULL"])
      {
        v173 = v165;
        v177 = 0LL;
LABEL_136:

        goto LABEL_137;
      }
    }

    v173 = v165;
    v177 = [v184 objectAtIndexedSubscript:v165];
    if ((v186 & 1) != 0) {
      goto LABEL_136;
    }
LABEL_137:

    mach_error_t v34 = v221;
    v178 = v240;
LABEL_138:
    v239 = (void *)v177;
    v187 = v177 ? 1 : v214;
    if ((v187 & 1) == 0)
    {
      [MEMORY[0x189607968] numberWithUnsignedInteger:v173];
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  1000LL,  @"After %@ ms, retry %@/%@ times for method %@ of key %@",  v188,  v189,  v190,  (uint64_t)v121);

      v191 = (void *)MEMORY[0x189607A40];
      v192 = (double)(int)[v121 intValue] * 0.001;
      v193 = v191;
      mach_error_t v34 = v221;
      [v193 sleepForTimeInterval:v192];
    }

    v160 = v215;
    if (v187) {
      break;
    }
    uint64_t v32 = v178;
    v165 = v173 + 1;
    v138 = (void *)v223;
    if (v173 + 1 > (unint64_t)(int)[v34 intValue])
    {
      v239 = 0LL;
      __int128 v35 = v121;
      uint64_t v30 = v211;
      uint64_t v29 = v212;
      goto LABEL_147;
    }
  }

  __int128 v35 = v121;
  uint64_t v30 = v211;
  uint64_t v29 = v212;
  uint64_t v32 = v178;
LABEL_147:
  a8 = v231;
  uint64_t v31 = v226;
  char v28 = v228;
  uint64_t v27 = (void *)v220;
LABEL_148:
  uint64_t v25 = v227;
  uint64_t v26 = v210;
LABEL_18:

  return v239;
}

LABEL_57:
                    [v21 objectForKeyedSubscript:@"RETURN"];
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    [v116 objectForKeyedSubscript:@"RETURN_FORMAT"];
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    v118 = isObjectNilOrZhuGeNull(v117);

                    if ((v118 & 1) != 0) {
                      goto LABEL_59;
                    }
                    [v21 objectForKeyedSubscript:@"RETURN"];
                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                    [v119 objectForKeyedSubscript:@"RETURN_FORMAT"];
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    v121 = -[ZhuGeArmory convertReturnValue:toFormat:](v140, "convertReturnValue:toFormat:", v115, v120);

                    v115 = (void *)v121;
                    if (v121)
                    {
LABEL_59:
                      [v21 objectForKeyedSubscript:@"RETURN"];
                      v125 = (void *)objc_claimAutoreleasedReturnValue();
                      [v125 objectForKeyedSubscript:@"RETURN_CASE"];
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      v127 = isObjectNilOrZhuGeNull(v126);

                      if ((v127 & 1) != 0)
                      {
                        char v28 = v115;
                        goto LABEL_65;
                      }

                      [v21 objectForKeyedSubscript:@"RETURN"];
                      v128 = (void *)objc_claimAutoreleasedReturnValue();
                      [v128 objectForKeyedSubscript:@"RETURN_CASE"];
                      v129 = (void *)objc_claimAutoreleasedReturnValue();
                      -[ZhuGeArmory convertReturnValue:toCase:](v140, "convertReturnValue:toCase:", v115, v129);
                      char v28 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v28) {
                        goto LABEL_65;
                      }
                      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1179LL,  @"Failed to convert case for key %@!",  v130,  v131,  v132,  (uint64_t)v10);
                      [MEMORY[0x189607870] errorWithZhuGeErrorCode:10 underlyingError:0];
                      v133 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    else
                    {
                      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1169LL,  @"Failed to convert format for key %@!",  v122,  v123,  v124,  (uint64_t)v10);
                      [MEMORY[0x189607870] errorWithZhuGeErrorCode:10 underlyingError:0];
                      v133 = (id)objc_claimAutoreleasedReturnValue();
                      char v28 = 0LL;
                    }

                    *v139 = v133;
                    goto LABEL_65;
                  }

                  char v28 = v136;
                  ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1147LL,  @"Key %@ is not converted, keep original value %@",  v109,  v110,  v111,  (uint64_t)v10);
                }

                else
                {
                  ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1138LL,  @"Config %@ for key %@ is not a dictionary",  v103,  v104,  v105,  (uint64_t)@"RETURN_REVALUES");
                }
              }

              uint64_t v29 = v137;
              uint64_t v27 = obj;
              v115 = v28;
              if (!v28) {
                goto LABEL_43;
              }
              goto LABEL_57;
            }

            ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1127LL,  @"Config %@ for key %@ is not a dictionary",  v94,  v95,  v96,  (uint64_t)@"RETURN");
LABEL_65:
            uint64_t v29 = v137;
            uint64_t v27 = obj;
            goto LABEL_43;
          }

          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1100LL,  @"Key %@ is defined action sequence with no action item",  v77,  v78,  v79,  (uint64_t)v10);
          uint64_t v68 = (void *)MEMORY[0x189607870];
          v69 = 37LL;
        }

        else
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1080LL,  @"Key %@ doesn't define the default action",  v44,  v45,  v46,  (uint64_t)v10);
          uint64_t v68 = (void *)MEMORY[0x189607870];
          v69 = 29LL;
        }

        [v68 errorWithZhuGeErrorCode:v69 underlyingError:0];
        uint64_t v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
        char v28 = 0LL;
        *a6 = v67;
        uint64_t v29 = v137;
        goto LABEL_43;
      }

      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1074LL,  @"Key %@ doesn't define actions",  v40,  v41,  v42,  (uint64_t)v10);
      uint64_t v65 = (void *)MEMORY[0x189607870];
      uint64_t v66 = 29LL;
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1064LL,  @"Key %@ defines a non-string access",  v36,  v37,  v38,  (uint64_t)v10);
      uint64_t v65 = (void *)MEMORY[0x189607870];
      uint64_t v66 = 9LL;
    }

LABEL_25:
    [v65 errorWithZhuGeErrorCode:v66 underlyingError:0];
    uint64_t v67 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = 0LL;
    goto LABEL_42;
  }

  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1021LL,  @"error p-pointer is nil!",  v12,  v13,  v14,  v134);
  uint64_t v27 = 0LL;
  uint64_t v22 = 0LL;
  char v28 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v21 = 0LL;
LABEL_43:

  return v28;
}

LABEL_13:
  return v27;
}

LABEL_33:
LABEL_34:
  return v15;
}

LABEL_21:
      uint64_t v14 = v53;
LABEL_22:
      ++v13;
    }

    while (v13 != v14);
    uint64_t v9 = v52;
    uint64_t v53 = [v11 countByEnumeratingWithState:&v58 objects:v63 count:16];
  }

  while (v53);
LABEL_24:

  uint64_t v10 = v10;
  uint64_t v42 = v10;
LABEL_34:

  return v42;
}

  uint64_t v43 = v20;

  return v43;
}

LABEL_10:
  uint64_t v31 = v16;
  return v31;
}

    uint64_t v25 = 0LL;
LABEL_11:
    *a4 = v24;
    goto LABEL_12;
  }

  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryScreenSerialNumberByProperty:withError:]",  1693LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v30);
  uint64_t v14 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v25 = 0LL;
LABEL_12:

  return v25;
}

  uint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = *v3++;
    uint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

LABEL_60:
  ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmoryHelper.m",  "-[ZhuGeArmoryHelperArmory getPropertiesOfKey:withError:]",  528LL,  @"Key %@ does not match any definition!",  v84,  v85,  v86,  (uint64_t)v10);
  [MEMORY[0x189607870] errorWithZhuGeErrorCode:74 underlyingError:0];
  uint64_t v14 = 0LL;
  *v88 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  uint64_t v22 = v14;

  return v22;
}

void fdrLogCallback( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (a1 == 4) {
      int v8 = 512;
    }
    else {
      int v8 = 256;
    }
    if (a1 >= 4) {
      int v9 = v8;
    }
    else {
      int v9 = 1040;
    }
    ZhuGeLog( v9,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "fdrLogCallback",  135LL,  @"%s",  a6,  a7,  a8,  a2);
  }

uint64_t pAMFDRLogSetHandler(uint64_t a1)
{
  AMFDRLogSetHandlerSymbolLoc = (uint64_t (*)(uint64_t))getAMFDRLogSetHandlerSymbolLoc();
  if (!AMFDRLogSetHandlerSymbolLoc) {
    getFDRDataByFDRClassWithError_cold_1();
  }
  return AMFDRLogSetHandlerSymbolLoc(a1);
}

void fdrDiagnosticLogCallback( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (a1 == 4) {
      int v8 = 262656;
    }
    else {
      int v8 = 262400;
    }
    if (a1 >= 4) {
      int v9 = v8;
    }
    else {
      int v9 = 1040;
    }
    ZhuGeLog( v9,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "fdrDiagnosticLogCallback",  145LL,  @"%s",  a6,  a7,  a8,  a2);
  }

LABEL_73:
  optionsa = v18;
  v294 = a1;
  uint64_t v23 = objc_alloc_init(MEMORY[0x189603FA8]);
  MEMORY[0x1895DA70C](object);
  v119 = IOIteratorNext(object);
  uint64_t v22 = v296;
  if (!(_DWORD)v119) {
    goto LABEL_168;
  }
  v120 = v119;
  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  v295 = v15;
  do
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v120];
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  765LL,  @"Trying IO service entry %@",  v122,  v123,  v124,  (uint64_t)v121);

    [v15 objectForKeyedSubscript:@"parentClass"];
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    entry = v120;
    if (v125
      || ([v15 objectForKeyedSubscript:@"parentName"],
          (v125 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
    {

LABEL_78:
      parent = 0;
      memset(className, 0, sizeof(className));
      memset(name, 0, sizeof(name));
      v126 = v22;
      if (IORegistryEntryGetParentEntry(v120, (const char *)[v126 UTF8String], &parent))
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:v120];
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        [v294 key];
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  782LL,  @"Failed to get parent entry of entry %@ for key %@!",  v129,  v130,  v131,  (uint64_t)v127);
      }

      else if (IOObjectGetClass(parent, className))
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:v120];
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        [v294 key];
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  788LL,  @"Failed step1 to get parent class of entry %@ for key %@!",  v132,  v133,  v134,  (uint64_t)v127);
      }

      else if (IORegistryEntryGetNameInPlane( parent, (const char *)[v126 UTF8String], name))
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:v120];
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        [v294 key];
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  794LL,  @"Failed step2 to get parent name of entry %@ for key %@!",  v137,  v138,  v139,  (uint64_t)v127);
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:parent];
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithUTF8String:className];
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithUTF8String:name];
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  798LL,  @"Parent entry is %@, class is %@, name is %@",  v167,  v168,  v169,  (uint64_t)v165);

        v170 = [v15 objectForKeyedSubscript:@"parentClass"];
        if (v170
          && (v171 = (void *)v170,
              [v15 objectForKeyedSubscript:@"parentName"],
              v172 = (void *)objc_claimAutoreleasedReturnValue(),
              v172,
              v171,
              v172))
        {
          [v15 objectForKeyedSubscript:@"parentClass"];
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          [NSString stringWithUTF8String:className];
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v173 isEqualToString:v174])
          {
            [v15 objectForKeyedSubscript:@"parentName"];
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString stringWithUTF8String:name];
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v177 = [v175 isEqualToString:v176];

            v136 = @"parent class and name";
            if ((v177 & 1) != 0) {
              goto LABEL_88;
            }
          }

          else
          {
          }

          [MEMORY[0x189607968] numberWithUnsignedInt:entry];
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          [v294 key];
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  803LL,  @"Failed to match parent class and name of entry %@ for key %@!",  v202,  v203,  v204,  (uint64_t)v127);
        }

        else
        {
          [v15 objectForKeyedSubscript:@"parentClass"];
          v182 = (void *)objc_claimAutoreleasedReturnValue();

          if (v182)
          {
            [v15 objectForKeyedSubscript:@"parentClass"];
            v183 = (void *)objc_claimAutoreleasedReturnValue();
            [NSString stringWithUTF8String:className];
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = [v183 isEqualToString:v184];

            v136 = @"parent class";
            if ((v185 & 1) != 0) {
              goto LABEL_88;
            }
            [MEMORY[0x189607968] numberWithUnsignedInt:entry];
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            [v294 key];
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  812LL,  @"Failed to match parent class of entry %@ for key %@!",  v186,  v187,  v188,  (uint64_t)v127);
          }

          else
          {
            [v15 objectForKeyedSubscript:@"parentName"];
            v195 = (void *)objc_claimAutoreleasedReturnValue();

            if (v195)
            {
              [v15 objectForKeyedSubscript:@"parentName"];
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              [NSString stringWithUTF8String:name];
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              v198 = [v196 isEqualToString:v197];

              v136 = @"parent name";
              if ((v198 & 1) != 0) {
                goto LABEL_88;
              }
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              [v294 key];
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  821LL,  @"Failed to match parent name of entry %@ for key %@!",  v199,  v200,  v201,  (uint64_t)v127);
            }

            else
            {
              [v15 objectForKeyedSubscript:@"parent"];
              v237 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v237)
              {
                v136 = @"parent check failed";
                goto LABEL_88;
              }

              [v15 objectForKeyedSubscript:@"parent"];
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              [NSString stringWithUTF8String:className];
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              if ([v127 isEqualToString:v128])
              {
                v136 = @"parent class or name";
                goto LABEL_87;
              }

              [v15 objectForKeyedSubscript:@"parent"];
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              [NSString stringWithUTF8String:name];
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              v240 = [v238 isEqualToString:v239];

              v136 = @"parent class or name";
              if ((v240 & 1) != 0) {
                goto LABEL_88;
              }
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              [v294 key];
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  831LL,  @"Failed to match parent class or name of entry %@ for key %@!",  v241,  v242,  v243,  (uint64_t)v127);
            }
          }
        }
      }

      v136 = @"parent check failed";
LABEL_87:

LABEL_88:
      uint64_t v15 = v295;
      uint64_t v22 = v296;
      goto LABEL_89;
    }

    [v15 objectForKeyedSubscript:@"parent"];
    v135 = (void *)objc_claimAutoreleasedReturnValue();

    if (v135) {
      goto LABEL_78;
    }
    v136 = @"parent no check";
LABEL_89:
    LODWORD(v140) = entry;
    if ((-[__CFString isEqualToString:](v136, "isEqualToString:", @"parent check failed") & 1) != 0) {
      goto LABEL_160;
    }
    *(void *)className = 0LL;
    CFProperties = IORegistryEntryCreateCFProperties(entry, (CFMutableDictionaryRef *)className, allocator, 0);
    if (CFProperties)
    {
      v142 = CFProperties;
      [MEMORY[0x189607968] numberWithUnsignedInt:entry];
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      mach_error_string(v142);
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  847LL,  @"Failed to get IO properties from entry %@, %s",  v144,  v145,  v146,  (uint64_t)v143);
      goto LABEL_159;
    }

    v143 = *(void **)className;
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    v140 = v20;
    v291 = v143;
    v288 = [v140 countByEnumeratingWithState:&v302 objects:v308 count:16];
    if (!v288)
    {
      v164 = 0;
      v298 = 0LL;
      v299 = 0LL;
      goto LABEL_150;
    }

    v147 = 0;
    v298 = 0LL;
    v299 = 0LL;
    v286 = v140;
    v287 = *(void *)v303;
    while (2)
    {
      v148 = 0LL;
      v280 = v147 + v288;
      v281 = v147;
      do
      {
        if (*(void *)v303 != v287) {
          objc_enumerationMutation(v140);
        }
        v149 = *(void *)(*((void *)&v302 + 1) + 8 * v148);
        [v140 objectForKeyedSubscript:v149];
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        [v143 objectForKeyedSubscript:v149];
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v151)
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:entry];
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  860LL,  @"%@ doesn't exist in entry %@",  v179,  v180,  v181,  v149);
          goto LABEL_144;
        }

        if ([v150 hasPrefix:@"number:"])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(@"number:", "length"));
            v152 = (void *)objc_claimAutoreleasedReturnValue();

            v153 = objc_alloc_init(MEMORY[0x189607978]);
            [v153 numberFromString:v152];
            v154 = (void *)objc_claimAutoreleasedReturnValue();

            if (![v154 isEqualToNumber:v151])
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  876LL,  @"NSNumber %@ of entry %@ is %@ while expecting %@",  v192,  v193,  v194,  v149);

              v298 = v154;
LABEL_142:
              v150 = v152;
              goto LABEL_148;
            }

            v298 = v154;
            v299 = v151;
            goto LABEL_120;
          }

          [MEMORY[0x189607968] numberWithUnsignedInt:entry];
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  867LL,  @"%@ of entry %@ is class %@ while expecting NSNumber",  v189,  v190,  v191,  v149);
LABEL_144:

          goto LABEL_149;
        }

        if (![v150 hasPrefix:@"BOOL:"])
        {
          if ([v150 hasPrefix:@"data:"])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  901LL,  @"%@ of entry %@ is class %@ while expecting NSData",  v211,  v212,  v213,  v149);
              goto LABEL_144;
            }

            [NSString stringFromData:v151];
            v299 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(@"data:", "length"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v157)
            {
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  909LL,  @"%@ is not a valid data criterion",  v158,  v159,  v160,  (uint64_t)v150);
              v298 = 0LL;
              v151 = v299;
              goto LABEL_149;
            }

            v151 = v299;
            if (([v157 isEqualToString:v299] & 1) == 0)
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  914LL,  @"NSData %@ of entry %@ is %@ while expecting %@",  v218,  v219,  v220,  v149);
              goto LABEL_147;
            }
          }

          else
          {
            objc_msgSend(v150, "substringFromIndex:", objc_msgSend(@"string:", "length"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();

            if (([v157 isEqualToString:v151] & 1) == 0)
            {
              [MEMORY[0x189607968] numberWithUnsignedInt:entry];
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  922LL,  @"NSString %@ of entry %@ is %@ while expecting %@",  v214,  v215,  v216,  v149);
LABEL_147:

              v298 = v157;
LABEL_148:
              uint64_t v22 = v296;
LABEL_149:

              v164 = v281 + v148;
              v299 = v151;
              uint64_t v15 = v295;
              uint64_t v20 = v301;
              v143 = v291;
              v140 = v286;
              goto LABEL_150;
            }

            v299 = v151;
          }

          v298 = v157;
          v152 = v150;
          goto LABEL_120;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:entry];
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  882LL,  @"%@ of entry %@ is class %@ while expecting BOOL<NSNumber>",  v205,  v206,  v207,  v149);
          goto LABEL_144;
        }

        objc_msgSend(v150, "substringFromIndex:", objc_msgSend(@"BOOL:", "length"));
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        [v152 lowercaseString];
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v155 isEqualToString:@"yes"])
        {

          v156 = (void *)MEMORY[0x189604A88];
        }

        else
        {
          [v152 lowercaseString];
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v300 = [v161 isEqualToString:@"true"];

          if (v300) {
            v156 = (void *)MEMORY[0x189604A88];
          }
          else {
            v156 = (void *)MEMORY[0x189604A80];
          }
        }

        v162 = [v156 BOOLValue];
        if (v162 != [v151 BOOLValue])
        {
          [MEMORY[0x189607968] numberWithUnsignedInt:entry];
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  895LL,  @"BOOL %@ of entry %@ is %@ while expecting %@",  v208,  v209,  v210,  v149);

          v298 = v156;
          goto LABEL_142;
        }

        v298 = v156;
        v299 = v151;
LABEL_120:

        ++v148;
        uint64_t v15 = v295;
        uint64_t v22 = v296;
        v143 = v291;
        v140 = v286;
      }

      while (v288 != v148);
      v163 = [v286 countByEnumeratingWithState:&v302 objects:v308 count:16];
      v164 = v280;
      v147 = v280;
      uint64_t v20 = v301;
      v288 = v163;
      if (v163) {
        continue;
      }
      break;
    }

LABEL_150:
    v221 = v164;
    if ([v140 count] == v221)
    {
      if (v282)
      {
        ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  941LL,  @"Checking in self node for property %@",  v222,  v223,  v224,  (uint64_t)v8);
        [v143 objectForKeyedSubscript:v8];
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = (id)entry;
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:entry];
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607968] numberWithUnsignedInt:optionsa];
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  944LL,  @"Checking entry %@, plane %@ for property %@ with direction %@,",  v231,  v232,  v233,  (uint64_t)v230);

        v143 = v291;
        v140 = (id)entry;
        v225 = (void *)IORegistryEntrySearchCFProperty( entry, (const char *)[v290 UTF8String], v8, allocator, optionsa);
      }

      if (v225)
      {
        [v23 addObject:v225];
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInt:v140];
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  949LL,  @"No property %@ in entry %@",  v234,  v235,  v236,  (uint64_t)v8);

        LODWORD(v140) = entry;
      }
    }

    else
    {
      v226 = v221;
      [MEMORY[0x189607968] numberWithUnsignedInt:entry];
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189607968] numberWithInt:(v226 + 1)];
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v140, "count"));
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  933LL,  @"Entry %@ failed check at %@/%@",  v227,  v228,  v229,  (uint64_t)v225);

      v143 = v291;
      LODWORD(v140) = entry;
    }

LABEL_159:
LABEL_160:
    IOObjectRelease((io_object_t)v140);
    v120 = IOIteratorNext(object);
  }

  while ((_DWORD)v120);
LABEL_168:
  v244 = [v23 count];
  if (v244 == 1)
  {
    v254 = [v23 objectAtIndexedSubscript:0];

    [v294 key];
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  965LL,  @"Found 1 property %@ for key %@ with non-fullPath",  v255,  v256,  v257,  (uint64_t)v8);

    uint64_t v23 = (id)v254;
  }

  else if (v244)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    [v294 key];
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  969LL,  @"Found %@ property %@ for key %@ with non-fullPath",  v259,  v260,  v261,  (uint64_t)v258);
  }

  else
  {

    [v294 key];
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryIOProperty:fromCriteria:withError:]",  959LL,  @"Failed to find a non-fullPath service for key %@",  v246,  v247,  v248,  (uint64_t)v245);

    v95 = (void *)MEMORY[0x189607870];
    v96 = 21LL;
LABEL_171:
    [v95 errorWithZhuGeErrorCode:v96 underlyingError:0];
    uint64_t v23 = 0LL;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_175:
  uint64_t v21 = v290;
LABEL_17:
  if (object)
  {
    IOObjectRelease(object);
    object = 0;
  }

  return v23;
}

BOOL isMogulService(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0LL;
  CFMutableDictionaryRef properties = 0LL;
  if (!a1 || !a2) {
    return v2;
  }
  if (IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x189604DB0], 0))
  {
    uint64_t v7 = @"Failed to get registry properties";
    uint64_t v8 = 2819LL;
LABEL_5:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "isMogulService",  v8,  v7,  v4,  v5,  v6,  v13);
LABEL_6:
    BOOL v2 = 0LL;
    goto LABEL_7;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "isMogulService",  2822LL,  @"transportProperties: %@",  v4,  v5,  v6,  (uint64_t)properties);
  Value = (const __CFString *)CFDictionaryGetValue(properties, @"ComponentFunction");
  uint64_t v11 = (const __CFString *)CFDictionaryGetValue(properties, @"ComponentType");
  if (*a2 == 1)
  {
    uint64_t v12 = @"auth,display";
  }

  else
  {
    if (*a2)
    {
      uint64_t v7 = @"Unknown mogul type";
      uint64_t v8 = 2836LL;
      goto LABEL_5;
    }

    uint64_t v12 = @"auth,mlb";
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "isMogulService",  2839LL,  @"function: %@, targetFunction: %@, type: %@, targetType: %@",  v4,  v5,  v6,  (uint64_t)Value);
  if (CFStringCompare(Value, v12, 0LL)) {
    goto LABEL_6;
  }
  BOOL v2 = CFStringCompare(v11, @"mogul,a1222", 0LL) == kCFCompareEqualTo;
LABEL_7:
  if (properties) {
    CFRelease(properties);
  }
  return v2;
}

LABEL_43:
            ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "decodePKCS7TouchScreenCert",  v29,  v28,  v16,  v17,  v18,  (uint64_t)v30);
LABEL_44:
            CFRelease(v13);
            theData = v26;
            uint64_t v13 = v26;
            if (v26) {
              return v13;
            }
            goto LABEL_19;
          }

LABEL_18:
          CFRelease(v13);
          theData = 0LL;
LABEL_19:
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "+[ZhuGeKeysActionArmory queryMogulTouchScreenCertDecoded:withError:]",  3264LL,  @"Failed to decode AccessoryCertificate",  v22,  v23,  v24,  (uint64_t)v30);
          [MEMORY[0x189607870] errorWithZhuGeErrorCode:12 underlyingError:0];
          uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = 0LL;
          goto LABEL_20;
        }

        id v19 = @"fail to decode ContentInfo";
        uint64_t v20 = 3183LL;
      }
    }

    else
    {
      id v19 = @"null or empty pkcs7 cert content";
      uint64_t v20 = 3165LL;
    }

LABEL_17:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "decodePKCS7TouchScreenCert",  v20,  v19,  v16,  v17,  v18,  (uint64_t)v30);
    goto LABEL_18;
  }

  return v13;
}

uint64_t libFDRLibraryCore_0()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0LL;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000LL;
  uint64_t v0 = libFDRLibraryCore_frameworkLibrary_0;
  uint64_t v5 = libFDRLibraryCore_frameworkLibrary_0;
  if (!libFDRLibraryCore_frameworkLibrary_0)
  {
    __int128 v6 = xmmword_18A317420;
    uint64_t v7 = 0LL;
    uint64_t v0 = _sl_dlopen();
    v3[3] = v0;
    libFDRLibraryCore_frameworkLibrary_0 = v0;
  }

  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_188F40EE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *getAMFDRDiagnosticGenerateReportSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getAMFDRDiagnosticGenerateReportSymbolLoc_ptr;
  uint64_t v6 = getAMFDRDiagnosticGenerateReportSymbolLoc_ptr;
  if (!getAMFDRDiagnosticGenerateReportSymbolLoc_ptr)
  {
    id v1 = (void *)libFDRLibrary();
    uint64_t v0 = dlsym(v1, "AMFDRDiagnosticGenerateReport");
    v4[3] = (uint64_t)v0;
    getAMFDRDiagnosticGenerateReportSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F40F74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t libFDRLibrary()
{
  uint64_t v0 = libFDRLibraryCore_0();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

void *getAMFDRLogSetHandlerSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getAMFDRLogSetHandlerSymbolLoc_ptr;
  uint64_t v6 = getAMFDRLogSetHandlerSymbolLoc_ptr;
  if (!getAMFDRLogSetHandlerSymbolLoc_ptr)
  {
    id v1 = (void *)libFDRLibrary();
    uint64_t v0 = dlsym(v1, "AMFDRLogSetHandler");
    v4[3] = (uint64_t)v0;
    getAMFDRLogSetHandlerSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F41058( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *getAMFDRCreateWithOptionsSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getAMFDRCreateWithOptionsSymbolLoc_ptr;
  uint64_t v6 = getAMFDRCreateWithOptionsSymbolLoc_ptr;
  if (!getAMFDRCreateWithOptionsSymbolLoc_ptr)
  {
    id v1 = (void *)libFDRLibrary();
    uint64_t v0 = dlsym(v1, "AMFDRCreateWithOptions");
    v4[3] = (uint64_t)v0;
    getAMFDRCreateWithOptionsSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F410E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *getAMFDRSealingMapVerifySealingSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getAMFDRSealingMapVerifySealingSymbolLoc_ptr;
  uint64_t v6 = getAMFDRSealingMapVerifySealingSymbolLoc_ptr;
  if (!getAMFDRSealingMapVerifySealingSymbolLoc_ptr)
  {
    id v1 = (void *)libFDRLibrary();
    uint64_t v0 = dlsym(v1, "AMFDRSealingMapVerifySealing");
    v4[3] = (uint64_t)v0;
    getAMFDRSealingMapVerifySealingSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F41170( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc_ptr;
  uint64_t v6 = getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc_ptr;
  if (!getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc_ptr)
  {
    id v1 = (void *)libFDRLibrary();
    uint64_t v0 = dlsym(v1, "AMFDRSealingMapVerifyAsidMetadataForDevice");
    v4[3] = (uint64_t)v0;
    getAMFDRSealingMapVerifyAsidMetadataForDeviceSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_188F411FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t readPropertyFromMogulService(int a1, char *name, const __CFString *a3, void *a4)
{
  io_iterator_t existing = 0;
  mach_port_t v7 = *MEMORY[0x1896086A8];
  uint64_t v8 = IOServiceMatching(name);
  if (IOServiceGetMatchingServices(v7, v8, &existing))
  {
    uint64_t v12 = @"Failed to find AuthCP service, try to read IDSN via AID";
    uint64_t v13 = 2891LL;
LABEL_3:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "readPropertyFromMogulService",  v13,  v12,  v9,  v10,  v11,  v35);
    uint64_t v14 = 0LL;
    io_object_t v15 = 0;
    goto LABEL_22;
  }

  if (!existing)
  {
    uint64_t v12 = @"No matching services for AuthCP, try to read IDSN via AID";
    uint64_t v13 = 2896LL;
    goto LABEL_3;
  }

  uint64_t v36 = a4;
  io_object_t v15 = 0;
  uint64_t v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  while (1)
  {
    while (1)
    {
      if (v15) {
        IOObjectRelease(v15);
      }
      io_registry_entry_t v17 = IOIteratorNext(existing);
      io_object_t v15 = v17;
      if (a1 == 1)
      {
        int v21 = 196608;
      }

      else
      {
        if (a1)
        {
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "isMogulAuthCPService",  2862LL,  @"Unknown mogul type",  v18,  v19,  v20,  v35);
          goto LABEL_18;
        }

        int v21 = 0x40000;
      }

      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v17, @"flags", v16, 0);
      if (CFProperty) {
        break;
      }
LABEL_18:
      if (!v15) {
        goto LABEL_21;
      }
    }

    uint64_t v26 = CFProperty;
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "isMogulAuthCPService",  2867LL,  @"Get the flag number is : %@",  v23,  v24,  v25,  (uint64_t)CFProperty);
    CFTypeID v27 = CFGetTypeID(v26);
    if (v27 == CFNumberGetTypeID()) {
      break;
    }
    CFRelease(v26);
    if (!v15)
    {
LABEL_21:
      uint64_t v14 = 0LL;
      goto LABEL_22;
    }
  }

  int valuePtr = 0;
  CFNumberGetValue((CFNumberRef)v26, kCFNumberSInt32Type, &valuePtr);
  int v28 = v21 & ~valuePtr;
  CFRelease(v26);
  if (v28) {
    goto LABEL_18;
  }
  CFTypeRef v29 = IORegistryEntryCreateCFProperty(v15, a3, v16, 0);
  if (!v29)
  {
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "readPropertyFromMogulService",  2912LL,  @"No property: %@",  v30,  v31,  v32,  (uint64_t)a3);
    goto LABEL_18;
  }

  CFTypeRef v34 = v29;
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeKeys/ZhuGeKeysAction.m",  "readPropertyFromMogulService",  2908LL,  @"Get data <%@> of property: %@",  v30,  v31,  v32,  (uint64_t)v29);
  *uint64_t v36 = v34;
  uint64_t v14 = 1LL;
LABEL_22:
  if (existing)
  {
    IOObjectRelease(existing);
    io_iterator_t existing = 0;
  }

  if (v15) {
    IOObjectRelease(v15);
  }
  return v14;
}

void __getConfigDict_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v516[28] = *MEMORY[0x1895F89C0];
  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Binaries/ZhuGe_Service/install/Symbols/embattled/embattled_keys.m",  "getConfigDict_block_invoke",  16LL,  @"Initialize keys config!",  a6,  a7,  a8,  v27);
  v515[0] = @"Iay9Sr+EgQjh8wCawoxNP10KX4+UsX2CXjihZPv1EcZPk";
  v513 = @"TVOS";
  v511[0] = @"ENTITLEMENT";
  v511[1] = @"CACHEABLE";
  v512[0] = @"ZHUGE_NULL";
  v512[1] = MEMORY[0x189604A88];
  v511[2] = @"ALIAS";
  v511[3] = @"DEPENDENCY";
  v512[2] = @"ZHUGE_NULL";
  v512[3] = @"ZHUGE_NULL";
  v512[4] = @"ZHUGE_NULL";
  v511[4] = @"PRIVILEGE";
  v511[5] = @"ACTIONS";
  v509[0] = @"ACTION_DEFAULT";
  v507[0] = @"ACTION_METHOD";
  v507[1] = @"ACTION_ARGUMENT";
  v508[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v508[1] = &unk_18A31FD18;
  v507[2] = @"ACTION_RETRY";
  v505[0] = @"ACTION_RETRY_NUMBER";
  v505[1] = @"ACTION_RETRY_INTERVAL";
  v506[0] = &unk_18A31F148;
  v506[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v506 forKeys:v505 count:2];
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v508[2] = v191;
  [MEMORY[0x189603F68] dictionaryWithObjects:v508 forKeys:v507 count:3];
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v510[0] = v190;
  v509[1] = @"SYSCFG";
  v503[0] = @"ACTION_METHOD";
  v503[1] = @"ACTION_ARGUMENT";
  v504[0] = @"querySysCfgKey:withError:";
  v504[1] = &unk_18A31FD30;
  v504[2] = &unk_18A31F7F8;
  v503[2] = @"ACTION_ENTITLEMENT";
  v503[3] = @"ACTION_RETRY";
  v501[0] = @"ACTION_RETRY_NUMBER";
  v501[1] = @"ACTION_RETRY_INTERVAL";
  v502[0] = &unk_18A31F148;
  v502[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v502 forKeys:v501 count:2];
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v504[3] = v189;
  [MEMORY[0x189603F68] dictionaryWithObjects:v504 forKeys:v503 count:4];
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v510[1] = v188;
  v509[2] = @"ACTION_SEQUENCE";
  v500[0] = @"SYSCFG";
  v500[1] = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:v500 count:2];
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v510[2] = v187;
  [MEMORY[0x189603F68] dictionaryWithObjects:v510 forKeys:v509 count:3];
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v512[5] = v186;
  v511[6] = @"RETURN";
  v498[0] = @"RETURN_FORMAT";
  v498[1] = @"RETURN_CASE";
  v499[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v499[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v499 forKeys:v498 count:2];
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v512[6] = v185;
  [MEMORY[0x189603F68] dictionaryWithObjects:v512 forKeys:v511 count:7];
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v514 = v184;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v514 forKeys:&v513 count:1];
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v516[0] = v183;
  v515[1] = @"YTrd2LofkEtmiM4cXwiLc082s6U/st5pPHdDS8MT8UAsc";
  v496 = @"TVOS";
  v494[0] = @"SUPPORT_RESTOREOS";
  v494[1] = @"ENTITLEMENT";
  v495[0] = MEMORY[0x189604A80];
  v495[1] = @"ZHUGE_NULL";
  v494[2] = @"CACHEABLE";
  v494[3] = @"ALIAS";
  v495[2] = MEMORY[0x189604A88];
  v495[3] = &unk_18A31FD48;
  v494[4] = @"DEPENDENCY";
  v494[5] = @"PRIVILEGE";
  v495[4] = @"ZHUGE_NULL";
  v495[5] = @"ZHUGE_NULL";
  v494[6] = @"ACTIONS";
  v492[0] = @"ACTION_DEFAULT";
  v490[0] = @"ACTION_METHOD";
  v490[1] = @"ACTION_ARGUMENT";
  v491[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v491[1] = &unk_18A31FD60;
  v490[2] = @"ACTION_RETRY";
  v488[0] = @"ACTION_RETRY_NUMBER";
  v488[1] = @"ACTION_RETRY_INTERVAL";
  v489[0] = &unk_18A31F148;
  v489[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v489 forKeys:v488 count:2];
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v491[2] = v182;
  [MEMORY[0x189603F68] dictionaryWithObjects:v491 forKeys:v490 count:3];
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v493[0] = v181;
  v492[1] = @"ACTION_SEQUENCE";
  v487 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v487 count:1];
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v493[1] = v180;
  [MEMORY[0x189603F68] dictionaryWithObjects:v493 forKeys:v492 count:2];
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v495[6] = v179;
  v485[0] = @"RETURN_REVALUES";
  v483 = @"RETURN_REVALUE_DEFAULT";
  v481[0] = @"RETURN_REVALUE_VALUE";
  v481[1] = @"RETURN_REVALUE_ERROR";
  v482[0] = @"ZHUGE_NULL";
  v482[1] = &unk_18A31FD78;
  v494[7] = @"RETURN";
  v481[2] = @"RETURN_REVALUE_OUTCOME";
  v482[2] = @"EMPTY_STRING";
  [MEMORY[0x189603F68] dictionaryWithObjects:v482 forKeys:v481 count:3];
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v484 = v178;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v484 forKeys:&v483 count:1];
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v485[1] = @"RETURN_FORMAT";
  v486[0] = v177;
  v486[1] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v486 forKeys:v485 count:2];
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v495[7] = v176;
  [MEMORY[0x189603F68] dictionaryWithObjects:v495 forKeys:v494 count:8];
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v497 = v175;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v497 forKeys:&v496 count:1];
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v516[1] = v174;
  v515[2] = @"hCf3J+I7Gvmj39kb5wuYT1CfwQRQymZQ/Xo+KPRhX4lU8";
  v479 = @"TVOS";
  v477[0] = @"ENTITLEMENT";
  v477[1] = @"CACHEABLE";
  v478[0] = @"ZHUGE_NULL";
  uint64_t v8 = MEMORY[0x189604A80];
  v478[1] = MEMORY[0x189604A80];
  v477[2] = @"ALIAS";
  v477[3] = @"DEPENDENCY";
  v478[2] = @"ZHUGE_NULL";
  v478[3] = @"ZHUGE_NULL";
  v478[4] = @"ZHUGE_NULL";
  v477[4] = @"PRIVILEGE";
  v477[5] = @"ACTIONS";
  v475[0] = @"ACTION_DEFAULT";
  v473[0] = @"ACTION_METHOD";
  v473[1] = @"ACTION_ARGUMENT";
  v474[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v474[1] = &unk_18A31FD90;
  v473[2] = @"ACTION_RETRY";
  v471[0] = @"ACTION_RETRY_NUMBER";
  v471[1] = @"ACTION_RETRY_INTERVAL";
  v472[0] = &unk_18A31F148;
  v472[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v472 forKeys:v471 count:2];
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v474[2] = v173;
  [MEMORY[0x189603F68] dictionaryWithObjects:v474 forKeys:v473 count:3];
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v476[0] = v172;
  v475[1] = @"ACTION_SEQUENCE";
  v470 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v470 count:1];
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v476[1] = v171;
  [MEMORY[0x189603F68] dictionaryWithObjects:v476 forKeys:v475 count:2];
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v477[6] = @"RETURN";
  v478[5] = v170;
  v478[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v478 forKeys:v477 count:7];
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v480 = v169;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v480 forKeys:&v479 count:1];
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v516[2] = v168;
  v515[3] = @"eiBoDNfdjGI+4DTEZmHZB18Dyio2oSnjU9BjtR0BFWARY";
  v468 = @"TVOS";
  v466[0] = @"ENTITLEMENT";
  v466[1] = @"CACHEABLE";
  v467[0] = @"ZHUGE_NULL";
  v467[1] = v8;
  v466[2] = @"ALIAS";
  v466[3] = @"DEPENDENCY";
  v467[2] = @"ZHUGE_NULL";
  v467[3] = @"ZHUGE_NULL";
  v467[4] = @"ZHUGE_NULL";
  v466[4] = @"PRIVILEGE";
  v466[5] = @"ACTIONS";
  v464[0] = @"ACTION_DEFAULT";
  v462[0] = @"ACTION_METHOD";
  v462[1] = @"ACTION_ARGUMENT";
  v463[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v463[1] = &unk_18A31FDA8;
  v462[2] = @"ACTION_RETRY";
  v460[0] = @"ACTION_RETRY_NUMBER";
  v460[1] = @"ACTION_RETRY_INTERVAL";
  v461[0] = &unk_18A31F148;
  v461[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v461 forKeys:v460 count:2];
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v463[2] = v167;
  [MEMORY[0x189603F68] dictionaryWithObjects:v463 forKeys:v462 count:3];
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v465[0] = v166;
  v464[1] = @"ACTION_SEQUENCE";
  v459 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v459 count:1];
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v465[1] = v165;
  [MEMORY[0x189603F68] dictionaryWithObjects:v465 forKeys:v464 count:2];
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v466[6] = @"RETURN";
  v467[5] = v164;
  v467[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v467 forKeys:v466 count:7];
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v469 = v163;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v469 forKeys:&v468 count:1];
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v516[3] = v162;
  v515[4] = @"8ybq4N66oFkNzgwX0r/uh12j3Yul3nPiPplgdku4vHwGw";
  v457 = @"TVOS";
  v455[0] = @"CACHEABLE";
  v455[1] = @"ALIAS";
  v456[0] = MEMORY[0x189604A80];
  v456[1] = &unk_18A31FDC0;
  v455[2] = @"ACTIONS";
  v453[0] = @"ACTION_DEFAULT";
  v451[0] = @"ACTION_METHOD";
  v451[1] = @"ACTION_ARGUMENT";
  v452[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v452[1] = &unk_18A31FDD8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v452 forKeys:v451 count:2];
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v454[0] = v161;
  v453[1] = @"IOSERVICE_ETHERNET";
  v449[0] = @"ACTION_METHOD";
  v449[1] = @"ACTION_ARGUMENT";
  v450[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v450[1] = &unk_18A31FDF0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v450 forKeys:v449 count:2];
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v454[1] = v160;
  v453[2] = @"SYSCFG";
  v447[0] = @"ACTION_METHOD";
  v447[1] = @"ACTION_ARGUMENT";
  v448[0] = @"querySysCfgKey:withError:";
  v448[1] = &unk_18A31FE08;
  v447[2] = @"ACTION_ENTITLEMENT";
  v448[2] = &unk_18A31F8E8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v448 forKeys:v447 count:3];
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v454[2] = v159;
  v453[3] = @"ACTION_SEQUENCE";
  v446[0] = @"SYSCFG";
  v446[1] = @"ACTION_DEFAULT";
  v446[2] = @"IOSERVICE_ETHERNET";
  [MEMORY[0x189603F18] arrayWithObjects:v446 count:3];
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v454[3] = v158;
  [MEMORY[0x189603F68] dictionaryWithObjects:v454 forKeys:v453 count:4];
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v456[2] = v157;
  v455[3] = @"RETURN";
  v444[0] = @"RETURN_FORMAT";
  v444[1] = @"RETURN_CASE";
  v445[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v445[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v445 forKeys:v444 count:2];
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v456[3] = v156;
  [MEMORY[0x189603F68] dictionaryWithObjects:v456 forKeys:v455 count:4];
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v458 = v155;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v458 forKeys:&v457 count:1];
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v516[4] = v154;
  v515[5] = @"wCREDfKF3ElH/GhqMIJjn15CQ72E5I5V/bN+n/bBR4MNU";
  v442 = @"TVOS";
  v440[0] = @"CACHEABLE";
  v440[1] = @"ALIAS";
  v441[0] = MEMORY[0x189604A80];
  v441[1] = &unk_18A31FE20;
  v440[2] = @"ACTIONS";
  v438[0] = @"ACTION_DEFAULT";
  v436[0] = @"ACTION_METHOD";
  v436[1] = @"ACTION_ARGUMENT";
  v437[0] = @"querySysCfgKey:withError:";
  v437[1] = &unk_18A31FE38;
  v436[2] = @"ACTION_ENTITLEMENT";
  v437[2] = &unk_18A31F910;
  [MEMORY[0x189603F68] dictionaryWithObjects:v437 forKeys:v436 count:3];
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v439[0] = v153;
  v438[1] = @"ACTION_SEQUENCE";
  v435 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v435 count:1];
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v439[1] = v152;
  [MEMORY[0x189603F68] dictionaryWithObjects:v439 forKeys:v438 count:2];
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v441[2] = v151;
  v440[3] = @"RETURN";
  v433[0] = @"RETURN_FORMAT";
  v433[1] = @"RETURN_CASE";
  v434[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v434[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v434 forKeys:v433 count:2];
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v441[3] = v150;
  [MEMORY[0x189603F68] dictionaryWithObjects:v441 forKeys:v440 count:4];
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v443 = v149;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v443 forKeys:&v442 count:1];
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v516[5] = v148;
  v515[6] = @"9aOxr1//Y8XlITR3p5/CT1Amyb/Z9TI/b88Mi/ETgB8oM";
  v431 = @"TVOS";
  v429[0] = @"SUPPORT_RESTOREOS";
  v429[1] = @"ENTITLEMENT";
  v430[0] = MEMORY[0x189604A80];
  v430[1] = @"ZHUGE_NULL";
  v429[2] = @"CACHEABLE";
  v429[3] = @"ALIAS";
  uint64_t v9 = MEMORY[0x189604A88];
  v430[2] = MEMORY[0x189604A88];
  v430[3] = @"ZHUGE_NULL";
  v429[4] = @"DEPENDENCY";
  v429[5] = @"PRIVILEGE";
  v430[4] = @"ZHUGE_NULL";
  v430[5] = @"ZHUGE_NULL";
  v429[6] = @"ACTIONS";
  v427 = @"ACTION_DEFAULT";
  v425[0] = @"ACTION_METHOD";
  v425[1] = @"ACTION_ARGUMENT";
  v426[0] = @"queryFactoryShippingSettingTimeWithError:";
  v426[1] = MEMORY[0x189604A58];
  v425[2] = @"ACTION_ENTITLEMENT";
  v426[2] = &unk_18A31F938;
  [MEMORY[0x189603F68] dictionaryWithObjects:v426 forKeys:v425 count:3];
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v428 = v147;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v428 forKeys:&v427 count:1];
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v430[6] = v146;
  [MEMORY[0x189603F68] dictionaryWithObjects:v430 forKeys:v429 count:7];
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v432 = v145;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v432 forKeys:&v431 count:1];
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v516[6] = v144;
  v515[7] = @"k2L0muVU/NTtMtzysnNs210RDcjTSFUOp9M9EJEp0hvNs";
  v423 = @"TVOS";
  v421 = @"ACTIONS";
  v419 = @"ACTION_DEFAULT";
  v417[0] = @"ACTION_METHOD";
  v417[1] = @"ACTION_ARGUMENT";
  v418[0] = @"queryFDRSealingStatusWithManifestOverride:WithError:";
  v418[1] = &unk_18A31FE50;
  v417[2] = @"ACTION_ENTITLEMENT";
  v418[2] = &unk_18A31F960;
  [MEMORY[0x189603F68] dictionaryWithObjects:v418 forKeys:v417 count:3];
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v420 = v143;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v420 forKeys:&v419 count:1];
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v422 = v142;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v422 forKeys:&v421 count:1];
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v424 = v141;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v424 forKeys:&v423 count:1];
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v516[7] = v140;
  v515[8] = @"sg1SrHyuq7Uu15zGYwGGz1CjjOASEqn31w0kiAkOfUKt0";
  v415 = @"TVOS";
  v414[0] = &unk_18A31FE68;
  v413[0] = @"PRIVILEGE";
  v413[1] = @"ACTIONS";
  v411 = @"ACTION_DEFAULT";
  v409[0] = @"ACTION_METHOD";
  v409[1] = @"ACTION_ARGUMENT";
  v410[0] = @"queryFDRSealingStatusWithManifestOverride:WithError:";
  v410[1] = &unk_18A31FE80;
  v409[2] = @"ACTION_ENTITLEMENT";
  v410[2] = &unk_18A31F988;
  [MEMORY[0x189603F68] dictionaryWithObjects:v410 forKeys:v409 count:3];
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v412 = v139;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v412 forKeys:&v411 count:1];
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v414[1] = v138;
  [MEMORY[0x189603F68] dictionaryWithObjects:v414 forKeys:v413 count:2];
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v416 = v137;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v416 forKeys:&v415 count:1];
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v516[8] = v136;
  v515[9] = @"SEs5TXAVh1zo4q7nzd6BI0A/2poOxsJ4U7WDQ9fbQe1vw";
  v407 = @"TVOS";
  v405[0] = @"ENTITLEMENT";
  v405[1] = @"CACHEABLE";
  v406[0] = @"ZHUGE_NULL";
  v406[1] = v9;
  v405[2] = @"ALIAS";
  v405[3] = @"DEPENDENCY";
  v406[2] = &unk_18A31FE98;
  v406[3] = @"ZHUGE_NULL";
  v406[4] = @"ZHUGE_NULL";
  v405[4] = @"PRIVILEGE";
  v405[5] = @"ACTIONS";
  v403[0] = @"ACTION_DEFAULT";
  v401[0] = @"ACTION_METHOD";
  v401[1] = @"ACTION_ARGUMENT";
  v402[0] = @"ZhuGeToDo:withError:";
  v402[1] = &unk_18A31FEB0;
  v401[2] = @"ACTION_RETRY";
  v399[0] = @"ACTION_RETRY_NUMBER";
  v399[1] = @"ACTION_RETRY_INTERVAL";
  v400[0] = &unk_18A31F148;
  v400[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v400 forKeys:v399 count:2];
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v402[2] = v135;
  [MEMORY[0x189603F68] dictionaryWithObjects:v402 forKeys:v401 count:3];
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v404[0] = v134;
  v403[1] = @"ACTION_SEQUENCE";
  v398 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v398 count:1];
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v404[1] = v133;
  [MEMORY[0x189603F68] dictionaryWithObjects:v404 forKeys:v403 count:2];
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v405[6] = @"RETURN";
  v406[5] = v132;
  v406[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v406 forKeys:v405 count:7];
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v408 = v131;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v408 forKeys:&v407 count:1];
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v516[9] = v130;
  v515[10] = @"r8L1DAtjrZMjuEhYjJB6J0DmQfsy8VWuW95w7j+wYUmfI";
  v396 = @"TVOS";
  v394[0] = @"ENTITLEMENT";
  v394[1] = @"CACHEABLE";
  v395[0] = @"ZHUGE_NULL";
  uint64_t v10 = MEMORY[0x189604A88];
  v395[1] = MEMORY[0x189604A88];
  v394[2] = @"ALIAS";
  v394[3] = @"DEPENDENCY";
  v395[2] = &unk_18A31FEC8;
  v395[3] = @"ZHUGE_NULL";
  v395[4] = @"ZHUGE_NULL";
  v394[4] = @"PRIVILEGE";
  v394[5] = @"ACTIONS";
  v392[0] = @"ACTION_DEFAULT";
  v390[0] = @"ACTION_METHOD";
  v390[1] = @"ACTION_ARGUMENT";
  v391[0] = @"ZhuGeToDo:withError:";
  v391[1] = &unk_18A31FEE0;
  v390[2] = @"ACTION_RETRY";
  v388[0] = @"ACTION_RETRY_NUMBER";
  v388[1] = @"ACTION_RETRY_INTERVAL";
  v389[0] = &unk_18A31F148;
  v389[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v389 forKeys:v388 count:2];
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v391[2] = v129;
  [MEMORY[0x189603F68] dictionaryWithObjects:v391 forKeys:v390 count:3];
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v393[0] = v128;
  v392[1] = @"ACTION_SEQUENCE";
  v387 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v387 count:1];
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v393[1] = v127;
  [MEMORY[0x189603F68] dictionaryWithObjects:v393 forKeys:v392 count:2];
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v394[6] = @"RETURN";
  v395[5] = v126;
  v395[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v395 forKeys:v394 count:7];
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v397 = v125;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v397 forKeys:&v396 count:1];
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v516[10] = v124;
  v515[11] = @"qXLtae9hyCs7VeXhQLkRM097iiuk2VDpWcN4E56+F84hE";
  v385 = @"TVOS";
  v383[0] = @"ENTITLEMENT";
  v383[1] = @"CACHEABLE";
  v384[0] = @"ZHUGE_NULL";
  v384[1] = v10;
  v383[2] = @"ALIAS";
  v383[3] = @"DEPENDENCY";
  v384[2] = &unk_18A31FEF8;
  v384[3] = @"ZHUGE_NULL";
  v384[4] = @"ZHUGE_NULL";
  v383[4] = @"PRIVILEGE";
  v383[5] = @"ACTIONS";
  v381[0] = @"ACTION_DEFAULT";
  v379[0] = @"ACTION_METHOD";
  v379[1] = @"ACTION_ARGUMENT";
  v380[0] = @"ZhuGeToDo:withError:";
  v380[1] = &unk_18A31FF10;
  v379[2] = @"ACTION_RETRY";
  v377[0] = @"ACTION_RETRY_NUMBER";
  v377[1] = @"ACTION_RETRY_INTERVAL";
  v378[0] = &unk_18A31F148;
  v378[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v378 forKeys:v377 count:2];
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v380[2] = v123;
  [MEMORY[0x189603F68] dictionaryWithObjects:v380 forKeys:v379 count:3];
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v382[0] = v122;
  v381[1] = @"ACTION_SEQUENCE";
  v376 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v376 count:1];
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v382[1] = v121;
  [MEMORY[0x189603F68] dictionaryWithObjects:v382 forKeys:v381 count:2];
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v383[6] = @"RETURN";
  v384[5] = v120;
  v384[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v384 forKeys:v383 count:7];
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v386 = v119;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v386 forKeys:&v385 count:1];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v516[11] = v118;
  v515[12] = @"uU6Q/yVGRbrIwfV5JhBYH11bVr+w7C8fkcxwcwEsQQxek";
  v374 = @"TVOS";
  v372[0] = @"SUPPORT_RESTOREOS";
  v372[1] = @"ENTITLEMENT";
  uint64_t v11 = MEMORY[0x189604A88];
  v373[0] = MEMORY[0x189604A88];
  v373[1] = @"ZHUGE_NULL";
  v372[2] = @"CACHEABLE";
  v372[3] = @"ALIAS";
  v373[2] = MEMORY[0x189604A88];
  v373[3] = @"ZHUGE_NULL";
  v372[4] = @"DEPENDENCY";
  v372[5] = @"PRIVILEGE";
  v373[4] = @"ZHUGE_NULL";
  v373[5] = @"ZHUGE_NULL";
  v372[6] = @"ACTIONS";
  v370[0] = @"ACTION_DEFAULT";
  v368[0] = @"ACTION_METHOD";
  v368[1] = @"ACTION_ARGUMENT";
  v369[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v369[1] = &unk_18A31FF28;
  v368[2] = @"ACTION_RETRY";
  v366[0] = @"ACTION_RETRY_NUMBER";
  v366[1] = @"ACTION_RETRY_INTERVAL";
  v367[0] = &unk_18A31F148;
  v367[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v367 forKeys:v366 count:2];
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v369[2] = v117;
  [MEMORY[0x189603F68] dictionaryWithObjects:v369 forKeys:v368 count:3];
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v371[0] = v116;
  v370[1] = @"ACTION_SEQUENCE";
  v365 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v365 count:1];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v371[1] = v115;
  [MEMORY[0x189603F68] dictionaryWithObjects:v371 forKeys:v370 count:2];
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v373[6] = v114;
  v372[7] = @"RETURN";
  v363 = @"RETURN_FORMAT";
  v364 = @"NUMBER_SIZE_GB";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v364 forKeys:&v363 count:1];
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v373[7] = v113;
  [MEMORY[0x189603F68] dictionaryWithObjects:v373 forKeys:v372 count:8];
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v375 = v112;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v375 forKeys:&v374 count:1];
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v516[12] = v111;
  v515[13] = @"w3d+bqLep9C2KRT5Dc/t717IDOHkzNoShIRuhKyVGx19w";
  v361 = @"TVOS";
  v359[0] = @"SUPPORT_RESTOREOS";
  v359[1] = @"ENTITLEMENT";
  v360[0] = v11;
  v360[1] = @"ZHUGE_NULL";
  v359[2] = @"CACHEABLE";
  v359[3] = @"ALIAS";
  v360[2] = v11;
  v360[3] = @"ZHUGE_NULL";
  v359[4] = @"DEPENDENCY";
  v359[5] = @"PRIVILEGE";
  v360[4] = @"ZHUGE_NULL";
  v360[5] = @"ZHUGE_NULL";
  v359[6] = @"ACTIONS";
  v357[0] = @"ACTION_DEFAULT";
  v355[0] = @"ACTION_METHOD";
  v355[1] = @"ACTION_ARGUMENT";
  v356[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v356[1] = &unk_18A31FF40;
  v355[2] = @"ACTION_RETRY";
  v353[0] = @"ACTION_RETRY_NUMBER";
  v353[1] = @"ACTION_RETRY_INTERVAL";
  v354[0] = &unk_18A31F148;
  v354[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v354 forKeys:v353 count:2];
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v356[2] = v110;
  [MEMORY[0x189603F68] dictionaryWithObjects:v356 forKeys:v355 count:3];
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v358[0] = v109;
  v357[1] = @"ACTION_SEQUENCE";
  v352 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v352 count:1];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v358[1] = v108;
  [MEMORY[0x189603F68] dictionaryWithObjects:v358 forKeys:v357 count:2];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v360[6] = v107;
  v359[7] = @"RETURN";
  v350 = @"RETURN_FORMAT";
  v351 = @"STRING_SIZE_GB";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v351 forKeys:&v350 count:1];
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v360[7] = v106;
  [MEMORY[0x189603F68] dictionaryWithObjects:v360 forKeys:v359 count:8];
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v362 = v105;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v362 forKeys:&v361 count:1];
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v516[13] = v104;
  v515[14] = @"UZxSgv2us0ZfhXwIhUX7a0FiCXZhsoLlXmkH6rQVODX9s";
  v348 = @"TVOS";
  v346[0] = @"CACHEABLE";
  v346[1] = @"ALIAS";
  v347[0] = MEMORY[0x189604A80];
  v347[1] = &unk_18A31FF58;
  v346[2] = @"ACTIONS";
  v344[0] = @"ACTION_DEFAULT";
  v342[0] = @"ACTION_METHOD";
  v342[1] = @"ACTION_ARGUMENT";
  v343[0] = @"querySysCfgKey:withError:";
  v343[1] = &unk_18A31FF70;
  v342[2] = @"ACTION_ENTITLEMENT";
  v343[2] = &unk_18A31FA00;
  [MEMORY[0x189603F68] dictionaryWithObjects:v343 forKeys:v342 count:3];
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v345[0] = v103;
  v344[1] = @"ACTION_SEQUENCE";
  v341 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v341 count:1];
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v345[1] = v102;
  [MEMORY[0x189603F68] dictionaryWithObjects:v345 forKeys:v344 count:2];
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v347[2] = v101;
  v346[3] = @"RETURN";
  v339[0] = @"RETURN_FORMAT";
  v339[1] = @"RETURN_CASE";
  v340[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v340[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v340 forKeys:v339 count:2];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v347[3] = v100;
  [MEMORY[0x189603F68] dictionaryWithObjects:v347 forKeys:v346 count:4];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v349 = v99;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v349 forKeys:&v348 count:1];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v516[14] = v98;
  v515[15] = @"6Q2HUd0W2HvvW1uXtIrXh0BgG9/ymV6FwuWvCVnjBLnag";
  v337 = @"TVOS";
  v335[0] = @"ENTITLEMENT";
  v335[1] = @"CACHEABLE";
  v336[0] = @"ZHUGE_NULL";
  v336[1] = MEMORY[0x189604A88];
  v335[2] = @"ALIAS";
  v335[3] = @"DEPENDENCY";
  v336[2] = @"ZHUGE_NULL";
  v336[3] = @"ZHUGE_NULL";
  v336[4] = @"ZHUGE_NULL";
  v335[4] = @"PRIVILEGE";
  v335[5] = @"ACTIONS";
  v333[0] = @"ACTION_DEFAULT";
  v331[0] = @"ACTION_METHOD";
  v331[1] = @"ACTION_ARGUMENT";
  v332[0] = @"querySysctlVariableName:dataType:withError:";
  v332[1] = &unk_18A31FF88;
  v331[2] = @"ACTION_RETRY";
  v329[0] = @"ACTION_RETRY_NUMBER";
  v329[1] = @"ACTION_RETRY_INTERVAL";
  v330[0] = &unk_18A31F148;
  v330[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v330 forKeys:v329 count:2];
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v332[2] = v97;
  [MEMORY[0x189603F68] dictionaryWithObjects:v332 forKeys:v331 count:3];
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v334[0] = v96;
  v333[1] = @"ACTION_SEQUENCE";
  v328 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v328 count:1];
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v334[1] = v95;
  [MEMORY[0x189603F68] dictionaryWithObjects:v334 forKeys:v333 count:2];
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v335[6] = @"RETURN";
  v336[5] = v94;
  v336[6] = @"ZHUGE_NULL";
  [MEMORY[0x189603F68] dictionaryWithObjects:v336 forKeys:v335 count:7];
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v338 = v93;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v516[15] = v92;
  v515[16] = @"Y3FFASJRjHM2+f+RUDIR/16k0NNJHtQLJjm+hhqI5t4OM";
  v326 = @"TVOS";
  v324[0] = @"CACHEABLE";
  v324[1] = @"ALIAS";
  uint64_t v12 = MEMORY[0x189604A80];
  v325[0] = MEMORY[0x189604A80];
  v325[1] = &unk_18A31FFA0;
  v324[2] = @"ACTIONS";
  v322[0] = @"ACTION_DEFAULT";
  v320[0] = @"ACTION_METHOD";
  v320[1] = @"ACTION_ARGUMENT";
  v321[0] = @"querySysCfgKey:withError:";
  v321[1] = &unk_18A31FFB8;
  v320[2] = @"ACTION_ENTITLEMENT";
  v321[2] = &unk_18A31FA28;
  [MEMORY[0x189603F68] dictionaryWithObjects:v321 forKeys:v320 count:3];
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v323[0] = v91;
  v322[1] = @"ACTION_SEQUENCE";
  v319 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v319 count:1];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v323[1] = v90;
  [MEMORY[0x189603F68] dictionaryWithObjects:v323 forKeys:v322 count:2];
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v325[2] = v89;
  v324[3] = @"RETURN";
  v317[0] = @"RETURN_FORMAT";
  v317[1] = @"RETURN_CASE";
  v318[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v318[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v318 forKeys:v317 count:2];
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v325[3] = v88;
  [MEMORY[0x189603F68] dictionaryWithObjects:v325 forKeys:v324 count:4];
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v327 = v87;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v327 forKeys:&v326 count:1];
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v516[16] = v86;
  v515[17] = @"bBUGOKyRf8JC1/kbTQbCp0C7Gf6xGsFgHS8xrmZbHlrJQ";
  v315 = @"TVOS";
  v314[0] = v12;
  v313[0] = @"CACHEABLE";
  v313[1] = @"ACTIONS";
  v311[0] = @"ACTION_DEFAULT";
  v309[0] = @"ACTION_METHOD";
  v309[1] = @"ACTION_ARGUMENT";
  v310[0] = @"querySysCfgKey:withError:";
  v310[1] = &unk_18A31FFD0;
  v309[2] = @"ACTION_ENTITLEMENT";
  v310[2] = &unk_18A31FA50;
  [MEMORY[0x189603F68] dictionaryWithObjects:v310 forKeys:v309 count:3];
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v312[0] = v85;
  v311[1] = @"ACTION_SEQUENCE";
  v308 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v308 count:1];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v312[1] = v84;
  [MEMORY[0x189603F68] dictionaryWithObjects:v312 forKeys:v311 count:2];
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v314[1] = v83;
  [MEMORY[0x189603F68] dictionaryWithObjects:v314 forKeys:v313 count:2];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = v82;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v316 forKeys:&v315 count:1];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v516[17] = v81;
  v515[18] = @"W6G2ZPL+BzsMLGtunPo4q13HKvqm45nmzrVJEV2Uq/x18";
  v306 = @"TVOS";
  v305[0] = MEMORY[0x189604A88];
  v304[0] = @"SUPPORT_RESTOREOS";
  v304[1] = @"ACTIONS";
  v302 = @"ACTION_DEFAULT";
  v300[0] = @"ACTION_METHOD";
  v300[1] = @"ACTION_ARGUMENT";
  v301[0] = @"getReportFDRDiagnosticFromOption:withError:";
  v301[1] = &unk_18A31FFE8;
  v300[2] = @"ACTION_ENTITLEMENT";
  v301[2] = &unk_18A31FA78;
  [MEMORY[0x189603F68] dictionaryWithObjects:v301 forKeys:v300 count:3];
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v303 = v80;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v303 forKeys:&v302 count:1];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v305[1] = v79;
  [MEMORY[0x189603F68] dictionaryWithObjects:v305 forKeys:v304 count:2];
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = v78;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v307 forKeys:&v306 count:1];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v516[18] = v77;
  v515[19] = @"TeSXZEwq35nFS8donhmyb1Ck5VDKjR5ddJ3qChRQGO+WU";
  v298 = @"TVOS";
  v296[0] = @"CACHEABLE";
  v296[1] = @"ALIAS";
  uint64_t v13 = MEMORY[0x189604A80];
  v297[0] = MEMORY[0x189604A80];
  v297[1] = &unk_18A320000;
  v296[2] = @"ACTIONS";
  v294[0] = @"ACTION_DEFAULT";
  v292[0] = @"ACTION_METHOD";
  v292[1] = @"ACTION_ARGUMENT";
  v293[0] = @"querySysCfgKey:withError:";
  v293[1] = &unk_18A320018;
  v292[2] = @"ACTION_ENTITLEMENT";
  v293[2] = &unk_18A31FAA0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v293 forKeys:v292 count:3];
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v295[0] = v76;
  v294[1] = @"ACTION_SEQUENCE";
  v291 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v291 count:1];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v295[1] = v75;
  [MEMORY[0x189603F68] dictionaryWithObjects:v295 forKeys:v294 count:2];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v297[2] = v74;
  v296[3] = @"RETURN";
  v289[0] = @"RETURN_FORMAT";
  v289[1] = @"RETURN_CASE";
  v290[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v290[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v290 forKeys:v289 count:2];
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v297[3] = v73;
  [MEMORY[0x189603F68] dictionaryWithObjects:v297 forKeys:v296 count:4];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v299 = v72;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v299 forKeys:&v298 count:1];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v516[19] = v71;
  v515[20] = @"AzRjL78vqZvv+67BDObFP1BuLaSpSTaRpPUKVhQGQp45w";
  v287 = @"TVOS";
  v285[0] = @"CACHEABLE";
  v285[1] = @"ALIAS";
  v286[0] = v13;
  v286[1] = &unk_18A320030;
  v285[2] = @"ACTIONS";
  v283[0] = @"ACTION_DEFAULT";
  v281[0] = @"ACTION_METHOD";
  v281[1] = @"ACTION_ARGUMENT";
  v282[0] = @"querySysCfgKey:withError:";
  v282[1] = &unk_18A320048;
  v281[2] = @"ACTION_ENTITLEMENT";
  v282[2] = &unk_18A31FAC8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v282 forKeys:v281 count:3];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v284[0] = v70;
  v283[1] = @"ACTION_SEQUENCE";
  v280 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v280 count:1];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v284[1] = v69;
  [MEMORY[0x189603F68] dictionaryWithObjects:v284 forKeys:v283 count:2];
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
  v286[2] = v68;
  v285[3] = @"RETURN";
  v278[0] = @"RETURN_FORMAT";
  v278[1] = @"RETURN_CASE";
  v279[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v279[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v279 forKeys:v278 count:2];
  uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue();
  v286[3] = v67;
  [MEMORY[0x189603F68] dictionaryWithObjects:v286 forKeys:v285 count:4];
  uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = v66;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
  uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue();
  v516[20] = v65;
  v515[21] = @"YK1jvTHgjdt2Od1g1cGNg1EzY5VLX6jKTt3wQupFvEbI8";
  v276 = @"TVOS";
  v274[0] = @"CACHEABLE";
  v274[1] = @"ALIAS";
  v275[0] = MEMORY[0x189604A80];
  v275[1] = &unk_18A320060;
  v274[2] = @"ACTIONS";
  v272[0] = @"ACTION_DEFAULT";
  v270[0] = @"ACTION_METHOD";
  v270[1] = @"ACTION_ARGUMENT";
  v271[0] = @"querySysCfgKey:withError:";
  v271[1] = &unk_18A320078;
  v270[2] = @"ACTION_ENTITLEMENT";
  v271[2] = &unk_18A31FAF0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v271 forKeys:v270 count:3];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v273[0] = v64;
  v272[1] = @"ACTION_SEQUENCE";
  v269 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v269 count:1];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v273[1] = v63;
  [MEMORY[0x189603F68] dictionaryWithObjects:v273 forKeys:v272 count:2];
  uint64_t v62 = (void *)objc_claimAutoreleasedReturnValue();
  v275[2] = v62;
  v274[3] = @"RETURN";
  v267[0] = @"RETURN_FORMAT";
  v267[1] = @"RETURN_CASE";
  v268[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v268[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v268 forKeys:v267 count:2];
  uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
  v275[3] = v61;
  [MEMORY[0x189603F68] dictionaryWithObjects:v275 forKeys:v274 count:4];
  uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();
  v277 = v60;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v516[21] = v59;
  v515[22] = @"CZbYk6sTjNxVqTYUgxbf+17r9md3DZ5QRHzUHBjtnELao";
  v265 = @"TVOS";
  v263[0] = @"CACHEABLE";
  v263[1] = @"ALIAS";
  v264[0] = MEMORY[0x189604A80];
  v264[1] = &unk_18A320090;
  v263[2] = @"ACTIONS";
  v261[0] = @"ACTION_DEFAULT";
  v259[0] = @"ACTION_METHOD";
  v259[1] = @"ACTION_ARGUMENT";
  v260[0] = @"querySysCfgKey:withError:";
  v260[1] = &unk_18A3200A8;
  v259[2] = @"ACTION_ENTITLEMENT";
  v260[2] = &unk_18A31FB18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v260 forKeys:v259 count:3];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v262[0] = v58;
  v261[1] = @"ACTION_SEQUENCE";
  v258 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v258 count:1];
  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
  v262[1] = v57;
  [MEMORY[0x189603F68] dictionaryWithObjects:v262 forKeys:v261 count:2];
  uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
  v264[2] = v56;
  v263[3] = @"RETURN";
  v256[0] = @"RETURN_FORMAT";
  v256[1] = @"RETURN_CASE";
  v257[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v257[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v257 forKeys:v256 count:2];
  uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
  v264[3] = v55;
  [MEMORY[0x189603F68] dictionaryWithObjects:v264 forKeys:v263 count:4];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = v54;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v266 forKeys:&v265 count:1];
  uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
  v516[22] = v53;
  v515[23] = @"GPXrJXV9cmnYFY6vDzNBd0BJ83EQQN8iNp2FlUkSsaSA4";
  v254 = @"TVOS";
  v252[0] = @"CACHEABLE";
  v252[1] = @"ALIAS";
  uint64_t v14 = MEMORY[0x189604A88];
  v253[0] = MEMORY[0x189604A88];
  v253[1] = &unk_18A3200C0;
  v252[2] = @"ACTIONS";
  v250 = @"ACTION_DEFAULT";
  v248[0] = @"ACTION_METHOD";
  v248[1] = @"ACTION_ARGUMENT";
  v249[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v249[1] = &unk_18A3200D8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v249 forKeys:v248 count:2];
  uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = v52;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v251 forKeys:&v250 count:1];
  uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
  v253[2] = v51;
  v252[3] = @"RETURN";
  v246 = @"RETURN_FORMAT";
  v247 = @"BOOL_NEGATIVE";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v247 forKeys:&v246 count:1];
  uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
  v253[3] = v50;
  [MEMORY[0x189603F68] dictionaryWithObjects:v253 forKeys:v252 count:4];
  uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = v49;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v255 forKeys:&v254 count:1];
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  v516[23] = v48;
  v515[24] = @"xsY3cS4aDX96XNwVKUi7L08r7F8ncE7jhvsPDL61Eg9LM";
  v244 = @"TVOS";
  v242[0] = @"ENTITLEMENT";
  v242[1] = @"CACHEABLE";
  v243[0] = @"ZHUGE_NULL";
  v243[1] = v14;
  v242[2] = @"ALIAS";
  v242[3] = @"DEPENDENCY";
  v243[2] = @"ZHUGE_NULL";
  v243[3] = @"ZHUGE_NULL";
  v243[4] = @"ZHUGE_NULL";
  v242[4] = @"PRIVILEGE";
  v242[5] = @"ACTIONS";
  v240[0] = @"ACTION_DEFAULT";
  v238[0] = @"ACTION_METHOD";
  v238[1] = @"ACTION_ARGUMENT";
  v239[0] = @"queryIOProperty:fromCriteria:withError:";
  v239[1] = &unk_18A3200F0;
  v238[2] = @"ACTION_RETRY";
  v236[0] = @"ACTION_RETRY_NUMBER";
  v236[1] = @"ACTION_RETRY_INTERVAL";
  v237[0] = &unk_18A31F148;
  v237[1] = &unk_18A31F148;
  [MEMORY[0x189603F68] dictionaryWithObjects:v237 forKeys:v236 count:2];
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  v239[2] = v47;
  [MEMORY[0x189603F68] dictionaryWithObjects:v239 forKeys:v238 count:3];
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
  v241[0] = v46;
  v240[1] = @"ACTION_SEQUENCE";
  v235 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v235 count:1];
  BOOL v45 = (void *)objc_claimAutoreleasedReturnValue();
  v241[1] = v45;
  [MEMORY[0x189603F68] dictionaryWithObjects:v241 forKeys:v240 count:2];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v243[5] = v44;
  v242[6] = @"RETURN";
  v233 = @"RETURN_FORMAT";
  v234 = @"NUMBER_UINT32";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v234 forKeys:&v233 count:1];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  v243[6] = v43;
  [MEMORY[0x189603F68] dictionaryWithObjects:v243 forKeys:v242 count:7];
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
  v245 = v42;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v245 forKeys:&v244 count:1];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
  v516[24] = v41;
  v515[25] = @"MTHSF+Sp8Pknq2dPiJDyJ15yizzWgnmZpwZI1aCjkv3Tk";
  v231 = @"TVOS";
  v229[0] = @"CACHEABLE";
  v229[1] = @"ALIAS";
  uint64_t v15 = MEMORY[0x189604A80];
  v230[0] = MEMORY[0x189604A80];
  v230[1] = &unk_18A320108;
  v229[2] = @"ACTIONS";
  v227[0] = @"ACTION_DEFAULT";
  v225[0] = @"ACTION_METHOD";
  v225[1] = @"ACTION_ARGUMENT";
  v226[0] = @"queryThreadRadioMacAddress64BitWithError:";
  v226[1] = MEMORY[0x189604A58];
  v225[2] = @"ACTION_ENTITLEMENT";
  v226[2] = &unk_18A31FBB8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v226 forKeys:v225 count:3];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v228[0] = v40;
  v227[1] = @"ACTION_SEQUENCE";
  v224 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v224 count:1];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v228[1] = v39;
  [MEMORY[0x189603F68] dictionaryWithObjects:v228 forKeys:v227 count:2];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  v230[2] = v38;
  v229[3] = @"RETURN";
  v222[0] = @"RETURN_FORMAT";
  v222[1] = @"RETURN_CASE";
  v223[0] = @"STRING_MAC_ADDR";
  v223[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v223 forKeys:v222 count:2];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  v230[3] = v37;
  [MEMORY[0x189603F68] dictionaryWithObjects:v230 forKeys:v229 count:4];
  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
  v232 = v36;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v232 forKeys:&v231 count:1];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  v516[25] = v35;
  v515[26] = @"oE0p4DyQRSEkINvBNV4QW24lIWg+vlyQaWptILxxZlPdM";
  v220 = @"TVOS";
  v218[0] = @"CACHEABLE";
  v218[1] = @"ALIAS";
  v219[0] = v15;
  v219[1] = &unk_18A320120;
  v218[2] = @"ACTIONS";
  v216[0] = @"ACTION_DEFAULT";
  v214[0] = @"ACTION_METHOD";
  v214[1] = @"ACTION_ARGUMENT";
  v215[0] = @"queryThreadRadioMacAddressForProvisioningWithError:";
  v215[1] = MEMORY[0x189604A58];
  v214[2] = @"ACTION_ENTITLEMENT";
  v215[2] = &unk_18A31FBE0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v215 forKeys:v214 count:3];
  CFTypeRef v34 = (void *)objc_claimAutoreleasedReturnValue();
  v217[0] = v34;
  v216[1] = @"ACTION_SEQUENCE";
  v213 = @"ACTION_DEFAULT";
  [MEMORY[0x189603F18] arrayWithObjects:&v213 count:1];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  v217[1] = v33;
  [MEMORY[0x189603F68] dictionaryWithObjects:v217 forKeys:v216 count:2];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v219[2] = v32;
  v218[3] = @"RETURN";
  v211[0] = @"RETURN_FORMAT";
  v211[1] = @"RETURN_CASE";
  v212[0] = @"STRING_MAC_ADDR";
  v212[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v212 forKeys:v211 count:2];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  v219[3] = v31;
  [MEMORY[0x189603F68] dictionaryWithObjects:v219 forKeys:v218 count:4];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
  CFTypeRef v29 = (void *)objc_claimAutoreleasedReturnValue();
  v516[26] = v29;
  v515[27] = @"4QXj82hRhZ6/k74y2qWao0BROSL65x+Bvew1MAHwp6RZw";
  v209 = @"TVOS";
  v207[0] = @"CACHEABLE";
  v207[1] = @"ALIAS";
  v208[0] = MEMORY[0x189604A80];
  v208[1] = &unk_18A320138;
  v207[2] = @"ACTIONS";
  v205[0] = @"ACTION_DEFAULT";
  v203[0] = @"ACTION_METHOD";
  v203[1] = @"ACTION_ARGUMENT";
  v204[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v204[1] = &unk_18A320150;
  [MEMORY[0x189603F68] dictionaryWithObjects:v204 forKeys:v203 count:2];
  int v28 = (void *)objc_claimAutoreleasedReturnValue();
  v206[0] = v28;
  v205[1] = @"IOSERVICE_SDIO";
  v201[0] = @"ACTION_METHOD";
  v201[1] = @"ACTION_ARGUMENT";
  v202[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v202[1] = &unk_18A320168;
  [MEMORY[0x189603F68] dictionaryWithObjects:v202 forKeys:v201 count:2];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v206[1] = v16;
  v205[2] = @"IOSERVICE_WLAN";
  v199[0] = @"ACTION_METHOD";
  v199[1] = @"ACTION_ARGUMENT";
  v200[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v200[1] = &unk_18A320180;
  [MEMORY[0x189603F68] dictionaryWithObjects:v200 forKeys:v199 count:2];
  io_registry_entry_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v206[2] = v17;
  v205[3] = @"IOSERVICE_MARCONI_WIFI";
  v197[0] = @"ACTION_METHOD";
  v197[1] = @"ACTION_ARGUMENT";
  v198[0] = @"queryIOPropertyFromPath:andCriteria:withError:";
  v198[1] = &unk_18A320198;
  [MEMORY[0x189603F68] dictionaryWithObjects:v198 forKeys:v197 count:2];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v206[3] = v18;
  v205[4] = @"SYSCFG";
  v195[0] = @"ACTION_METHOD";
  v195[1] = @"ACTION_ARGUMENT";
  v196[0] = @"querySysCfgKey:withError:";
  v196[1] = &unk_18A3201B0;
  v195[2] = @"ACTION_ENTITLEMENT";
  v196[2] = &unk_18A31FCA8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v196 forKeys:v195 count:3];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v206[4] = v19;
  v205[5] = @"ACTION_SEQUENCE";
  v194[0] = @"SYSCFG";
  v194[1] = @"ACTION_DEFAULT";
  v194[2] = @"IOSERVICE_SDIO";
  v194[3] = @"IOSERVICE_WLAN";
  v194[4] = @"IOSERVICE_MARCONI_WIFI";
  [MEMORY[0x189603F18] arrayWithObjects:v194 count:5];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v206[5] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v206 forKeys:v205 count:6];
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  v208[2] = v21;
  v207[3] = @"RETURN";
  v192[0] = @"RETURN_FORMAT";
  v192[1] = @"RETURN_CASE";
  v193[0] = @"STRING_MAC_ADDR_SYSCFG_6BYTE";
  v193[1] = @"STRING_LOWERCASE";
  [MEMORY[0x189603F68] dictionaryWithObjects:v193 forKeys:v192 count:2];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v208[3] = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:v208 forKeys:v207 count:4];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = v23;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  v516[27] = v24;
  uint64_t v25 = [MEMORY[0x189603F68] dictionaryWithObjects:v516 forKeys:v515 count:28];
  uint64_t v26 = (void *)getConfigDict_aDict;
  getConfigDict_aDict = v25;
}

void ZhuGeLog( int a1, const char *a2, const char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v13 = a5;
  uint64_t v18 = v13;
  if (a2) {
    uint64_t v19 = a2;
  }
  else {
    uint64_t v19 = "UnknownFile";
  }
  if (a3) {
    uint64_t v20 = a3;
  }
  else {
    uint64_t v20 = "UnknownFunc";
  }
  if (!v13)
  {
    if (isLoggingInternal_aToken != -1) {
      dispatch_once(&isLoggingInternal_aToken, &__block_literal_global_33_0);
    }
    if (isLoggingInternal_isInternal) {
      ZhuGePrintStderr( "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeLog.m",  "ZhuGeLog",  183LL,  @"Catch the NULL format pointer from: %s %s(%ld)",  v14,  v15,  v16,  v17,  (uint64_t)v19);
    }
    goto LABEL_24;
  }

  if ((a1 & 0x40000) != 0 && !hasZhuGeLogConditionalPrint())
  {
LABEL_24:
    int v28 = 0LL;
    id v29 = 0LL;
    uint64_t v27 = 0LL;
    id v21 = 0LL;
    goto LABEL_61;
  }

  id v21 = objc_alloc_init(MEMORY[0x189607940]);
  if ((isZhuGeInRestoreOS() & 1) != 0 || hasZhuGeLogPrefixPidTid())
  {
    if (ZhuGeLog_prefix_token != -1) {
      dispatch_once(&ZhuGeLog_prefix_token, &__block_literal_global_3);
    }
    [v21 appendFormat:@"%@", ZhuGeLog_prefixPidTid];
  }

  if (isLoggingInternal_aToken != -1) {
    dispatch_once(&isLoggingInternal_aToken, &__block_literal_global_33_0);
  }
  if (isLoggingInternal_isInternal && hasZhuGeLogPrefixFileFuncLine())
  {
    uint64_t v22 = (void *)NSString;
    [NSString stringWithUTF8String:v19];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 lastPathComponent];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:v20];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithLong:a4];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 stringWithFormat:@"<%@ %@(%@)>", v24, v25, v26];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();

    [v21 appendFormat:@"%@", v27];
  }

  else
  {
    uint64_t v27 = 0LL;
  }

  objc_msgSend(v21, "appendFormat:", @"%s: ", ZHUGE_LOG_TYPE_STR[BYTE1(a1)]);
  int v28 = (void *)[objc_alloc(NSString) initWithFormat:v18 arguments:&a9];
  if ([v28 hasSuffix:@"\n"])
  {
    uint64_t v30 = objc_msgSend(v28, "substringToIndex:", objc_msgSend(v28, "length") - 1);

    int v28 = (void *)v30;
  }

  [NSString stringWithFormat:@"%@%@", v21, v28];
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!isZhuGeInRestoreOS())
  {
    +[ZhuGeSingletonArmory sharedInstance](&OBJC_CLASS___ZhuGeLockerArmory, "sharedInstance");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v38 logHandler];

    if (v39)
    {
      v40 = +[ZhuGeSingletonArmory sharedInstance](&OBJC_CLASS___ZhuGeLockerArmory, "sharedInstance");
      uint64_t v41 = (void (*)(void, uint64_t))[v40 logHandler];
      id v42 = [NSString stringWithFormat:@"%s %@", "[ZhuGe]", v29];
      v41(a1, [v42 UTF8String]);

      goto LABEL_61;
    }

    if ((a1 & 0x10000) != 0)
    {
      uint64_t v47 = (FILE *)*MEMORY[0x1895F89E0];
      id v48 = v28;
      fprintf(v47, "%s\n", (const char *)[v48 UTF8String]);
      if ((a1 & 0x20000) != 0)
      {
        int v28 = v48;
        goto LABEL_61;
      }
    }

    if (ZhuGeLog_oslog_token != -1) {
      dispatch_once(&ZhuGeLog_oslog_token, &__block_literal_global_24);
    }
    if (isLoggingInternal_aToken != -1) {
      dispatch_once(&isLoggingInternal_aToken, &__block_literal_global_33_0);
    }
    if (isLoggingInternal_isInternal)
    {
      uint64_t v49 = (os_log_s *)ZhuGeLog_logObj;
      if (!os_log_type_enabled((os_log_t)ZhuGeLog_logObj, (os_log_type_t)a1)) {
        goto LABEL_61;
      }
      *(_DWORD *)buf = 138543362;
      id v53 = v29;
    }

    else
    {
      if ((a1 & 0x80410) == 0) {
        goto LABEL_61;
      }
      uint64_t v49 = (os_log_s *)ZhuGeLog_logObj;
      if (!os_log_type_enabled((os_log_t)ZhuGeLog_logObj, (os_log_type_t)a1)) {
        goto LABEL_61;
      }
      *(_DWORD *)buf = 138543362;
      id v53 = v29;
    }

    _os_log_impl(&dword_188F2F000, v49, (os_log_type_t)a1, "%{public}@", buf, 0xCu);
    goto LABEL_61;
  }

  int v31 = isInZhuGeService();
  id v29 = v29;
  int v32 = isZhuGeInRestoreOS();
  if (v31)
  {
    if (v32)
    {
      pthread_mutex_lock(&printXpcRestoreLog_aRecursiveMutex);
      id v33 = (void *)printXpcRestoreLog_backXpcProxy;
      +[ZhuGeSingletonArmory sharedInstance](&OBJC_CLASS___ZhuGeLockerArmory, "sharedInstance");
      CFTypeRef v34 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 xpcConnection];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = [v35 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_40];
      uint64_t v37 = (void *)printXpcRestoreLog_backXpcProxy;
      printXpcRestoreLog_backXpcProxy = v36;

      id v33 = (void *)printXpcRestoreLog_backXpcProxy;
      if (printXpcRestoreLog_backXpcProxy)
      {
LABEL_35:
        [v33 printRemoteLog:v29];
      }

      else
      {
        objc_msgSend( NSString,  "stringWithFormat:",  @"%s ERR: Failed to get a restore log proxy!",  "[ZhuGe]");
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        printSerialLog(v50);

        [NSString stringWithFormat:@"%s %@", "[ZhuGe]", v29];
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        printSerialLog(v51);
      }
    }

    pthread_mutex_unlock(&printXpcRestoreLog_aRecursiveMutex);
  }

  else if (v32)
  {
    [NSString stringWithFormat:@"%s %@", "[ZhuGe]", v29];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = +[ZhuGeSingletonArmory sharedInstance](&OBJC_CLASS___ZhuGeLockerArmory, "sharedInstance");
    uint64_t v45 = [v44 logHandler];

    if (v45)
    {
      +[ZhuGeSingletonArmory sharedInstance](&OBJC_CLASS___ZhuGeLockerArmory, "sharedInstance");
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void, uint64_t))[v46 logHandler])( 0, objc_msgSend(v43, "UTF8String"));
    }

    else if (isZhuGeStdoutRedirected())
    {
      fprintf( (FILE *)*MEMORY[0x1895F89E0], "%s\n", (const char *)[v43 UTF8String]);
    }

    else
    {
      printSerialLog(v43);
    }
  }

LABEL_61:
}

uint64_t ZhuGePrintStderr( const char *a1, const char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  id v13 = v12;
  if (!a1) {
    a1 = "UnknownFile";
  }
  if (!a2) {
    a2 = "UnknownFunc";
  }
  if (v12)
  {
    if (isLoggingInternal_aToken != -1) {
      dispatch_once(&isLoggingInternal_aToken, &__block_literal_global_33_0);
    }
    if (isLoggingInternal_isInternal)
    {
      uint64_t v14 = strrchr(a1, 47);
      if (v14) {
        uint64_t v15 = v14 + 1;
      }
      else {
        uint64_t v15 = a1;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"%s <%s %s(%ld)> ERR: ", "[ZhuGe]", v15, a2, a3);
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s ERR: ", "[ZhuGe]", v27, v28, v29);
    }

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = (void *)[objc_alloc(NSString) initWithFormat:v13 arguments:&a9];
    objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v18, "length") - 1);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = [v19 isEqualToString:@"\n"];

    if (v20)
    {
      uint64_t v21 = objc_msgSend(v18, "substringToIndex:", objc_msgSend(v18, "length") - 1);

      uint64_t v18 = (void *)v21;
    }

    uint64_t v22 = (FILE *)*MEMORY[0x1895F89D0];
    id v23 = v17;
    uint64_t v24 = (const char *)[v23 UTF8String];
    id v25 = v18;
    uint64_t v16 = fprintf(v22, "%s%s\n", v24, (const char *)[v25 UTF8String]);
  }

  else
  {
    if (isLoggingInternal_aToken != -1) {
      dispatch_once(&isLoggingInternal_aToken, &__block_literal_global_33_0);
    }
    if (isLoggingInternal_isInternal) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "%s <ZhuGeLog.m %s(%d)> ERR: Catched NULL format pointer from: %s %s(%ld)\n",  "[ZhuGe]",  "ZhuGePrintStderr",  309,  a1,  a2,  a3);
    }
    uint64_t v16 = 0xFFFFFFFFLL;
  }

  return v16;
}

void __ZhuGeLog_block_invoke()
{
  __uint64_t v2 = 0LL;
  if (pthread_threadid_np(0LL, &v2)) {
    __uint64_t v2 = MEMORY[0x1895DA988]();
  }
  uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"{%d:0x%llx}", getpid(), v2);
  id v1 = (void *)ZhuGeLog_prefixPidTid;
  ZhuGeLog_prefixPidTid = v0;
}

void __ZhuGeLog_block_invoke_2()
{
  os_log_t v0 = os_log_create("com.apple.zhuge", "ZhuGeArmory");
  id v1 = (void *)ZhuGeLog_logObj;
  ZhuGeLog_logObj = (uint64_t)v0;
}

uint64_t __isLoggingInternal_block_invoke()
{
  if ((isZhuGeInInternalBuild() & 1) != 0 || isZhuGeInFactoryBuild())
  {
    uint64_t result = islibtraceSimulatingCustomerBuild() ^ 1;
  }

  else
  {
    uint64_t result = isZhuGeInRestoreOS();
    if ((_DWORD)result) {
      uint64_t result = doesZhuGeDeemRestoreOSAsInternal();
    }
  }

  isLoggingInternal_isInternal = result;
  return result;
}

uint64_t __printXpcRestoreLog_block_invoke()
{
  return initPthreadRecursiveMutex(&printXpcRestoreLog_aRecursiveMutex);
}

uint64_t __printXpcRestoreLog_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  pthread_mutex_lock(&printXpcRestoreLog_aRecursiveMutex);
  [NSString stringWithFormat:@"%s ERR: Restore log connection error: %@", "[ZhuGe]", v2];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  printSerialLog(v3);
  uint64_t v4 = (void *)printXpcRestoreLog_backXpcProxy;
  printXpcRestoreLog_backXpcProxy = 0LL;

  return pthread_mutex_unlock(&printXpcRestoreLog_aRecursiveMutex);
}

void printSerialLog(void *a1)
{
  id v2 = a1;
  dispatch_semaphore_wait((dispatch_semaphore_t)printSerialLog_aSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v1 = (FILE *)printSerialLog_pConsole;
  if (printSerialLog_pConsole || (id v1 = fopen("/dev/console", "w"), (printSerialLog_pConsole = (uint64_t)v1) != 0))
  {
    [v2 UTF8String];
    fprintf(v1, "%s\n");
  }

  else
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%s ERR: Cannot print serial log!\n");
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)printSerialLog_aSemaphore);
}

void __printSerialLog_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1LL);
  id v1 = (void *)printSerialLog_aSemaphore;
  printSerialLog_aSemaphore = (uint64_t)v0;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010LL)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }

          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0LL);
            if (!(_DWORD)result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }

          else
          {
            return 7LL;
          }
        }

        else
        {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject( a1,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)a2,  0x20uLL,  0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1) {
            return 0LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else if (!*(void *)(a2 + 80) {
               || (__int128 v7 = 0u,
        }
                   __int128 v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0LL;
          }
          __int128 v7 = 0u;
          __int128 v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0LL;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }

    else
    {
      __int128 v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      __int128 v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 4_Block_object_dispose(&a9, 8) = v8;
      __int128 v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }

  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon( void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 4_Block_object_dispose(&a9, 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 12_Block_object_dispose(&a9, 8) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 20_Block_object_dispose(&a9, 8) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 28_Block_object_dispose(&a9, 8) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 36_Block_object_dispose(&a9, 8) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 44_Block_object_dispose(&a9, 8) = 0LL;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + _Block_object_dispose(&a9, 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }

  return result;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  uint64_t v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  __int128 v5 = &v4[v3];
  __int128 v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    __int128 v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      __int128 v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            double result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          double result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  double result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    __int128 v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4[0];
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unint64_t v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  _OWORD v10[2] = *MEMORY[0x1895F89C0];
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x1895F89C0];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

void getFDRDataByFDRClassWithError_cold_1()
{
  dispatch_semaphore_t v0 = (const void *)abort_report_np();
  CC_SHA256(v0, v1, v2);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
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

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x189608318](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x189608370](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties( io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x189608458](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator( io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x189608480](*(void *)&entry, plane, *(void *)&options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return MEMORY[0x1896084B8](*(void *)&entry, plane, name);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608508](entryID);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x189608510](*(void *)&entry, plane);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices( mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x189608578](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x189613708]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x189613748]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t SecAbsoluteTimeFromDateContentWithError()
{
  return MEMORY[0x18960B1A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

uint64_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1895FABE0](block, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FB670](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1895FBBF0]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1895FC5E0]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1895FC6B8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1895FCAB8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1895FCAC0](a1, *(void *)&a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1895FCB68](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}