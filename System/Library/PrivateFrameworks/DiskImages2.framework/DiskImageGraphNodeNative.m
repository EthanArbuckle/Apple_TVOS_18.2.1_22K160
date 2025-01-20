@interface DiskImageGraphNodeNative
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)deleteImage;
- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4;
- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8;
- (NSURL)filePath;
- (id)URL;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)setFilePath:(id)a3;
@end

@implementation DiskImageGraphNodeNative

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DiskImageGraphNodeNative;
  if (objc_msgSendSuper2(&v10, sel_validateWithDictionary_error_, v6, a4))
  {
    BOOL v7 = 0;
    if ([v6 validateAndPopObjectForKey:@"FilePath" className:objc_opt_class() isOptional:0 error:a4])
    {
      if ([v6 count])
      {
        objc_msgSend( NSString,  "stringWithFormat:",  @"Validation failed, input contains unexpected data.");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v7 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  v8,  a4);
      }

      else
      {
        BOOL v7 = 1;
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (DiskImageGraphNodeNative)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if (+[DiskImageGraphNodeNative validateWithDictionary:error:]( &OBJC_CLASS___DiskImageGraphNodeNative,  "validateWithDictionary:error:",  v10,  a6))
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
    self = -[DiskImageGraphNode initWithDictionary:updateChangesToDict:workDir:error:]( &v20,  sel_initWithDictionary_updateChangesToDict_workDir_error_,  v10,  v8,  v11,  a6);
    if (!self) {
      goto LABEL_4;
    }
    v12 = (void *)MEMORY[0x189604030];
    uint64_t v13 = [v10 objectForKey:@"FilePath"];
    [v12 fileURLWithPath:v13 relativeToURL:v11];
    v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
    filePath = self->_filePath;
    self->_filePath = v14;
    v16 = -[DiskImageGraphNodeNative filePath](self, "filePath");
    LOBYTE(v13) = [v16 checkResourceIsReachableAndReturnError:a6];

    if ((v13 & 1) == 0)
    {
      +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  2LL,  @"Image referenced in the pstack is unreachable.",  a6);
      v17 = (DiskImageGraphNodeNative *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
LABEL_4:
      v17 = self;
      self = v17;
    }

    v18 = v17;
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (DiskImageGraphNodeNative)initWithURL:(id)a3 tag:(id)a4 UUID:(id)a5 parentNode:(id)a6 metadata:(id)a7 isCache:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
  v16 = -[DiskImageGraphNode initWithTag:UUID:parentNode:metadata:isCache:]( &v19,  sel_initWithTag_UUID_parentNode_metadata_isCache_,  a4,  a5,  a6,  a7,  v8);
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_filePath, a3);
  }

  return v17;
}

- (void)setFilePath:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  v5 = -[DiskImageGraphNode pstackDict](self, "pstackDict");
  if (v5)
  {
    v6 = -[DiskImageGraphNode pstackDict](self, "pstackDict");
    [v8 relativeString];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v7 forKey:@"FilePath"];
  }
}

- (BOOL)deleteImage
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896078A8] defaultManager];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DiskImageGraphNodeNative filePath](self, "filePath");
  id v16 = 0LL;
  char v5 = [v3 removeItemAtURL:v4 error:&v16];
  id v6 = v16;

  if ((v5 & 1) == 0)
  {
    int v7 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      v9 = -[DiskImageGraphNodeNative filePath](self, "filePath");
      [v6 description];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158466;
      int v18 = 39;
      __int16 v19 = 2080;
      objc_super v20 = "-[DiskImageGraphNodeNative deleteImage]";
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      id v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      getDIOSLog();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[DiskImageGraphNodeNative filePath](self, "filePath");
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 description];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158466;
        int v18 = 39;
        __int16 v19 = 2080;
        objc_super v20 = "-[DiskImageGraphNodeNative deleteImage]";
        __int16 v21 = 2112;
        v22 = v13;
        __int16 v23 = 2112;
        v24 = v14;
        _os_log_impl(&dword_188046000, v12, OS_LOG_TYPE_ERROR, "%.*s: Failed to delete %@: %@", buf, 0x26u);
      }
    }

    *__error() = v7;
  }

  return v5;
}

- (id)toDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DiskImageGraphNodeNative;
  v3 = -[DiskImageGraphNode toDictionary](&v8, sel_toDictionary);
  v4 = (void *)[v3 mutableCopy];

  -[DiskImageGraphNodeNative filePath](self, "filePath");
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 relativePath];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKeyedSubscript:@"FilePath"];

  return v4;
}

- (id)URL
{
  return self->_filePath;
}

- (NSURL)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
}

- (id)toDIShadowNode
{
  v3 = objc_alloc(&OBJC_CLASS___DIShadowNode);
  v4 = -[DiskImageGraphNodeNative filePath](self, "filePath");
  char v5 = -[DIShadowNode initWithURL:isCache:]( v3,  "initWithURL:isCache:",  v4,  -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

- (BOOL)validateAppendedImageWithInfo:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[DiskImageGraphNodeNative filePath](self, "filePath");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiskImageGraph getImageInfoDictWithURL:error:]( &OBJC_CLASS___DiskImageGraph,  "getImageInfoDictWithURL:error:",  v7,  a4);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v8 objectForKeyedSubscript:@"Image Format"];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = [v9 isEqualToString:@"RAW"];

    if (v10)
    {
      int v11 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68157954;
        int v23 = 72;
        __int16 v24 = 2080;
        uint64_t v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();

        if (v13)
        {
          fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v13);
          free(v13);
        }
      }

      else
      {
        getDIOSLog();
        objc_super v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          int v23 = 72;
          __int16 v24 = 2080;
          uint64_t v25 = "-[DiskImageGraphNodeNative(Append) validateAppendedImageWithInfo:error:]";
          _os_log_impl( &dword_188046000,  v20,  OS_LOG_TYPE_DEFAULT,  "%.*s: Parent image is RAW, skipping shadow UUID validation on append.",  buf,  0x12u);
        }
      }

      *__error() = v11;
      goto LABEL_13;
    }

    [v6 objectForKeyedSubscript:@"Identity Info"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 objectForKeyedSubscript:@"Parent UUID"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 objectForKeyedSubscript:@"Identity Info"];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 objectForKeyedSubscript:@"UUID"];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = [v16 isEqualToString:v18];

    if ((v19 & 1) != 0)
    {
LABEL_13:
      BOOL v14 = 1;
      goto LABEL_14;
    }

    BOOL v14 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"UUID validation failed for appended image.",  a4);
  }

  else
  {
    BOOL v14 = 0;
  }

@end