@interface XPCClient
+ (id)clientIDForConnection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)auditTokenData;
- (NSString)bundlePath;
- (NSString)clientID;
- (NSString)clientIDHeader;
- (NSString)clientVersion;
- (NSString)userAgent;
- (XPCClient)init;
- (XPCClient)initWithApplicationID:(id)a3;
- (XPCClient)initWithConnection:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation XPCClient

- (XPCClient)init
{
  return -[XPCClient initWithConnection:](self, "initWithConnection:", 0LL);
}

- (XPCClient)initWithApplicationID:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___XPCClient;
  v5 = -[XPCClient init](&v16, "init");
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    v7 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v4,  0LL,  0LL);
    v8 = v7;
    if (v7)
    {
      v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord URL](v7, "URL"));
      if (v9)
      {
        v10 = CFBundleCreate(0LL, v9);
        if (v10)
        {
          v11 = v10;
          sub_1001BEC38(v5, v10);
          CFRelease(v11);
        }
      }
    }

    objc_autoreleasePoolPop(v6);
    if (!v5->_clientID)
    {
      v12 = (NSString *)[v4 copy];
      clientID = v5->_clientID;
      v5->_clientID = v12;

      clientVersion = v5->_clientVersion;
      v5->_clientVersion = (NSString *)@"1.0";
    }

    sub_1001BECD8((uint64_t)v5);
  }

  return v5;
}

- (XPCClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___XPCClient;
  v5 = -[XPCClient init](&v18, "init");
  if (v5)
  {
    if (!v4)
    {
LABEL_16:
      sub_1001BECD8((uint64_t)v5);
      goto LABEL_17;
    }

    clientVersion = (NSString *)v4;
    objc_opt_self(&OBJC_CLASS___XPCClient);
    -[NSString auditToken](clientVersion, "auditToken");
    int v7 = proc_pidpath(pid, buffer, 0x1000u);
    if (v7 <= 0)
    {
      v8 = 0LL;
    }

    else
    {
      v8 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v7,  4LL);

      if (!v8) {
        goto LABEL_15;
      }
      CFURLRef v9 = CFURLCreateWithFileSystemPath(0LL, v8, kCFURLPOSIXPathStyle, 0);
      if (v9)
      {
        CFURLRef v10 = v9;
        v11 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL(v9);
        if (v11)
        {
          v12 = v11;
          v13 = CFBundleCreate(0LL, v11);
          if (v13)
          {
            v14 = v13;
            sub_1001BEC38(v5, v13);
            CFRelease(v14);
          }

          CFRelease(v12);
        }

        CFRelease(v10);
      }

      if (v5->_clientID) {
        goto LABEL_15;
      }
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v8, "lastPathComponent"));
      clientID = v5->_clientID;
      v5->_clientID = (NSString *)v15;

      clientVersion = v5->_clientVersion;
      v5->_clientVersion = (NSString *)@"1.0";
    }

LABEL_15:
    goto LABEL_16;
  }

+ (id)clientIDForConnection:(id)a3
{
  id v3 = a3;
  id v4 = -[XPCClient initWithConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithConnection:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientID](v4, "clientID"));
  return v5;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XPCClient;
  id v3 = -[XPCClient description](&v7, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@",  v4,  self->_clientID));

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_clientID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if (v6 == objc_opt_class(v4, v7))
  {
    clientID = self->_clientID;
    CFURLRef v10 = (void *)objc_claimAutoreleasedReturnValue([v4 clientID]);
    unsigned __int8 v8 = -[NSString isEqual:](clientID, "isEqual:", v10);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)clientIDHeader
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end