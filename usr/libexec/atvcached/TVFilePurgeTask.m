@interface TVFilePurgeTask
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NSURL)cacheURL;
- (TVFilePurgeTask)init;
- (TVFilePurgeTask)initWithCoder:(id)a3;
- (TVFilePurgeTask)initWithURL:(id)a3 urgency:(int64_t)a4;
- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4;
- (int64_t)purgeableAmountWithUrgency:(int64_t)a3;
- (int64_t)urgency;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVFilePurgeTask

- (TVFilePurgeTask)init
{
  return -[TVFilePurgeTask initWithURL:urgency:](self, "initWithURL:urgency:", 0LL, 1LL);
}

- (TVFilePurgeTask)initWithURL:(id)a3 urgency:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVFilePurgeTask;
  v8 = -[TVFilePurgeTask init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cacheURL, a3);
    v9->_urgency = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
  [v5 encodeObject:v4 forKey:@"TVCacheURL"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[TVFilePurgeTask urgency](self, "urgency"), @"TVUrgency");
}

- (TVFilePurgeTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVFilePurgeTask;
  id v5 = -[TVFilePurgeTask init](&v10, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"TVCacheURL"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v7;

    v5->_urgency = (int64_t)[v4 decodeIntegerForKey:@"TVUrgency"];
  }

  return v5;
}

- (int64_t)purgeableAmountWithUrgency:(int64_t)a3
{
  if (-[TVFilePurgeTask urgency](self, "urgency") > a3) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
  unsigned int v5 = [v4 checkResourceIsReachableAndReturnError:0];

  if (!v5) {
    return 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
  id v8 = objc_msgSend(v6, "tvcd_sizeOfFileAtURL:", v7);

  return (int64_t)v8;
}

- (int64_t)purgeAmount:(int64_t)a3 withUrgency:(int64_t)a4
{
  if (-[TVFilePurgeTask urgency](self, "urgency", a3) > a4) {
    return 0LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
  unsigned int v7 = [v6 checkResourceIsReachableAndReturnError:0];

  id v5 = 0LL;
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
    id v5 = objc_msgSend(v8, "tvcd_sizeOfFileAtURL:", v9);

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
    id v17 = 0LL;
    unsigned __int8 v12 = [v10 removeItemAtURL:v11 error:&v17];
    id v13 = v17;

    if ((v12 & 1) == 0)
    {
      id v14 = sub_100007290();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100007894(self, (uint64_t)v13, v15);
      }

      id v5 = 0LL;
    }
  }

  return (int64_t)v5;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVFilePurgeTask;
  v3 = -[TVFilePurgeTask description](&v10, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVFilePurgeTask cacheURL](self, "cacheURL"));
  int64_t v6 = -[TVFilePurgeTask urgency](self, "urgency");
  else {
    unsigned int v7 = off_10000C5B0[v6 - 2];
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ URL=%@; urgency=%@;",
                   v4,
                   v5,
                   v7));

  return (NSString *)v8;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void).cxx_destruct
{
}

@end