@interface DIUserDataParams
+ (BOOL)supportsSecureCoding;
- (BOOL)embedWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (BOOL)supportsPstack;
- (DIUserDataParams)initWithCoder:(id)a3;
- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)userDict;
- (void)encodeWithCoder:(id)a3;
- (void)setUserDict:(id)a3;
@end

@implementation DIUserDataParams

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  v4 = -[DIBaseParams initWithURL:error:](&v8, sel_initWithURL_error_, a3, a4);
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)MEMORY[0x189604A60];
  }

  return v5;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DIUserDataParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  v5 = -[DIBaseParams initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userData"];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x189607908];
      objc_super v8 = (void *)MEMORY[0x189604010];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = 0LL;
      uint64_t v12 = [v7 unarchivedObjectOfClasses:v11 fromData:v6 error:&v16];
      id v13 = v16;
      userDict = v5->_userDict;
      v5->_userDict = (NSDictionary *)v12;

      if (!v13) {
        goto LABEL_7;
      }
    }

    else
    {
      +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  22LL,  @"Failed serializing user dictionary");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[DIBaseParams setDeserializationError:](v5, "setDeserializationError:", v13);
LABEL_7:
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  -[DIBaseParams encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1896078F8];
  v6 = -[DIUserDataParams userDict](self, "userDict");
  id v16 = 0LL;
  [v5 archivedDataWithRootObject:v6 requiringSecureCoding:0 error:&v16];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v16;

  if (v8)
  {
    int v9 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v15 = 0LL;
      getDIOSLog();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      int v19 = 36;
      __int16 v20 = 2080;
      v21 = "-[DIUserDataParams encodeWithCoder:]";
      __int16 v22 = 2114;
      id v23 = v8;
      LODWORD(v14) = 28;
      id v13 = buf;
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v11);
        free(v11);
      }
    }

    else
    {
      getDIOSLog();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v19 = 36;
        __int16 v20 = 2080;
        v21 = "-[DIUserDataParams encodeWithCoder:]";
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl( &dword_188046000,  v12,  OS_LOG_TYPE_ERROR,  "%.*s: Error encoding user dictionary: %{public}@",  buf,  0x1Cu);
      }
    }

    *__error() = v9;
  }

  objc_msgSend(v4, "encodeObject:forKey:", v7, @"userData", v13, v14, v15);
}

- (BOOL)retrieveWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0LL, a3)) {
    return 0;
  }
  int v5 = *__error();
  if (DIForwardLogs())
  {
    uint64_t v17 = 0LL;
    getDIOSLog();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 38;
    *(_WORD *)uint64_t v24 = 2080;
    *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v24[10] = 2114;
    *(void *)&v24[12] = self;
    LODWORD(v15) = 28;
    uint64_t v14 = buf;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
      free(v7);
    }
  }

  else
  {
    getDIOSLog();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)uint64_t v24 = 2080;
      *(void *)&v24[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v24[10] = 2114;
      *(void *)&v24[12] = self;
      _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v5;
  *(void *)buf = 0LL;
  *(void *)uint64_t v24 = buf;
  *(void *)&v24[8] = 0x3032000000LL;
  *(void *)&v24[16] = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v24 + 40) connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  *(void *)(*(void *)v24 + 40LL),  2LL,  a3))
  {
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    __int16 v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0LL;
    [*(id *)(*(void *)v24 + 40) remoteProxy];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __38__DIUserDataParams_retrieveWithError___block_invoke;
    v16[3] = &unk_18A1CA2C0;
    v16[4] = &v17;
    v16[5] = buf;
    [v10 retrieveUserDataWithParams:self reply:v16];

    char v8 = [*(id *)(*(void *)v24 + 40) completeCommandWithError:a3];
    if ((v8 & 1) != 0)
    {
      [(id)v18[5] userDict];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        [(id)v18[5] userDict];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v12 = (void *)MEMORY[0x189604A60];
      }

      -[DIUserDataParams setUserDict:](self, "setUserDict:", v12, v14, v15);
      if (v11) {
    }
      }

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    char v8 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v8;
}

void __38__DIUserDataParams_retrieveWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) signalCommandCompletedWithXpcError:v6];
}

- (BOOL)embedWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[DIUserDataParams userDict](self, "userDict");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"userDict cannot be nil or empty",  a3);
  }
  -[DIUserDataParams userDict](self, "userDict");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 count];

  if (!v7) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"userDict cannot be nil or empty",  a3);
  }
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3)) {
    return 0;
  }
  int v8 = *__error();
  if (DIForwardLogs())
  {
    v15[5] = 0LL;
    getDIOSLog();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 35;
    *(_WORD *)uint64_t v17 = 2080;
    *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v17[10] = 2114;
    *(void *)&v17[12] = self;
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v10);
      free(v10);
    }
  }

  else
  {
    getDIOSLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 35;
      *(_WORD *)uint64_t v17 = 2080;
      *(void *)&v17[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v17[10] = 2114;
      *(void *)&v17[12] = self;
      _os_log_impl(&dword_188046000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v8;
  *(void *)buf = 0LL;
  *(void *)uint64_t v17 = buf;
  *(void *)&v17[8] = 0x3032000000LL;
  *(void *)&v17[16] = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v17 + 40) connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  *(void *)(*(void *)v17 + 40LL),  4LL,  a3))
  {
    [*(id *)(*(void *)v17 + 40) remoteProxy];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __35__DIUserDataParams_embedWithError___block_invoke;
    v15[3] = &unk_18A1CA2E8;
    v15[4] = buf;
    [v13 embedUserDataWithParams:self reply:v15];

    char v11 = [*(id *)(*(void *)v17 + 40) completeCommandWithError:a3];
  }

  else
  {
    char v11 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v11;
}

uint64_t __35__DIUserDataParams_embedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) signalCommandCompletedWithXpcError:a2];
}

- (NSDictionary)userDict
{
  return self->_userDict;
}

- (void)setUserDict:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end