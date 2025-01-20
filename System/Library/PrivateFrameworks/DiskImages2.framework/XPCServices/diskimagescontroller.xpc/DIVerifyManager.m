@interface DIVerifyManager
- (BOOL)runWithError:(id *)a3;
- (DIVerifyManager)initWithParams:(id)a3;
- (DIVerifyParams)verifyParams;
- (void)setVerifyParams:(id)a3;
@end

@implementation DIVerifyManager

- (DIVerifyManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIVerifyManager;
  v6 = -[DIVerifyManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_verifyParams, a3);
  }

  return v7;
}

- (BOOL)runWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    __p = 0LL;
    uint64_t v6 = sub_1000BE278();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 32;
    __int16 v34 = 2080;
    v35 = "-[DIVerifyManager runWithError:]";
    LODWORD(v26) = 18;
    objc_super v9 = (char *)_os_log_send_and_compose_impl( v8,  &__p,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: entry",  (int)buf,  v26);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000BE278();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 32;
      __int16 v34 = 2080;
      v35 = "-[DIVerifyManager runWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }

  *__error() = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIVerifyManager verifyParams](self, "verifyParams"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diskImageParamsXPC]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIVerifyManager verifyParams](self, "verifyParams"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 shadowChain]);
  id v16 = [v15 shouldValidate];
  if (v13) {
    [v13 createDiskImageWithCache:0 shadowValidation:v16];
  }
  else {
    uint64_t v28 = 0LL;
  }

  sub_100006174(&__p, "DI Verify Queue");
  sub_10004D52C(buf);
  if (v32 < 0) {
    operator delete(__p);
  }
  char v17 = (*(uint64_t (**)(uint64_t, uint8_t *, void))(*(void *)v28 + 56LL))(v28, buf, 0LL);
  if ((v17 & 1) != 0)
  {
    int v18 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v27 = 0LL;
      uint64_t v19 = sub_1000BE278();
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v21 = 3LL;
      }
      else {
        uint64_t v21 = 2LL;
      }
      __p = (void *)0x2004100202LL;
      __int16 v30 = 2080;
      v31 = "-[DIVerifyManager runWithError:]";
      LODWORD(v26) = 18;
      v22 = (char *)_os_log_send_and_compose_impl( v21,  &v27,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%.*s: Verify passed",  (int)&__p,  v26);

      if (v22)
      {
        fprintf(__stderrp, "%s\n", v22);
        free(v22);
      }
    }

    else
    {
      uint64_t v23 = sub_1000BE278();
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        __p = (void *)0x2004100202LL;
        __int16 v30 = 2080;
        v31 = "-[DIVerifyManager runWithError:]";
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v20,  OS_LOG_TYPE_DEFAULT,  "%.*s: Verify passed",  (uint8_t *)&__p,  0x12u);
      }
    }

    *__error() = v18;
  }

  else
  {
    LOBYTE(v20) = +[DIError failWithEnumValue:description:error:]( &OBJC_CLASS___DIError,  "failWithEnumValue:description:error:",  152LL,  @"Disk image verification failed",  a3);
  }

  __p = &v37;
  sub_10000F974((void ***)&__p);
  if (v36 < 0) {
    operator delete(*(void **)buf);
  }
  uint64_t v24 = v28;
  uint64_t v28 = 0LL;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 16LL))(v24);
  }
  return (v17 | v20) & 1;
}

- (DIVerifyParams)verifyParams
{
  return self->_verifyParams;
}

- (void)setVerifyParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end