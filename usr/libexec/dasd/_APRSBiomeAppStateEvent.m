@interface _APRSBiomeAppStateEvent
+ (id)eventWithAppBundleID:(id)a3 appState:(int)a4;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)bundleID;
- (id)serialize;
- (int)appState;
- (unsigned)dataVersion;
- (void)setAppState:(int)a3;
- (void)setBundleID:(id)a3;
@end

@implementation _APRSBiomeAppStateEvent

+ (id)eventWithAppBundleID:(id)a3 appState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS____APRSBiomeAppStateEvent);
  v7 = v6;
  if (v6)
  {
    -[_APRSBiomeAppStateEvent setBundleID:](v6, "setBundleID:", v5);
    -[_APRSBiomeAppStateEvent setAppState:](v7, "setAppState:", v4);
  }

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = (void *)objc_opt_class(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 eventWithAppBundleID:v6 appState:v10]);

  return v7;
}

- (id)serialize
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = -[NSString copy](v2->_bundleID, "copy");
  if ((unint64_t)[v3 length] >= 0x3D)
  {
    uint64_t v4 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000B380C((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    }
    uint64_t v5 = objc_claimAutoreleasedReturnValue([v3 substringToIndex:60]);

    id v3 = (id)v5;
  }

  if (([v3 getCString:v8 maxLength:60 encoding:4] & 1) == 0)
  {
    v6 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000B3794((uint64_t *)&v2->_bundleID, v6);
    }
  }

  int appState = v2->_appState;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v8,  64LL));
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

- (int)appState
{
  return self->_appState;
}

- (void)setAppState:(int)a3
{
  self->_int appState = a3;
}

- (void).cxx_destruct
{
}

@end