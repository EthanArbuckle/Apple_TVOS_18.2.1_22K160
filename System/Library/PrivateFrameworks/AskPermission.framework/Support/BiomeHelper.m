@interface BiomeHelper
+ (BOOL)donateToBiomeWithRequestIdentifier:(id)a3 withError:(id *)a4;
+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4;
+ (int)_mapRequestStatusToBiomeStatus:(int64_t)a3;
+ (void)donateToBiomeWithRequest:(id)a3;
+ (void)donateToBiomeWithRequests:(id)a3;
@end

@implementation BiomeHelper

+ (void)donateToBiomeWithRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(a1);
    id v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
    *(_DWORD *)buf = 138543618;
    v41 = v7;
    __int16 v42 = 2112;
    v43 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Donating to Biome Stream - Identifier: %@",  buf,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 modifiedDate]);
  if (v10) {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 modifiedDate]);
  }
  else {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 createdDate]);
  }
  v12 = v11;
  [v11 timeIntervalSinceReferenceDate];
  double v14 = v13;

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14));
  id v38 = objc_alloc(&OBJC_CLASS___BMFamilyAskToBuy);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueIdentifier]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v4 requesterDSID]);
  v36 = (void *)objc_claimAutoreleasedReturnValue([v4 approverDSID]);
  unsigned int v35 = objc_msgSend(a1, "_mapRequestStatusToBiomeStatus:", objc_msgSend(v4, "status"));
  v34 = (void *)objc_claimAutoreleasedReturnValue([v4 itemTitle]);
  v32 = (void *)objc_claimAutoreleasedReturnValue([v4 itemDescription]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedPrice]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v4 thumbnailURLString]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v4 ageRating]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v4 starRating]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v4 productType]);
  id v29 = a1;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 productURL]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 absoluteString]);
  id v20 = [v38 initWithRequestID:v37 eventTime:v39 userID:v33 actionUserID:v36 status:v35 itemTitle:v34 itemDescription:v32 itemLocalizedPrice:v31 thumbnailP ath:v30 ageRating:v15 starRating:v16 productType:v17 isActionUserDevice:&__kCFBooleanFalse storeLink:v19];

  if (v20)
  {
    uint64_t v21 = BiomeLibrary();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 Family]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 AskToBuy]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 source]);
    [v25 sendEvent:v20];
  }

  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v22) {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)objc_opt_class(v29);
      id v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v4 compile]);
      *(_DWORD *)buf = 138543618;
      v41 = v26;
      __int16 v42 = 2112;
      v43 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_ERROR,  "%{public}@: Biome Event failed to create from Request: %@",  buf,  0x16u);
    }
  }
}

+ (void)donateToBiomeWithRequests:(id)a3
{
  id v4 = a3;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 donateToBiomeWithRequest:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v6);
  }
}

+ (BOOL)donateToBiomeWithRequestIdentifier:(id)a3 withError:(id *)a4
{
  id v23 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _requestInfoForIndentifier:a3 withError:&v23]);
  id v7 = v23;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v10 = 0LL;
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0) {
    id v10 = v8;
  }

  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v11) {
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = (void *)objc_opt_class(a1);
    double v14 = a4;
    id v15 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 object]);
    *(_DWORD *)buf = 138543618;
    v25 = v13;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Request Info: %@.", buf, 0x16u);

    a4 = v14;
  }

  v17 = -[ApprovalRequest initWithCloudPushDictionary:]( objc_alloc(&OBJC_CLASS___ApprovalRequest),  "initWithCloudPushDictionary:",  v10);
  [a1 donateToBiomeWithRequest:v17];
  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      __int16 v26 = 2112;
      id v27 = v7;
      id v21 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: Error requesting info for Biome donation - %@",  buf,  0x16u);
    }
  }

  if (a4) {
    *a4 = v7;
  }

  return v7 == 0LL;
}

+ (int)_mapRequestStatusToBiomeStatus:(int64_t)a3
{
  else {
    return 0;
  }
}

+ (id)_requestInfoForIndentifier:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 retrieveRequestURL]);

  unsigned int v35 = @"requestId";
  id v36 = v6;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  id v10 = objc_alloc_init(&OBJC_CLASS___URLRequestEncoder);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( -[URLRequestEncoder requestWithMethod:bagURL:parameters:]( v10,  "requestWithMethod:bagURL:parameters:",  4LL,  v8,  v9));
  id v32 = 0LL;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 resultWithTimeout:&v32 error:60.0]);
  id v13 = v32;
  if (!v12)
  {
    id v21 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  v28 = v8;
  id v29 = a4;
  id v30 = v6;
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class(a1);
    *(_DWORD *)buf = 138543362;
    v34 = v16;
    id v17 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Encoded request successfully",  buf,  0xCu);
  }

  id v18 = a1;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[URLSession sharedSession](&OBJC_CLASS___URLSession, "sharedSession"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 dataTaskPromiseWithRequest:v12]);

  id v31 = v13;
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 resultWithTimeout:&v31 error:60.0]);
  id v22 = v31;

  if (v21)
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v23) {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 OSLogObject]);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_opt_class(v18);
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      id v26 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received server result",  buf,  0xCu);
    }
  }

  id v13 = v22;
  a4 = v29;
  id v6 = v30;
  id v8 = v28;
  if (v29) {
LABEL_13:
  }
    *a4 = v13;
LABEL_14:

  return v21;
}

@end