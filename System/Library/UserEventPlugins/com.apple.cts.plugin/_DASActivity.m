@interface _DASActivity
+ (_DASActivity)activityWithCTSActivity:(id)a3;
- (void)linkToCTSActivity:(id)a3;
@end

@implementation _DASActivity

+ (_DASActivity)activityWithCTSActivity:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 priority];
  v5 = (uint64_t *)&_DASSchedulingPriorityUtility;
  if (v4 != 1) {
    v5 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
  }
  uint64_t v6 = *v5;
  sub_30F4((uint64_t)[v3 eligibleTime]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  sub_30F4((uint64_t)[v3 deadlineTime]);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:]( _DASActivity,  "activityWithName:priority:duration:startingAfter:startingBefore:",  v9,  v6,  objc_msgSend(v3, "expected_duration"),  v7,  v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 serviceName]);
  [v10 setServiceName:v11];

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundle_id"));
  [v10 setBundleId:v12];

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "related_applications"));
  [v10 setRelatedApplications:v13];

  objc_msgSend(v10, "setRunOnAppForeground:", objc_msgSend(v3, "runOnAppForeground"));
  objc_msgSend(v10, "setBudgeted:", objc_msgSend(v3, "duet_power_budgeted"));
  if (objc_msgSend(v3, "requires_protection_class") == 1)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](&OBJC_CLASS____DASFileProtection, "complete"));
  }

  else if (objc_msgSend(v3, "requires_protection_class") == 2)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[_DASFileProtection completeUnlessOpen](&OBJC_CLASS____DASFileProtection, "completeUnlessOpen"));
  }

  else
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[_DASFileProtection completeUntilFirstUserAuthentication]( &OBJC_CLASS____DASFileProtection,  "completeUntilFirstUserAuthentication"));
  }

  v15 = (void *)v14;
  [v10 setFileProtection:v14];

LABEL_12:
  objc_msgSend(v10, "setRequiresBuddyComplete:", objc_msgSend(v3, "requires_buddy_complete"));
  objc_msgSend(v10, "setDarkWakeEligible:", objc_msgSend(v3, "power_nap"));
  objc_msgSend(v10, "setBeforeDaysFirstActivity:", objc_msgSend(v3, "app_refresh"));
  objc_msgSend(v10, "setRequiresDeviceInactivity:", objc_msgSend(v3, "requires_screen_sleep"));
  objc_msgSend(v10, "setRequiresSignificantUserInactivity:", objc_msgSend(v3, "requires_significant_user_inactivity"));
  objc_msgSend(v10, "setPreventDeviceSleep:", objc_msgSend(v3, "prevents_device_sleep"));
  objc_msgSend(v10, "setRequiresPlugin:", objc_msgSend(v3, "allow_battery") ^ 1);
  objc_msgSend(v10, "setTriggersRestart:", objc_msgSend(v3, "may_reboot_device"));
  objc_msgSend(v10, "setMemoryIntensive:", objc_msgSend(v3, "memory_intensive"));
  objc_msgSend(v10, "setCpuIntensive:", objc_msgSend(v3, "cpu_intensive"));
  objc_msgSend(v10, "setDiskIntensive:", objc_msgSend(v3, "disk_intensive"));
  objc_msgSend(v10, "setRequiresNetwork:", objc_msgSend(v3, "requires_network_connectivity"));
  objc_msgSend(v10, "setRequiresInexpensiveNetworking:", objc_msgSend(v3, "requires_inexpensive_network"));
  if (objc_msgSend(v3, "expected_network_download_size_bytes")) {
    objc_msgSend(v10, "setDownloadSize:", (uint64_t)objc_msgSend(v3, "expected_network_download_size_bytes") / 1024);
  }
  if (objc_msgSend(v3, "expected_network_upload_size_bytes")) {
    objc_msgSend(v10, "setUploadSize:", (uint64_t)objc_msgSend(v3, "expected_network_upload_size_bytes") / 1024);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "network_endpoint"));

  if (v16)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "network_endpoint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](&OBJC_CLASS___NWEndpoint, "endpointWithCEndpoint:", v18));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, kNWEndpointKey);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "network_parameters"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "network_parameters"));
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NWParameters parametersWithCParameters:]( &OBJC_CLASS___NWParameters,  "parametersWithCParameters:",  v21));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v22, kNWParametersKey);
    }

    [v10 setUserInfo:v17];
  }

  objc_msgSend(v10, "setUserRequestedBackupTask:", objc_msgSend(v3, "user_requested_backup_task"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "das_data"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "das_data"));
    [v10 setConstraintsWithXPCDictionary:v24];
  }

  [v10 setHandlerQueue:qword_15390];
  [v10 setDelayedStart:1];
  [v10 linkToCTSActivity:v3];
  objc_msgSend(v3, "setDas_eligible:", 0);
  objc_msgSend(v3, "setDas_started:", 0);

  return (_DASActivity *)v10;
}

- (void)linkToCTSActivity:(id)a3
{
  id v4 = a3;
  id location = 0LL;
  objc_initWeak(&location, v4);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_4E98;
  v7[3] = &unk_107C0;
  objc_copyWeak(&v8, &location);
  -[_DASActivity setStartHandler:](self, "setStartHandler:", v7);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_5018;
  v5[3] = &unk_107C0;
  objc_copyWeak(&v6, &location);
  -[_DASActivity setSuspendHandler:](self, "setSuspendHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

@end