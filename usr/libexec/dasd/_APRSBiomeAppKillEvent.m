@interface _APRSBiomeAppKillEvent
+ (id)eventWithAppBundleID:(id)a3 pid:(int)a4 exitReason:(unsigned int)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (NSString)description;
- (id)log;
- (id)serialize;
- (int)pid;
- (unsigned)dataVersion;
- (unsigned)exitReason;
- (void)setBundleID:(id)a3;
- (void)setExitReason:(unsigned int)a3;
- (void)setPid:(int)a3;
@end

@implementation _APRSBiomeAppKillEvent

+ (id)eventWithAppBundleID:(id)a3 pid:(int)a4 exitReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class(a1));
  v10 = v9;
  if (v9)
  {
    [v9 setBundleID:v8];
    [v10 setPid:v6];
    [v10 setExitReason:v5];
  }

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v5 = (void *)objc_opt_class(a1);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 eventWithAppBundleID:v6 pid:v10 exitReason:v11]);

  return v7;
}

- (id)log
{
  if (qword_100157998 != -1) {
    dispatch_once(&qword_100157998, &stru_100115F60);
  }
  return (id)qword_1001579A0;
}

- (id)serialize
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSString copy](v2->_bundleID, "copy");
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_APRSBiomeAppKillEvent log](v2, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B3948((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 substringToIndex:60]);
    id v3 = (id)v5;
  }

  if (([v3 getCString:v8 maxLength:60 encoding:4] & 1) == 0)
  {
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[_APRSBiomeAppKillEvent log](v2, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B38D4((uint64_t *)&v2->_bundleID, v6);
    }
  }

  int pid = v2->_pid;
  unsigned int exitReason = v2->_exitReason;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v8,  68LL));
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"App %@ \n pid %d \n exit reason %d",  self->_bundleID,  self->_pid,  self->_exitReason);
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_int pid = a3;
}

- (unsigned)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(unsigned int)a3
{
  self->_unsigned int exitReason = a3;
}

- (void).cxx_destruct
{
}

@end