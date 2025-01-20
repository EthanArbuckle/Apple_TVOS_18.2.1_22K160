@interface SDAState
+ (id)loadFromFileAtPath:(id)a3;
- (NSMutableDictionary)lastEventIdPerVol;
- (NSMutableDictionary)lastEventTimePerVol;
- (NSNumber)sdaVersion;
- (NSString)pathToDisk;
- (void)saveToFile;
- (void)setLastEventIdPerVol:(id)a3;
- (void)setLastEventTimePerVol:(id)a3;
- (void)setPathToDisk:(id)a3;
- (void)setSdaVersion:(id)a3;
- (void)updateEventId:(unint64_t)a3 andDate:(id)a4 forVolPath:(id)a5;
@end

@implementation SDAState

+ (id)loadFromFileAtPath:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = objc_opt_new(&OBJC_CLASS___SDAState);
  v5 = @"/var/db/spaceattribution";
  if (v3) {
    v5 = v3;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v5,  @"SpeculativeDownload.db"));

  -[SDAState setPathToDisk:](v4, "setPathToDisk:", v6);
  id v31 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfFile:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfFile:options:error:",  v6,  0LL,  &v31));
  id v8 = v31;
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    v13 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v10,  v11,  v12,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v30 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v14,  v7,  &v30));
    id v16 = v30;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 objectForKey:@"SdaVersion"]);
    v18 = (os_log_s *)v17;
    if (!v17 || (uint64_t v17 = (uint64_t)[(id)v17 isEqualToNumber:&off_10004FD68], (v17 & 1) == 0))
    {
      uint64_t v19 = SALog(v17);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "New SDA version!", buf, 2u);
      }

      v15 = 0LL;
    }
  }

  else
  {
    uint64_t v21 = SALog(v8);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100032BAC();
    }
    v15 = 0LL;
    id v16 = v9;
  }

  v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"LastEventIdPerVol"]);
  if (!v22)
  {
    uint64_t v23 = SALog(0LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "creating dictionary for kLastEventIdPerVol",  buf,  2u);
    }

    v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[SDAState setLastEventIdPerVol:](v4, "setLastEventIdPerVol:", v22);
  v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"LastEventTimePerVol"]);
  if (!v25)
  {
    uint64_t v26 = SALog(0LL);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "creating dictionary for kLastEventTimePerVol",  buf,  2u);
    }

    v25 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }

  -[SDAState setLastEventTimePerVol:](v4, "setLastEventTimePerVol:", v25);

  return v4;
}

- (void)updateEventId:(unint64_t)a3 andDate:(id)a4 forVolPath:(id)a5
{
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAState lastEventIdPerVol](self, "lastEventIdPerVol"));
  [v8 setObject:v9 forKey:v7];

  -[SDAState saveToFile](self, "saveToFile");
}

- (void)saveToFile
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v24 = 0LL;
  unsigned __int8 v4 = [v3 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v24];
  id v5 = v24;
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObjectsAndKeys:",  &off_10004FD68,  @"SdaVersion",  self->_lastEventTimePerVol,  @"LastEventIdPerVol",  self->_lastEventIdPerVol,  @"LastEventTimePerVol",  0LL));
    id v23 = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v7,  0LL,  &v23));
    id v9 = v23;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAState pathToDisk](self, "pathToDisk"));
    unsigned __int8 v11 = [v8 writeToFile:v10 atomically:1];

    if ((v11 & 1) == 0)
    {
      uint64_t v13 = SALog(v12);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100032C0C(self, v14);
      }
    }

    v6 = v9;
  }

  else
  {
    uint64_t v15 = SALog(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003008C(v7, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (NSNumber)sdaVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSdaVersion:(id)a3
{
}

- (NSMutableDictionary)lastEventTimePerVol
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setLastEventTimePerVol:(id)a3
{
}

- (NSMutableDictionary)lastEventIdPerVol
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLastEventIdPerVol:(id)a3
{
}

- (NSString)pathToDisk
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setPathToDisk:(id)a3
{
}

- (void).cxx_destruct
{
}

@end