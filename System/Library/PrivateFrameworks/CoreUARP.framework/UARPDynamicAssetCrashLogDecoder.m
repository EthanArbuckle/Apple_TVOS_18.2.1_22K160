@interface UARPDynamicAssetCrashLogDecoder
- (BOOL)copySectionName:(id)a3 inDictionary:(id)a4;
- (BOOL)createDictionary:(id)a3 inDictionary:(id)a4;
- (BOOL)decodeCrashLog:(id)a3 inDictionary:(id)a4;
- (UARPDynamicAssetCrashLogDecoder)init;
- (UARPDynamicAssetCrashLogDecoder)initWithDecoderId:(unsigned int)a3 sectionName:(id)a4 inputDictionary:(id)a5;
@end

@implementation UARPDynamicAssetCrashLogDecoder

- (UARPDynamicAssetCrashLogDecoder)init
{
  return 0LL;
}

- (UARPDynamicAssetCrashLogDecoder)initWithDecoderId:(unsigned int)a3 sectionName:(id)a4 inputDictionary:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCrashLogDecoder;
  v11 = -[UARPDynamicAssetCrashLogDecoder init](&v15, sel_init);
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v11->_log;
    v11->_log = v12;

    v11->_decoderId = a3;
    objc_storeStrong((id *)&v11->_sectionName, a4);
    objc_storeStrong((id *)&v11->_cmapDictionary, a5);
  }

  return v11;
}

- (BOOL)decodeCrashLog:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_unsigned int decoderId = (int *)&self->_decoderId;
  unsigned int decoderId = self->_decoderId;
  if (decoderId == 2)
  {
    BOOL v10 = -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:]( self,  "createDictionary:inDictionary:",  v6,  v7);
    goto LABEL_5;
  }

  if (decoderId == 1)
  {
    BOOL v10 = -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:]( self,  "copySectionName:inDictionary:",  v6,  v7);
LABEL_5:
    BOOL v11 = v10;
    goto LABEL_9;
  }

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCrashLogDecoder decodeCrashLog:inDictionary:].cold.1(p_decoderId, log);
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)copySectionName:(id)a3 inDictionary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", @"CrashLogKey");
  if (v8)
  {
    [v6 allKeys];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          if (objc_msgSend(v8, "isEqualToString:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24))
          {
            [v6 objectForKey:v8];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v7 setObject:v22 forKey:v8];

            BOOL v21 = 1;
            goto LABEL_14;
          }
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.2( (uint64_t)v8,  log,  v15,  v16,  v17,  v18,  v19,  v20);
    }
    BOOL v21 = 0;
LABEL_14:
  }

  else
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.1();
    }
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)createDictionary:(id)a3 inDictionary:(id)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v39 = a3;
  id v6 = a4;
  -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", @"CrashLogKey");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", @"DecodedCrashLogChildKey");
    uint64_t v9 = -[NSDictionary objectForKey:](self->_cmapDictionary, "objectForKey:", @"DecodedCrashLogKey");
    uint64_t v10 = (void *)v9;
    if (v8)
    {
      if (v9)
      {
        uint64_t v11 = [v8 count];
        if (v11 == [v7 count])
        {
          v33 = self;
          v34 = v10;
          v35 = v6;
          [v39 allKeys];
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          id v12 = objc_alloc_init(MEMORY[0x189603FC8]);
          if ([v7 count])
          {
            unint64_t v13 = 0LL;
            int v14 = 0;
            v36 = v7;
            while (1)
            {
              [v7 objectAtIndexedSubscript:v13];
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
              __int128 v40 = 0u;
              __int128 v41 = 0u;
              __int128 v42 = 0u;
              __int128 v43 = 0u;
              id v16 = v37;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (!v17) {
                break;
              }
              uint64_t v18 = v17;
              int v38 = v14;
              char v19 = 0;
              uint64_t v20 = *(void *)v41;
              do
              {
                for (uint64_t i = 0LL; i != v18; ++i)
                {
                  if (*(void *)v41 != v20) {
                    objc_enumerationMutation(v16);
                  }
                  if ([*(id *)(*((void *)&v40 + 1) + 8 * i) isEqualToString:v15])
                  {
                    [v8 objectAtIndexedSubscript:v13];
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    [v39 objectForKey:v15];
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    [v12 setObject:v23 forKey:v22];

                    char v19 = 1;
                  }
                }

                uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
              }

              while (v18);

              id v7 = v36;
              if ((v19 & 1) == 0) {
                goto LABEL_32;
              }

              unint64_t v13 = (v38 + 1);
              int v14 = v38 + 1;
              if ([v36 count] <= v13) {
                goto LABEL_18;
              }
            }

LABEL_32:
            log = v33->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
              -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.4( (uint64_t)v15,  log,  v27,  v28,  v29,  v30,  v31,  v32);
            }

            BOOL v24 = 0;
            uint64_t v10 = v34;
            id v6 = v35;
          }

          else
          {
LABEL_18:
            uint64_t v10 = v34;
            id v6 = v35;
            [v35 setObject:v12 forKey:v34];
            BOOL v24 = 1;
          }

          goto LABEL_29;
        }

        if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
          -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.5();
        }
      }

      else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
      {
        -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.3();
      }
    }

    else if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogDecoder createDictionary:inDictionary:].cold.2();
    }

    BOOL v24 = 0;
LABEL_29:

    goto LABEL_30;
  }

  if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCrashLogDecoder copySectionName:inDictionary:].cold.1();
  }
  BOOL v24 = 0;
LABEL_30:

  return v24;
}

- (void).cxx_destruct
{
}

- (void)decodeCrashLog:(int *)a1 inDictionary:(os_log_s *)a2 .cold.1(int *a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl( &dword_187DC0000,  a2,  OS_LOG_TYPE_ERROR,  "UUID (%u) is not defined. Cannot Decode crashLog Dictionary",  (uint8_t *)v3,  8u);
  OUTLINED_FUNCTION_1_1();
}

- (void)copySectionName:inDictionary:.cold.1()
{
}

- (void)copySectionName:(uint64_t)a3 inDictionary:(uint64_t)a4 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)createDictionary:inDictionary:.cold.2()
{
}

- (void)createDictionary:inDictionary:.cold.3()
{
}

- (void)createDictionary:(uint64_t)a3 inDictionary:(uint64_t)a4 .cold.4( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)createDictionary:inDictionary:.cold.5()
{
}

@end