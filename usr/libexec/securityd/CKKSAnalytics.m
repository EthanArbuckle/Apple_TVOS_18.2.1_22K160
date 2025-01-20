@interface CKKSAnalytics
+ (id)databasePath;
+ (id)logger;
- (BOOL)isCKPartialError:(id)a3;
- (id)createErrorAttributes:(id)a3 depth:(unint64_t)a4 attributes:(id)a5;
- (id)dateOfLastSuccessForEvent:(id)a3 zoneName:(id)a4;
- (id)datePropertyForKey:(id)a3 zoneName:(id)a4;
- (id)errorChain:(id)a3 depth:(unint64_t)a4;
- (void)addCKPartialError:(id)a3 error:(id)a4 depth:(unint64_t)a5;
- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)logRecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6;
- (void)logSuccessForEvent:(id)a3 zoneName:(id)a4;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5;
- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6;
- (void)noteEvent:(id)a3 zoneName:(id)a4;
- (void)noteMetric:(id)a3 count:(int64_t)a4;
- (void)recordRecoveredTLKMetrics:(id)a3 tlkRecoveryResults:(id)a4 uniqueTLKsRecoveredEvent:(id)a5 totalSharesRecoveredEvent:(id)a6 totalRecoverableTLKSharesEvent:(id)a7 totalRecoverableTLKsEvent:(id)a8 totalViewsWithSharesEvent:(id)a9;
- (void)setDateProperty:(id)a3 forKey:(id)a4 zoneName:(id)a5;
@end

@implementation CKKSAnalytics

- (void)logSuccessForEvent:(id)a3 zoneName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v6, v7));
  -[CKKSAnalytics logSuccessForEventNamed:](self, "logSuccessForEventNamed:", v8);

  id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"last_success_%@-%@",  v6,  v7));

  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v10, v9);
}

- (BOOL)isCKPartialError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)addCKPartialError:(id)a3 error:(id)a4 depth:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v28 = self;
  if (!-[CKKSAnalytics isCKPartialError:](self, "isCKPartialError:", v9)) {
    goto LABEL_20;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0) {
    goto LABEL_19;
  }
  id v26 = v9;
  v27 = v8;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v25 = v11;
  id v13 = v11;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v14) {
    goto LABEL_18;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v30;
  unint64_t v17 = a5 + 1;
  while (2)
  {
    for (i = 0LL; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v29 + 1) + 8 * (void)i),  v25,  v26));
      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSError);
      if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 domain]);
        if ([v21 isEqualToString:CKErrorDomain])
        {
          id v22 = [v19 code];

          if (v22 == (id)22) {
            goto LABEL_14;
          }
        }

        else
        {
        }

        uint64_t v23 = objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](v28, "errorChain:depth:", v19, v17));
        if (v23)
        {
          v24 = (void *)v23;
          [v27 setObject:v23 forKeyedSubscript:@"oneCloudKitPartialFailure"];

          goto LABEL_18;
        }
      }

- (id)errorChain:(id)a3 depth:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 5 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSError), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v17[0] = @"domain";
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
    v17[1] = @"code";
    v18[0] = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v6 code]));
    v18[1] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
    id v11 = [v10 mutableCopy];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    unint64_t v14 = a4 + 1;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v13, v14));
    [v11 setObject:v15 forKeyedSubscript:@"child"];

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v11, v6, v14);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)createErrorAttributes:(id)a3 depth:(unint64_t)a4 attributes:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v10 = v9;
  if (v7) {
    [v9 setValuesForKeysWithDictionary:v7];
  }
  v19[0] = &__kCFBooleanTrue;
  v18[0] = @"recoverableError";
  v18[1] = @"errorDomain";
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
  v19[1] = v11;
  void v18[2] = @"errorCode";
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 code]));
  v19[2] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v18,  3LL));
  [v10 setValuesForKeysWithDictionary:v13];

  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:NSUnderlyingErrorKey]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v15, 0LL));
  [v10 setObject:v16 forKeyedSubscript:@"errorChain"];

  -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v10, v8, 0LL);
  return v10;
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v15 = v14;
    if (v10) {
      [v14 setValuesForKeysWithDictionary:v10];
    }
    v23[0] = @"recoverableError";
    v23[1] = @"zone";
    v24[0] = &__kCFBooleanTrue;
    v24[1] = v11;
    v23[2] = @"errorDomain";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    v24[2] = v16;
    v23[3] = @"errorCode";
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 code]));
    v24[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  4LL));
    [v15 setValuesForKeysWithDictionary:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v20, 0LL));
    [v15 setObject:v21 forKeyedSubscript:@"errorChain"];

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v15, v13, 0LL);
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___CKKSAnalytics;
    -[CKKSAnalytics logSoftFailureForEventNamed:withAttributes:]( &v22,  "logSoftFailureForEventNamed:withAttributes:",  v12,  v15);
  }
}

- (void)logRecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v12 = v11;
    if (v8) {
      [v11 setValuesForKeysWithDictionary:v8];
    }
    v21[0] = &__kCFBooleanTrue;
    v20[0] = @"recoverableError";
    v20[1] = @"errorDomain";
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    v21[1] = v13;
    v20[2] = @"errorCode";
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v10 code]));
    v21[2] = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL));
    [v12 setValuesForKeysWithDictionary:v15];

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v17, 0LL));
    [v12 setObject:v18 forKeyedSubscript:@"errorChain"];

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v12, v10, 0LL);
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___CKKSAnalytics;
    -[CKKSAnalytics logSoftFailureForEventNamed:withAttributes:]( &v19,  "logSoftFailureForEventNamed:withAttributes:",  v9,  v12);
  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 zoneName:(id)a5 withAttributes:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v15 = v14;
    if (v10) {
      [v14 setValuesForKeysWithDictionary:v10];
    }
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userInfo]);
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v17, 0LL));
    [v15 setObject:v18 forKeyedSubscript:@"errorChain"];

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v15, v13, 0LL);
    v23[0] = @"recoverableError";
    v23[1] = @"zone";
    v24[0] = &__kCFBooleanFalse;
    v24[1] = v11;
    v23[2] = @"errorDomain";
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    v24[2] = v19;
    v23[3] = @"errorCode";
    id v20 = [v13 code];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
    v24[3] = v21;
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  4LL));

    [v15 setValuesForKeysWithDictionary:v22];
    -[CKKSAnalytics logHardFailureForEventNamed:withAttributes:]( self,  "logHardFailureForEventNamed:withAttributes:",  v12,  v15);
  }
}

- (void)logUnrecoverableError:(id)a3 forEvent:(id)a4 withAttributes:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    id v9 = a4;
    id v10 = a3;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v12 = v11;
    if (v8) {
      [v11 setValuesForKeysWithDictionary:v8];
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSUnderlyingErrorKey]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics errorChain:depth:](self, "errorChain:depth:", v14, 0LL));
    [v12 setObject:v15 forKeyedSubscript:@"errorChain"];

    -[CKKSAnalytics addCKPartialError:error:depth:](self, "addCKPartialError:error:depth:", v12, v10, 0LL);
    v20[0] = @"recoverableError";
    v20[1] = @"zone";
    v21[0] = &__kCFBooleanFalse;
    v21[1] = @"OTBottledPeer";
    v20[2] = @"errorDomain";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    v21[2] = v16;
    void v20[3] = @"errorCode";
    id v17 = [v10 code];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v17));
    void v21[3] = v18;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  4LL));
    [v12 setValuesForKeysWithDictionary:v19];

    -[CKKSAnalytics logHardFailureForEventNamed:withAttributes:]( self,  "logHardFailureForEventNamed:withAttributes:",  v9,  v12);
  }
}

- (void)noteEvent:(id)a3 zoneName:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a4, a3));
  -[CKKSAnalytics noteEventNamed:](self, "noteEventNamed:", v5);
}

- (id)dateOfLastSuccessForEvent:(id)a3 zoneName:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"last_success_%@-%@",  a4,  a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics datePropertyForKey:](self, "datePropertyForKey:", v5));

  return v6;
}

- (void)setDateProperty:(id)a3 forKey:(id)a4 zoneName:(id)a5
{
  id v8 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a4, a5));
  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v8, v9);
}

- (id)datePropertyForKey:(id)a3 zoneName:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", a3, a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSAnalytics datePropertyForKey:](self, "datePropertyForKey:", v5));

  return v6;
}

- (void)noteMetric:(id)a3 count:(int64_t)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%lld", v6, a4));
  -[CKKSAnalytics logResultForEvent:hardFailure:result:](self, "logResultForEvent:hardFailure:result:", v9, 0LL, 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[CKKSAnalytics setDateProperty:forKey:](self, "setDateProperty:forKey:", v7, v9);

  id v8 = -[NSNumber initWithLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLong:", a4);
  -[CKKSAnalytics setNumberProperty:forKey:](self, "setNumberProperty:forKey:", v8, v6);
}

- (void)recordRecoveredTLKMetrics:(id)a3 tlkRecoveryResults:(id)a4 uniqueTLKsRecoveredEvent:(id)a5 totalSharesRecoveredEvent:(id)a6 totalRecoverableTLKSharesEvent:(id)a7 totalRecoverableTLKsEvent:(id)a8 totalViewsWithSharesEvent:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v36 = a9;
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v15 successfulKeysRecovered]);
  v38 = v16;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v16, [v19 count]);

  v39 = v15;
  v37 = v17;
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v17, [v15 totalTLKSharesRecovered]);
  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, [v14 count]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v21 = v14;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v44 + 1) + 8 * (void)i) tlkUUID]);
        [v20 addObject:v26];
      }

      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v23);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v18, [v20 count]);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v28 = v21;
  id v29 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v41;
    do
    {
      for (j = 0LL; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneID]);
        [v27 setObject:v34 forKeyedSubscript:v35];
      }

      id v30 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v30);
  }

  -[CKKSAnalytics noteMetric:count:](self, "noteMetric:count:", v36, [v27 count]);
}

+ (id)databasePath
{
  if (qword_1002DEBF8 != -1) {
    dispatch_once(&qword_1002DEBF8, &stru_10028FEA8);
  }
  return +[CKKSAnalytics defaultAnalyticsDatabasePath:]( &OBJC_CLASS___CKKSAnalytics,  "defaultAnalyticsDatabasePath:",  @"ckks_analytics");
}

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKKSAnalytics;
  id v2 = objc_msgSendSuper2(&v4, "logger");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end