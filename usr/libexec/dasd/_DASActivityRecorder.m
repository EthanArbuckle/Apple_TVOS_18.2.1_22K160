@interface _DASActivityRecorder
+ (id)predicateForActivityWithName:(id)a3;
+ (id)predicateForActivityWithSubmitDate:(id)a3;
+ (id)predicateForLaunchActivities;
+ (id)predicateForPendingActivities;
+ (id)predicateForStartedActivities;
+ (id)predicateForUniqueRecord:(id)a3;
- (id)createNewActivity:(id)a3;
- (id)createOrUpdateActivity:(id)a3 context:(id)a4;
- (id)entityName;
- (id)fetchActivitiesUsingPredicate:(id)a3 context:(id)a4;
- (id)fetchActivity:(id)a3 context:(id)a4;
- (id)fetchAllActivities:(id)a3;
- (id)getActivityFromManagedObject:(id)a3;
- (void)copyActivity:(id)a3 toManagedObject:(id)a4;
- (void)deleteActivites:(id)a3 moc:(id)a4;
- (void)deleteActivitiesIfRequired:(id)a3;
- (void)deleteActivity:(id)a3 context:(id)a4;
- (void)deleteOldActivities:(id)a3;
- (void)updateActivity:(id)a3 value:(int)a4 context:(id)a5;
- (void)updateActivityCanceled:(id)a3 context:(id)a4;
- (void)updateActivityCompleted:(id)a3 context:(id)a4;
- (void)updateActivityStarted:(id)a3 context:(id)a4;
@end

@implementation _DASActivityRecorder

- (id)entityName
{
  return @"Activity";
}

+ (id)predicateForActivityWithName:(id)a3
{
  return +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"name == %@", a3);
}

+ (id)predicateForActivityWithSubmitDate:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:-2.0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dateByAddingTimeInterval:2.0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"submitDate > %@ AND submitDate < %@",  v5,  v6));
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }

  return v7;
}

+ (id)predicateForUniqueRecord:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForActivityWithName:]( &OBJC_CLASS____DASActivityRecorder,  "predicateForActivityWithName:",  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 submitDate]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForActivityWithSubmitDate:]( &OBJC_CLASS____DASActivityRecorder,  "predicateForActivityWithSubmitDate:",  v6));

  v11[0] = v7;
  v11[1] = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));

  return v9;
}

+ (id)predicateForPendingActivities
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"currentState == %d",  0LL);
}

+ (id)predicateForStartedActivities
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"currentState == %d",  1LL);
}

+ (id)predicateForLaunchActivities
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestsApplicationLaunch == %d",  1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"requestsExtensionLaunch == %d",  1LL));
  v7[0] = v2;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v4));

  return v5;
}

- (id)createNewActivity:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v5,  v4));

  return v6;
}

- (id)createOrUpdateActivity:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForUniqueRecord:]( &OBJC_CLASS____DASActivityRecorder,  "predicateForUniqueRecord:",  v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    uint64_t v15 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v8 error:&v15]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);

    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder createNewActivity:](self, "createNewActivity:", v7));
    }
    -[_DASActivityRecorder copyActivity:toManagedObject:](self, "copyActivity:toManagedObject:", v6, v13);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)fetchActivitiesUsingPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  v6));
  -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

  -[NSFetchRequest setPredicate:](v8, "setPredicate:", v7);
  -[NSFetchRequest setFetchBatchSize:](v8, "setFetchBatchSize:", 512LL);
  -[NSFetchRequest setFetchLimit:](v8, "setFetchLimit:", 512LL);
  uint64_t v13 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v8 error:&v13]);

  return v11;
}

- (id)fetchActivity:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForUniqueRecord:]( &OBJC_CLASS____DASActivityRecorder,  "predicateForUniqueRecord:",  a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[_DASActivityRecorder fetchActivitiesUsingPredicate:context:]( self,  "fetchActivitiesUsingPredicate:context:",  v7,  v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 lastObject]);
  return v9;
}

- (id)fetchAllActivities:(id)a3
{
  return -[_DASActivityRecorder fetchActivitiesUsingPredicate:context:]( self,  "fetchActivitiesUsingPredicate:context:",  0LL,  a3);
}

- (id)getActivityFromManagedObject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new(&OBJC_CLASS____DASActivity);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  -[_DASActivity setName:](v4, "setName:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 startAfter]);
  -[_DASActivity setStartAfter:](v4, "setStartAfter:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 startBefore]);
  -[_DASActivity setStartBefore:](v4, "setStartBefore:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 submitDate]);
  -[_DASActivity setSubmitDate:](v4, "setSubmitDate:", v8);

  -[_DASActivity setSchedulingPriority:](v4, "setSchedulingPriority:", (int)[v3 schedulingPriority]);
  [v3 predictedOptimalScore];
  -[_DASActivity setPredictedOptimalScore:](v4, "setPredictedOptimalScore:");
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 predictedOptimalStartDate]);
  -[_DASActivity setPredictedOptimalStartDate:](v4, "setPredictedOptimalStartDate:", v9);

  -[_DASActivity setSuspendable:](v4, "setSuspendable:", [v3 suspendable]);
  -[_DASActivity setTargetDevice:](v4, "setTargetDevice:", (int)[v3 targetDevice]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteDevice]);
  -[_DASActivity setRemoteDevice:](v4, "setRemoteDevice:", v10);

  -[_DASActivity setRequiresRemoteDeviceWake:]( v4,  "setRequiresRemoteDeviceWake:",  [v3 requiresRemoteDeviceWake]);
  -[_DASActivity setCancelAfterDeadline:](v4, "setCancelAfterDeadline:", [v3 cancelAfterDeadline]);
  -[_DASActivity setDuration:](v4, "setDuration:", [v3 duration]);
  -[_DASActivity setTransferSize:](v4, "setTransferSize:", [v3 transferSize]);
  -[_DASActivity setTriggersRestart:](v4, "setTriggersRestart:", [v3 triggersRestart]);
  -[_DASActivity setRequiresPlugin:](v4, "setRequiresPlugin:", [v3 requiresPlugin]);
  -[_DASActivity setRequiresNetwork:](v4, "setRequiresNetwork:", [v3 requiresNetwork]);
  -[_DASActivity setRequiresDeviceInactivity:]( v4,  "setRequiresDeviceInactivity:",  [v3 requiresDeviceInactivity]);
  -[_DASActivity setRequiresInexpensiveNetworking:]( v4,  "setRequiresInexpensiveNetworking:",  [v3 requiresInexpensiveNetworking]);
  -[_DASActivity setRequestsApplicationLaunch:]( v4,  "setRequestsApplicationLaunch:",  [v3 requestsApplicationLaunch]);
  -[_DASActivity setRequestsExtensionLaunch:]( v4,  "setRequestsExtensionLaunch:",  [v3 requestsExtensionLaunch]);
  -[_DASActivity setSupportsAnyApplication:]( v4,  "setSupportsAnyApplication:",  [v3 supportsAnyApplication]);
  -[_DASActivity setCpuIntensive:](v4, "setCpuIntensive:", [v3 cpuIntensive]);
  -[_DASActivity setDiskIntensive:](v4, "setDiskIntensive:", [v3 diskIntensive]);
  -[_DASActivity setMemoryIntensive:](v4, "setMemoryIntensive:", [v3 memoryIntensive]);
  -[_DASActivity setBeforeUserIsActive:](v4, "setBeforeUserIsActive:", [v3 beforeUserIsActive]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleID]);
  -[_DASActivity setBundleId:](v4, "setBundleId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 rateLimitConfigurationName]);
  -[_DASActivity setRateLimitConfigurationName:](v4, "setRateLimitConfigurationName:", v12);

  -[_DASActivity setIsUpload:](v4, "setIsUpload:", [v3 isUpload]);
  -[_DASActivity setBudgeted:](v4, "setBudgeted:", [v3 budgeted]);
  -[_DASActivity setRelevancy:](v4, "setRelevancy:", [v3 relevancy]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v3 launchReason]);
  -[_DASActivity setLaunchReason:](v4, "setLaunchReason:", v13);

  v14 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v15 = objc_claimAutoreleasedReturnValue([v3 uuid]);
  v16 = -[NSUUID initWithUUIDBytes:](v14, "initWithUUIDBytes:", [v15 bytes]);
  -[_DASActivity setUuid:](v4, "setUuid:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 extensionIdentifier]);
  -[_DASActivity setExtensionIdentifier:](v4, "setExtensionIdentifier:", v17);

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
  v19 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v18,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v3 relatedApplications]);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v20,  v22,  0LL));
    -[_DASActivity setRelatedApplications:](v4, "setRelatedApplications:", v23);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 schedulerRecommendedApplications]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v3 schedulerRecommendedApplications]);
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v20,  v25,  0LL));
    -[_DASActivity setSchedulerRecommendedApplications:](v4, "setSchedulerRecommendedApplications:", v26);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivity validClassesForUserInfoSerialization]( &OBJC_CLASS____DASActivity,  "validClassesForUserInfoSerialization"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v28,  v29,  0LL));
    -[_DASActivity setUserInfo:](v4, "setUserInfo:", v30);
  }

  return v4;
}

- (void)copyActivity:(id)a3 toManagedObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  [v6 setName:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 startAfter]);
  [v6 setStartAfter:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 startBefore]);
  [v6 setStartBefore:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 submitDate]);
  [v6 setSubmitDate:v10];

  objc_msgSend(v6, "setSchedulingPriority:", (__int16)objc_msgSend(v5, "schedulingPriority"));
  [v5 predictedOptimalScore];
  objc_msgSend(v6, "setPredictedOptimalScore:");
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 predictedOptimalStartDate]);
  [v6 setPredictedOptimalStartDate:v11];

  objc_msgSend(v6, "setSuspendable:", objc_msgSend(v5, "suspendable"));
  objc_msgSend(v6, "setTargetDevice:", (__int16)objc_msgSend(v5, "targetDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteDevice]);
  [v6 setRemoteDevice:v12];

  objc_msgSend(v6, "setRequiresRemoteDeviceWake:", objc_msgSend(v5, "requiresRemoteDeviceWake"));
  objc_msgSend(v6, "setCancelAfterDeadline:", objc_msgSend(v5, "cancelAfterDeadline"));
  objc_msgSend(v6, "setDuration:", objc_msgSend(v5, "duration"));
  objc_msgSend(v6, "setTransferSize:", objc_msgSend(v5, "transferSize"));
  objc_msgSend(v6, "setTriggersRestart:", objc_msgSend(v5, "triggersRestart"));
  objc_msgSend(v6, "setRequiresPlugin:", objc_msgSend(v5, "requiresPlugin"));
  objc_msgSend(v6, "setRequiresNetwork:", objc_msgSend(v5, "requiresNetwork"));
  objc_msgSend(v6, "setRequiresDeviceInactivity:", objc_msgSend(v5, "requiresDeviceInactivity"));
  objc_msgSend(v6, "setRequiresInexpensiveNetworking:", objc_msgSend(v5, "requiresInexpensiveNetworking"));
  objc_msgSend(v6, "setRequestsApplicationLaunch:", objc_msgSend(v5, "requestsApplicationLaunch"));
  objc_msgSend(v6, "setRequestsExtensionLaunch:", objc_msgSend(v5, "requestsExtensionLaunch"));
  objc_msgSend(v6, "setSupportsAnyApplication:", objc_msgSend(v5, "supportsAnyApplication"));
  objc_msgSend(v6, "setCpuIntensive:", objc_msgSend(v5, "cpuIntensive"));
  objc_msgSend(v6, "setDiskIntensive:", objc_msgSend(v5, "diskIntensive"));
  objc_msgSend(v6, "setMemoryIntensive:", objc_msgSend(v5, "memoryIntensive"));
  objc_msgSend(v6, "setBeforeUserIsActive:", objc_msgSend(v5, "beforeUserIsActive"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleId]);
  [v6 setBundleID:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 rateLimitConfigurationName]);
  [v6 setRateLimitConfigurationName:v14];

  objc_msgSend(v6, "setIsUpload:", objc_msgSend(v5, "isUpload"));
  objc_msgSend(v6, "setBudgeted:", objc_msgSend(v5, "budgeted"));
  objc_msgSend(v6, "setRelevancy:", objc_msgSend(v5, "relevancy"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 launchReason]);
  [v6 setLaunchReason:v15];

  [v6 setCurrentState:0];
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 extensionIdentifier]);
  [v6 setExtensionIdentifier:v16];

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
  [v17 getUUIDBytes:v28];

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v28, 16LL));
  [v6 setUuid:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 relatedApplications]);
  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 relatedApplications]);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v20,  1LL,  0LL));
    [v6 setRelatedApplications:v21];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v5 schedulerRecommendedApplications]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v5 schedulerRecommendedApplications]);
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v23,  1LL,  0LL));
    [v6 setSchedulerRecommendedApplications:v24];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v26,  1LL,  0LL));
    [v6 setUserInfo:v27];
  }
}

- (void)updateActivity:(id)a3 value:(int)a4 context:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v10 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder fetchActivity:context:](self, "fetchActivity:context:"));
  v8 = v7;
  if (v7)
  {
    [v7 setCurrentState:v5];
    if ((v5 - 2) < 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v8 setCompletedDate:v9];
LABEL_6:

      goto LABEL_7;
    }

    if ((_DWORD)v5 == 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v10 startDate]);
      [v8 setStartDate:v9];
      goto LABEL_6;
    }
  }

- (void)updateActivityStarted:(id)a3 context:(id)a4
{
}

- (void)updateActivityCompleted:(id)a3 context:(id)a4
{
}

- (void)updateActivityCanceled:(id)a3 context:(id)a4
{
}

- (void)deleteActivity:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v8,  v6));
  -[NSFetchRequest setEntity:](v11, "setEntity:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityRecorder predicateForUniqueRecord:]( &OBJC_CLASS____DASActivityRecorder,  "predicateForUniqueRecord:",  v7));
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", v10);

  -[_DASActivityRecorder deleteActivites:moc:](self, "deleteActivites:moc:", v11, v6);
}

- (void)deleteActivites:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 setFetchBatchSize:512];
  id v7 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v6);

  uint64_t v9 = 0LL;
  id v8 = [v5 executeRequest:v7 error:&v9];
}

- (void)deleteOldActivities:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", -432000.0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"currentState <= %@ AND startBefore <= %@",  &off_100121AC8,  v9));
  id v6 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v7,  v4));
  -[NSFetchRequest setEntity:](v6, "setEntity:", v8);

  -[NSFetchRequest setPredicate:](v6, "setPredicate:", v5);
  -[_DASActivityRecorder deleteActivites:moc:](self, "deleteActivites:moc:", v6, v4);
}

- (void)deleteActivitiesIfRequired:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSFetchRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASActivityRecorder entityName](self, "entityName"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v6,  v4));
  -[NSFetchRequest setEntity:](v5, "setEntity:", v7);

  uint64_t v8 = 0LL;
}

@end