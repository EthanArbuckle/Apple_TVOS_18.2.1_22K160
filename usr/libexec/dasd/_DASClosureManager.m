@interface _DASClosureManager
- (BOOL)isDeletableApp:(id)a3;
- (BOOL)isUserInstalledApp:(id)a3;
- (_DASClosureManager)init;
- (_DASCollectTelemetryActivityContext)collectTelemetryActivityContext;
- (id)appsLaunchedSinceBoot;
- (id)appsToExclude;
- (id)mostRecentBootTime;
- (id)recentlyInstalledAppsLimitedTo:(int)a3 withStore:(id)a4;
- (void)buildClosuresForApps:(id)a3 withTask:(id)a4 onBoot:(BOOL)a5;
- (void)buildClosuresForMaximum:(int)a3 withMinimumLikelihood:(double)a4 recentInstallCount:(int)a5 task:(id)a6 onBoot:(BOOL)a7;
- (void)buildClosuresOnBootWithTask:(id)a3;
- (void)buildClosuresOpportunisticWithTask:(id)a3;
- (void)collectClosureTelemetryWithTask:(id)a3;
- (void)collectLaunchDataWithBootBatchTimestamp:(double)a3 opportunisticBatchTimestamp:(double)a4 completion:(id)a5;
- (void)collectPrewarmingDataWithCompletion:(id)a3;
- (void)initializeLogs;
- (void)setCollectTelemetryActivityContext:(id)a3;
@end

@implementation _DASClosureManager

- (_DASClosureManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____DASClosureManager;
  v2 = -[_DASClosureManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[_DASClosureManager initializeLogs](v2, "initializeLogs");
    -[_DASClosureManager registerForActivities](v3, "registerForActivities");
    v4 = objc_opt_new(&OBJC_CLASS____DASCollectTelemetryActivityContext);
    collectTelemetryActivityContext = v3->_collectTelemetryActivityContext;
    v3->_collectTelemetryActivityContext = v4;
  }

  return v3;
}

- (void)initializeLogs
{
  if (!qword_100157AF0)
  {
    os_log_t v2 = os_log_create("com.apple.dasd.signpost", "DuetClosuresTelemetry");
    v3 = (void *)qword_100157AF0;
    qword_100157AF0 = (uint64_t)v2;
  }

  if (!qword_100157AF8)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( +[_DASDaemonLogger logForCategory:]( &OBJC_CLASS____DASDaemonLogger,  "logForCategory:",  @"closureManager"));
    v5 = (void *)qword_100157AF8;
    qword_100157AF8 = v4;
  }

- (BOOL)isUserInstalledApp:(id)a3
{
  return 0;
}

- (BOOL)isDeletableApp:(id)a3
{
  return 0;
}

- (id)appsToExclude
{
  return &__NSArray0__struct;
}

- (void)buildClosuresForApps:(id)a3 withTask:(id)a4 onBoot:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  os_signpost_id_t v9 = os_signpost_id_generate((os_log_t)qword_100157AF0);
  v10 = (os_log_s *)(id)qword_100157AF0;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@","]);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v5;
    LOWORD(v33) = 2114;
    *(void *)((char *)&v33 + 2) = v12;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  v9,  "DuetClosuresPrewarm",  "onBoot:%d, bundleIDs:%{public}@",  buf,  0x12u);
  }

  *(void *)buf = 0LL;
  *(void *)&__int128 v33 = buf;
  *((void *)&v33 + 1) = 0x2020000000LL;
  char v34 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100055B64;
  v28[3] = &unk_100115300;
  v28[4] = buf;
  [v8 setExpirationHandler:v28];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v13 = v7;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
LABEL_6:
    uint64_t v16 = 0LL;
    while (1)
    {
      if (*(void *)v25 != v15) {
        objc_enumerationMutation(v13);
      }
      if (*(_BYTE *)(v33 + 24)) {
        break;
      }
      uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
      v18 = (os_log_s *)qword_100157AF8;
      if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v29 = 138412290;
        uint64_t v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Building closure for '%@'", v29, 0xCu);
      }

      if (v14 == (id)++v16)
      {
        id v14 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v14) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  if (*(_BYTE *)(v33 + 24))
  {
    id v23 = 0LL;
    unsigned __int8 v19 = [v8 setTaskExpiredWithRetryAfter:&v23 error:0.0];
    id v20 = v23;
    if ((v19 & 1) == 0)
    {
      v21 = (os_log_s *)(id)qword_100157AF0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
        sub_1000B4D24(v22, (uint64_t)v20, (uint64_t)v29);
      }

      [v8 setTaskCompleted];
    }
  }

  else
  {
    [v8 setTaskCompleted];
  }

  _Block_object_dispose(buf, 8);
}

- (id)recentlyInstalledAppsLimitedTo:(int)a3 withStore:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DKAppInstallMetadataKey isInstall](&OBJC_CLASS____DKAppInstallMetadataKey, "isInstall"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForObjectsWithMetadataKey:andIntegerValue:]( &OBJC_CLASS____DKQuery,  "predicateForObjectsWithMetadataKey:andIntegerValue:",  v6,  1LL));

  id v8 = (void *)v7;
  os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -172800.0));
  uint64_t v10 = objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartDateAfter:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartDateAfter:",  v9));

  v11 = (void *)v10;
  v51[0] = v8;
  v51[1] = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v12));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"startDate",  0LL));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInstallStream](&OBJC_CLASS____DKSystemEventStreams, "appInstallStream"));
  v50 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
  v49 = v14;
  uint64_t v17 = (void *)v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v49, 1LL));
  unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DKEventQuery eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:]( &OBJC_CLASS____DKEventQuery,  "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:",  v17,  v16,  0LL,  a3,  v18));

  id v47 = 0LL;
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 executeQuery:v19 error:&v47]);
  id v21 = v47;
  if (v21)
  {
    v22 = (os_log_s *)qword_100157AF8;
    if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4D6C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    id v30 = &__NSArray0__struct;
  }

  else
  {
    v39 = v17;
    v40 = (void *)v10;
    v41 = v8;
    id v42 = v5;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v32 = v20;
    id v33 = [v32 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (i = 0LL; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v43 + 1) + 8 * (void)i) stringValue]);
          [v31 addObject:v37];
        }

        id v34 = [v32 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }

      while (v34);
    }

    id v30 = [v31 copy];
    id v8 = v41;
    id v5 = v42;
    uint64_t v17 = v39;
    v11 = v40;
  }

  return v30;
}

- (id)appsLaunchedSinceBoot
{
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager mostRecentBootTime](self, "mostRecentBootTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[_DKApplicationMetadataKey extensionHostIdentifier]( &OBJC_CLASS____DKApplicationMetadataKey,  "extensionHostIdentifier"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForObjectsWithMetadataKey:]( &OBJC_CLASS____DKQuery,  "predicateForObjectsWithMetadataKey:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v5));

  id v20 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));

  os_signpost_id_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v2 timeIntervalSinceDate:v9];
  if (v10 > 0.0)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v2 dateByAddingTimeInterval:3600.0]);

    os_signpost_id_t v9 = (void *)v11;
  }

  v12 = -[NSDateInterval initWithStartDate:endDate:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:endDate:",  v2,  v9);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appUsageStream](&OBJC_CLASS____DKSystemEventStreams, "appUsageStream"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[_DKHistogramQuery histogramQueryForStream:interval:withPredicate:]( &OBJC_CLASS____DKHistogramQuery,  "histogramQueryForStream:interval:withPredicate:",  v13,  v12,  v8));

  uint64_t v19 = 0LL;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v3 executeQuery:v14 error:&v19]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 countDictionary]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 allKeys]);

  return v17;
}

- (void)buildClosuresForMaximum:(int)a3 withMinimumLikelihood:(double)a4 recentInstallCount:(int)a5 task:(id)a6 onBoot:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  char v67 = 0;
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472LL;
  v63[2] = sub_100056774;
  v63[3] = &unk_100115300;
  v63[4] = &v64;
  id v56 = a6;
  [v56 setExpirationHandler:v63];
  BOOL v50 = v7;
  unsigned int v51 = a5;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DKApplicationMetadataKey extensionHostIdentifier]( &OBJC_CLASS____DKApplicationMetadataKey,  "extensionHostIdentifier"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForObjectsWithMetadataKey:]( &OBJC_CLASS____DKQuery,  "predicateForObjectsWithMetadataKey:",  v12));
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v13));

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -1209600.0));
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStartDateAfter:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStartDateAfter:",  v14));

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager appsLaunchedSinceBoot](self, "appsLaunchedSinceBoot"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager appsToExclude](self, "appsToExclude"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 arrayByAddingObjectsFromArray:v16]);

  if ([v17 count])
  {
    v18 = (os_log_s *)qword_100157AF8;
    if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Excluding apps: %@", buf, 0xCu);
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsWithStringValueInValues:]( &OBJC_CLASS____DKQuery,  "predicateForEventsWithStringValueInValues:",  v17));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate notPredicateWithSubpredicate:]( &OBJC_CLASS___NSCompoundPredicate,  "notPredicateWithSubpredicate:",  v19));
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL));
  }

  v70[0] = v54;
  v70[1] = v53;
  v70[2] = v20;
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 3LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v21));

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](&OBJC_CLASS____DKSystemEventStreams, "appInFocusStream"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[_DKPredictionQuery topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:]( &OBJC_CLASS____DKPredictionQuery,  "topNPredictionQueryForStream:withPredicate:withTopN:withMinLikelihood:",  v23,  v22,  (int)((double)a3 * 1.5),  a4));

  [v24 setReadMetadata:1];
  [v24 setSlotDuration:86400];
  [v24 setMinimumDaysOfHistory:1];
  id v62 = 0LL;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v55 executeQuery:v24 error:&v62]);
  id v26 = v62;
  if (v26)
  {
    uint64_t v27 = (os_log_s *)qword_100157AF8;
    if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_ERROR)) {
      sub_1000B4DA0(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    [v56 setTaskCompleted];
  }

  else
  {
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v25 valueAtDate:v35]);

    v36 = (os_log_s *)qword_100157AF8;
    if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v52;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Elements are: %@", buf, 0xCu);
    }

    if (*((_BYTE *)v65 + 24))
    {
      id v61 = 0LL;
      unsigned __int8 v37 = [v56 setTaskExpiredWithRetryAfter:&v61 error:0.0];
      id v49 = v61;
      if ((v37 & 1) == 0)
      {
        v38 = (os_log_s *)(id)qword_100157AF0;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue([v56 identifier]);
          sub_1000B4D24(v39, (uint64_t)v49, (uint64_t)buf);
        }

        [v56 setTaskCompleted];
      }
    }

    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue([v52 allKeys]);
      id v49 = [v40 mutableCopy];

      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472LL;
      v59[2] = sub_100056788;
      v59[3] = &unk_100116280;
      id v60 = v52;
      [v49 sortUsingComparator:v59];
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472LL;
      v58[2] = sub_100056818;
      v58[3] = &unk_1001162A8;
      v58[4] = self;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v58));
      id v47 = (void *)objc_claimAutoreleasedReturnValue([v49 filteredArrayUsingPredicate:v41]);

      if ((unint64_t)[v47 count] > a3)
      {
        uint64_t v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "subarrayWithRange:", 0, a3));

        id v47 = (void *)v42;
      }

      __int128 v43 = (void *)objc_claimAutoreleasedReturnValue( -[_DASClosureManager recentlyInstalledAppsLimitedTo:withStore:]( self,  "recentlyInstalledAppsLimitedTo:withStore:",  v51,  v55,  v47));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_100056824;
      v57[3] = &unk_1001162A8;
      v57[4] = self;
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v57));
      __int128 v45 = (void *)objc_claimAutoreleasedReturnValue([v43 filteredArrayUsingPredicate:v44]);

      __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v45 arrayByAddingObjectsFromArray:v48]);
      -[_DASClosureManager buildClosuresForApps:withTask:onBoot:]( self,  "buildClosuresForApps:withTask:onBoot:",  v46,  v56,  v50);
    }
  }

  _Block_object_dispose(&v64, 8);
}

- (void)buildClosuresOnBootWithTask:(id)a3
{
}

- (id)mostRecentBootTime
{
  *(void *)BOOL v7 = 0x1500000001LL;
  size_t v6 = 16LL;
  if (sysctl(v7, 2u, &v4, &v6, 0LL, 0LL) == -1) {
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  }
  else {
    os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)v5 / 1000000.0 + (double)v4));
  }
  return v2;
}

- (void)buildClosuresOpportunisticWithTask:(id)a3
{
}

- (void)collectClosureTelemetryWithTask:(id)a3
{
  id v4 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASClosureManager mostRecentBootTime](self, "mostRecentBootTime"));
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -86400.0));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 laterDate:v6]);

  -[_DASCollectTelemetryActivityContext updateWithtask:prewarmingStartDate:launchStartDate:]( self->_collectTelemetryActivityContext,  "updateWithtask:prewarmingStartDate:launchStartDate:",  v4,  v5,  v7);
  id v8 = (os_log_s *)qword_100157AF8;
  if (os_log_type_enabled((os_log_t)qword_100157AF8, OS_LOG_TYPE_DEFAULT))
  {
    collectTelemetryActivityContext = self->_collectTelemetryActivityContext;
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = collectTelemetryActivityContext;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Running telemetry collection using context: %@",  buf,  0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100056AB4;
  v11[3] = &unk_1001150D0;
  v11[4] = self;
  [v4 setExpirationHandler:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100056AC4;
  v10[3] = &unk_100116320;
  v10[4] = self;
  -[_DASClosureManager collectPrewarmingDataWithCompletion:](self, "collectPrewarmingDataWithCompletion:", v10);
}

- (void)collectLaunchDataWithBootBatchTimestamp:(double)a3 opportunisticBatchTimestamp:(double)a4 completion:(id)a5
{
}

- (void)collectPrewarmingDataWithCompletion:(id)a3
{
}

- (_DASCollectTelemetryActivityContext)collectTelemetryActivityContext
{
  return self->_collectTelemetryActivityContext;
}

- (void)setCollectTelemetryActivityContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end