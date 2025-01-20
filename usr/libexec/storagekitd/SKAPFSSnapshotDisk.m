@interface SKAPFSSnapshotDisk
+ (BOOL)diskIsSnapshot:(id)a3;
+ (BOOL)isiOSRootSnapshotWithDiskDescription:(id)a3;
- (BOOL)_cacheInfo;
- (BOOL)_supportsRecaching;
@end

@implementation SKAPFSSnapshotDisk

+ (BOOL)diskIsSnapshot:(id)a3
{
  id v3 = a3;
  v4 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v3);

  if (v4) {
    BOOL v5 = IOObjectConformsTo(-[SKIOObject ioObj](v4, "ioObj"), "AppleAPFSSnapshot") != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_cacheInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk daDisk](v2, "daDisk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  BOOL v5 = (__DASession *)[v4 diskArbSession];

  CFDictionaryRef v6 = DADiskCopyDescription(v3);
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v6,  "objectForKeyedSubscript:",  kDADiskDescriptionVolumePathKey));
    unsigned int v9 = [(id)objc_opt_class(v2) isiOSRootSnapshotWithDiskDescription:v7];
    char v10 = v9;
    if (v9)
    {
      -[SKAPFSSnapshotDisk setSealStatus:](v2, "setSealStatus:", 0LL);
      if (!v8)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
        [v32 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100044B08];

        id v33 = sub_10000E2BC();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          v75.f_bsize = 136315138;
          *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_FAULT,  "%s: Unmounted root snapshot",  (uint8_t *)&v75,  0xCu);
        }

- (BOOL)_supportsRecaching
{
  return -[SKAPFSSnapshotDisk isIOSRootSnapshot](self, "isIOSRootSnapshot") ^ 1;
}

+ (BOOL)isiOSRootSnapshotWithDiskDescription:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kDADiskDescriptionMediaKindKey]);

  if (v4)
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    CFDictionaryRef v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey]);
    CFDictionaryRef v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
      unsigned __int8 v5 = [v8 isEqualToString:@"file:///"];
    }

    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

@end