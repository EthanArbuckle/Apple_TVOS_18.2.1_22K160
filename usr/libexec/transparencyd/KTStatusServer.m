@interface KTStatusServer
+ (id)auditorReportForKTRequest:(id)a3;
+ (id)auditorReportForKTSMT:(id)a3;
+ (id)auditorReportForSTH:(id)a3;
+ (void)auditorReportsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
+ (void)errorsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
+ (void)ignoreFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5;
@end

@implementation KTStatusServer

+ (void)errorsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
}

+ (void)ignoreFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
}

+ (id)auditorReportForKTRequest:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = [v3 type];
  if ((unint64_t)v5 <= 2) {
    [v4 setObject:*(void *)*(&off_100287998 + (void)v5) forKeyedSubscript:kTransparencyAuditorReportType];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 uri]);
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportURI];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 accountKey]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportAccountKey];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
  [v4 setObject:v9 forKeyedSubscript:kTransparencyAuditorReportApplication];

  [v3 requestTime];
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  [v10 timeIntervalSince1970];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v11 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v3 serverLoggableDatas]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
  [v4 setObject:v13 forKeyedSubscript:kTransparencyAuditorReportServerLoggableDatas];

  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLoggableDatas]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 clientLoggableDatas]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);
    [v4 setObject:v16 forKeyedSubscript:kTransparencyAuditorReportTrustedLoggableDatas];
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v3 serverHint]);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 serverHint]);
    [v4 setObject:v18 forKeyedSubscript:kTransparencyAuditorReportServerHint];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v3 queryRequest]);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 queryRequest]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 base64EncodedStringWithOptions:0]);
    [v4 setObject:v21 forKeyedSubscript:kTransparencyAuditorReportQueryRequest];
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue([v3 queryResponse]);

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v3 queryResponse]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 base64EncodedStringWithOptions:0]);
    [v4 setObject:v24 forKeyedSubscript:kTransparencyAuditorReportQueryResponse];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v3 responseTime]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v3 responseTime]);
    [v26 timeIntervalSince1970];
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v4 setObject:v27 forKeyedSubscript:kTransparencyAuditorReportResponseTime];
  }

  if ([v3 type] == (id)1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountKeyServer sharedKeyServiceForApplication:]( &OBJC_CLASS___KTAccountKeyServer,  "sharedKeyServiceForApplication:",  v28));

    if (v29)
    {
      uint64_t v33 = 0LL;
      v34 = &v33;
      uint64_t v35 = 0x3032000000LL;
      v36 = sub_10019BA40;
      v37 = sub_10019BA50;
      id v38 = 0LL;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10019BA58;
      v32[3] = &unk_100287908;
      v32[4] = &v33;
      [v29 signData:0 completionBlock:v32];
      v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v34[5] base64EncodedStringWithOptions:0]);
      [v4 setObject:v30 forKeyedSubscript:kTransparencyAuditorReportPCSIdentity];

      _Block_object_dispose(&v33, 8);
    }
  }

  return v4;
}

+ (id)auditorReportForKTSMT:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v4 setObject:kTransparencyAuditorReportTypeSMT forKeyedSubscript:kTransparencyAuditorReportType];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 uri]);
  [v4 setObject:v5 forKeyedSubscript:kTransparencyAuditorReportURI];

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportApplication];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 receiptTime]);
  [v7 timeIntervalSince1970];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 smt]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
  [v4 setObject:v10 forKeyedSubscript:kTransparencyAuditorReportSMT];

  if ([v3 signatureResult] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportSignatureFailed];
  }
  if ([v3 mergeResult] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportMMDFailed];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v3 failureEvent]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 failureEvent]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 encodedError]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 base64EncodedStringWithOptions:0]);
    [v4 setObject:v14 forKeyedSubscript:kTransparencyAuditorReportNSError];
  }

  return v4;
}

+ (id)auditorReportForSTH:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ([v3 isMapHead])
  {
    [v4 setObject:kTransparencyAuditorReportTypeSMH forKeyedSubscript:kTransparencyAuditorReportType];
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 populating]));
    [v4 setObject:v5 forKeyedSubscript:kTransparencyAuditorReportMapPopulating];
  }

  else
  {
    [v4 setObject:kTransparencyAuditorReportTypeSLH forKeyedSubscript:kTransparencyAuditorReportType];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 application]);
  [v4 setObject:v6 forKeyedSubscript:kTransparencyAuditorReportApplication];

  [v3 receiptTime];
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
  [v7 timeIntervalSince1970];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v4 setObject:v8 forKeyedSubscript:kTransparencyAuditorReportRequestTime];

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 sth]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 base64EncodedStringWithOptions:0]);
  [v4 setObject:v10 forKeyedSubscript:kTransparencyAuditorReportSTH];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 gossip]));
  [v4 setObject:v11 forKeyedSubscript:kTransparencyAuditorReportGossip];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 logBeginTime]));
  [v4 setObject:v12 forKeyedSubscript:kTransparencyAuditorReportTreeEpoch];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v3 revision]));
  [v4 setObject:v13 forKeyedSubscript:kTransparencyAuditorReportRevision];

  if ([v3 signatureVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportSignatureFailed];
  }
  if ([v3 inclusionVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportInclusionFailed];
  }
  if ([v3 consistencyVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportConsistencyFailed];
  }
  if ([v3 mmdVerified] != (id)1) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kTransparencyAuditorReportMMDFailed];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v3 failureEvent]);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 failureEvent]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 encodedError]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 base64EncodedStringWithOptions:0]);
    [v4 setObject:v17 forKeyedSubscript:kTransparencyAuditorReportNSError];
  }

  return v4;
}

+ (void)auditorReportsForFailedEvents:(id)a3 dataStore:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v24 = (void (**)(id, void))a5;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  v40 = sub_10019BA40;
  v41 = sub_10019BA50;
  id v42 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)i);
        v14 = (id *)(v38 + 5);
        id v32 = (id)v38[5];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_10019C31C;
        v30[3] = &unk_100287930;
        v30[4] = v13;
        id v15 = v9;
        id v31 = v15;
        unsigned __int8 v16 = [v8 performAndWaitForRequestId:v13 error:&v32 block:v30];
        objc_storeStrong(v14, v32);
        if ((v16 & 1) == 0)
        {
          v18 = (id *)(v38 + 5);
          v17 = (void *)v38[5];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472LL;
          v26[2] = sub_10019C398;
          v26[3] = &unk_100287978;
          v28 = &v37;
          id v29 = v17;
          v26[4] = v13;
          id v27 = v15;
          unsigned __int8 v19 = [v8 performAndWaitForFailedEventId:v13 error:&v29 block:v26];
          objc_storeStrong(v18, v29);

          if ((v19 & 1) == 0)
          {

            goto LABEL_12;
          }
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

@end