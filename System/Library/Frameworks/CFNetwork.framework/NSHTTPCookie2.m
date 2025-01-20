@interface NSHTTPCookie2
- (BOOL)hostOnly;
- (BOOL)httpOnly;
- (BOOL)secure;
- (BOOL)sesion;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5;
- (NSString)domain;
- (NSString)name;
- (NSString)partition;
- (NSString)path;
- (NSString)value;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)sameSite;
- (int64_t)source;
@end

@implementation NSHTTPCookie2

- (NSHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___NSHTTPCookie2;
  v12 = -[NSHTTPCookie2 init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    if ([v11 hasPrefix:@"."])
    {
      uint64_t v14 = [v11 lowercaseString];
      domain = v13->_domain;
      v13->_domain = (NSString *)v14;
    }

    else
    {
      [@"." stringByAppendingString:v11];
      domain = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [domain lowercaseString];
      v17 = v13->_domain;
      v13->_domain = (NSString *)v16;
    }

    path = v13->_path;
    v13->_path = (NSString *)@"/";

    partition = v13->_partition;
    v13->_partition = (NSString *)@"none";

    *(_DWORD *)&v13->_secure = 0x1000000;
    v13->_sameSite = 0LL;
    v13->_source = 0LL;
  }

  return v13;
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)self->_sCreationDate];
}

- (NSDate)expirationDate
{
  if (self->_session) {
    return (NSDate *)0LL;
  }
  [MEMORY[0x189603F50] dateWithTimeIntervalSince1970:(double)self->_sExpirationDate];
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  v3 = (void *)NSString;
  -[NSHTTPCookie2 name](self, "name");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSHTTPCookie2 value](self, "value");
  v5 = -[NSHTTPCookie2 domain](self, "domain");
  v6 = -[NSHTTPCookie2 partition](self, "partition");
  v7 = -[NSHTTPCookie2 path](self, "path");
  v8 = -[NSHTTPCookie2 expirationDate](self, "expirationDate");
  [v3 stringWithFormat:@"NSHTTPCookie2 = <\n Name=%@\n Value=%@\n Domain=%@\n Partition=%@\n Path=%@\n Expiry=%@\n Secure=%d\n HttpOnly=%d\n HostOnly=%d\n sameSite=%ld\n>", v11, v4, v5, v6, v7, v8, -[NSHTTPCookie2 secure](self, "secure"), -[NSHTTPCookie2 httpOnly](self, "httpOnly"), -[NSHTTPCookie2 hostOnly](self, "hostOnly"), -[NSHTTPCookie2 sameSite](self, "sameSite")];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSMutableHTTPCookie2);
  v5 = -[NSHTTPCookie2 name](self, "name");
  v6 = -[NSHTTPCookie2 value](self, "value");
  v7 = -[NSHTTPCookie2 domain](self, "domain");
  v8 = -[NSMutableHTTPCookie2 initWithName:value:domain:](v4, "initWithName:value:domain:", v5, v6, v7);

  -[NSHTTPCookie2 partition](self, "partition");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setPartition:](v8, "setPartition:", v9);

  -[NSHTTPCookie2 value](self, "value");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setValue:](v8, "setValue:", v10);

  -[NSHTTPCookie2 path](self, "path");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableHTTPCookie2 setPath:](v8, "setPath:", v11);

  -[NSMutableHTTPCookie2 setSecure:](v8, "setSecure:", -[NSHTTPCookie2 secure](self, "secure"));
  -[NSMutableHTTPCookie2 setSameSite:](v8, "setSameSite:", -[NSHTTPCookie2 sameSite](self, "sameSite"));
  v12 = -[NSHTTPCookie2 expirationDate](self, "expirationDate");
  -[NSMutableHTTPCookie2 setExpirationDate:](v8, "setExpirationDate:", v12);

  -[NSMutableHTTPCookie2 setHostOnly:](v8, "setHostOnly:", -[NSHTTPCookie2 hostOnly](self, "hostOnly"));
  -[NSMutableHTTPCookie2 setHttpOnly:](v8, "setHttpOnly:", -[NSHTTPCookie2 httpOnly](self, "httpOnly"));
  return v8;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (BOOL)sesion
{
  return self->_sesion;
}

- (BOOL)secure
{
  return self->_secure;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (BOOL)hostOnly
{
  return self->_hostOnly;
}

- (NSString)partition
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (void).cxx_destruct
{
}

@end