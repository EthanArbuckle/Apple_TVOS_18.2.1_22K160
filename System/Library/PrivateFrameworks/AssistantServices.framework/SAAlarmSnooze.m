@interface SAAlarmSnooze
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SAAlarmSnooze

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
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSnooze alarmIds](self, "alarmIds"));
  id v14 = sub_1000789BC(v12, v13, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceInfo]);
  id v17 = sub_10029CB8C(v10, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SAAlarmSnooze alarmIds](self, "alarmIds"));
  v19 = sub_100078B98(v15, (uint64_t)v17, v18, @"snooze");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  return v20;
}

@end