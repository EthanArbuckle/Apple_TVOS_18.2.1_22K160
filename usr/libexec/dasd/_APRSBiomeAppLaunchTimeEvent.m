@interface _APRSBiomeAppLaunchTimeEvent
+ (id)eventWithAppBundleID:(id)a3 activationTime:(unsigned int)a4 launchReason:(unsigned int)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (id)serialize;
- (unsigned)activationTime;
- (unsigned)dataVersion;
- (unsigned)launchReason;
- (void)setActivationTime:(unsigned int)a3;
- (void)setBundleID:(id)a3;
- (void)setLaunchReason:(unsigned int)a3;
@end

@implementation _APRSBiomeAppLaunchTimeEvent

+ (id)eventWithAppBundleID:(id)a3 activationTime:(unsigned int)a4 launchReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)objc_opt_class(a1));
  v10 = v9;
  if (v9)
  {
    [v9 setBundleID:v8];
    [v10 setActivationTime:v6];
    [v10 setLaunchReason:v5];
  }

  return v10;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    [a3 getBytes:v11 length:68];
    uint64_t v5 = (void *)objc_opt_class(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    uint64_t v7 = v12;
    uint64_t v8 = v13;
  }

  else
  {
    [a3 getBytes:v11 length:68];
    uint64_t v5 = (void *)objc_opt_class(a1);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    uint64_t v7 = v12;
    uint64_t v8 = v13;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 eventWithAppBundleID:v6 activationTime:v7 launchReason:v8]);

  return v9;
}

- (id)serialize
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSString copy](v2->_bundleID, "copy");
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    v4 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B380C((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 substringToIndex:60]);

    id v3 = (id)v5;
  }

  if (([v3 getCString:v8 maxLength:60 encoding:4] & 1) == 0)
  {
    uint64_t v6 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B3794((uint64_t *)&v2->_bundleID, v6);
    }
  }

  unsigned int activationTime = v2->_activationTime;
  char launchReason = v2->_launchReason;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v8,  68LL));
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unsigned)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(unsigned int)a3
{
  self->_unsigned int activationTime = a3;
}

- (unsigned)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(unsigned int)a3
{
  self->_char launchReason = a3;
}

- (void).cxx_destruct
{
}

@end