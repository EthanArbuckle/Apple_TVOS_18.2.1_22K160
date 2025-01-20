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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  result = -[DIBaseParams initWithURL:error:](&v7, "initWithURL:error:", a3, a5);
  if (result) {
    result->_size = a4;
  }
  return result;
}

- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 inputURL]);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  v10 = -[DIBaseParams initWithURL:error:](&v18, "initWithURL:error:", v9, a5);

  if (!v10) {
    goto LABEL_3;
  }
  v10->_size = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 diskImageParamsXPC]);
  -[DIBaseParams setDiskImageParamsXPC:](v10, "setDiskImageParamsXPC:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v10, "shadowChain"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 shadowChain]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 nodes]);
  unsigned __int8 v15 = [v12 addShadowNodes:v14 error:a5];

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
  v5 = -[DIBaseParams initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    v5->_size = (unint64_t)[v4 decodeInt64ForKey:@"size"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DIResizeParams;
  -[DIBaseParams encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIResizeParams size](self, "size"), @"size");
}

- (BOOL)resizeWithError:(id *)a3
{
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3))
  {
    int v5 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v51 = 0LL;
      uint64_t v6 = sub_1000BE278();
      objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v8 = 3LL;
      }
      else {
        uint64_t v8 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 34;
      __int16 v53 = 2080;
      v54 = "-[DIResizeParams resizeWithError:]";
      __int16 v55 = 2114;
      v56 = self;
      v9 = (char *)_os_log_send_and_compose_impl( v8,  &v51,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: entry: %{public}@",  buf,  28);

      if (v9)
      {
        fprintf(__stderrp, "%s\n", v9);
        free(v9);
      }
    }

    else
    {
      uint64_t v11 = sub_1000BE278();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 34;
        __int16 v53 = 2080;
        v54 = "-[DIResizeParams resizeWithError:]";
        __int16 v55 = 2114;
        v56 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }

    *__error() = v5;
    v13 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v13, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v13,  1LL,  a3))
    {
      BOOL v10 = 0;
LABEL_17:

      return v10;
    }

    uint64_t v51 = 0LL;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    id v16 = [v15 shouldValidate];
    if (v14)
    {
      [v14 createDiskImageWithCache:0 shadowValidation:v16];
      uint64_t v17 = *(void *)buf;
    }

    else
    {
      uint64_t v17 = 0LL;
    }

    uint64_t v19 = v51;
    uint64_t v51 = v17;
    *(void *)buf = 0LL;
    if (v19)
    {
      (*(void (**)(uint64_t))(*(void *)v19 + 16LL))(v19);
      uint64_t v20 = *(void *)buf;
      *(void *)buf = 0LL;
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 16LL))(v20);
      }
    }

    if (((*(uint64_t (**)(uint64_t))(*(void *)v51 + 40LL))(v51) & 1) != 0)
    {
      unint64_t v21 = -[DIResizeParams size](self, "size");
      unint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 24LL))(v51);
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 32LL))(v51);
      unint64_t v24 = (v21 + v22 - 1) / v22 * v22;
      if ((*(uint64_t (**)(uint64_t))(*(void *)v51 + 24LL))(v51) * v23 == v24)
      {
        int v25 = *__error();
        if (sub_1000BE2F0())
        {
          uint64_t v50 = 0LL;
          uint64_t v26 = sub_1000BE278();
          v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v28 = 3LL;
          }
          else {
            uint64_t v28 = 2LL;
          }
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 34;
          __int16 v53 = 2080;
          v54 = "-[DIResizeParams resizeWithError:]";
          LODWORD(v49) = 18;
          v29 = (char *)_os_log_send_and_compose_impl( v28,  &v50,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "%.*s: New disk image size is the same as previous",  (int)buf,  v49);

          if (v29)
          {
            fprintf(__stderrp, "%s\n", v29);
            free(v29);
          }
        }

        else
        {
          uint64_t v33 = sub_1000BE278();
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&buf[4] = 34;
            __int16 v53 = 2080;
            v54 = "-[DIResizeParams resizeWithError:]";
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%.*s: New disk image size is the same as previous",  buf,  0x12u);
          }
        }

        *__error() = v25;
        BOOL v10 = 1;
        goto LABEL_39;
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      id v32 = [v31 setSizeWithDiskImage:&v51 newSize:v24];

      if (!(_DWORD)v32)
      {
        uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v51 + 32LL))(v51);
        -[DIResizeParams setSize:]( self,  "setSize:",  (*(uint64_t (**)(uint64_t))(*(void *)v51 + 24LL))(v51) * v36);
        int v37 = *__error();
        if (sub_1000BE2F0())
        {
          uint64_t v50 = 0LL;
          uint64_t v38 = sub_1000BE278();
          v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          unint64_t v41 = -[DIResizeParams size](self, "size");
          if (v40) {
            uint64_t v42 = 3LL;
          }
          else {
            uint64_t v42 = 2LL;
          }
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 34;
          __int16 v53 = 2080;
          v54 = "-[DIResizeParams resizeWithError:]";
          __int16 v55 = 2048;
          v56 = (DIResizeParams *)v41;
          LODWORD(v49) = 28;
          v43 = (char *)_os_log_send_and_compose_impl( v42,  &v50,  0LL,  0LL,  &_mh_execute_header,  v39,  0LL,  "%.*s: Disk image resized to %llu bytes",  (int)buf,  v49);

          if (v43)
          {
            fprintf(__stderrp, "%s\n", v43);
            free(v43);
          }
        }

        else
        {
          uint64_t v44 = sub_1000BE278();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v46 = -[DIResizeParams size](self, "size");
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&buf[4] = 34;
            __int16 v53 = 2080;
            v54 = "-[DIResizeParams resizeWithError:]";
            __int16 v55 = 2048;
            v56 = (DIResizeParams *)v46;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%.*s: Disk image resized to %llu bytes",  buf,  0x1Cu);
          }
        }

        *__error() = v37;
        v47 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v51 + 136LL))(v51);
        uint64_t v48 = sub_1000144E8(v47);
        if ((_DWORD)v48) {
          BOOL v10 = +[DIError failWithPOSIXCode:error:](&OBJC_CLASS___DIError, "failWithPOSIXCode:error:", v48, a3);
        }
        else {
          BOOL v10 = 1;
        }
        if (v47) {
          (*(void (**)(void *))(*v47 + 40LL))(v47);
        }
        goto LABEL_39;
      }

      unsigned __int8 v30 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  v32,  @"Failed to resize the image",  a3);
    }

    else
    {
      unsigned __int8 v30 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Image doesn't support resizing",  a3);
    }

    BOOL v10 = v30;
LABEL_39:
    uint64_t v35 = v51;
    uint64_t v51 = 0LL;
    if (v35) {
      (*(void (**)(uint64_t))(*(void *)v35 + 16LL))(v35);
    }
    goto LABEL_17;
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

@end