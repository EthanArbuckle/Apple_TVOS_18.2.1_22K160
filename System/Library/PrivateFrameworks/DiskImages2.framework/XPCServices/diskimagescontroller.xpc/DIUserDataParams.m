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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIUserDataParams)initWithURL:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  v4 = -[DIBaseParams initWithURL:error:](&v8, "initWithURL:error:", a3, a4);
  v5 = v4;
  if (v4)
  {
    userDict = v4->_userDict;
    v4->_userDict = (NSDictionary *)&__NSDictionary0__struct;
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
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  v6 = -[DIBaseParams initWithCoder:](&v21, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), @"userData");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v8);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary, v11);
      v14 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v12,  objc_opt_class(&OBJC_CLASS___NSData, v13),  0LL);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v20 = 0LL;
      uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v9,  &v20));
      id v17 = v20;
      userDict = v6->_userDict;
      v6->_userDict = (NSDictionary *)v16;

      if (!v17) {
        goto LABEL_7;
      }
    }

    else
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue( +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  22LL,  @"Failed serializing user dictionary"));
    }

    -[DIBaseParams setDeserializationError:](v6, "setDeserializationError:", v17);
LABEL_7:
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DIUserDataParams;
  -[DIBaseParams encodeWithCoder:](&v18, "encodeWithCoder:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  id v17 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v5,  0LL,  &v17));
  id v7 = v17;

  if (v7)
  {
    int v8 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v16 = 0LL;
      uint64_t v9 = sub_1000BE278();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        uint64_t v11 = 3LL;
      }
      else {
        uint64_t v11 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      int v20 = 36;
      __int16 v21 = 2080;
      v22 = "-[DIUserDataParams encodeWithCoder:]";
      __int16 v23 = 2114;
      id v24 = v7;
      int v15 = 28;
      uint64_t v12 = (char *)_os_log_send_and_compose_impl( v11,  &v16,  0LL,  0LL,  &_mh_execute_header,  v10,  16LL,  "%.*s: Error encoding user dictionary: %{public}@",  buf,  v15);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }

    else
    {
      uint64_t v13 = sub_1000BE278();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v20 = 36;
        __int16 v21 = 2080;
        v22 = "-[DIUserDataParams encodeWithCoder:]";
        __int16 v23 = 2114;
        id v24 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%.*s: Error encoding user dictionary: %{public}@",  buf,  0x1Cu);
      }
    }

    *__error() = v8;
  }

  [v4 encodeObject:v6 forKey:@"userData"];
}

- (BOOL)retrieveWithError:(id *)a3
{
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0LL, a3)) {
    return 0;
  }
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    uint64_t v6 = sub_1000BE278();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 38;
    *(_WORD *)v25 = 2080;
    *(void *)&v25[2] = "-[DIUserDataParams retrieveWithError:]";
    *(_WORD *)&v25[10] = 2114;
    *(void *)&v25[12] = self;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v7,  0LL,  "%.*s: entry: %{public}@",  buf,  28);

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }

  else
  {
    uint64_t v11 = sub_1000BE278();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 38;
      *(_WORD *)v25 = 2080;
      *(void *)&v25[2] = "-[DIUserDataParams retrieveWithError:]";
      *(_WORD *)&v25[10] = 2114;
      *(void *)&v25[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v5;
  *(void *)buf = 0LL;
  *(void *)v25 = buf;
  *(void *)&v25[8] = 0x3032000000LL;
  *(void *)&v25[16] = sub_10003E518;
  v26 = sub_10003E528;
  v27 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v25 + 40) connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  *(void *)(*(void *)v25 + 40LL),  2LL,  a3))
  {
    uint64_t v18 = 0LL;
    v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    __int16 v21 = sub_10003E518;
    v22 = sub_10003E528;
    id v23 = 0LL;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)v25 + 40) remoteProxy]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10003E530;
    v17[3] = &unk_100177600;
    v17[4] = &v18;
    v17[5] = buf;
    [v13 retrieveUserDataWithParams:self reply:v17];

    unsigned __int8 v10 = [*(id *)(*(void *)v25 + 40) completeCommandWithError:a3];
    if ((v10 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v19[5] userDict]);
      if (v14) {
        int v15 = (void *)objc_claimAutoreleasedReturnValue([(id)v19[5] userDict]);
      }
      else {
        int v15 = &__NSDictionary0__struct;
      }
      -[DIUserDataParams setUserDict:](self, "setUserDict:", v15);
      if (v14) {
    }
      }

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v10;
}

- (BOOL)embedWithError:(id *)a3
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  if (!v5) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"userDict cannot be nil or empty",  a3);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIUserDataParams userDict](self, "userDict"));
  id v7 = [v6 count];

  if (!v7) {
    return +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  22LL,  @"userDict cannot be nil or empty",  a3);
  }
  if (!-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2LL, a3)) {
    return 0;
  }
  int v8 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v20 = 0LL;
    uint64_t v9 = sub_1000BE278();
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v11 = 3LL;
    }
    else {
      uint64_t v11 = 2LL;
    }
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&uint8_t buf[4] = 35;
    *(_WORD *)v22 = 2080;
    *(void *)&v22[2] = "-[DIUserDataParams embedWithError:]";
    *(_WORD *)&v22[10] = 2114;
    *(void *)&v22[12] = self;
    int v18 = 28;
    uint64_t v12 = (char *)_os_log_send_and_compose_impl( v11,  &v20,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%.*s: entry: %{public}@",  buf,  v18);

    if (v12)
    {
      fprintf(__stderrp, "%s\n", v12);
      free(v12);
    }
  }

  else
  {
    uint64_t v14 = sub_1000BE278();
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&uint8_t buf[4] = 35;
      *(_WORD *)v22 = 2080;
      *(void *)&v22[2] = "-[DIUserDataParams embedWithError:]";
      *(_WORD *)&v22[10] = 2114;
      *(void *)&v22[12] = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }

  *__error() = v8;
  *(void *)buf = 0LL;
  *(void *)v22 = buf;
  *(void *)&v22[8] = 0x3032000000LL;
  *(void *)&v22[16] = sub_10003E518;
  id v23 = sub_10003E528;
  id v24 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
  if (([*(id *)(*(void *)v22 + 40) connectWithError:a3] & 1) != 0
    && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  *(void *)(*(void *)v22 + 40LL),  4LL,  a3))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)v22 + 40) remoteProxy]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10003E974;
    v19[3] = &unk_100175B88;
    v19[4] = buf;
    [v16 embedUserDataWithParams:self reply:v19];

    unsigned __int8 v13 = [*(id *)(*(void *)v22 + 40) completeCommandWithError:a3];
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v13;
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

@end