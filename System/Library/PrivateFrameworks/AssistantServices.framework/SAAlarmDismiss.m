@interface SAAlarmDismiss
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)_ad_alarmResponseForResponse:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3;
@end

@implementation SAAlarmDismiss

- (BOOL)ad_requiresDeviceContext
{
  return 1;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 1;
}

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  id v11 = sub_10029CB20(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmDismiss alarmIds](self, "alarmIds"));
  id v14 = sub_1000789BC(v12, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceInfo]);
  id v17 = sub_10029CB8C(v10, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmDismiss alarmIds](self, "alarmIds"));
  v19 = sub_100078B98(v15, (uint64_t)v17, v18, @"dismiss");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

- (void)_ad_getAlarmRequestRepresentationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init(&OBJC_CLASS___AFDismissAlarmRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmDismiss alarmIds](self, "alarmIds"));
  -[AFDismissAlarmRequest setAlarmURLs:](v5, "setAlarmURLs:", v6);

  BOOL v7 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmDismiss alarmIds](self, "alarmIds"));
    int v10 = 136315394;
    id v11 = "-[SAAlarmDismiss(ADAlarmTransformer) _ad_getAlarmRequestRepresentationWithCompletionHandler:]";
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Asking to dismiss alarms with identifiers %@",  (uint8_t *)&v10,  0x16u);
  }

  v4[2](v4, v5);
}

- (id)_ad_alarmResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (Class *)&OBJC_CLASS___SACommandSucceeded_ptr;
  if ((isKindOfClass & 1) == 0) {
    v6 = (Class *)&OBJC_CLASS___SACommandFailed_ptr;
  }
  return objc_alloc_init(*v6);
}

@end