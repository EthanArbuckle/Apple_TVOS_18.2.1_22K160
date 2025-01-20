@interface _DASActivity
+ (_DASActivity)activityWithDASBGSystemTask:(id)a3 withClientOffset:(double)a4;
- (void)linkToBGSystemTask:(id)a3;
@end

@implementation _DASActivity

+ (_DASActivity)activityWithDASBGSystemTask:(id)a3 withClientOffset:(double)a4
{
  id v6 = a3;
  id v7 = [v6 priority];
  if ((unint64_t)v7 < 2)
  {
    v8 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
  }

  else if (v7 == (id)2)
  {
    v8 = (uint64_t *)&_DASSchedulingPriorityUtility;
  }

  else
  {
    if (v7 != (id)3) {
      goto LABEL_8;
    }
    v8 = (uint64_t *)&_DASSchedulingPriorityUserInitiated;
  }

  uint64_t v4 = *v8;
LABEL_8:
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 eligibleTime]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 deadlineTime]);
  if (a4 == 0.0) {
    goto LABEL_15;
  }
  if (a4 == 64000000.0)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));

    id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    v9 = (void *)v11;
LABEL_13:

    v10 = v12;
    goto LABEL_15;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dateByAddingTimeInterval:a4]);

  [v10 timeIntervalSinceDate:v14];
  if (v15 < 0.0)
  {
    id v12 = v14;
    v9 = v12;
    goto LABEL_13;
  }

  v9 = v14;
LABEL_15:
  v16 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  objc_msgSend(v6, "expected_duration");
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:]( &OBJC_CLASS____DASActivity,  "activityWithName:priority:duration:startingAfter:startingBefore:",  v16,  v4,  (unint64_t)v17,  v9,  v10));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "related_applications"));
  [v18 setRelatedApplications:v19];

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 serviceName]);
  [v18 setServiceName:v20];

  v21 = (void *)objc_claimAutoreleasedReturnValue([v6 rateLimitConfigurationName]);
  [v18 setRateLimitConfigurationName:v21];

  objc_msgSend(v18, "setRunOnAppForeground:", objc_msgSend(v6, "runOnAppForeground"));
  objc_msgSend(v18, "setRequestsApplicationLaunch:", objc_msgSend(v6, "requestsApplicationLaunch"));
  objc_msgSend(v18, "setBudgeted:", objc_msgSend(v6, "duet_power_budgeted"));
  objc_msgSend(v18, "setBeforeApplicationLaunch:", objc_msgSend(v6, "beforeApplicationLaunch"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "group_name"));

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "group_name"));
    [v18 setGroupName:v23];
  }

  if ([v6 type] == (id)2)
  {
    [v6 interval];
    objc_msgSend(v18, "setInterval:");
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v6 featureCodes]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v6 featureCodes]);
    [v18 setFeatureCodes:v25];
  }

  if (objc_msgSend(v6, "requires_protection_class") == (id)1)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
  }

  else if (objc_msgSend(v6, "requires_protection_class") == (id)2)
  {
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](&OBJC_CLASS____DASFileProtection, "completeUnlessOpen"));
  }

  else
  {
    if (objc_msgSend(v6, "requires_protection_class") != (id)3) {
      goto LABEL_28;
    }
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUntilFirstUserAuthentication]( &OBJC_CLASS____DASFileProtection,  "completeUntilFirstUserAuthentication"));
  }

  v27 = (void *)v26;
  [v18 setFileProtection:v26];

LABEL_28:
  objc_msgSend(v18, "setRequiresBuddyComplete:", objc_msgSend(v6, "requires_buddy_complete"));
  objc_msgSend(v18, "setShouldWakeDevice:", objc_msgSend(v6, "shouldWakeDevice"));
  objc_msgSend(v18, "setDarkWakeEligible:", objc_msgSend(v6, "power_nap"));
  objc_msgSend(v18, "setBeforeDaysFirstActivity:", objc_msgSend(v6, "app_refresh"));
  objc_msgSend(v18, "setRequiresSignificantUserInactivity:", objc_msgSend(v6, "requires_significant_user_inactivity"));
  objc_msgSend(v18, "setRequiresDeviceInactivity:", objc_msgSend(v6, "requiresUserInactivity"));
  objc_msgSend(v18, "setPreventDeviceSleep:", objc_msgSend(v6, "prevents_device_sleep"));
  objc_msgSend(v18, "setRequiresPlugin:", objc_msgSend(v6, "requiresExternalPower"));
  objc_msgSend(v18, "setTriggersRestart:", objc_msgSend(v6, "may_reboot_device"));
  if (objc_msgSend(v6, "resource_intensive"))
  {
    if ([v6 resources])
    {
      objc_msgSend(v18, "setCpuIntensive:", (unint64_t)objc_msgSend(v6, "resources") & 1);
      objc_msgSend(v18, "setMemoryIntensive:", ((unint64_t)objc_msgSend(v6, "resources") >> 1) & 1);
      objc_msgSend(v18, "setDiskIntensive:", ((unint64_t)objc_msgSend(v6, "resources") >> 2) & 1);
      objc_msgSend(v18, "setAneIntensive:", ((unint64_t)objc_msgSend(v6, "resources") >> 3) & 1);
      objc_msgSend(v18, "setGpuIntensive:", ((unint64_t)objc_msgSend(v6, "resources") >> 4) & 1);
    }

    else
    {
      [v18 setCpuIntensive:1];
    }
  }

  objc_msgSend(v18, "setRequiresNetwork:", objc_msgSend(v6, "requires_network_connectivity"));
  objc_msgSend(v18, "setRequiresInexpensiveNetworking:", objc_msgSend(v6, "requires_inexpensive_network"));
  objc_msgSend(v18, "setRequiresUnconstrainedNetworking:", objc_msgSend(v6, "requires_unconstrained_network"));
  if (objc_msgSend(v6, "expected_network_download_size_bytes")) {
    objc_msgSend(v18, "setDownloadSize:", (uint64_t)objc_msgSend(v6, "expected_network_download_size_bytes") / 1024);
  }
  if (objc_msgSend(v6, "expected_network_upload_size_bytes")) {
    objc_msgSend(v18, "setUploadSize:", (uint64_t)objc_msgSend(v6, "expected_network_upload_size_bytes") / 1024);
  }
  objc_msgSend(v18, "setUserRequestedBackupTask:", objc_msgSend(v6, "user_requested_backup_task"));
  if ([v6 targetDevice] == (id)1)
  {
    uint64_t v28 = 1LL;
  }

  else if ([v6 targetDevice] == (id)2)
  {
    uint64_t v28 = 2LL;
  }

  else if ([v6 targetDevice] == (id)3)
  {
    uint64_t v28 = 3LL;
  }

  else
  {
    uint64_t v28 = 0LL;
  }

  [v18 setTargetDevice:v28];
  v29 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteDevice]);
  [v18 setRemoteDevice:v29];

  objc_msgSend(v18, "setRequiresRemoteDeviceWake:", objc_msgSend(v6, "requiresRemoteDeviceWake"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "produced_result_identifiers"));
  [v18 setProducedResultIdentifiers:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue([v6 dependencies]);
  [v18 setDependencies:v31];

  v32 = (void *)objc_claimAutoreleasedReturnValue([v6 diskVolume]);
  [v18 setDiskVolume:v32];

  if ([v6 type] == (id)3)
  {
    v33 = (void *)objc_opt_new(&OBJC_CLASS____DASFastPass);
    [v18 setFastPass:v33];

    v34 = (void *)objc_claimAutoreleasedReturnValue([v6 processingTaskIdentifiers]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v18 fastPass]);
    [v35 setProcessingTaskIdentifiers:v34];

    id v36 = [v6 semanticVersion];
    v37 = (void *)objc_claimAutoreleasedReturnValue([v18 fastPass]);
    [v37 setSemanticVersion:v36];

    if (objc_msgSend(v6, "resource_intensive"))
    {
      [v18 setGpuIntensive:0];
      [v18 setAneIntensive:0];
      [v18 setDiskIntensive:0];
      [v18 setMemoryIntensive:0];
      [v18 setCpuIntensive:0];
      [v18 setRequiresDeviceInactivity:0];
    }

    [v18 setPreventDeviceSleep:1];
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v18 userInfo]);
  v39 = (NSMutableDictionary *)[v38 mutableCopy];

  if (!v39) {
    v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "network_endpoint"));

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "network_endpoint"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v41));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v42, kNWEndpointKey);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "network_parameters"));
    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "network_parameters"));
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NWParameters parametersWithCParameters:]( &OBJC_CLASS___NWParameters,  "parametersWithCParameters:",  v44));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v45, kNWParametersKey);
    }
  }

  if ([v6 resources])
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue([v6 resourcesDescription]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v46, _DASResourcesKey);
  }

  if ([v6 overrideRateLimiting])
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 overrideRateLimiting]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v47,  _DASOverrideRateLimitingKey);
  }

  if ([v6 magneticInterferenceSensitivity])
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 magneticInterferenceSensitivity]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v48,  _DASCTSMagneticInterferenceSensitivityKey);
  }

  if ([v6 mailFetch])
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 mailFetch]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v49, _DASCTSMailFetchKey);
  }

  if ([v6 bypassPeakPower])
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 bypassPeakPower]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v50,  _DASCTSBypassPeakPowerPressureKey);
  }

  if ([v6 bypassBatteryAging])
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 bypassBatteryAging]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v51,  _DASCTSBypassBatteryAgingProtectionKey);
  }

  if ([v6 requiresMinimumBatteryLevel])
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 requiresMinimumBatteryLevel]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v52,  _DASCTSMinBatteryLevelKey);
  }

  if ([v6 requiresMinimumDataBudgetPercentage])
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( NSNumber,  "numberWithDouble:",  (double)(unint64_t)[v6 requiresMinimumDataBudgetPercentage] / 100.0));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v53,  _DASCTSMinDataBudgetPercentRemainingKey);
  }

  if ([v6 blockRebootActivitiesForSU])
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 blockRebootActivitiesForSU]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v54,  _DASCTSBlockRebootActivitiesForSUKey);
  }

  if ([v6 useStatisticalModelForTriggersRestart])
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 useStatisticalModelForTriggersRestart]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v39,  "setObject:forKeyedSubscript:",  v55,  _DASCTSUseStatisticalModelForRestartTasksKey);
  }

  if (-[NSMutableDictionary count](v39, "count")) {
    [v18 setUserInfo:v39];
  }

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[_DASBGSystemTaskHelper activityQueue](&OBJC_CLASS____DASBGSystemTaskHelper, "activityQueue"));
  [v18 setHandlerQueue:v56];

  [v18 setDelayedStart:1];
  [v18 linkToBGSystemTask:v6];
  id v57 = v18;

  return (_DASActivity *)v57;
}

- (void)linkToBGSystemTask:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000493B0;
  v7[3] = &unk_100115FF8;
  objc_copyWeak(&v8, &location);
  -[_DASActivity setStartHandler:](self, "setStartHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100049504;
  v5[3] = &unk_100115FF8;
  objc_copyWeak(&v6, &location);
  -[_DASActivity setSuspendHandler:](self, "setSuspendHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

@end