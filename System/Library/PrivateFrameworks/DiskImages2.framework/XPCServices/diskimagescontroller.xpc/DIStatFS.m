@interface DIStatFS
+ (BOOL)supportsSecureCoding;
- (DIStatFS)initWithCoder:(id)a3;
- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4;
- (NSString)mountedFrom;
- (NSURL)mountedOnURL;
- (unint64_t)blockSize;
- (void)encodeWithCoder:(id)a3;
- (void)logWithHeader:(id)a3;
@end

@implementation DIStatFS

- (DIStatFS)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DIStatFS;
  v6 = -[DIStatFS init](&v15, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v5), @"mountedOnURL");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v8;

    id v11 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v10),  @"mountedFrom");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    mountedFrom = v6->_mountedFrom;
    v6->_mountedFrom = (NSString *)v12;

    v6->_blockSize = (unint64_t)[v4 decodeIntegerForKey:@"blockSize"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
  [v6 encodeObject:v4 forKey:@"mountedOnURL"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
  [v6 encodeObject:v5 forKey:@"mountedFrom"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[DIStatFS blockSize](self, "blockSize"), @"blockSize");
}

- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___DIStatFS;
  id v6 = -[DIStatFS init](&v24, "init");
  if (!v6)
  {
LABEL_17:
    v18 = v6;
    goto LABEL_18;
  }

  if ((fstatfs(a3, &v31) & 0x80000000) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31.f_mntonname));
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 1LL));
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v8;

    v6->_blockSize = v31.f_bsize;
    id v10 = +[DIHelpers copyDevicePathWithStatfs:](&OBJC_CLASS___DIHelpers, "copyDevicePathWithStatfs:", &v31);
    id v11 = v10;
    int v12 = *__error();
    if (sub_1000BE2F0())
    {
      uint64_t v23 = 0LL;
      uint64_t v13 = sub_1000BE278();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 2LL;
      }
      *(_DWORD *)buf = 68158210;
      int v26 = 41;
      __int16 v27 = 2080;
      v28 = "-[DIStatFS initWithFileDescriptor:error:]";
      __int16 v29 = 2082;
      f_fstypename = v31.f_fstypename;
      v16 = (char *)_os_log_send_and_compose_impl( v15,  &v23,  0LL,  0LL,  &_mh_execute_header,  v14,  0LL,  "%.*s: File system is %{public}s",  buf,  28);

      if (v16)
      {
        fprintf(__stderrp, "%s\n", v16);
        free(v16);
      }
    }

    else
    {
      uint64_t v19 = sub_1000BE278();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        int v26 = 41;
        __int16 v27 = 2080;
        v28 = "-[DIStatFS initWithFileDescriptor:error:]";
        __int16 v29 = 2082;
        f_fstypename = v31.f_fstypename;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%.*s: File system is %{public}s",  buf,  0x1Cu);
      }
    }

    *__error() = v12;

    goto LABEL_17;
  }

  id v17 = +[DIError nilWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:verboseInfo:error:",  *__error(),  @"fstatfs failed",  a4);
  v18 = (DIStatFS *)objc_claimAutoreleasedReturnValue(v17);
LABEL_18:
  v21 = v18;

  return v21;
}

- (void)logWithHeader:(id)a3
{
  id v6 = a3;
  int v23 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v24 = 0LL;
    uint64_t v7 = sub_1000BE278();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = 3LL;
    }
    else {
      uint64_t v9 = 2LL;
    }
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    unsigned int v12 = -[DIStatFS blockSize](self, "blockSize");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
    if (v13)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"locally mounted from %@",  v4));
    }

    else
    {
      v14 = @"remote mount";
    }

    *(_DWORD *)buf = 68158979;
    int v26 = 26;
    __int16 v27 = 2080;
    v28 = "-[DIStatFS logWithHeader:]";
    __int16 v29 = 2114;
    id v30 = v6;
    __int16 v31 = 2113;
    v32 = v11;
    __int16 v33 = 1024;
    unsigned int v34 = v12;
    __int16 v35 = 2114;
    v36 = v14;
    v22 = (char *)_os_log_send_and_compose_impl( v9,  &v24,  0LL,  0LL,  &_mh_execute_header,  v8,  0LL,  "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@",  buf,  54);
    if (v13)
    {
    }

    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }

  else
  {
    uint64_t v15 = sub_1000BE278();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
      unsigned int v19 = -[DIStatFS blockSize](self, "blockSize");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
      if (v20)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"locally mounted from %@",  v3));
      }

      else
      {
        v21 = @"remote mount";
      }

      *(_DWORD *)buf = 68158979;
      int v26 = 26;
      __int16 v27 = 2080;
      v28 = "-[DIStatFS logWithHeader:]";
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2113;
      v32 = v18;
      __int16 v33 = 1024;
      unsigned int v34 = v19;
      __int16 v35 = 2114;
      v36 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@",  buf,  0x36u);
      if (v20)
      {
      }
    }
  }

  *__error() = v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mountedOnURL
{
  return self->_mountedOnURL;
}

- (NSString)mountedFrom
{
  return self->_mountedFrom;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void).cxx_destruct
{
}

@end