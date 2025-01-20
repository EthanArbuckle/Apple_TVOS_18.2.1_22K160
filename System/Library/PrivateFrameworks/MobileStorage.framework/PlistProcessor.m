@interface PlistProcessor
+ (id)sharedPlistProcessor;
- (BOOL)jobIsManagedByMSM:(id)a3;
- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5;
- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4;
- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4;
@end

@implementation PlistProcessor

+ (id)sharedPlistProcessor
{
  if (sharedPlistProcessor_onceToken != -1) {
    dispatch_once(&sharedPlistProcessor_onceToken, &__block_literal_global_1);
  }
  return (id)sharedPlistProcessor_gPP;
}

void __38__PlistProcessor_sharedPlistProcessor__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___PlistProcessor);
  v1 = (void *)sharedPlistProcessor_gPP;
  sharedPlistProcessor_gPP = (uint64_t)v0;
}

- (void)scanPlistsAtPath:(id)a3 execBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = (uint64_t (**)(id, void *, void))a4;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  objc_msgSend(MEMORY[0x1896078A8], "defaultManager", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 enumeratorAtPath:v5];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [v5 stringByAppendingPathComponent:v13];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189603F68] dictionaryWithContentsOfFile:v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && (v6[2](v6, v15, v13) & 1) == 0)
        {

          goto LABEL_12;
        }
      }

      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

- (id)copyAndFixPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  107LL,  -3,  0LL,  @"Invalid input(s).",  v9,  v10,  v11,  v45);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    v46 = 0LL;
    id v37 = 0LL;
    v28 = 0LL;
    __int128 v18 = 0LL;
    v36 = 0LL;
    goto LABEL_15;
  }

  normalizePrivateVar(v8);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  normalizePrivateVar(@"/private/var/personalized_factory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v13 hasPrefix:v14];

  v46 = v13;
  if ((v15 & 1) == 0)
  {
    id v39 = v7;
    v34 = 0LL;
    v23 = 0LL;
    id v38 = 0LL;
    v36 = 0LL;
LABEL_20:
    __int128 v18 = 0LL;
    v28 = 0LL;
    id v37 = 0LL;
    goto LABEL_29;
  }

  uint64_t v16 = [v7 objectForKey:@"Label"];
  copyProgramArgs(v7);
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v36 = (void *)v16;
    [v7 objectForKey:@"XPCServiceName"];
    id v37 = (id)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      id v39 = v7;
      v34 = 0LL;
      v23 = 0LL;
      id v38 = 0LL;
      goto LABEL_20;
    }

    createMobileStorageError( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  127LL,  -2,  0LL,  @"Missing program arguments.",  v40,  v41,  v42,  v45);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    v28 = 0LL;
    __int128 v18 = 0LL;
LABEL_15:
    v23 = 0LL;
    goto LABEL_16;
  }

  __int128 v18 = v17;
  [v17 objectAtIndex:0];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  if (v19)
  {
    if ([v19 hasPrefix:@"/Developer"])
    {
      [v23 componentsSeparatedByString:@"/"];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)[v27 mutableCopy];

      [v28 objectAtIndex:0];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = [v29 isEqualToString:&stru_18A214FC8];

      if (v30) {
        [v28 removeObjectAtIndex:0];
      }
      [v28 replaceObjectAtIndex:0 withObject:v13];
      [v28 componentsJoinedByString:@"/"];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)[v7 mutableCopy];
        [v18 replaceObjectAtIndex:0 withObject:v34];
        [v35 setObject:v18 forKey:@"ProgramArguments"];
        [v35 removeObjectForKey:@"Program"];
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          -[PlistProcessor copyAndFixPlist:forMountPoint:withError:].cold.1();
        }
        v36 = (void *)v16;
        id v37 = v35;
        id v38 = 0LL;
        if (!a5) {
          goto LABEL_28;
        }
      }

      else
      {
        v36 = (void *)v16;
        createMobileStorageError( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  158LL,  -2,  0LL,  @"Failed to update program path %@.",  v31,  v32,  v33,  (uint64_t)v23);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v37 = 0LL;
        if (!a5) {
          goto LABEL_28;
        }
      }

      goto LABEL_17;
    }

    v36 = (void *)v16;
    createMobileStorageError( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  144LL,  -2,  0LL,  @"Invalid program path: %@",  v24,  v25,  v26,  (uint64_t)v23);
  }

  else
  {
    v36 = (void *)v16;
    createMobileStorageError( (uint64_t)"-[PlistProcessor copyAndFixPlist:forMountPoint:withError:]",  135LL,  -2,  0LL,  @"Invalid program arguments: %@",  v20,  v21,  v22,  (uint64_t)v18);
  }

  id v38 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = 0LL;
  v28 = 0LL;
LABEL_16:
  v34 = 0LL;
  if (!a5)
  {
LABEL_28:
    id v39 = v37;
    goto LABEL_29;
  }

- (id)copyPlistWithMSMKeys:(id)a3 withError:(id *)a4
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = (void *)[v5 mutableCopy];
    [v9 objectForKey:@"_AdditionalProperties"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    isNSDictionary(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12) {
      id v13 = (id)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v11];
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    __int128 v19 = v13;
    if (v13)
    {
      uint64_t v24 = @"ManagedByMobileStorageMounter";
      v25[0] = MEMORY[0x189604A88];
      [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:v20 forKeyedSubscript:@"MobileStorageMounter"];

      [v10 setObject:v19 forKeyedSubscript:@"_AdditionalProperties"];
      id v18 = v10;
      __int128 v17 = 0LL;
      uint64_t v10 = v18;
      if (!a4) {
        goto LABEL_13;
      }
    }

    else
    {
      createMobileStorageError( (uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]",  208LL,  -2,  0LL,  @"Failed to allocate dictionary.",  v14,  v15,  v16,  v23);
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v18 = 0LL;
      if (!a4) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor copyPlistWithMSMKeys:withError:]",  192LL,  -2,  0LL,  @"Invalid input.",  v6,  v7,  v8,  v23);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    __int128 v19 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
  }

  if (!v18) {
    *a4 = v17;
  }
LABEL_13:
  id v21 = v18;

  return v21;
}

- (BOOL)jobIsManagedByMSM:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v14) {
      -[PlistProcessor jobIsManagedByMSM:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_22;
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Label"];
  if (!v5)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v22) {
      -[PlistProcessor jobIsManagedByMSM:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_22;
  }

  uint64_t v6 = (void *)v5;
  [v4 objectForKeyedSubscript:@"_AdditionalProperties"];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[PlistProcessor jobIsManagedByMSM:].cold.3();
    }

    goto LABEL_21;
  }

  [v7 objectForKeyedSubscript:@"MobileStorageMounter"];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[PlistProcessor jobIsManagedByMSM:].cold.4((uint64_t)v6, v30, v31, v32, v33, v34, v35, v36);
    }

    goto LABEL_20;
  }

  [v9 objectForKeyedSubscript:@"ManagedByMobileStorageMounter"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[PlistProcessor jobIsManagedByMSM:].cold.5((uint64_t)v6, v37, v38, v39, v40, v41, v42, v43);
    }

LABEL_20:
LABEL_21:

LABEL_22:
    char v13 = 0;
    goto LABEL_23;
  }

  char v13 = [v11 BOOLValue];

LABEL_23:
  return v13;
}

- (BOOL)verifyPlist:(id)a3 forMountPoint:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12 = v8;
  if (!v7 || !v8)
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  282LL,  -3,  0LL,  @"Invalid input(s).",  v9,  v10,  v11,  v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t v16 = 0LL;
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }

  [v7 objectForKey:@"Label"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  288LL,  -2,  0LL,  @"Failed to retrieve job label.",  v13,  v14,  v15,  v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = 0LL;
    goto LABEL_15;
  }

  copyProgramArgs(v7);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v17;
  if (!v17)
  {
    createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  294LL,  -2,  0LL,  @"Failed to retrieve program arguments.",  v18,  v19,  v20,  v42);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  [v17 objectAtIndex:0];
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
  normalizePrivateVar(v22);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    [v21 objectAtIndex:0];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    createMobileStorageError( (uint64_t)"-[PlistProcessor verifyPlist:forMountPoint:withError:]",  300LL,  -2,  0LL,  @"Failed to normalize %@.",  v38,  v39,  v40,  (uint64_t)v37);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    uint64_t v23 = 0LL;
    uint64_t v27 = 0LL;
    if (!a5)
    {
LABEL_20:
      BOOL v36 = 0;
      goto LABEL_21;
    }

- (void)copyAndFixPlist:forMountPoint:withError:.cold.1()
{
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)jobIsManagedByMSM:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  uint64_t v1 = @"_AdditionalProperties";
  _os_log_debug_impl( &dword_18826F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Job '%@' lacks a '%@' dictionary.",  v0,  0x16u);
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.4( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)jobIsManagedByMSM:(uint64_t)a3 .cold.5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end