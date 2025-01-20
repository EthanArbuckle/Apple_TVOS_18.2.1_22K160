@interface LTSStatsStore
+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4;
+ (id)getBootUUID;
+ (id)getPrevStatsSinceBoot;
+ (id)readFromFile:(id)a3;
+ (void)saveStatsSinceBoot:(id)a3;
- (NSMutableDictionary)lts;
- (NSString)fileName;
- (id)getDeviceSerialNumber;
- (id)getLifetimeStats;
- (id)getLifetimeStatsForVersion:(unint64_t)a3;
- (id)getfileNameForChannel:(id)a3;
- (id)initForChannel:(id)a3;
- (void)saveLifetimeStats:(id)a3 forVersion:(unint64_t)a4;
- (void)setChannelExistsForChannel:(id)a3;
- (void)setFileName:(id)a3;
- (void)setLts:(id)a3;
@end

@implementation LTSStatsStore

- (id)getfileNameForChannel:(id)a3
{
  uint64_t v4 = 0LL;
  while (![a3 isEqualToString:off_100014940[v4]])
  {
    v4 += 4LL;
    if (v4 == 56)
    {
      v5 = 0LL;
      return v5;
    }
  }

  v5 = off_100014940[v4 + 1];
  return v5;
}

- (void)setChannelExistsForChannel:(id)a3
{
  uint64_t v4 = 0LL;
  while (![a3 isEqualToString:off_100014940[v4]])
  {
    v4 += 4LL;
    if (v4 == 56) {
      return;
    }
  }

  LOBYTE(off_100014940[v4 + 3]) = 1;
}

- (id)getDeviceSerialNumber
{
  v2 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
  if (v2)
  {
    v3 = v2;
    if (![v2 length] && os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AEDC();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AEB0();
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](&OBJC_CLASS___NSString, "string"));
  }

  return v3;
}

- (id)initForChannel:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LTSStatsStore;
  v5 = -[LTSStatsStore init](&v20, "init");
  -[LTSStatsStore setChannelExistsForChannel:](v5, "setChannelExistsForChannel:", v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[LTSStatsStore getfileNameForChannel:](v5, "getfileNameForChannel:", v4));
  fileName = v5->_fileName;
  v5->_fileName = (NSString *)v6;

  if (!v5->_fileName)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AF08();
    }
    goto LABEL_18;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsStore getDeviceSerialNumber](v5, "getDeviceSerialNumber"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[LTSStatsStore readFromFile:](&OBJC_CLASS___LTSStatsStore, "readFromFile:", v5->_fileName));
  lts = v5->_lts;
  v5->_lts = (NSMutableDictionary *)v9;

  v11 = v5->_lts;
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", @"Serial"));
    v13 = v12;
    if (!v12 || [v12 compare:v8])
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000AFC8();
      }
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      v15 = v5->_lts;
      v5->_lts = (NSMutableDictionary *)v14;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lts, "setObject:forKeyedSubscript:", v8, @"Serial");
    }
  }

  else
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v17 = v5->_lts;
    v5->_lts = (NSMutableDictionary *)v16;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_lts, "setObject:forKeyedSubscript:", v8, @"Serial");
  }

  if (!v5->_lts)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000AF68();
    }

LABEL_18:
    v18 = 0LL;
    goto LABEL_12;
  }

  v18 = v5;

LABEL_12:
  return v18;
}

+ (BOOL)writeDictionary:(id)a3 toFile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"/var/db/SoC/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  char v24 = 0;
  [v7 appendString:v6];
  NSFileAttributeKey v27 = NSFileProtectionKey;
  NSFileProtectionType v28 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v23 = 0LL;
  [v8 createDirectoryAtPath:@"/var/db/SoC/" withIntermediateDirectories:0 attributes:v9 error:&v23];
  id v10 = v23;

  objc_super v20 = v5;
  if ([v8 fileExistsAtPath:@"/var/db/SoC/" isDirectory:&v24] && v24)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSOutputStream outputStreamToFileAtPath:append:]( &OBJC_CLASS___NSOutputStream,  "outputStreamToFileAtPath:append:",  v7,  0LL,  v5));
    [v11 open];
    id v22 = 0LL;
    uint64_t v12 = +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v5,  v11,  200LL,  0LL,  &v22);
    id v13 = v22;

    [v11 close];
    if (v12)
    {
      NSFileAttributeKey v25 = NSFileProtectionKey;
      NSFileProtectionType v26 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      id v21 = v13;
      unsigned __int8 v15 = [v8 setAttributes:v14 ofItemAtPath:v7 error:&v21];
      id v16 = v21;

      v17 = (os_log_s *)off_100014B00;
      if ((v15 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
          sub_10000B054((uint64_t)v7, v12, v17);
        }
        BOOL v18 = 1;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
          sub_10000B0C4();
        }
        BOOL v18 = 0;
      }

      id v13 = v16;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000AFF4();
      }
      BOOL v18 = 0;
    }

    id v10 = v13;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B124();
    }
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)readFromFile:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  @"/var/db/SoC/"));
  [v4 appendString:v3];

  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSInputStream inputStreamWithFileAtPath:]( &OBJC_CLASS___NSInputStream,  "inputStreamWithFileAtPath:",  v4));
  [v5 open];
  id v9 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithStream:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithStream:options:format:error:",  v5,  2LL,  0LL,  &v9));
  id v7 = v9;
  [v5 close];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
      sub_10000B1E4();
    }
  }

  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B184();
  }

  return v6;
}

- (id)getLifetimeStats
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lts,  "objectForKeyedSubscript:",  @"LifetimeStats"));
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
    sub_10000B244();
  }
  return v2;
}

- (id)getLifetimeStatsForVersion:(unint64_t)a3
{
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_lts,  "objectForKeyedSubscript:",  @"version"));
  id v6 = v5;
  if (v5 && -[NSString unsignedLongLongValue](v5, "unsignedLongLongValue") == (id)a3)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsStore getLifetimeStats](self, "getLifetimeStats"));
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));
    id v9 = v8;
    if (v7) {
      goto LABEL_11;
    }
  }

  else
  {
    id v10 = (os_log_s *)off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
    {
      fileName = self->_fileName;
      int v15 = 138543874;
      id v16 = v6;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2114;
      objc_super v20 = fileName;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "LTS on-disk version(%{public}@) doesn't match with current version(%lld) for domain %{public}@\n",  (uint8_t *)&v15,  0x20u);
    }

    -[NSMutableDictionary removeObjectForKey:](self->_lts, "removeObjectForKey:", @"version");
    -[NSMutableDictionary removeObjectForKey:](self->_lts, "removeObjectForKey:", @"LifetimeStats");
    v8 = 0LL;
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  v11 = (os_log_s *)off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = self->_fileName;
    int v15 = 138543362;
    id v16 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Returning empty dictionary for lifetime stats of domain %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  id v7 = 0LL;
LABEL_11:

  return v9;
}

- (void)saveLifetimeStats:(id)a3 forVersion:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  -[NSMutableDictionary setObject:forKey:](self->_lts, "setObject:forKey:", v7, @"version");
  -[NSMutableDictionary setObject:forKey:](self->_lts, "setObject:forKey:", v6, @"LifetimeStats");

  +[LTSStatsStore writeDictionary:toFile:]( &OBJC_CLASS___LTSStatsStore,  "writeDictionary:toFile:",  self->_lts,  self->_fileName);
  v8 = (os_log_s *)off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    fileName = self->_fileName;
    int v10 = 138543362;
    v11 = fileName;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Saved lifetime stats of domain %{public}@",  (uint8_t *)&v10,  0xCu);
  }
}

+ (id)getBootUUID
{
  size_t v8 = 37LL;
  if (!qword_100014B38)
  {
    int v2 = sysctlbyname("kern.bootsessionuuid", v9, &v8, 0LL, 0LL);
    if (v2)
    {
      int v7 = v2;
      id v6 = (os_log_s *)off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000B2B4(v7, v6);
      }
    }

    else
    {
      uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v9, 1LL));
      id v4 = (void *)qword_100014B38;
      qword_100014B38 = v3;
    }
  }

  return (id)qword_100014B38;
}

+ (void)saveStatsSinceBoot:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsStore getBootUUID](&OBJC_CLASS___LTSStatsStore, "getBootUUID"));
  if (v5)
  {
    [v4 setObject:v3 forKey:@"PrevStatsSinceBoot"];
    [v4 setObject:v5 forKey:@"bootuuid"];
    +[LTSStatsStore writeDictionary:toFile:]( &OBJC_CLASS___LTSStatsStore,  "writeDictionary:toFile:",  v4,  @"lts.statssinceboot.plist");
  }

  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B324();
  }
}

+ (id)getPrevStatsSinceBoot
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsStore getBootUUID](&OBJC_CLASS___LTSStatsStore, "getBootUUID"));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B324();
    }
    id v5 = 0LL;
    id v3 = 0LL;
    goto LABEL_8;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[LTSStatsStore readFromFile:]( &OBJC_CLASS___LTSStatsStore,  "readFromFile:",  @"lts.statssinceboot.plist"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"bootuuid"]);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B350();
    }
    id v5 = 0LL;
    goto LABEL_8;
  }

  id v5 = v4;
  if (([v4 isEqualToString:v2] & 1) == 0)
  {
    int v7 = (os_log_s *)off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "On-disk stats since boot are with different boot session UUID",  v10,  2u);
    }

    [v3 removeObjectForKey:@"PrevStatsSinceBoot"];
    [v3 removeObjectForKey:@"bootuuid"];
    +[LTSStatsStore writeDictionary:toFile:]( &OBJC_CLASS___LTSStatsStore,  "writeDictionary:toFile:",  v3,  @"lts.statssinceboot.plist");
LABEL_8:
    id v6 = 0LL;
    goto LABEL_9;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"PrevStatsSinceBoot"]);
LABEL_9:
  id v8 = v6;

  return v8;
}

- (NSMutableDictionary)lts
{
  return self->_lts;
}

- (void)setLts:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end