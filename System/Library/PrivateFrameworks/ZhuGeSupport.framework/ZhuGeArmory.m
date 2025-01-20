@interface ZhuGeArmory
- (BOOL)checkDependency:(id)a3 withError:(id *)a4;
- (BOOL)convertReturnValue:(id *)a3 ByItselfAndError:(id)a4 AndRevalues:(id)a5;
- (BOOL)updateChangeablePropertiesForKey:(id)a3 andOption:(id)a4 withError:(id *)a5;
- (BOOL)verifyDependencyWithError:(id *)a3;
- (Class)actionClass;
- (Class)configClass;
- (NSDictionary)config;
- (NSDictionary)option;
- (NSMutableArray)dependencyPath;
- (NSString)key;
- (ZhuGeArmoryHelperArmory)helper;
- (id)actForKey:(id)a3 andName:(id)a4 andConfig:(id)a5 andOptions:(id)a6 andPreferences:(id)a7 withError:(id *)a8;
- (id)convertReturnValue:(id)a3 toCase:(id)a4;
- (id)convertReturnValue:(id)a3 toFormat:(id)a4;
- (id)getKeyAndOptionFromDependency:(id)a3 withError:(id *)a4;
- (id)queryKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6;
- (id)runForKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6;
- (void)initData;
- (void)setDependencyPath:(id)a3;
@end

@implementation ZhuGeArmory

- (void)initData
{
  self->_configClass = (Class)objc_opt_class();
  self->_actionClass = (Class)objc_opt_class();
  v3 = objc_alloc(&OBJC_CLASS___ZhuGeArmoryHelperArmory);
  -[objc_class getConfig](self->_configClass, "getConfig");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[ZhuGeArmoryHelperArmory initWithRawConfig:](v3, "initWithRawConfig:", v6);
  helper = self->_helper;
  self->_helper = v4;
}

- (BOOL)updateChangeablePropertiesForKey:(id)a3 andOption:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v13 = a4;
  if (!a5)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]",  38LL,  @"error p-pointer is nil!",  v10,  v11,  v12,  v32);
LABEL_12:
    BOOL v29 = 0;
    goto LABEL_13;
  }

  *a5 = 0LL;
  if (!v9)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]",  44LL,  @"key pointer is nil!",  v10,  v11,  v12,  v32);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    BOOL v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  objc_storeStrong((id *)&self->_key, a3);
  objc_storeStrong((id *)&self->_option, a4);
  v14 = -[ZhuGeArmory helper](self, "helper");
  key = self->_key;
  id v33 = 0LL;
  [v14 getConfigOfKey:key withError:&v33];
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v17 = v33;
  config = self->_config;
  self->_config = v16;

  if (!self->_config)
  {
    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]",  55LL,  @"Failed to update config for key %@!",  v19,  v20,  v21,  (uint64_t)v9);
    id v30 = v17;
    *a5 = v30;

    goto LABEL_12;
  }

  if (isZhuGeInRestoreOS())
  {
    uint64_t v25 = -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", @"SUPPORT_RESTOREOS");
    if (v25)
    {
      v26 = (void *)v25;
      v27 = -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", @"SUPPORT_RESTOREOS");
      char v28 = [v27 BOOLValue];

      if ((v28 & 1) == 0)
      {
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]",  64LL,  @"Key %@ isn't supported in restoreos!",  v22,  v23,  v24,  (uint64_t)v9);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:40 underlyingError:0];
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]",  70LL,  @"Properties of key %@ is: %@",  v22,  v23,  v24,  (uint64_t)v9);

  BOOL v29 = 1;
LABEL_13:

  return v29;
}

- (BOOL)convertReturnValue:(id *)a3 ByItselfAndError:(id)a4 AndRevalues:(id)a5
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = v8;
  v78 = a3;
  if (!a3)
  {
    v64 = @"returnValue p-pointer is nil!";
    uint64_t v65 = 91LL;
LABEL_66:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  v65,  v64,  v9,  v10,  v11,  v71);
    BOOL v66 = 0;
    goto LABEL_71;
  }

  if (!v8)
  {
    v64 = @"revalues pointer is nil!";
    uint64_t v65 = 96LL;
    goto LABEL_66;
  }

  v74 = v7;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  id v72 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v73 = 0;
    uint64_t v16 = *(void *)v85;
    uint64_t v77 = *(void *)v85;
LABEL_5:
    uint64_t v17 = 0LL;
    while (1)
    {
      if (*(void *)v85 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v84 + 1) + 8 * v17);
      [v13 objectForKeyedSubscript:v18];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0) {
        break;
      }
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  104LL,  @"Config of revalue %@ is not a dictionary",  v21,  v22,  v23,  v18);
LABEL_61:
      if (++v17 == v15)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_69;
      }
    }

    [v13 objectForKeyedSubscript:v18];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (isObjectNilOrZhuGeNull(v25))
    {
    }

    else
    {
      [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  111LL,  @"Error config of revalue %@ is not an array",  v28,  v29,  v30,  v18);

        goto LABEL_60;
      }
    }

    uint64_t v31 = v15;
    [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (isObjectNilOrZhuGeNull(v32))
    {

      goto LABEL_16;
    }

    [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0)
    {
LABEL_16:
      [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (isObjectNilOrZhuGeNull(v39))
      {

LABEL_21:
        ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  125LL,  @"Outcome config of revalue %@ is invalid!",  v40,  v41,  v42,  v18);
        int v46 = 8;
        uint64_t v15 = v31;
        goto LABEL_59;
      }

      [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();

      if ((v44 & 1) == 0) {
        goto LABEL_21;
      }
      [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v45 = (isObjectNilOrZhuGeNull(v79) & 1) != 0 || [v79 count] == 0;
      uint64_t v15 = v31;
      if ((isObjectNilOrZhuGeNull(v38) & 1) != 0)
      {
        BOOL v50 = 1;
        if (!v45) {
          goto LABEL_27;
        }
      }

      else
      {
        BOOL v50 = [v38 count] == 0;
        if (!v45)
        {
LABEL_27:
          objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", objc_msgSend(v74, "code"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          int v52 = [v79 containsObject:v51];

          if (!v50)
          {
LABEL_28:
            int v75 = v52;
            __int128 v82 = 0u;
            __int128 v83 = 0u;
            __int128 v80 = 0u;
            __int128 v81 = 0u;
            id v53 = v38;
            uint64_t v54 = [v53 countByEnumeratingWithState:&v80 objects:v88 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v81;
              while (2)
              {
                for (uint64_t i = 0LL; i != v55; ++i)
                {
                  if (*(void *)v81 != v56) {
                    objc_enumerationMutation(v53);
                  }
                  if ([*(id *)(*((void *)&v80 + 1) + 8 * i) isEqualToString:@"ALL_ZERO"]
                    && (isObjectValidAndAllZero(*v78) & 1) != 0)
                  {
                    int v58 = 1;
                    goto LABEL_42;
                  }
                }

                uint64_t v55 = [v53 countByEnumeratingWithState:&v80 objects:v88 count:16];
                if (v55) {
                  continue;
                }
                break;
              }
            }

            int v58 = 0;
LABEL_42:

            uint64_t v15 = v31;
            int v52 = v75;
LABEL_43:
            if ((v52 & v58) == 1)
            {
              ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  154LL,  @"Revalue %@ criteria are matched",  v47,  v48,  v49,  v18);
              if ([v76 isEqualToString:@"NIL"])
              {
                *v78 = 0LL;
LABEL_55:
                char v73 = 1;
                int v46 = 4;
LABEL_58:

LABEL_59:
                if (v46 != 8)
                {

                  BOOL v66 = v73 & 1;
                  goto LABEL_70;
                }

                goto LABEL_60;
              }

              if ([v76 isEqualToString:@"EMPTY_STRING"])
              {
                v59 = v78;
                v60 = &stru_18A317680;
LABEL_54:
                void *v59 = v60;
                goto LABEL_55;
              }

              if ([v76 isEqualToString:@"EMPTY_ARRAY"])
              {
                v59 = v78;
                v60 = (const __CFString *)MEMORY[0x189604A58];
                goto LABEL_54;
              }

              if ([v76 isEqualToString:@"EMPTY_DICTIONARY"])
              {
                v59 = v78;
                v60 = (const __CFString *)MEMORY[0x189604A60];
                goto LABEL_54;
              }

              if ([v76 isEqualToString:@"ZERO_NUMBER"])
              {
                v59 = v78;
                v60 = (const __CFString *)&unk_18A31F0B8;
                goto LABEL_54;
              }

              ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]",  186LL,  @"Outcome config of revalue %@ is unsupported!",  v61,  v62,  v63,  v18);
            }

            int v46 = 8;
            goto LABEL_58;
          }

- (id)convertReturnValue:(id)a3 toFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = v6;
  if (!v5)
  {
    uint64_t v11 = @"returnValue pointer is nil!";
    uint64_t v12 = 204LL;
    goto LABEL_7;
  }

  if (!v6)
  {
    uint64_t v11 = @"format pointer is nil!";
    uint64_t v12 = 209LL;
    goto LABEL_7;
  }

  if (!isObjectNSStringAndZhuGeNull(v6))
  {
    if ([v10 isEqualToString:@"STRING"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [NSString stringFromData:v5];
LABEL_59:
        id v13 = (void *)v15;
        goto LABEL_9;
      }
    }

    if ([v10 isEqualToString:@"STRING_VISIBLE"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [NSString visibleStringFromData:v5];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_HEX"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [NSString hexStringFromData:v5];
        goto LABEL_59;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%x", objc_msgSend(v5, "intValue"));
        uint64_t v15 = LABEL_40:;
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_MAC_ADDR"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [NSString macAddressStringFromData:v5];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_MAC_ADDR_SYSCFG_6BYTE"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [NSString macAddressStringFromSysconfigDataSixByte:v5];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_UUID_WITHOUT_DASH"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [v5 stringByRemovingCharactersInString:@"-"];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_TRIM_SIZE_UNIT_CHARS"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"STRING_SIZE_GB"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v16 = (void *)NSString;
        unint64_t v17 = [v5 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_39:
        objc_msgSend(v16, "stringWithFormat:", @"%llu", v17);
        goto LABEL_40;
      }
    }

    if ([v10 isEqualToString:@"STRING_SIZE_GIB"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v16 = (void *)NSString;
        unint64_t v17 = (unint64_t)[v5 unsignedLongLongValue] >> 30;
        goto LABEL_39;
      }
    }

    if ([v10 isEqualToString:@"ARRAY_GRAPHIC_INFO"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = [MEMORY[0x189603F18] graphicInfoArrayFromArray:v5];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_SINT32"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v18 = (void *)MEMORY[0x189607968];
        id v19 = v5;
        uint64_t v20 = 4LL;
LABEL_50:
        uint64_t v21 = 1LL;
LABEL_58:
        uint64_t v15 = [v18 integerFromData:v19 size:v20 truncate:0 isSigned:v21 needSwap:0];
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_SINT64"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v18 = (void *)MEMORY[0x189607968];
        id v19 = v5;
        uint64_t v20 = 8LL;
        goto LABEL_50;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_UINT32"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v18 = (void *)MEMORY[0x189607968];
        id v19 = v5;
        uint64_t v20 = 4LL;
LABEL_57:
        uint64_t v21 = 0LL;
        goto LABEL_58;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_UINT64"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v18 = (void *)MEMORY[0x189607968];
        id v19 = v5;
        uint64_t v20 = 8LL;
        goto LABEL_57;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_TRIM_SIZE_UNIT_CHARS"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v22 = objc_alloc_init(MEMORY[0x189607978]);
        [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 numberFromString:v23];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:

        goto LABEL_9;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_SIZE_GB"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v24 = (void *)MEMORY[0x189607968];
        unint64_t v25 = [v5 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_71:
        uint64_t v15 = [v24 numberWithUnsignedLongLong:v25];
        goto LABEL_59;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v22 = objc_alloc_init(MEMORY[0x189607978]);
        v26 = (void *)MEMORY[0x189607968];
        [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 numberFromString:v23];
        char v27 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v28 = [v27 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_74:
        [v26 numberWithUnsignedLongLong:v28];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_75;
      }
    }

    if ([v10 isEqualToString:@"NUMBER_SIZE_GIB"])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v24 = (void *)MEMORY[0x189607968];
        unint64_t v25 = (unint64_t)[v5 unsignedLongLongValue] >> 30;
        goto LABEL_71;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v22 = objc_alloc_init(MEMORY[0x189607978]);
        v26 = (void *)MEMORY[0x189607968];
        [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 numberFromString:v23];
        char v27 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v28 = (unint64_t)[v27 unsignedLongLongValue] >> 30;
        goto LABEL_74;
      }
    }

    if ([v10 isEqualToString:@"BOOL_POSITIVE"])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v30 = (void *)MEMORY[0x189607968];
      if ((isKindOfClass & 1) != 0)
      {
        id v31 = v5;
        uint64_t v32 = 0LL;
LABEL_84:
        uint64_t v15 = [v30 BOOLFromData:v31 needNegate:v32];
        goto LABEL_59;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
        goto LABEL_59;
      }
    }

    if ([v10 isEqualToString:@"BOOL_NEGATIVE"])
    {
      objc_opt_class();
      char v33 = objc_opt_isKindOfClass();
      uint64_t v30 = (void *)MEMORY[0x189607968];
      if ((v33 & 1) != 0)
      {
        id v31 = v5;
        uint64_t v32 = 1LL;
        goto LABEL_84;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v15 = objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v5, "BOOLValue") ^ 1);
        goto LABEL_59;
      }
    }

    objc_opt_class();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:toFormat:]",  385LL,  @"Format %@ and class %@ mismatched!",  v34,  v35,  v36,  (uint64_t)v10);
    goto LABEL_8;
  }

  uint64_t v11 = @"format is invalid!";
  uint64_t v12 = 214LL;
LABEL_7:
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:toFormat:]",  v12,  v11,  v7,  v8,  v9,  v37);
LABEL_8:
  id v13 = 0LL;
LABEL_9:

  return v13;
}

- (id)convertReturnValue:(id)a3 toCase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = v6;
  if (!v5)
  {
    uint64_t v11 = @"returnValue pointer is nil!";
    uint64_t v12 = 398LL;
    goto LABEL_15;
  }

  if (!v6)
  {
    uint64_t v11 = @"caseType pointer is nil!";
    uint64_t v12 = 403LL;
    goto LABEL_15;
  }

  if (isObjectNSStringAndZhuGeNull(v6))
  {
    uint64_t v11 = @"caseType is invalid!";
    uint64_t v12 = 408LL;
LABEL_15:
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory convertReturnValue:toCase:]",  v12,  v11,  v7,  v8,  v9,  v17);
    uint64_t v15 = 0LL;
    goto LABEL_16;
  }

  if ([v10 isEqualToString:@"STRING_UPPERCASE"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [MEMORY[0x189603F90] currentLocale];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v5 uppercaseStringWithLocale:v13];
  }

  else
  {
    if (![v10 isEqualToString:@"STRING_LOWERCASE"]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      uint64_t v11 = @"Case %@ and class %@ mismatched!";
      uint64_t v17 = (uint64_t)v10;
      uint64_t v12 = 425LL;
      goto LABEL_15;
    }

    [MEMORY[0x189603F90] currentLocale];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v5 lowercaseStringWithLocale:v13];
  }

  uint64_t v15 = (void *)v14;

LABEL_16:
  return v15;
}

- (id)getKeyAndOptionFromDependency:(id)a3 withError:(id *)a4
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v9 = v5;
  if (a4)
  {
    *a4 = 0LL;
    if (v5)
    {
      [v5 componentsSeparatedByString:@"{"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v10 count] == 1)
      {
        id v11 = v9;
        uint64_t v12 = 0LL;
        id v13 = 0LL;
        uint64_t v14 = @"ZHUGE_NULL";
LABEL_9:
        id v27 = v11;
        v28[0] = v14;
        [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }

      if ([v10 count] == 2)
      {
        [v10 firstObject];
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        [v9 stringByReplacingOccurrencesOfString:v11 withString:&stru_18A317680];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 dataUsingEncoding:4];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = 0LL;
        [MEMORY[0x1896078D8] JSONObjectWithData:v12 options:1 error:&v26];
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v13 = v26;

        if (v14) {
          goto LABEL_9;
        }
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]",  472LL,  @"dependency %@ doesn't contain a valid JSON string!",  v21,  v22,  v23,  (uint64_t)v9);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:27 underlyingError:v13];
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = 0LL;
LABEL_12:
        *a4 = v16;
        goto LABEL_13;
      }

      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]",  477LL,  @"dependency %@ format is wrong!",  v17,  v18,  v19,  (uint64_t)v9);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:59 underlyingError:0];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = 0LL;
      uint64_t v14 = 0LL;
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]",  456LL,  @"dependency pointer is nil!",  v6,  v7,  v8,  v25);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v10 = 0LL;
    }

    uint64_t v12 = 0LL;
    uint64_t v15 = 0LL;
    id v13 = 0LL;
    goto LABEL_12;
  }

  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]",  450LL,  @"error p-pointer is nil!",  v6,  v7,  v8,  v25);
  id v11 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v15 = 0LL;
  id v13 = 0LL;
LABEL_13:

  return v15;
}

- (BOOL)checkDependency:(id)a3 withError:(id *)a4
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v10 = v6;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  500LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v73);
    BOOL v14 = 0;
    goto LABEL_36;
  }

  *a4 = 0LL;
  if (isObjectNilOrZhuGeNull(v6))
  {
    id v11 = (void *)MEMORY[0x189603FA8];
    -[ZhuGeArmory key](self, "key");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 arrayWithObject:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ZhuGeArmory setDependencyPath:](self, "setDependencyPath:", v13);

    BOOL v14 = 1;
    goto LABEL_36;
  }

  -[ZhuGeArmory key](self, "key");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = [v10 containsObject:v15];

  if (v16)
  {
    -[ZhuGeArmory key](self, "key");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  513LL,  @"Key %@ dependency got deadloop",  v18,  v19,  v20,  (uint64_t)v17);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:28 underlyingError:0];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }

  __int128 v89 = 0u;
  __int128 v90 = 0u;
  __int128 v87 = 0u;
  __int128 v88 = 0u;
  id obj = v10;
  uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
  if (!v80)
  {
    BOOL v14 = 1;
    goto LABEL_35;
  }

  uint64_t v77 = a4;
  v78 = v10;
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = 0LL;
  id v27 = 0LL;
  uint64_t v81 = *(void *)v88;
  __int128 v82 = 0LL;
  while (2)
  {
    uint64_t v28 = 0LL;
    uint64_t v29 = v24;
    uint64_t v30 = v25;
    id v31 = v26;
    do
    {
      if (*(void *)v88 != v81) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = *(void *)(*((void *)&v87 + 1) + 8 * v28);
      ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  520LL,  @"Checking dependency \"%@\"",  v21,  v22,  v23,  v32);
      -[ZhuGeArmory dependencyPath](self, "dependencyPath");
      char v33 = (void *)objc_claimAutoreleasedReturnValue();
      int v34 = [v33 containsObject:v32];

      if (v34)
      {
        v74 = -[ZhuGeArmory key](self, "key");
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  523LL,  @"Duplicated dependency \"%@\" for key \"%@\"",  v53,  v54,  v55,  v32);

        [MEMORY[0x189607870] errorWithZhuGeErrorCode:28 underlyingError:0];
        *uint64_t v77 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v14 = 0;
        id v26 = v31;
        id v31 = v82;
        uint64_t v25 = v30;
        goto LABEL_34;
      }

      id v86 = v27;
      -[ZhuGeArmory getKeyAndOptionFromDependency:withError:]( self,  "getKeyAndOptionFromDependency:withError:",  v32,  &v86);
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v35 = v86;

      if (!v24)
      {
        -[ZhuGeArmory key](self, "key");
        int v75 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  530LL,  @"Failed to resolve dependency %@ for key %@!",  v56,  v57,  v58,  v32);

        id v26 = v35;
        BOOL v14 = 0;
        *uint64_t v77 = v26;
        uint64_t v29 = v30;
        uint64_t v25 = v82;
        goto LABEL_34;
      }

      [v24 allKeys];
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 firstObject];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

      [v24 allValues];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 firstObject];
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (isObjectNilOrZhuGeNull(v38))
      {

        v38 = 0LL;
      }

      id v85 = v35;
      v39 = -[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]( self,  "runForKey:andOptions:andPreferences:withError:",  v25,  v38,  0LL,  &v85);
      id v40 = v85;

      if (!v39)
      {
        v76 = -[ZhuGeArmory key](self, "key");
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  542LL,  @"Failed to run for dependency \"%@\" for key \"%@\"",  v59,  v60,  v61,  v32);

        id v62 = v40;
        *uint64_t v77 = v62;

        BOOL v14 = 0;
        id v26 = v31;
        id v31 = v38;
        goto LABEL_33;
      }

      __int128 v82 = v38;
      -[ZhuGeArmory dependencyPath](self, "dependencyPath");
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 addObject:v32];

      -[ZhuGeArmory helper](self, "helper");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      id v84 = v40;
      [v42 getConfigOfKey:v25 withError:&v84];
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v43 = v84;

      if (!v26)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  552LL,  @"Failed to get config for dependency %@!",  v44,  v45,  v46,  v32);
        id v26 = v43;
        BOOL v14 = 0;
        *uint64_t v77 = v26;
        goto LABEL_32;
      }

      [v26 objectForKeyedSubscript:@"DEPENDENCY"];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
      char v48 = isObjectNilOrZhuGeNull(v47);

      if ((v48 & 1) == 0)
      {
        [v26 objectForKeyedSubscript:@"DEPENDENCY"];
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          -[ZhuGeArmory key](self, "key");
          uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue();
          ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  559LL,  @"Dependency %@ defines a non-array dependency",  v69,  v70,  v71,  (uint64_t)v68);

          [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
          *uint64_t v77 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_31;
        }
      }

      [v26 objectForKeyedSubscript:@"DEPENDENCY"];
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      id v83 = v43;
      BOOL v52 = -[ZhuGeArmory checkDependency:withError:](self, "checkDependency:withError:", v51, &v83);
      id v27 = v83;

      if (!v52)
      {
        -[ZhuGeArmory key](self, "key");
        uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory checkDependency:withError:]",  566LL,  @"Failed to verify for key \"%@\" in dependency \"%@\"",  v64,  v65,  v66,  (uint64_t)v63);

        id v67 = v27;
        *uint64_t v77 = v67;

LABEL_31:
        BOOL v14 = 0;
        goto LABEL_32;
      }

      ++v28;
      uint64_t v29 = v24;
      uint64_t v30 = v25;
      id v31 = v26;
    }

    while (v80 != v28);
    uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v80) {
      continue;
    }
    break;
  }

  BOOL v14 = 1;
LABEL_32:
  id v31 = v82;
LABEL_33:
  uint64_t v29 = v24;
LABEL_34:

  uint64_t v10 = v78;
LABEL_35:

LABEL_36:
  return v14;
}

- (BOOL)verifyDependencyWithError:(id *)a3
{
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory verifyDependencyWithError:]",  585LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v33);
    id v20 = 0LL;
    BOOL v21 = 0;
    goto LABEL_10;
  }

  *a3 = 0LL;
  uint64_t v8 = (void *)MEMORY[0x189603FA8];
  -[ZhuGeArmory key](self, "key");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 arrayWithObject:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ZhuGeArmory setDependencyPath:](self, "setDependencyPath:", v10);

  -[ZhuGeArmory config](self, "config");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKeyedSubscript:@"DEPENDENCY"];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  char v13 = isObjectNilOrZhuGeNull(v12);

  if ((v13 & 1) == 0)
  {
    -[ZhuGeArmory config](self, "config");
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 objectForKeyedSubscript:@"DEPENDENCY"];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[ZhuGeArmory key](self, "key");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory verifyDependencyWithError:]",  595LL,  @"Key %@ defines a non-array dependency",  v29,  v30,  v31,  (uint64_t)v28);

      [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v20 = 0LL;
      goto LABEL_9;
    }
  }

  -[ZhuGeArmory config](self, "config");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 objectForKeyedSubscript:@"DEPENDENCY"];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v35 = 0LL;
  BOOL v19 = -[ZhuGeArmory checkDependency:withError:](self, "checkDependency:withError:", v18, &v35);
  id v20 = v35;

  if (!v19)
  {
    -[ZhuGeArmory key](self, "key");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ZhuGeArmory dependencyPath](self, "dependencyPath");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 componentsJoinedByString:@"-->"];
    int v34 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory verifyDependencyWithError:]",  602LL,  @"Failed to check dependency for key \"%@\" in path \"%@\"",  v24,  v25,  v26,  (uint64_t)v22);

    id v27 = v20;
    id v20 = v27;
LABEL_9:
    BOOL v21 = 0;
    *a3 = v27;
    goto LABEL_10;
  }

  BOOL v21 = 1;
LABEL_10:

  return v21;
}

- (id)actForKey:(id)a3 andName:(id)a4 andConfig:(id)a5 andOptions:(id)a6 andPreferences:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v234 = v18;
  v235 = v16;
  v233 = v15;
  v243 = v14;
  v232 = v17;
  if (!a8)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  648LL,  @"error p-pointer is nil!",  v19,  v20,  v21,  v203);
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
LABEL_7:
    int v34 = &unk_18A31F0D0;
    id v35 = &unk_18A31F0D0;
    goto LABEL_18;
  }

  *a8 = 0LL;
  if (!v14)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  654LL,  @"key pointer is nil!",  v19,  v20,  v21,  v203);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
    *a8 = v33;
    a8 = 0LL;
    goto LABEL_7;
  }

  uint64_t v22 = v18;
  -[ZhuGeArmory key](self, "key");
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v14)
  {
    -[ZhuGeArmory option](self, "option");
    uint64_t v24 = (id *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v24 = (id *)v17;
  }

  v231 = v24;
  [v16 objectForKeyedSubscript:@"ACTION_METHOD"];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  667LL,  @"Key \"%@\" doesn't define method for action \"%@\"",  v36,  v37,  v38,  (uint64_t)v14);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:29 underlyingError:0];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v32 = 0LL;
LABEL_17:
    *a8 = v45;
    int v34 = &unk_18A31F0D0;
    id v35 = &unk_18A31F0D0;
    a8 = v231;
    goto LABEL_18;
  }

  [v16 objectForKeyedSubscript:@"ACTION_METHOD"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  675LL,  @"Key \"%@\" defines a non-string method for action \"%@\"",  v39,  v40,  v41,  (uint64_t)v14);
    goto LABEL_15;
  }

  if (isObjectNSStringAndZhuGeNull(v32))
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  681LL,  @"Key \"%@\" defines a empty method for action \"%@\"",  v42,  v43,  v44,  (uint64_t)v14);
LABEL_15:
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v28 = 0LL;
LABEL_16:
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    goto LABEL_17;
  }

  [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  688LL,  @"Key \"%@\" doesn't define argument for action \"%@\"",  v47,  v48,  v49,  (uint64_t)v14);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:29 underlyingError:0];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    goto LABEL_16;
  }

  [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];
  BOOL v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  694LL,  @"Key \"%@\" defines a non-array argument for action \"%@\"",  v52,  v53,  v54,  (uint64_t)v14);
    goto LABEL_15;
  }

  [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  SEL v55 = NSSelectorFromString((NSString *)v32);
  -[objc_class methodSignatureForSelector:]( -[ZhuGeArmory actionClass](self, "actionClass"),  "methodSignatureForSelector:",  v55);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  705LL,  @"Method %@ of key %@ doesn't exist!",  v56,  v57,  v58,  (uint64_t)v32);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:35 underlyingError:0];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    goto LABEL_17;
  }

  [MEMORY[0x189603F88] invocationWithMethodSignature:v30];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]",  712LL,  @"Failed to get invocation method \"%@\" for key \"%@\"",  v59,  v60,  v61,  (uint64_t)v32);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:33 underlyingError:0];
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = 0LL;
    v241 = 0LL;
    v238 = 0LL;
    v236 = 0LL;
    v237 = 0LL;
    uint64_t v26 = 0LL;
    v239 = 0LL;
    id v27 = 0LL;
    uint64_t v28 = 0LL;
    goto LABEL_17;
  }

  -[objc_class setKey:](-[ZhuGeArmory actionClass](self, "actionClass"), "setKey:", v14);
  objc_msgSend(v29, "setTarget:", -[ZhuGeArmory actionClass](self, "actionClass"));
  [v29 setSelector:v55];
  v222 = v30;
  uint64_t v62 = [v30 numberOfArguments] - 1;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue();
  v229 = v29;
  uint64_t v230 = v62;
  uint64_t v223 = (uint64_t)v32;
  v226 = v31;
  v228 = v63;
  if (v62 < 3)
  {
    v227 = 0LL;
    id v210 = 0LL;
    uint64_t v230 = 2LL;
  }

  else
  {
    uint64_t v64 = 0LL;
    uint64_t v65 = 0LL;
    for (uint64_t i = 2LL; i != v62; ++i)
    {
      if ([v31 count] <= (unint64_t)(i - 2))
      {
        id v67 = 0LL;
      }

      else
      {
        objc_msgSend(v31, "objectAtIndexedSubscript:");
        id v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      v255 = v67;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v29 = v229;
        if (-[__CFString isEqualToString:](v255, "isEqualToString:", @"$option"))
        {
          uint64_t v68 = v231;
          uint64_t v69 = v255;
          v255 = (__CFString *)v68;
          goto LABEL_50;
        }

        int v70 = isObjectNSStringAndZhuGeNull(v255);
        uint64_t v69 = v255;
        if (v70)
        {
          v255 = 0LL;
          goto LABEL_50;
        }

        if (-[__CFString rangeOfString:](v255, "rangeOfString:", @"$subkey") != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[ZhuGeArmory helper](self, "helper");
          uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
          id v254 = v64;
          [v71 getSubkeyOfKey:v14 withError:&v254];
          id v72 = (void *)objc_claimAutoreleasedReturnValue();
          id v210 = v254;

          uint64_t v73 = v72;
          v227 = v72;
          if (v72)
          {
            if ((isObjectNSStringAndZhuGeNull(v72) & 1) == 0 && [v72 count])
            {
              -[__CFString componentsSeparatedByString:](v255, "componentsSeparatedByString:", @"$subkey");
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              char v242 = 0;
              unint64_t v80 = 1LL;
              while (1)
              {
                [v69 objectAtIndexedSubscript:v80];
                uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue();
                uint64_t v82 = [v81 intValue];

                if ((_DWORD)v82
                  || ([v69 objectAtIndexedSubscript:v80],
                      id v83 = (void *)objc_claimAutoreleasedReturnValue(),
                      int v84 = [v83 hasPrefix:@"0"],
                      v83,
                      v84))
                {
                  objc_msgSend(NSString, "stringWithFormat:", @"%s%d", "$subkey", v82);
                  id v85 = (void *)objc_claimAutoreleasedReturnValue();
                  id v86 = v255;
                  [v227 objectAtIndexedSubscript:(int)v82];
                  __int128 v87 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__CFString stringByReplacingOccurrencesOfString:withString:]( v86,  "stringByReplacingOccurrencesOfString:withString:",  v85,  v87);
                  __int128 v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  __int128 v89 = v255;
                  v255 = v88;
                }

                else
                {
                  char v242 = 1;
                }

                ++v80;
                uint64_t v73 = v227;
                if ([v69 count] <= v80)
                {
                  if ((v242 & 1) != 0)
                  {
                    __int128 v90 = v255;
                    [v227 objectAtIndexedSubscript:0];
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString stringByReplacingOccurrencesOfString:withString:]( v90,  "stringByReplacingOccurrencesOfString:withString:",  @"$subkey",  v91);
                    uint64_t v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v93 = v255;
                    v255 = v92;
                  }

void __79__ZhuGeArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke( uint64_t a1)
{
  id v11 = &v12;
  uint64_t v12 = 0LL;
  [*(id *)(a1 + 32) setArgument:&v11 atIndex:*(void *)(a1 + 88)];
  [*(id *)(a1 + 32) invoke];
  [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 96)];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    if ([*(id *)(a1 + 48) methodReturnLength])
    {
      uint64_t v10 = 0LL;
      [*(id *)(a1 + 32) getReturnValue:&v10];
      if (v10) {
        uint64_t v7 = v10;
      }
      else {
        uint64_t v7 = @"ZHUGE_NULL";
      }
      [*(id *)(a1 + 80) setObject:v7 atIndexedSubscript:*(void *)(a1 + 96)];
      if (v12) {
        uint64_t v8 = v12;
      }
      else {
        uint64_t v8 = @"ZHUGE_NULL";
      }
      [*(id *)(a1 + 72) setObject:v8 atIndexedSubscript:*(void *)(a1 + 96)];
    }

    else
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]_block_invoke",  962LL,  @"Method %@ of key %@ doesn't return anything!",  v4,  v5,  v6,  *(void *)(a1 + 56));
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:37 underlyingError:0];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 72) setObject:v9 atIndexedSubscript:*(void *)(a1 + 96)];
    }
  }

- (id)runForKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  uint64_t v148 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (a6)
  {
    *a6 = 0LL;
    if (!v10)
    {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1027LL,  @"key pointer is nil!",  v12,  v13,  v14,  v134);
      [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = 0LL;
      id v22 = 0LL;
      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      uint64_t v21 = 0LL;
LABEL_22:
      *a6 = v26;
      goto LABEL_43;
    }

    -[ZhuGeArmory key](self, "key");
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 == v10)
    {
      ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1033LL,  @"Will invocate for key %@!",  v17,  v18,  v19,  (uint64_t)v10);
      -[ZhuGeArmory config](self, "config");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = 0LL;
    }

    else
    {
      ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1036LL,  @"Will invocate for dependency %@!",  v17,  v18,  v19,  (uint64_t)v10);
      -[ZhuGeArmory helper](self, "helper");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v146 = 0LL;
      [v20 getConfigOfKey:v10 withError:&v146];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = v146;

      if (!v21)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1039LL,  @"Failed to update config for key %@!",  v23,  v24,  v25,  (uint64_t)v10);
        id v26 = v22;
        id v22 = v26;
LABEL_21:
        id v27 = 0LL;
        uint64_t v28 = 0LL;
        uint64_t v29 = 0LL;
        goto LABEL_22;
      }
    }

    [v21 objectForKeyedSubscript:@"PRIVILEGE"];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    char v31 = isObjectNilOrZhuGeNull(v30);

    if ((v31 & 1) != 0)
    {
      v137 = 0LL;
    }

    else
    {
      [v21 objectForKeyedSubscript:@"PRIVILEGE"];
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1048LL,  @"Key %@ defines a non-array user privilege",  v55,  v56,  v57,  (uint64_t)v10);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }

      uint64_t v58 = (void *)NSString;
      uid_t v59 = getuid();
      uint64_t v60 = [v58 stringWithUTF8String:getpwuid(v59)->pw_name];
      [v21 objectForKeyedSubscript:@"PRIVILEGE"];
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = (void *)v60;
      LOBYTE(v60) = [v61 containsObject:v60];

      if ((v60 & 1) == 0)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1055LL,  @"Current process priviledge is not allowed by Key \"%@\"",  v62,  v63,  v64,  (uint64_t)v10);
        uint64_t v65 = (void *)MEMORY[0x189607870];
        uint64_t v66 = 44LL;
        goto LABEL_25;
      }
    }

    [v21 objectForKeyedSubscript:@"ENTITLEMENT"];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    char v33 = isObjectNilOrZhuGeNull(v32);

    if ((v33 & 1) != 0
      || ([v21 objectForKeyedSubscript:@"ENTITLEMENT"],
          int v34 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v35 = objc_opt_isKindOfClass(),
          v34,
          (v35 & 1) != 0))
    {
      [v21 objectForKeyedSubscript:@"ACTIONS"];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        [v21 objectForKeyedSubscript:@"ACTIONS"];
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        [v43 objectForKeyedSubscript:@"ACTION_DEFAULT"];
        id v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          uint64_t v140 = self;
          uint64_t v47 = (void *)MEMORY[0x189603FA8];
          uint64_t v48 = [v21 objectForKeyedSubscript:@"ACTIONS"];
          [(id)v48 allKeys];
          uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
          [v47 arrayWithArray:v49];
          BOOL v50 = (void *)objc_claimAutoreleasedReturnValue();

          id obj = v50;
          [v50 removeObject:@"ACTION_SEQUENCE"];
          [v21 objectForKeyedSubscript:@"ACTIONS"];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          [v51 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
          uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v48) = isObjectNilOrZhuGeNull(v52);

          if ((v48 & 1) != 0)
          {
            id v27 = v50;
          }

          else
          {
            [v21 objectForKeyedSubscript:@"ACTIONS"];
            int v70 = (void *)objc_claimAutoreleasedReturnValue();
            [v70 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
            uint64_t v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v72 = objc_opt_isKindOfClass();

            if ((v72 & 1) == 0)
            {
              ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1091LL,  @"Key %@ is defined action sequence with non-array",  v73,  v74,  v75,  (uint64_t)v10);
              [MEMORY[0x189607870] errorWithZhuGeErrorCode:9 underlyingError:0];
              uint64_t v28 = 0LL;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_65;
            }

            [v21 objectForKeyedSubscript:@"ACTIONS"];
            uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue();
            [v76 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
            id v27 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if ([v27 count])
          {
            __int128 v144 = 0u;
            __int128 v145 = 0u;
            __int128 v142 = 0u;
            __int128 v143 = 0u;
            id obj = v27;
            uint64_t v80 = [obj countByEnumeratingWithState:&v142 objects:v147 count:16];
            uint64_t v139 = a6;
            if (v80)
            {
              uint64_t v81 = v80;
              id v135 = v22;
              id v82 = v15;
              id v83 = v11;
              uint64_t v84 = *(void *)v143;
LABEL_32:
              uint64_t v85 = 0LL;
              while (1)
              {
                if (*(void *)v143 != v84) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v86 = *(void *)(*((void *)&v142 + 1) + 8 * v85);
                [v21 objectForKeyedSubscript:@"ACTIONS"];
                __int128 v87 = (void *)objc_claimAutoreleasedReturnValue();
                [v87 objectForKeyedSubscript:v86];
                __int128 v88 = (void *)objc_claimAutoreleasedReturnValue();

                -[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]( v140,  "actForKey:andName:andConfig:andOptions:andPreferences:withError:",  v10,  v86,  v88,  v83,  v82,  v139);
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

                if (v28) {
                  break;
                }
                if (v81 == ++v85)
                {
                  uint64_t v81 = [obj countByEnumeratingWithState:&v142 objects:v147 count:16];
                  if (v81) {
                    goto LABEL_32;
                  }
                  uint64_t v28 = 0LL;
                  break;
                }
              }

              id v11 = v83;
              id v15 = v82;
              id v22 = v135;
            }

            else
            {
              uint64_t v28 = 0LL;
            }

            [v21 objectForKeyedSubscript:@"RETURN"];
            __int128 v90 = (void *)objc_claimAutoreleasedReturnValue();
            char v91 = isObjectNilOrZhuGeNull(v90);

            if ((v91 & 1) != 0) {
              goto LABEL_65;
            }
            [v21 objectForKeyedSubscript:@"RETURN"];
            uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            char v93 = objc_opt_isKindOfClass();

            if ((v93 & 1) != 0)
            {
              [v21 objectForKeyedSubscript:@"RETURN"];
              uint64_t v97 = (void *)objc_claimAutoreleasedReturnValue();
              [v97 objectForKeyedSubscript:@"RETURN_REVALUES"];
              uint64_t v98 = (void *)objc_claimAutoreleasedReturnValue();
              char v99 = isObjectNilOrZhuGeNull(v98);

              if ((v99 & 1) == 0)
              {
                [v21 objectForKeyedSubscript:@"RETURN"];
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                [v100 objectForKeyedSubscript:@"RETURN_REVALUES"];
                char v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                char v102 = objc_opt_isKindOfClass();

                if ((v102 & 1) != 0)
                {
                  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1142LL,  @"Key %@ original value is %@, error is %@",  v103,  v104,  v105,  (uint64_t)v10);
                  id v141 = v28;
                  id v106 = *v139;
                  [v21 objectForKeyedSubscript:@"RETURN"];
                  char v107 = (void *)objc_claimAutoreleasedReturnValue();
                  [v107 objectForKeyedSubscript:@"RETURN_REVALUES"];
                  uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v106) = -[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]( v140,  "convertReturnValue:ByItselfAndError:AndRevalues:",  &v141,  v106,  v108);
                  id v136 = v141;

                  if ((v106 & 1) != 0)
                  {
                    *uint64_t v139 = 0LL;
                    uint64_t v28 = v136;
                    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1152LL,  @"Key %@ revalued value is %@, error is %@",  v109,  v110,  v111,  (uint64_t)v10);
                    a6 = v139;
                    uint64_t v29 = v137;
                    id v27 = obj;
                    v115 = v136;
                    if (!v136)
                    {
                      ZhuGeLog( 524800,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]",  1155LL,  @"Revalued key %@ to nil intentionally!",  v112,  v113,  v114,  (uint64_t)v10);
                      [MEMORY[0x189607870] errorWithZhuGeErrorCode:11 underlyingError:0];
                      id v26 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_22;
                    }

- (id)queryKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (!a6)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1202LL,  @"error p-pointer is nil!",  v12,  v13,  v14,  v35);
    id v27 = 0LL;
    id v28 = 0LL;
    goto LABEL_13;
  }

  *a6 = 0LL;
  if (!v10)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1208LL,  @"key pointer is nil!",  v12,  v13,  v14,  v35);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = 0LL;
    id v28 = 0LL;
    goto LABEL_12;
  }

  ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1213LL,  @"Querying the key: %@",  v12,  v13,  v14,  (uint64_t)v10);
  id v38 = 0LL;
  BOOL v16 = -[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]( self,  "updateChangeablePropertiesForKey:andOption:withError:",  v10,  v11,  &v38);
  id v17 = v38;
  uint64_t v21 = v17;
  if (!v16)
  {
    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1218LL,  @"Failed to update properties for key %@, error %@!",  v18,  v19,  v20,  (uint64_t)v10);
    char v33 = v21;
LABEL_11:
    id v32 = v33;
    id v28 = v32;
    id v27 = 0LL;
    goto LABEL_12;
  }

  id v37 = v17;
  BOOL v22 = -[ZhuGeArmory verifyDependencyWithError:](self, "verifyDependencyWithError:", &v37);
  id v23 = v37;

  if (!v22)
  {
    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1224LL,  @"Dependency of %@ is not ready, error %@",  v24,  v25,  v26,  (uint64_t)v10);
    char v33 = v23;
    goto LABEL_11;
  }

  id v36 = v23;
  -[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]( self,  "runForKey:andOptions:andPreferences:withError:",  v10,  v11,  v15,  &v36);
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  id v28 = v36;

  if (!v27)
  {
    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m",  "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]",  1234LL,  @"Failed to act for key %@!",  v29,  v30,  v31,  (uint64_t)v10);
    id v32 = v28;
    id v28 = v32;
LABEL_12:
    *a6 = v32;
  }

- (ZhuGeArmoryHelperArmory)helper
{
  return (ZhuGeArmoryHelperArmory *)objc_getProperty(self, a2, 24LL, 1);
}

- (Class)configClass
{
  return self->_configClass;
}

- (Class)actionClass
{
  return self->_actionClass;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDictionary)option
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSMutableArray)dependencyPath
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setDependencyPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end