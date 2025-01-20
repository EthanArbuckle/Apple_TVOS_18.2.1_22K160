@interface SHFUPluginPreloaded
- (SHFUPluginPreloaded)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
@end

@implementation SHFUPluginPreloaded

- (SHFUPluginPreloaded)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SHFUPluginPreloaded;
  return -[SHFUPlugin initWithDeviceClass:delegate:info:options:deviceProperties:]( &v8,  "initWithDeviceClass:delegate:info:options:deviceProperties:",  a3,  a4,  a5,  a6,  a7);
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  id v6 = a3;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100017EB0((uint64_t)v6, a4, v7);
  }

  id v40 = 0LL;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin getPreloadedFWVersions:](self, "getPreloadedFWVersions:", &v40));
  v9 = (NSError *)v40;
  -[SHFUPlugin setLatestFirmwareVersions:](self, "setLatestFirmwareVersions:", v8);

  if (v9)
  {
    id v10 = 0LL;
LABEL_6:
    uint64_t v18 = 0LL;
    goto LABEL_7;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
  id v13 = [v12 BOOLValue];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin options](self, "options"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
  id v39 = 0LL;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v11,  v13,  v14,  v16,  v17,  &v39));
  v9 = (NSError *)v39;

  if (v9) {
    goto LABEL_6;
  }
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v10 = v10;
  id v24 = [v10 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v36;
    while (2)
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v10);
        }
        v28 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (-[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v28))
        {
          v9 = 0LL;
          uint64_t v18 = 1LL;
          goto LABEL_28;
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
        unsigned __int8 v30 = [v28 hardwareVersionSupportedBy:v29];

        if ((v30 & 1) == 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Device has HW revision ID %u which does not match FW files",  [v28 hardwareVersion]));
          v32 = objc_alloc(&OBJC_CLASS___NSError);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
          NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
          v52 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
          v9 = -[NSError initWithDomain:code:userInfo:](v32, "initWithDomain:code:userInfo:", v33, 44LL, v34);

          uint64_t v18 = 0LL;
          goto LABEL_28;
        }
      }

      id v25 = [v10 countByEnumeratingWithState:&v35 objects:v53 count:16];
      uint64_t v18 = 0LL;
      v9 = 0LL;
      if (v25) {
        continue;
      }
      break;
    }
  }

  else
  {
    uint64_t v18 = 0LL;
    v9 = 0LL;
  }

@end