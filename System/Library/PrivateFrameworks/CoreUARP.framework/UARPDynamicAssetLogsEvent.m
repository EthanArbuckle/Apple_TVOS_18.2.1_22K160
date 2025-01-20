@interface UARPDynamicAssetLogsEvent
+ (id)tag;
- (BOOL)decomposeUARP;
- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4;
- (UARPDynamicAssetLogsEvent)init;
- (UARPDynamicAssetLogsEvent)initWithURL:(id)a3;
- (id)createLogsFilepath:(id)a3 forRemoteEndpoint:(id)a4;
- (void)decomposeUARP;
@end

@implementation UARPDynamicAssetLogsEvent

- (UARPDynamicAssetLogsEvent)init
{
  return 0LL;
}

- (UARPDynamicAssetLogsEvent)initWithURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPDynamicAssetLogsEvent;
  v6 = -[UARPDynamicAssetLogsEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "logs");
    log = v7->_log;
    v7->_log = v8;
  }

  return v7;
}

- (BOOL)decomposeUARP
{
  v3 = -[UARPSuperBinaryAsset initWithURL:](objc_alloc(&OBJC_CLASS___UARPSuperBinaryAsset), "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  BOOL v5 = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0LL);
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPDynamicAssetLogsEvent decomposeUARP].cold.1(log);
    }
  }

  return v5;
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v31 = a4;
  if (!-[UARPDynamicAssetLogsEvent decomposeUARP](self, "decomposeUARP"))
  {
    BOOL v25 = 0;
    goto LABEL_23;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v7)
  {
    BOOL v25 = 1;
    goto LABEL_22;
  }

  uint64_t v9 = v7;
  uint64_t v30 = *(void *)v33;
  *(void *)&__int128 v8 = 136315394LL;
  __int128 v28 = v8;
  while (2)
  {
    for (uint64_t i = 0LL; i != v9; ++i)
    {
      if (*(void *)v33 != v30) {
        objc_enumerationMutation(obj);
      }
      objc_super v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v12 = -[UARPDynamicAssetLogsEvent createLogsFilepath:forRemoteEndpoint:]( self,  "createLogsFilepath:forRemoteEndpoint:",  v11,  v31,  v28);
      v13 = (void *)[objc_alloc(MEMORY[0x189604030]) initWithString:v12];
      [MEMORY[0x1896078A8] defaultManager];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 path];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = [v14 createFileAtPath:v15 contents:0 attributes:0];

      if ((v16 & 1) == 0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:].cold.1(log, v13);
        }
        goto LABEL_21;
      }

      [v11 rangePayload];
      v18 = -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v11, 0LL, v17, 0LL);
      if (!UARPWriteFile(v18, v13))
      {

LABEL_21:
        BOOL v25 = 0;
        goto LABEL_22;
      }

      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        [v13 path];
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v28;
        v37 = "-[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:]";
        __int16 v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_187DC0000, v20, OS_LOG_TYPE_INFO, "%s: Successfully Expanded LOGS to File: %@", buf, 0x16u);
      }

      if (v6)
      {
        UARPStringLogsDirectoryFilePath();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 path];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 lastPathComponent];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v22, v23, v24);
      }
    }

    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    BOOL v25 = 1;
    if (v9) {
      continue;
    }
    break;
  }

+ (id)tag
{
  v2 = (char *)uarpAssetTagStructAnalytics();
  return  -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  *v2,  v2[1],  v2[2],  v2[3]);
}

- (id)createLogsFilepath:(id)a3 forRemoteEndpoint:(id)a4
{
  id v5 = a4;
  [a3 tlvs];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:]( &OBJC_CLASS___UARPSuperBinaryAssetTLV,  "findTLVWithType:tlvs:",  3436347665LL,  v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    [v7 valueAsString];
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 stringByDeletingPathExtension];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"-%@", v9];
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v10 = &stru_18A143E70;
  }

  -[__CFString stringByAppendingPathExtension:](v10, "stringByAppendingPathExtension:", @"txt");
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 appleModelNumber];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 serialNumber];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  UARPStringLogsDirectoryFilePath();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UARPUniqueFilename(v12, v13, v14, @"LOGS", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
}

- (void)decomposeUARP
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_187DC0000, log, OS_LOG_TYPE_ERROR, "Unable to expand LOGS SuperBinary Asset", v1, 2u);
}

- (void)expandToDirectory:(void *)a1 forRemoteEndpoint:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v3 = a1;
  [a2 path];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl( &dword_187DC0000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to create filepath for radar LOGS at %@",  (uint8_t *)&v5,  0xCu);
}

@end