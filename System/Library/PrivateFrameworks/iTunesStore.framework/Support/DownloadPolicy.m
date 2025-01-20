@interface DownloadPolicy
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (NSData)policyData;
- (SSDownloadPolicy)downloadPolicy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setPolicyData:(id)a3;
@end

@implementation DownloadPolicy

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadPolicy;
  -[DownloadPolicy dealloc](&v3, "dealloc");
}

- (SSDownloadPolicy)downloadPolicy
{
  result = self->_cachedPolicy;
  if (!result)
  {
    result = -[DownloadPolicy policyData](self, "policyData");
    if (result)
    {
      uint64_t v11 = 0LL;
      self->_cachedPolicy = (SSDownloadPolicy *) +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___SSDownloadPolicy),  result,  &v11);
      if (v11)
      {
        id v4 = +[SSLogConfig sharedStoreServicesConfig](&OBJC_CLASS___SSLogConfig, "sharedStoreServicesConfig");
        if (!v4) {
          id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
        }
        unsigned int v5 = [v4 shouldLog];
        else {
          LODWORD(v6) = v5;
        }
        v7 = (os_log_s *)[v4 OSLogObject];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          uint64_t v6 = v6;
        }
        else {
          v6 &= 2u;
        }
        if ((_DWORD)v6)
        {
          uint64_t v8 = objc_opt_class(self);
          int v12 = 138543618;
          uint64_t v13 = v8;
          __int16 v14 = 2114;
          uint64_t v15 = v11;
          uint64_t v9 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  16LL,  "%{public}@: Failed to unarchive download policy. Error = %{public}@",  &v12,  22);
          if (v9)
          {
            v10 = (void *)v9;
            +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 4LL);
            free(v10);
            SSFileLog(v4, @"%@");
          }
        }
      }

      return self->_cachedPolicy;
    }

    else
    {
      self->_cachedPolicy = 0LL;
    }
  }

  return result;
}

- (NSData)policyData
{
  return (NSData *)-[DownloadPolicy valueForProperty:](self, "valueForProperty:", @"policy_data");
}

- (void)setPolicyData:(id)a3
{
  self->_cachedPolicy = 0LL;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___DownloadPolicyEntity);
}

+ (id)defaultProperties
{
  return +[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", @"policy_data", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DownloadPolicy;
  return -[DownloadPolicy copyWithZone:](&v4, "copyWithZone:", a3);
}

@end