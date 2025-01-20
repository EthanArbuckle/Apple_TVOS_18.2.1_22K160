@interface DIUserDataManager
- (BOOL)embedWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (DIUserDataManager)initWithParams:(id)a3;
- (DIUserDataParams)userDataParams;
- (void)setUserDataParams:(id)a3;
@end

@implementation DIUserDataManager

- (DIUserDataManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DIUserDataManager;
  v6 = -[DIUserDataManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDataParams, a3);
  }

  return v7;
}

- (BOOL)embedWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v35 = 0LL;
    uint64_t v6 = sub_1000BE278();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v37 = 36;
    __int16 v38 = 2080;
    v39 = "-[DIUserDataManager embedWithError:]";
    LODWORD(v33) = 18;
    objc_super v9 = (char *)_os_log_send_and_compose_impl( v8,  &v35,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: entry",  (int)buf,  v33);

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
      int v37 = 36;
      __int16 v38 = 2080;
      v39 = "-[DIUserDataManager embedWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }

  *__error() = v5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 diskImageParamsXPC]);
  unsigned __int8 v14 = [v13 lockBackendsWithError:a3];

  if ((v14 & 1) == 0) {
    return 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 diskImageParamsXPC]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 shadowChain]);
  id v19 = [v18 shouldValidate];
  if (v16) {
    [v16 createDiskImageWithCache:0 shadowValidation:v19];
  }
  else {
    uint64_t v35 = 0LL;
  }

  uint64_t v21 = v35;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userDict]);
  (*(void (**)(uint64_t, void *))(*(void *)v21 + 112LL))(v21, v23);

  int v24 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v34 = 0LL;
    uint64_t v25 = sub_1000BE278();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v27 = 3LL;
    }
    else {
      uint64_t v27 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v37 = 36;
    __int16 v38 = 2080;
    v39 = "-[DIUserDataManager embedWithError:]";
    LODWORD(v33) = 18;
    v28 = (char *)_os_log_send_and_compose_impl( v27,  &v34,  0LL,  0LL,  &_mh_execute_header,  v26,  0LL,  "%.*s: User data embedding passed",  (int)buf,  v33);

    if (v28)
    {
      fprintf(__stderrp, "%s\n", v28);
      free(v28);
    }
  }

  else
  {
    uint64_t v29 = sub_1000BE278();
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v37 = 36;
      __int16 v38 = 2080;
      v39 = "-[DIUserDataManager embedWithError:]";
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%.*s: User data embedding passed",  buf,  0x12u);
    }
  }

  *__error() = v24;
  uint64_t v31 = v35;
  uint64_t v35 = 0LL;
  if (v31) {
    (*(void (**)(uint64_t))(*(void *)v31 + 16LL))(v31);
  }
  return 1;
}

- (BOOL)retrieveWithError:(id *)a3
{
  int v4 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v37 = 0LL;
    uint64_t v5 = sub_1000BE278();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = 3LL;
    }
    else {
      uint64_t v7 = 2LL;
    }
    *(_DWORD *)buf = 68157954;
    int v39 = 39;
    __int16 v40 = 2080;
    v41 = "-[DIUserDataManager retrieveWithError:]";
    LODWORD(v33) = 18;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl( v7,  &v37,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%.*s: entry",  (int)buf,  v33);

    if (v8)
    {
      fprintf(__stderrp, "%s\n", v8);
      free(v8);
    }
  }

  else
  {
    uint64_t v9 = sub_1000BE278();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v39 = 39;
      __int16 v40 = 2080;
      v41 = "-[DIUserDataManager retrieveWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }

  *__error() = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 diskImageParamsXPC]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 shadowChain]);
  id v15 = [v14 shouldValidate];
  if (v12) {
    [v12 createDiskImageWithCache:0 shadowValidation:v15];
  }
  else {
    uint64_t v37 = 0LL;
  }

  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)v37 + 104LL))(&cf);
  v16 = (void *)cf;
  CFRetain(cf);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
  [v17 setUserDict:v16];

  int v18 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v35 = 0LL;
    uint64_t v19 = sub_1000BE278();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = 3LL;
    }
    else {
      uint64_t v21 = 2LL;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 userDict]);
    unsigned int v24 = [v23 count];
    *(_DWORD *)buf = 68158210;
    int v39 = 39;
    __int16 v40 = 2080;
    v41 = "-[DIUserDataManager retrieveWithError:]";
    __int16 v42 = 1024;
    unsigned int v43 = v24;
    LODWORD(v33) = 24;
    uint64_t v25 = (char *)_os_log_send_and_compose_impl( v21,  &v35,  0LL,  0LL,  &_mh_execute_header,  v20,  0LL,  "%.*s: User data retrieving passed, %d value(s) found",  (int)buf,  v33,  v34);

    if (v25)
    {
      fprintf(__stderrp, "%s\n", v25);
      free(v25);
    }
  }

  else
  {
    uint64_t v26 = sub_1000BE278();
    uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataManager userDataParams](self, "userDataParams"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 userDict]);
      unsigned int v30 = [v29 count];
      *(_DWORD *)buf = 68158210;
      int v39 = 39;
      __int16 v40 = 2080;
      v41 = "-[DIUserDataManager retrieveWithError:]";
      __int16 v42 = 1024;
      unsigned int v43 = v30;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%.*s: User data retrieving passed, %d value(s) found",  buf,  0x18u);
    }
  }

  *__error() = v18;
  sub_10000D8A4(&cf);
  uint64_t v31 = v37;
  uint64_t v37 = 0LL;
  if (v31) {
    (*(void (**)(uint64_t))(*(void *)v31 + 16LL))(v31);
  }
  return 1;
}

- (DIUserDataParams)userDataParams
{
  return self->_userDataParams;
}

- (void)setUserDataParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end