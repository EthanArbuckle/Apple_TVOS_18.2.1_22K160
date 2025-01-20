@interface DIVerifyParams
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldValidateShadows;
- (BOOL)verifyWithError:(id *)a3;
- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4;
- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5;
- (void)setShouldValidateShadows:(BOOL)a3;
@end

@implementation DIVerifyParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  v8 = -[DIVerifyParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DIVerifyParams;
  v9 = -[DIBaseParams initWithURL:error:](&v15, "initWithURL:error:", a3, a5);
  v10 = v9;
  if (!v9
    || -[DIBaseParams openExistingImageWithFlags:error:](v9, "openExistingImageWithFlags:error:", 0LL, a5)
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v10, "shadowChain")),
        unsigned int v12 = [v11 addShadowURLs:v8 error:a5],
        v11,
        v12))
  {
    v13 = v10;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (BOOL)shouldValidateShadows
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  unsigned __int8 v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  [v4 setShouldValidate:v3];
}

- (BOOL)verifyWithError:(id *)a3
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_1000843DC;
  v22 = sub_1000843EC;
  v23 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v17 = 0LL;
    uint64_t v6 = sub_1000B85DC();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    int v25 = 34;
    __int16 v26 = 2080;
    v27 = "-[DIVerifyParams verifyWithError:]";
    __int16 v28 = 2114;
    v29 = self;
    int v15 = 28;
    v9 = (char *)_os_log_send_and_compose_impl( v8,  &v17,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: entry: %{public}@",  buf,  v15);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v10 = sub_1000B85DC();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v25 = 34;
      __int16 v26 = 2080;
      v27 = "-[DIVerifyParams verifyWithError:]";
      __int16 v28 = 2114;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v5;
  if (([(id)v19[5] connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v19[5],  2LL,  a3))
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([(id)v19[5] remoteProxy]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000843F4;
    v16[3] = &unk_100168E18;
    v16[4] = &v18;
    [v12 verifyWithParams:self reply:v16];

    unsigned __int8 v13 = [(id)v19[5] completeCommandWithError:a3];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v13;
}

@end