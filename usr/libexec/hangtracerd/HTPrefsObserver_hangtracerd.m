@interface HTPrefsObserver_hangtracerd
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HTPrefsObserver_hangtracerd

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if (off_10005AE38 == a6)
  {
    id v9 = a3;
    v10 = NSStringFromSelector("memoryLoggingIntervalSec");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    unsigned int v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSKeyValueChangeOldKey]);
      unsigned int v14 = [v13 unsignedIntValue];

      v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
      unsigned int v16 = [v15 unsignedIntValue];

      if (v14 != v16)
      {
        sub_100008670();
        id v17 = sub_1000233A4();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](&OBJC_CLASS___HTPrefs, "sharedPrefs"));
          v20[0] = 67109376;
          v20[1] = v14;
          __int16 v21 = 1024;
          unsigned int v22 = [v19 memoryLoggingIntervalSec];
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "memoryLoggingInterval changed %u -> %u",  (uint8_t *)v20,  0xEu);
        }
      }
    }
  }
}

@end