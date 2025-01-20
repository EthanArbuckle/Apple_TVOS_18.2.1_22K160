@interface OTTapToRadarActualAdapter
- (OTTapToRadarActualAdapter)init;
- (void)postHomePodLostTrustTTR:(id)a3;
@end

@implementation OTTapToRadarActualAdapter

- (OTTapToRadarActualAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OTTapToRadarActualAdapter;
  return -[OTTapToRadarActualAdapter init](&v3, "init");
}

- (void)postHomePodLostTrustTTR:(id)a3
{
  id v3 = a3;
  if (!objc_opt_class(&OBJC_CLASS___TapToRadarService, v4))
  {
    v12 = sub_10001267C("octagon-ttr");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v17 = 0;
    v13 = "Trust lost, but TTR service not available";
    v14 = (uint8_t *)&v17;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    goto LABEL_11;
  }

  char v5 = _os_feature_enabled_impl("Security", "TTRTrustLossOnHomePod");
  v6 = sub_10001267C("octagon-ttr");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0)
  {
    if (!v8) {
      goto LABEL_11;
    }
    *(_WORD *)v16 = 0;
    v13 = "Trust lost, not posting TTR due to feature flag";
    v14 = v16;
    goto LABEL_10;
  }

  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trust lost, posting TTR", buf, 2u);
  }

  v7 = (os_log_s *)objc_alloc_init(&OBJC_CLASS___RadarDraft);
  id v9 = [[RadarComponent alloc] initWithName:@"Security" version:@"iCloud Keychain" identifier:606179];
  -[os_log_s setComponent:](v7, "setComponent:", v9);

  -[os_log_s setIsUserInitiated:](v7, "setIsUserInitiated:", 0LL);
  -[os_log_s setReproducibility:](v7, "setReproducibility:", 6LL);
  -[os_log_s setRemoteDeviceClasses:](v7, "setRemoteDeviceClasses:", 63LL);
  -[os_log_s setRemoteDeviceSelections:](v7, "setRemoteDeviceSelections:", 1LL);
  -[os_log_s setTitle:](v7, "setTitle:", @"Lost CDP trust");
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"HomePod unexpectedly lost CDP trust (please do not file this radar if you performed Reset Protected Data on another device, or otherwise intended to cause CDP trust loss on this HomePod). To disable this prompt for testing, turn off the Security/TTRTrustLossOnHomePod feature flag on the HomePod.\n\n%@",  v3));
  -[os_log_s setProblemDescription:](v7, "setProblemDescription:", v10);

  -[os_log_s setClassification:](v7, "setClassification:", 7LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](&OBJC_CLASS___TapToRadarService, "shared"));
  [v11 createDraft:v7 forProcessNamed:@"CDP" withDisplayReason:@"HomePod lost CDP/Manatee access" completionHandler:&stru_100283E10];

LABEL_11:
}

@end