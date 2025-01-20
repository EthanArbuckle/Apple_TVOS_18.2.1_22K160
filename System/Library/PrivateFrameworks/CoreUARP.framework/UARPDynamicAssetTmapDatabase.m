@interface UARPDynamicAssetTmapDatabase
+ (BOOL)supportsSecureCoding;
- (BOOL)addTmapMapping:(id)a3;
- (BOOL)cleanUpTmapDatabaseFiles;
- (BOOL)createTmapDatabaseFile;
- (BOOL)decomposeUARP;
- (BOOL)flushToDisk;
- (BOOL)tmapDatabaseFileExists;
- (UARPDynamicAssetTmapDatabase)init;
- (UARPDynamicAssetTmapDatabase)initWithCoder:(id)a3;
- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4 appleModelNumber:(id)a5;
- (id)findTmapDatabaseFileUrl;
- (id)findTmapforAppleModel:(id)a3;
- (id)initTmapDatabase:(id)a3;
- (void)cleanUpTmapDatabaseFiles;
- (void)createTmapDatabaseFile;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPDynamicAssetTmapDatabase

- (UARPDynamicAssetTmapDatabase)init
{
  return 0LL;
}

- (id)initTmapDatabase:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetTmapDatabase;
  v6 = -[UARPDynamicAssetTmapDatabase init](&v26, sel_init);
  os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v6->_log;
  v6->_log = v7;

  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](v6, "tmapDatabaseFileExists"))
  {
    uint64_t v9 = -[UARPDynamicAssetTmapDatabase findTmapDatabaseFileUrl](v6, "findTmapDatabaseFileUrl");
    if (!v9)
    {
      v17 = v6->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetTmapDatabase initTmapDatabase:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      goto LABEL_12;
    }

    v10 = (void *)v9;
    [MEMORY[0x189603F48] dataWithContentsOfURL:v9];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [MEMORY[0x189607908] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];

    v6 = (UARPDynamicAssetTmapDatabase *)v12;
  }

  tmapDatabase = v6->_tmapDatabase;
  if (!(v5 | (unint64_t)tmapDatabase))
  {
LABEL_12:
    v16 = 0LL;
    goto LABEL_13;
  }

  if (!tmapDatabase)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v15 = v6->_tmapDatabase;
    v6->_tmapDatabase = v14;
  }

  if (v5) {
    objc_storeStrong((id *)&v6->_url, a3);
  }
  v6 = v6;
  v16 = v6;
LABEL_13:

  return v16;
}

- (UARPDynamicAssetTmapDatabase)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetTmapDatabase;
  unint64_t v5 = -[UARPDynamicAssetTmapDatabase init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v16 count:2];
    os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 decodeObjectOfClasses:v8 forKey:@"tmap"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [v9 mutableCopy];
    tmapDatabase = v5->_tmapDatabase;
    v5->_tmapDatabase = (NSMutableArray *)v10;

    os_log_t v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
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
    [MEMORY[0x1896078F8] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 writeToURL:v3 atomically:1];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
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
  +[UARPDynamicAssetTmapMapping tag](&OBJC_CLASS___UARPDynamicAssetTmapMapping, "tag");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 tag];
        int v13 = [v5 tag];

        if (v12 == v13)
        {
          [v10 rangePayload];
          uint64_t v15 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v10, 0LL, v14, 0LL);
          if (!v15) {
            goto LABEL_18;
          }
          v16 = (void *)v15;
          v17 = (void *)MEMORY[0x189604010];
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = [MEMORY[0x189607908] unarchivedObjectOfClasses:v21 fromData:v16 error:0];
          if (!v22)
          {

LABEL_18:
            BOOL v25 = 0;
            goto LABEL_19;
          }

          uint64_t v23 = (void *)v22;
          BOOL v24 = -[UARPDynamicAssetTmapDatabase addTmapMapping:](self, "addTmapMapping:", v22);

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

  if (self->_tmapDatabase) {
    -[UARPDynamicAssetTmapDatabase flushToDisk](self, "flushToDisk");
  }
  BOOL v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addTmapMapping:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "Adding TMAP Mapping", (uint8_t *)&v33, 2u);
  }

  [v4 objectForKeyedSubscript:@"AppleModelNumber"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v4 objectForKeyedSubscript:@"Endian"];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      uint64_t v7 = @"BigEndian";
    }
    -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self, "findTmapforAppleModel:", v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        [v4 objectForKeyedSubscript:@"Events"];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        char v24 = [v8 appendTmapEvents:v23 endian:v7];

        if ((v24 & 1) == 0)
        {
          BOOL v25 = self->_log;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            -[UARPDynamicAssetTmapDatabase addTmapMapping:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
          }
          BOOL v13 = 0;
          goto LABEL_15;
        }

- (id)findTmapforAppleModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  char v5 = self->_tmapDatabase;
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

- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4 appleModelNumber:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self, "findTmapforAppleModel:", a5);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 expandMticData:v8 withEventID:v6];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[UARPDynamicAssetTmapDatabase expandMticData:withEventID:appleModelNumber:].cold.1( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19);
    }
    __int128 v11 = 0LL;
  }

  return v11;
}

- (id)findTmapDatabaseFileUrl
{
  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](self, "tmapDatabaseFileExists")
    || -[UARPDynamicAssetTmapDatabase createTmapDatabaseFile](self, "createTmapDatabaseFile"))
  {
    v3 = (void *)MEMORY[0x189604030];
    UARPStringTmapDatabaseFilePath();
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 fileURLWithPath:v4];
    char v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

- (BOOL)createTmapDatabaseFile
{
  v3 = (void *)MEMORY[0x189604030];
  UARPStringTmapDatabaseFilePath();
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 fileURLWithPath:v4];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](self, "tmapDatabaseFileExists"))
  {
    char v6 = 1;
  }

  else
  {
    UARPStringTmapDirectoryPath();
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUtilsCreateTemporaryFolder(v7);

    [MEMORY[0x1896078A8] defaultManager];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringTmapDatabaseFilePath();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v6 = [v8 createFileAtPath:v9 contents:0 attributes:0];

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPDynamicAssetTmapDatabase createTmapDatabaseFile].cold.1(log);
      }
    }
  }

  return v6;
}

- (BOOL)tmapDatabaseFileExists
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringTmapDatabaseFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (BOOL)cleanUpTmapDatabaseFiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringTmapDirectoryPath();
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  char v5 = [v3 removeItemAtPath:v4 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetTmapDatabase cleanUpTmapDatabaseFiles].cold.1(log, (uint64_t)v6);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)initTmapDatabase:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)addTmapMapping:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)addTmapMapping:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)expandMticData:(uint64_t)a3 withEventID:(uint64_t)a4 appleModelNumber:(uint64_t)a5 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)createTmapDatabaseFile
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v1 = a1;
  UARPStringTmapDatabaseFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_187DC0000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);
}

- (void)cleanUpTmapDatabaseFiles
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v3 = a1;
  UARPStringTmapDirectoryPath();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_2_1();
  __int16 v7 = v5;
  uint64_t v8 = a2;
  _os_log_error_impl( &dword_187DC0000,  v3,  OS_LOG_TYPE_ERROR,  "%s: Unable to remove files at %@ (%@)",  (uint8_t *)v6,  0x20u);
}

@end