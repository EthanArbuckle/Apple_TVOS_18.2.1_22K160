@interface UARPDynamicAssetCmapDatabase
+ (BOOL)supportsSecureCoding;
- (BOOL)addCmapMapping:(id)a3;
- (BOOL)cleanUpCmapDatabaseFiles;
- (BOOL)cmapDatabaseFileExists;
- (BOOL)createCmapDatabaseFile;
- (BOOL)decomposeUARP;
- (BOOL)flushToDisk;
- (UARPDynamicAssetCmapDatabase)init;
- (UARPDynamicAssetCmapDatabase)initWithCoder:(id)a3;
- (id)expandCrshData:(id)a3 withAppleModelNumber:(id)a4;
- (id)findCmapDatabaseFileUrl;
- (id)findCmapforAppleModel:(id)a3;
- (id)initCmapDatabase:(id)a3;
- (void)cleanUpCmapDatabaseFiles;
- (void)createCmapDatabaseFile;
- (void)encodeWithCoder:(id)a3;
- (void)flushToDisk;
@end

@implementation UARPDynamicAssetCmapDatabase

- (UARPDynamicAssetCmapDatabase)init
{
  return 0LL;
}

- (id)initCmapDatabase:(id)a3
{
  id v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCmapDatabase;
  v6 = -[UARPDynamicAssetCmapDatabase init](&v34, sel_init);
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = v6->_log;
  v6->_log = v7;

  if (!-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](v6, "cmapDatabaseFileExists"))
  {
LABEL_7:
    if (!v6->_cmapDatabase)
    {
      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      cmapDatabase = v6->_cmapDatabase;
      v6->_cmapDatabase = v21;
    }

    if (v5) {
      objc_storeStrong((id *)&v6->_url, a3);
    }
    v6 = v6;
    v23 = v6;
    goto LABEL_12;
  }

  uint64_t v9 = -[UARPDynamicAssetCmapDatabase findCmapDatabaseFileUrl](v6, "findCmapDatabaseFileUrl");
  if (v9)
  {
    v10 = (void *)v9;
    [MEMORY[0x189603F48] dataWithContentsOfURL:v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = 0LL;
    uint64_t v12 = [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v33];
    id v13 = v33;

    if (!v12 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapDatabase initCmapDatabase:].cold.2((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v6 = (UARPDynamicAssetCmapDatabase *)v12;
    goto LABEL_7;
  }

  v25 = v6->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[UARPDynamicAssetCmapDatabase initCmapDatabase:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
  }
  v23 = 0LL;
LABEL_12:

  return v23;
}

- (UARPDynamicAssetCmapDatabase)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetCmapDatabase;
  id v5 = -[UARPDynamicAssetCmapDatabase init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClasses:v8 forKey:@"cmap"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [v9 mutableCopy];
    cmapDatabase = v5->_cmapDatabase;
    v5->_cmapDatabase = (NSMutableArray *)v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = v12;
  }

  return v5;
}

- (BOOL)flushToDisk
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v15 = 0LL;
    [MEMORY[0x1896078F8] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v15];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v15;
    if (!v4)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetCmapDatabase flushToDisk].cold.1((uint64_t)v5, log, v7, v8, v9, v10, v11, v12);
      }
    }

    char v13 = [v4 writeToURL:v3 atomically:1];
  }

  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)decomposeUARP
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL)) {
    return 0;
  }
  +[UARPDynamicAssetCmapMapping tag](&OBJC_CLASS___UARPDynamicAssetCmapMapping, "tag");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v10 payloadTag];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 tag];
        int v13 = [v5 tag];

        if (v12 == v13)
        {
          [v10 rangePayload];
          uint64_t v15 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v10, 0LL, v14, 0LL);
          if (!v15) {
            goto LABEL_18;
          }
          uint64_t v16 = (void *)v15;
          uint64_t v17 = (void *)MEMORY[0x189604010];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [MEMORY[0x189607908] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
          if (!v22)
          {

LABEL_18:
            BOOL v25 = 0;
            goto LABEL_19;
          }

          v23 = (void *)v22;
          BOOL v24 = -[UARPDynamicAssetCmapDatabase addCmapMapping:](self, "addCmapMapping:", v22);

          if (!v24) {
            goto LABEL_18;
          }
        }
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (self->_cmapDatabase) {
    -[UARPDynamicAssetCmapDatabase flushToDisk](self, "flushToDisk");
  }
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addCmapMapping:(id)a3
{
  id v4 = a3;
  [v4 objectForKeyedSubscript:@"AppleModelNumber"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](self, "findCmapforAppleModel:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        [v4 objectForKeyedSubscript:@"sections"];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        char v21 = [v6 appendCmapEvents:v20];

        if ((v21 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetCmapDatabase addCmapMapping:].cold.1(log, v23, v24, v25, v26, v27, v28, v29);
          }
          BOOL v10 = 0;
          goto LABEL_9;
        }

- (id)findCmapforAppleModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = self->_cmapDatabase;
  id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (objc_msgSend(v9, "isEqualAppleModel:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)expandCrshData:(id)a3 withAppleModelNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](self, "findCmapforAppleModel:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 expandCrshDictionary:v6];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapDatabase expandCrshData:withAppleModelNumber:].cold.1( (uint64_t)v7,  log,  v12,  v13,  v14,  v15,  v16,  v17);
    }
    BOOL v10 = 0LL;
  }

  return v10;
}

- (id)findCmapDatabaseFileUrl
{
  if (-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](self, "cmapDatabaseFileExists")
    || -[UARPDynamicAssetCmapDatabase createCmapDatabaseFile](self, "createCmapDatabaseFile"))
  {
    v3 = (void *)MEMORY[0x189604030];
    UARPStringCmapDatabaseFilePath();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 fileURLWithPath:v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

- (BOOL)createCmapDatabaseFile
{
  v3 = (void *)MEMORY[0x189604030];
  UARPStringCmapDatabaseFilePath();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 fileURLWithPath:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](self, "cmapDatabaseFileExists"))
  {
    char v6 = 1;
  }

  else
  {
    UARPStringCmapDirectoryPath();
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUtilsCreateTemporaryFolder(v7);

    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringCmapDatabaseFilePath();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v8 createFileAtPath:v9 contents:0 attributes:0];

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetCmapDatabase createCmapDatabaseFile].cold.1(log);
      }
    }
  }

  return v6;
}

- (BOOL)cmapDatabaseFileExists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCmapDatabaseFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (BOOL)cleanUpCmapDatabaseFiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCmapDirectoryPath();
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  char v5 = [v3 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetCmapDatabase cleanUpCmapDatabaseFiles].cold.1(log, (uint64_t)v6);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)flushToDisk
{
}

- (void)addCmapMapping:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)addCmapMapping:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)expandCrshData:(uint64_t)a3 withAppleModelNumber:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)createCmapDatabaseFile
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v1 = a1;
  UARPStringCmapDatabaseFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_187DC0000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);
}

- (void)cleanUpCmapDatabaseFiles
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v3 = a1;
  UARPStringCmapDirectoryPath();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_2_1();
  __int16 v7 = v5;
  uint64_t v8 = a2;
  _os_log_error_impl( &dword_187DC0000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Unable to remove files at %@ (%@)",  (uint8_t *)v6,  0x20u);
}

@end