@interface SATimerDismiss
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)_ad_timerRequestRepresentation;
- (id)_ad_timerResponseForResponse:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SATimerDismiss

- (id)_ad_timerRequestRepresentation
{
  return objc_alloc_init(&OBJC_CLASS___AFDismissTimerRequest);
}

- (id)_ad_timerResponseForResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___AFSiriRequestSucceededResponse);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0) {
    v6 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
  }
  else {
    v6 = 0LL;
  }
  return v6;
}

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
  id v9 = a5;
  id v10 = sub_10029CB20(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerDismiss timerIds](self, "timerIds"));
  id v13 = v11;
  id v14 = v12;
  *(void *)v38 = _NSConcreteStackBlock;
  *(void *)&v38[8] = 3221225472LL;
  *(void *)&v38[16] = sub_100078274;
  v39 = &unk_1004EF1A8;
  *(void *)v40 = v14;
  id v15 = [v13 indexOfObjectPassingTest:v38];
  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
    v16 = 0LL;
  }
  else {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v15]);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 deviceInfo]);
  id v18 = sub_10029CB8C(v9, v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATimerDismiss timerIds](self, "timerIds"));
  id v20 = v16;
  v21 = v20;
  if (v20)
  {
    if ([v20 fromLocalDevice])
    {
      v22 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v38 = 136315650;
        *(void *)&v38[4] = "ADDeviceRouterResultForDeviceContextWithFiringTimer";
        *(_WORD *)&v38[12] = 2112;
        *(void *)&v38[14] = @"dismiss";
        *(_WORD *)&v38[22] = 2112;
        v39 = v19;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s #hal %@ local timers: %@",  v38,  0x20u);
      }

      v23 = 0LL;
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceInfo]);
      id v26 = sub_10016563C(v25, 0LL);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

      v28 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v33 = v28;
        uint64_t CompactDescription = AFPeerInfoGetCompactDescription(v27);
        v35 = (void *)objc_claimAutoreleasedReturnValue(CompactDescription);
        uint64_t Name = AFDeviceProximityGetName(v18);
        v37 = (void *)objc_claimAutoreleasedReturnValue(Name);
        *(_DWORD *)v38 = 136316162;
        *(void *)&v38[4] = "ADDeviceRouterResultForDeviceContextWithFiringTimer";
        *(_WORD *)&v38[12] = 2112;
        *(void *)&v38[14] = @"dismiss";
        *(_WORD *)&v38[22] = 2112;
        v39 = v19;
        *(_WORD *)v40 = 2112;
        *(void *)&v40[2] = v35;
        __int16 v41 = 2112;
        v42 = v37;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s #hal %@ timers: %@ on %@, proximity: %@",  v38,  0x34u);
      }

      v23 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v27);
    }

    v29 = objc_alloc(&OBJC_CLASS___ADDeviceRouterResult);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v21 contextCollectorSource]);
    v24 = -[ADDeviceRouterResult initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:]( v29,  "initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:",  v23,  v30,  v18,  v31,  0LL);
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

@end