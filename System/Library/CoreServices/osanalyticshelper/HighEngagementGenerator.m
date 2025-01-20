@interface HighEngagementGenerator
+ (id)_DHIDto95thPercentile;
+ (id)_DHIDtoCategoryDisplayNameMap;
+ (id)_OverrideIfNeeded:(id)a3 givenCategory:(id)a4;
+ (id)generateLastDayAppUsage;
+ (id)generateTopThreeCategories:(id)a3;
+ (id)getAppUsageArray:(id)a3 to:(id)a4;
+ (id)processDailyUsage:(id)a3 from:(id)a4 to:(id)a5;
+ (void)createBiomeFeed;
+ (void)generateTotalByCategory:(id)a3 completionHandler:(id)a4;
+ (void)setAlarm:(int64_t)a3;
@end

@implementation HighEngagementGenerator

+ (id)_DHIDtoCategoryDisplayNameMap
{
  if (qword_100026210 != -1) {
    dispatch_once(&qword_100026210, &stru_100020B10);
  }
  return (id)qword_100026208;
}

+ (id)_DHIDto95thPercentile
{
  if (qword_100026220 != -1) {
    dispatch_once(&qword_100026220, &stru_100020B30);
  }
  return (id)qword_100026218;
}

+ (id)_OverrideIfNeeded:(id)a3 givenCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_100026230 != -1) {
    dispatch_once(&qword_100026230, &stru_100020B50);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue([(id)qword_100026228 objectForKeyedSubscript:v5]);
  if (!v7) {
    id v7 = v6;
  }
  if (v7 == (id)CTCategoryIdentifierSystemUnblockable
    || v7 == (id)CTCategoryIdentifierSystemBlockable
    || v7 == (id)CTCategoryIdentifierSystemHidden)
  {

    id v7 = 0LL;
  }

  return v7;
}

+ (void)setAlarm:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", @"UTC"));
  [v5 setTimeZone:v6];

  if (a3 == 1)
  {
    id v7 = objc_opt_new(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setDay:](v7, "setDay:", 1LL);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 dateByAddingComponents:v7 toDate:v4 options:0]);

    v4 = (void *)v8;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 components:28 fromDate:v4]);
  [v9 setHour:23];
  [v9 setMinute:45];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromComponents:v9]);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Setting Alarm for %@",  (uint8_t *)&v19,  0xCu);
  }

  [v10 timeIntervalSince1970];
  double v12 = v11;
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_date(v13, "Date", (uint64_t)(ceil(v12) * 1000000000.0));
  xpc_dictionary_set_BOOL(v13, "ShouldWake", 0);
  xpc_set_event("com.apple.alarm", [@"com.apple.osanalytics.highengagementtimer" UTF8String], v13);
  [v9 setHour:23];
  [v9 setMinute:55];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v5 dateFromComponents:v9]);

  v15 = v14;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Setting Hard Alarm for %@",  (uint8_t *)&v19,  0xCu);
  }

  [v14 timeIntervalSince1970];
  double v17 = v16;
  xpc_object_t v18 = xpc_dictionary_create(0LL, 0LL, 0LL);

  xpc_dictionary_set_date(v18, "Date", (uint64_t)(ceil(v17) * 1000000000.0));
  xpc_dictionary_set_BOOL(v18, "ShouldWake", 1);
  xpc_set_event( "com.apple.alarm",  [@"com.apple.osanalytics.hardhighengagementtimer" UTF8String],  v18);
}

+ (void)createBiomeFeed
{
  if (objc_opt_class(&OBJC_CLASS___BMStream, a2) && objc_opt_class(&OBJC_CLASS___BMSource, v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([a1 generateLastDayAppUsage]);
    if (v4)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100006AE4;
      v14[3] = &unk_100020B98;
      v14[4] = a1;
      [a1 generateTotalByCategory:v4 completionHandler:v14];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_object_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Usage Data is Nil",  v13,  2u);
    }
  }

  else
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_1000151D4(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

+ (id)generateTopThreeCategories:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100007798;
  v11[3] = &unk_100020BC0;
  id v5 = v3;
  id v12 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:v11]);
  id v7 = [v6 count];
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, v8));

  return v9;
}

+ (void)generateTotalByCategory:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSMutableDictionary *, void *))a4;
  uint64_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Entering generateTotalByCategory",  buf,  2u);
  }

  if (!objc_opt_class(&OBJC_CLASS___CTCategories, v9))
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v27 = @"Categories framework not available.";
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"osanalyticshelper",  0LL,  v10));

    v7[2](v7, v8, v11);
  }

  if (v6)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CTCategories sharedCategories](&OBJC_CLASS___CTCategories, "sharedCategories"));
    xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    double v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    xpc_object_t v18 = sub_100007B48;
    int v19 = &unk_100020BE8;
    id v23 = a1;
    v14 = v8;
    v20 = v14;
    id v21 = v6;
    v22 = v7;
    [v12 categoriesForBundleIDs:v13 completionHandler:&v16];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[NSMutableDictionary count](v14, "count", v16, v17, v18, v19, v20, v21)));
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: generateTotalByCategory outside completion handler. Categories total count: %@",  buf,  0xCu);
    }
  }
}

+ (id)generateLastDayAppUsage
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dateByAddingTimeInterval:-86400.0]);
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v5) {
    sub_1000152A4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue([a1 getAppUsageArray:v4 to:v3]);
  BOOL v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v14) {
    sub_100015270(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue([a1 processDailyUsage:v13 from:v4 to:v3]);

  return v22;
}

+ (id)getAppUsageArray:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_class(&OBJC_CLASS____DKEventQuery, v7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v5;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: getAppUsageArray from: %@ to: %@",  buf,  0x16u);
    }

    uint64_t v8 = (void *)objc_opt_new(&OBJC_CLASS____DKEventQuery);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DKSystemEventStreams appInFocusStream](&OBJC_CLASS____DKSystemEventStreams, "appInFocusStream"));
    v31 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
    [v8 setEventStreams:v10];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery predicateForEventsIntersectingDateRangeFrom:to:]( &OBJC_CLASS____DKQuery,  "predicateForEventsIntersectingDateRangeFrom:to:",  v5,  v6));
    [v8 setPredicate:v11];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery startDateSortDescriptorAscending:]( &OBJC_CLASS____DKQuery,  "startDateSortDescriptorAscending:",  1LL));
    v30[0] = v12;
    xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[_DKQuery endDateSortDescriptorAscending:]( &OBJC_CLASS____DKQuery,  "endDateSortDescriptorAscending:",  1LL));
    v30[1] = v13;
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 2LL));
    [v8 setSortDescriptors:v14];

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](&OBJC_CLASS____DKKnowledgeStore, "knowledgeStore"));
    id v29 = 0LL;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 executeQuery:v8 error:&v29]);
    id v17 = v29;

    if (v17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
        sub_10001530C(v18, buf);
      }

      id v19 = 0LL;
    }

    else
    {
      id v19 = v16;
    }
  }

  else
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_1000152D8(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    id v19 = 0LL;
  }

  return v19;
}

+ (id)processDailyUsage:(id)a3 from:(id)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v41 = v7;
  id v42 = a5;
  v43 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v7)
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v45;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v9);
          }
          xpc_object_t v13 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate", v41));
          if (!v14
            || (uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 endDate]),
                BOOL v16 = v15 == 0LL,
                v15,
                v14,
                v16))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
              *(_DWORD *)buf = 138412290;
              v49 = v24;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Skipping event for %@ due to missing start or end date",  buf,  0xCu);
            }
          }

          else
          {
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v13 endDate]);
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
            [v17 timeIntervalSinceDate:v18];
            double v20 = v19;

            id v21 = (id)objc_claimAutoreleasedReturnValue([v13 startDate]);
            LODWORD(v17) = v21 < v8;

            if ((_DWORD)v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 startDate]);
              *(_DWORD *)buf = 138412546;
              v49 = v22;
              __int16 v50 = 2112;
              double v51 = *(double *)&v8;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Start date before from dates event.startDate :%@ fromDate %@",  buf,  0x16u);
            }

            if (v20 >= 0.0)
            {
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v13 endDate]);
              [v42 timeIntervalSinceDate:v25];
              BOOL v27 = v26 < 0.0;

              if (v27)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v38 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
                  v39 = (void *)objc_claimAutoreleasedReturnValue([v13 endDate]);
                  *(_DWORD *)buf = 138412546;
                  v49 = v38;
                  __int16 v50 = 2112;
                  double v51 = *(double *)&v39;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Stopping iteration with %@ that ends in the future at %@",  buf,  0x16u);
                }

                goto LABEL_34;
              }

              v28 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
              id v29 = [v28 copy];

              else {
                id v30 = v29;
              }
              v31 = v30;
              if (v30)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v43, "objectForKeyedSubscript:", v30));
                BOOL v33 = v32 == 0LL;

                if (v33)
                {
                  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v35, v31);
                }

                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
                    *(_DWORD *)buf = 138412546;
                    v49 = v31;
                    __int16 v50 = 2112;
                    double v51 = *(double *)&v34;
                    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Adding bundle to appUsage bundleID: %@  duration: %@",  buf,  0x16u);
                  }

                  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v43, "objectForKeyedSubscript:", v31));
                  [v35 doubleValue];
                  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20 + v36));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v37, v31);
                }
              }
            }

            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
              *(_DWORD *)buf = 138412546;
              v49 = v23;
              __int16 v50 = 2048;
              double v51 = v20;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HighEngagement: Skipping event for %@ with negative time interval of %f",  buf,  0x16u);
            }
          }
        }

        id v10 = [v9 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

@end