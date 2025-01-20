@interface TVSSTapToRadarController
- (void)createRadarDraft;
@end

@implementation TVSSTapToRadarController

- (void)createRadarDraft
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = 0LL;
  id v5 = objc_alloc_init((Class)off_100220240());
  [v5 setIsUserInitiated:1];
  [v5 setRemoteDeviceSelections:66];
  id v2 = [off_100220248() shared];
  id v4 = v6[0];
  [v2 createDraft:v5 forProcessNamed:0 withDisplayReason:0 error:&v4];
  objc_storeStrong(v6, v4);

  if (v6[0])
  {
    os_log_t oslog = (os_log_t)TapToRadarLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000D28C((uint64_t)v7, (uint64_t)v6[0]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Failed to create radar draft with error %@",  v7,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(v6, 0LL);
}

@end