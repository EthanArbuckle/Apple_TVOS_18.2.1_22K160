@interface AXRDeviceRemoteActionHelper
+ (id)sharedInstance;
- (float)_getCurrentVolume;
- (id)_init;
- (void)_setVolumeBy:(float)a3;
- (void)performAction:(id)a3;
@end

@implementation AXRDeviceRemoteActionHelper

+ (id)sharedInstance
{
  if (qword_10000CD00 != -1) {
    dispatch_once(&qword_10000CD00, &stru_1000086A0);
  }
  return (id)qword_10000CCF8;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXRDeviceRemoteActionHelper;
  v2 = -[AXRDeviceRemoteActionHelper init](&v6, "init");
  if ((AXDeviceIsAudioAccessory(v2, v3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
    [v4 warm];
  }

  return v2;
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ax_remote_daemon_log(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "performing action: %@", (uint8_t *)&v17, 0xCu);
  }

  if (([v4 isEqualToString:AXRDeviceRemoteActionNone] & 1) == 0)
  {
    if ([v4 isEqualToString:AXRDeviceRemoteActionHome])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 activateHomeButton];
LABEL_51:

      goto LABEL_52;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionAppSwitcher])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 toggleAppSwitcher];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionNotificationCenter])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 toggleNotificationCenter];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionControlCenter])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 toggleControlCenter];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSiri])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 activateSiri];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionTVMenu])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 pressTVMenuButton];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionTVSelect])
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXPISystemActionHelper sharedInstance](&OBJC_CLASS___AXPISystemActionHelper, "sharedInstance"));
      [v8 pressTVSelectButton];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandActivate])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSwitchControlServer server](&OBJC_CLASS___AXSwitchControlServer, "server"));
      v8 = v9;
      uint64_t v10 = 1LL;
LABEL_50:
      [v9 triggerCommand:v10];
      goto LABEL_51;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMenu])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSwitchControlServer server](&OBJC_CLASS___AXSwitchControlServer, "server"));
      v8 = v9;
      uint64_t v10 = 2LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandStartScanning])
    {
      v11 = &OBJC_CLASS___AXSwitchControlServer;
LABEL_24:
      v9 = (void *)objc_claimAutoreleasedReturnValue([v11 server]);
      v8 = v9;
      uint64_t v10 = 3LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandSelect])
    {
      v12 = &OBJC_CLASS___AXSwitchControlServer;
LABEL_27:
      v9 = (void *)objc_claimAutoreleasedReturnValue([v12 server]);
      v8 = v9;
      uint64_t v10 = 4LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMoveNext])
    {
      v13 = &OBJC_CLASS___AXSwitchControlServer;
LABEL_30:
      v9 = (void *)objc_claimAutoreleasedReturnValue([v13 server]);
      v8 = v9;
      uint64_t v10 = 5LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandMovePrevious])
    {
      v14 = &OBJC_CLASS___AXSwitchControlServer;
LABEL_33:
      v9 = (void *)objc_claimAutoreleasedReturnValue([v14 server]);
      v8 = v9;
      uint64_t v10 = 6LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionSwitchControlCommandStopScanning])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSwitchControlServer server](&OBJC_CLASS___AXSwitchControlServer, "server"));
      v8 = v9;
      uint64_t v10 = 7LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandSimpleTap])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 19LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextElement])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 9LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousElement])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 8LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextRotorOption])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 14LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousRotorOption])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 15LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandNextRotorItem])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 17LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandPreviousRotorItem])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXVoiceOverServer server](&OBJC_CLASS___AXVoiceOverServer, "server"));
      v8 = v9;
      uint64_t v10 = 16LL;
      goto LABEL_50;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollUpPage])
    {
      v11 = &OBJC_CLASS___AXVoiceOverServer;
      goto LABEL_24;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollDownPage])
    {
      v12 = &OBJC_CLASS___AXVoiceOverServer;
      goto LABEL_27;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollLeftPage])
    {
      v13 = &OBJC_CLASS___AXVoiceOverServer;
      goto LABEL_30;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionVoiceOverCommandScrollRightPage])
    {
      v14 = &OBJC_CLASS___AXVoiceOverServer;
      goto LABEL_33;
    }

    if ([v4 isEqualToString:AXRDeviceRemoteActionMediaPlayPause])
    {
      uint64_t v15 = 2LL;
    }

    else if ([v4 isEqualToString:AXRDeviceRemoteActionMediaNextTrack])
    {
      uint64_t v15 = 4LL;
    }

    else
    {
      if (![v4 isEqualToString:AXRDeviceRemoteActionMediaPreviousTrack])
      {
        if ([v4 isEqualToString:AXRDeviceRemoteActionMediaVolumeUp])
        {
          LODWORD(v16) = 1028443341;
        }

        else
        {
          LODWORD(v16) = -1119040307;
        }

        -[AXRDeviceRemoteActionHelper _setVolumeBy:](self, "_setVolumeBy:", v16);
        goto LABEL_52;
      }

      uint64_t v15 = 5LL;
    }

    sub_100004F34(v15);
  }

- (float)_getCurrentVolume
{
  id v2 = [sub_10000504C() sharedAVSystemController];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  float v6 = 0.0;
  [v3 getVolume:&v6 forCategory:@"MediaPlayback"];
  float v4 = v6;

  return v4;
}

- (void)_setVolumeBy:(float)a3
{
  float v6 = v5;
  -[AXRDeviceRemoteActionHelper _getCurrentVolume](self, "_getCurrentVolume");
  double v8 = fmin((float)(v7 + a3), 1.0);
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  float v9 = v8;
  if (vabds_f32(v6, v9) >= 0.00000011921)
  {
    id v10 = [sub_10000504C() sharedAVSystemController];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v10);
    *(float *)&double v11 = v9;
    [v12 setVolumeTo:@"MediaPlayback" forCategory:v11];
  }

@end