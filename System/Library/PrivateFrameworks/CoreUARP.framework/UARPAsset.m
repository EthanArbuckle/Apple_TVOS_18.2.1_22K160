@interface UARPAsset
- (BOOL)isEqual:(id)a3;
- (BOOL)prepareLocalFileForUse:(id *)a3;
- (BOOL)setData:(id)a3 atOffset:(unint64_t)a4 error:(id *)a5;
- (NSData)data;
- (UARPAsset)initWithID:(id)a3;
- (UARPAsset)initWithID:(id)a3 sandboxToken:(id)a4;
- (UARPAsset)initWithID:(id)a3 withBuffer:(id)a4;
- (UARPAssetID)id;
- (id)description;
- (id)getDataInRange:(_NSRange)a3 error:(id *)a4;
- (unint64_t)fileLength;
- (void)concludeLocalFileAccess;
- (void)fileLength;
@end

@implementation UARPAsset

- (UARPAsset)initWithID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPAsset;
  v6 = -[UARPAsset init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_id, a3);
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "assetID");
    log = v7->_log;
    v7->_log = v8;
  }

  return v7;
}

- (UARPAsset)initWithID:(id)a3 withBuffer:(id)a4
{
  return 0LL;
}

- (UARPAsset)initWithID:(id)a3 sandboxToken:(id)a4
{
  id v6 = a4;
  v7 = -[UARPAsset initWithID:](self, "initWithID:", a3);
  if (v7
    && (os_log_t v8 = -[UARPSandboxExtension initWithTokenString:]( objc_alloc(&OBJC_CLASS___UARPSandboxExtension),  "initWithTokenString:",  v6),  sandboxExtension = v7->_sandboxExtension,  v7->_sandboxExtension = v8,  sandboxExtension,  !v7->_sandboxExtension))
  {
    v10 = 0LL;
  }

  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)getDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (-[UARPAsset prepareLocalFileForUse:](self, "prepareLocalFileForUse:", a4)
    && -[NSFileHandle uarpSeekToOffset:error:](self->_filehandle, "uarpSeekToOffset:error:", location, a4))
  {
    -[NSFileHandle uarpReadDataUpToLength:error:](self->_filehandle, "uarpReadDataUpToLength:error:", length, a4);
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    os_log_t v8 = 0LL;
  }

  return v8;
}

- (BOOL)setData:(id)a3 atOffset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = -[UARPAsset prepareLocalFileForUse:](self, "prepareLocalFileForUse:", a5)
    && -[NSFileHandle uarpSeekToOffset:error:](self->_filehandle, "uarpSeekToOffset:error:", a4, a5)
    && -[NSFileHandle uarpWriteData:error:](self->_filehandle, "uarpWriteData:error:", v8, a5);

  return v9;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID rawDescription](self->_id, "rawDescription");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: %@>", v5, v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPAsset *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    BOOL v5 = self == v4 || -[UARPAssetID isEqual:](self->_id, "isEqual:", v4->_id);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)fileLength
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSURL path](self->_url, "path");
  id v9 = 0LL;
  [v3 attributesOfItemAtPath:v4 error:&v9];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v9;
  unint64_t v7 = [v5 fileSize];

  if (v6)
  {
    if (os_log_type_enabled(self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPAsset fileLength].cold.1();
    }
    unint64_t v7 = 0LL;
  }

  return v7;
}

- (BOOL)prepareLocalFileForUse:(id *)a3
{
  uint64_t v11 = 0LL;
  v12[0] = &v11;
  v12[1] = 0x3032000000LL;
  v12[2] = __Block_byref_object_copy_;
  v12[3] = __Block_byref_object_dispose_;
  id v13 = 0LL;
  int64_t onceToken = self->_onceToken;
  p_int64_t onceToken = &self->_onceToken;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __36__UARPAsset_prepareLocalFileForUse___block_invoke;
  v10[3] = &unk_18A143088;
  v10[4] = self;
  v10[5] = &v11;
  if (onceToken != -1)
  {
    dispatch_once(p_onceToken, v10);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (a3) {
LABEL_3:
  }
    *a3 = *(id *)(v12[0] + 40LL);
LABEL_4:
  if (*(void *)(v12[0] + 40LL))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPAsset prepareLocalFileForUse:].cold.1((uint64_t)self, (uint64_t)v12, log);
    }
  }

  BOOL v8 = self->_filehandle != 0LL;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 48) localURL];
  v4 = *(void **)(*(void *)v2 + 8LL);
  *(void *)(*(void *)v2 + 8LL) = v3;

  if ([*(id *)(*(void *)v2 + 48) type] == 10)
  {
    [MEMORY[0x1896078A8] defaultManager];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(*(void *)v2 + 48) localURL];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 path];
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v5 createFileAtPath:v7 contents:0 attributes:0];

    if ((v8 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(*(void *)v2 + 24LL), OS_LOG_TYPE_ERROR)) {
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_2();
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id obj = *(id *)(v10 + 40);
    uint64_t v11 = [MEMORY[0x189607898] fileHandleForWritingToURL:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 16);
    *(void *)(v12 + 16) = v11;

    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_DEBUG)) {
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_1();
    }
  }

  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v19 = *(id *)(v15 + 40);
    uint64_t v16 = [MEMORY[0x189607898] fileHandleForReadingFromURL:v14 error:&v19];
    objc_storeStrong((id *)(v15 + 40), v19);
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 16);
    *(void *)(v17 + 16) = v16;

    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24LL), OS_LOG_TYPE_DEBUG)) {
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_3();
    }
  }

- (void)concludeLocalFileAccess
{
}

- (UARPAssetID)id
{
  return (UARPAssetID *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

  ;
}

- (void)fileLength
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_2(&dword_187DC0000, v0, v1, "%s: Failed to get file size attribute for %@ with error %@", v2);
}

- (void)prepareLocalFileForUse:(os_log_s *)a3 .cold.1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[UARPAsset prepareLocalFileForUse:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 8);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_1_2( &dword_187DC0000,  a2,  a3,  "%s: Failed to Write/Read to url(%@) with Error: %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16],  *(void *)(*(void *)a2 + 40LL));
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_1()
{
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_2()
{
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_3()
{
}

@end