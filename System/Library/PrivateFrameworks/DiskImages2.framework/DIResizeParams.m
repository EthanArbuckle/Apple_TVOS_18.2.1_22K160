@interface DIResizeParams
+ (BOOL)supportsSecureCoding;
- (BOOL)resizeWithError:(id *)a3;
- (DIResizeParams)initWithCoder:(id)a3;
- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5;
- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation DIResizeParams

- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  result = -[DIBaseParams initWithURL:error:](&v7, sel_initWithURL_error_, a3, a5);
  if (result) {
    result->_size = a4;
  }
  return result;
}

- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  [v8 inputURL];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  v10 = -[DIBaseParams initWithURL:error:](&v18, sel_initWithURL_error_, v9, a5);

  if (!v10) {
    goto LABEL_3;
  }
  v10->_size = a4;
  [v8 diskImageParamsXPC];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams setDiskImageParamsXPC:](v10, "setDiskImageParamsXPC:", v11);
  v12 = -[DIBaseParams shadowChain](v10, "shadowChain");
  [v8 shadowChain];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 nodes];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v12 addShadowNodes:v14 error:a5];

  if ((v15 & 1) == 0) {
    v16 = 0LL;
  }
  else {
LABEL_3:
  }
    v16 = v10;

  return v16;
}

- (DIResizeParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  v5 = -[DIBaseParams initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5) {
    v5->_size = [v4 decodeInt64ForKey:@"size"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  -[DIBaseParams encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIResizeParams size](self, "size"), @"size");
}

- (BOOL)resizeWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3))
  {
    int v5 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v37 = 0LL;
      getDIOSLog();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 34;
      __int16 v39 = 2080;
      v40 = "-[DIResizeParams resizeWithError:]";
      __int16 v41 = 2114;
      v42 = self;
      objc_super v7 = (char *)_os_log_send_and_compose_impl();

      if (v7)
      {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v7);
        free(v7);
      }
    }

    else
    {
      getDIOSLog();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 34;
        __int16 v39 = 2080;
        v40 = "-[DIResizeParams resizeWithError:]";
        __int16 v41 = 2114;
        v42 = self;
        _os_log_impl(&dword_188046000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v5;
    v10 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v10, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v10,  1LL,  a3))
    {
      BOOL v8 = 0;
LABEL_14:

      return v8;
    }

    uint64_t v37 = 0LL;
    v11 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v12 = -[DIBaseParams shadowChain](self, "shadowChain");
    uint64_t v13 = [v12 shouldValidate];
    if (v11)
    {
      [v11 createDiskImageWithCache:0 shadowValidation:v13];
      uint64_t v14 = *(void *)buf;
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    uint64_t v37 = v14;
    *(void *)buf = 0LL;

    if (((*(uint64_t (**)(uint64_t))(*(void *)v37 + 40LL))(v37) & 1) != 0)
    {
      unint64_t v16 = -[DIResizeParams size](self, "size");
      unint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 24LL))(v37);
      uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 32LL))(v37);
      unint64_t v19 = (v16 + v17 - 1) / v17 * v17;
      if ((*(uint64_t (**)(uint64_t))(*(void *)v37 + 24LL))(v37) * v18 == v19)
      {
        int v20 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 34;
          __int16 v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          v22 = (char *)_os_log_send_and_compose_impl();

          if (v22)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v22);
            free(v22);
          }
        }

        else
        {
          getDIOSLog();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&buf[4] = 34;
            __int16 v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            _os_log_impl( &dword_188046000,  v26,  OS_LOG_TYPE_DEFAULT,  "%.*s: New disk image size is the same as previous",  buf,  0x12u);
          }
        }

        *__error() = v20;
        BOOL v8 = 1;
        goto LABEL_30;
      }
      v24 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      uint64_t v25 = [v24 setSizeWithDiskImage:&v37 newSize:v19];

      if (!(_DWORD)v25)
      {
        uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 32LL))(v37);
        -[DIResizeParams setSize:]( self,  "setSize:",  (*(uint64_t (**)(uint64_t))(*(void *)v37 + 24LL))(v37) * v28);
        int v29 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          unint64_t v31 = -[DIResizeParams size](self, "size");
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 34;
          __int16 v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          __int16 v41 = 2048;
          v42 = (DIResizeParams *)v31;
          v32 = (char *)_os_log_send_and_compose_impl();

          if (v32)
          {
            fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v32);
            free(v32);
          }
        }

        else
        {
          getDIOSLog();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v34 = -[DIResizeParams size](self, "size");
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&buf[4] = 34;
            __int16 v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            __int16 v41 = 2048;
            v42 = (DIResizeParams *)v34;
            _os_log_impl( &dword_188046000,  v33,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk image resized to %llu bytes",  buf,  0x1Cu);
          }
        }

        *__error() = v29;
        v35 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v37 + 136LL))(v37);
        uint64_t v36 = DiskImage::Context::flush(v35);
        if ((_DWORD)v36) {
          BOOL v8 = +[DIError failWithPOSIXCode:error:](&OBJC_CLASS___DIError, "failWithPOSIXCode:error:", v36, a3);
        }
        else {
          BOOL v8 = 1;
        }
        if (v35) {
          (*(void (**)(void *))(*v35 + 40LL))(v35);
        }
        goto LABEL_30;
      }

      BOOL v23 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v25,  @"Failed to resize the image",  a3);
    }

    else
    {
      BOOL v23 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Image doesn't support resizing",  a3);
    }

    BOOL v8 = v23;
LABEL_30:
    uint64_t v27 = v37;
    uint64_t v37 = 0LL;
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 16LL))(v27);
    }
    goto LABEL_14;
  }

  return 0;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end