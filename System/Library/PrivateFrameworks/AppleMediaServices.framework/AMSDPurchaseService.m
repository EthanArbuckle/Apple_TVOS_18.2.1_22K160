@interface AMSDPurchaseService
+ (BOOL)isConnectionEntitled:(id)a3;
+ (id)_fdsConsumedCache;
+ (id)_fdsConsumedCacheAccessQueue;
+ (id)_fdsEvaluatorCache;
+ (id)_fdsEvaluatorCacheAccessQueue;
+ (id)_fdsResultCache;
+ (id)_fdsResultCacheAccessQueue;
+ (id)_odiSessionCache;
+ (id)_odiSessionCacheAccessQueue;
- (id)_serverEndpointIdentifierForFDSAction:(unint64_t)a3;
- (void)_createODISessionWithSessionIdentifier:(id)a3 cacheIdentifier:(id)a4 accountType:(unint64_t)a5 bundleIdentifier:(id)a6 completion:(id)a7;
- (void)_generateODIFDSWithRequest:(id)a3 completion:(id)a4;
- (void)cacheFDS:(id)a3 forPurchaseIdentifier:(id)a4 logKey:(id)a5 completion:(id)a6;
- (void)cachedFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)createODISessionWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 completion:(id)a6;
- (void)didConsumeFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5;
- (void)generateFDSWithRequest:(id)a3 completion:(id)a4;
- (void)getODIAssessmentForSessionIdentifier:(id)a3 clearCache:(BOOL)a4 completion:(id)a5;
- (void)partialFDSAssessmentForRequest:(id)a3 completion:(id)a4;
- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3 sessionIdentifier:(id)a4 clearCache:(BOOL)a5 completion:(id)a6;
- (void)updateODIWithAttributes:(id)a3 forSessionIdentifier:(id)a4 completion:(id)a5;
@end

@implementation AMSDPurchaseService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.private.applemediaservices"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  unsigned __int8 v7 = [v6 BOOLValue];
  return v7;
}

- (void)cachedFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (v8)
  {
    v12 = 0LL;
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class(self, v15);
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to fetch FDS. We don't have a purchase identifier.",  buf,  0x16u);
    }

    uint64_t v16 = AMSError(2LL, @"FDS Error", @"No purchase identifier", 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v16);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v25 = sub_100032FB4;
  v26 = sub_100032FC4;
  id v27 = 0LL;
  if (!v12)
  {
    id v17 = objc_msgSend((id)objc_opt_class(self, v10), "_fdsResultCacheAccessQueue");
    v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100032FCC;
    block[3] = &unk_1000D7538;
    v23 = buf;
    block[4] = self;
    id v22 = v8;
    dispatch_sync(v18, block);
  }

  if (v11)
  {
    uint64_t v19 = *(void *)(*(void *)&buf[8] + 40LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_sanitizedForSecureCoding"));
    v11[2](v11, v19, v20);
  }

  _Block_object_dispose(buf, 8);
}

- (void)cacheFDS:(id)a3 forPurchaseIdentifier:(id)a4 logKey:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v14 = (void (**)(id, void *))a6;
  if (v11) {
    goto LABEL_2;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v18) {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = objc_opt_class(self, v20);
    __int16 v28 = 2114;
    id v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to cache FDS. We don't have a purchase identifier.",  buf,  0x16u);
  }

  uint64_t v21 = AMSError(2LL, @"FDS Error", @"No purchase identifier", 0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (!v17)
  {
LABEL_2:
    id v15 = objc_msgSend((id)objc_opt_class(self, v13), "_fdsResultCacheAccessQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v15);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100033234;
    block[3] = &unk_1000D7560;
    block[4] = self;
    id v24 = v11;
    id v25 = v10;
    dispatch_sync(v16, block);

    id v17 = 0LL;
  }

  if (v14)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ams_sanitizedForSecureCoding"));
    v14[2](v14, v22);
  }
}

- (void)didConsumeFDSForPurchaseIdentifier:(id)a3 logKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    uint64_t v21 = objc_opt_class(self, v12);
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] Caching FDS consumption metadata",  (uint8_t *)&v20,  0x16u);
  }

  if (a3)
  {
    uint64_t v13 = 0LL;
    if (v9)
    {
LABEL_7:
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ams_sanitizedForSecureCoding"));
      v9[2](v9, v14);
    }
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    if (!v15) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class(self, v17);
      int v20 = 138543618;
      uint64_t v21 = v18;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Unable to FDS consumption metadata. We don't have a purchase identifier.",  (uint8_t *)&v20,  0x16u);
    }

    uint64_t v19 = AMSError(2LL, @"FDS Error", @"No purchase identifier", 0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v9) {
      goto LABEL_7;
    }
  }
}

- (void)generateFDSWithRequest:(id)a3 completion:(id)a4
{
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  uint64_t v4 = AMSError(5LL, @"FDS Error", @"Platform Not Supported", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_sanitizedForSecureCoding"));
    v7[2](v7, 0LL, v6);
  }
}

- (void)partialFDSAssessmentForRequest:(id)a3 completion:(id)a4
{
  unsigned __int8 v7 = (void (**)(id, void, void *))a4;
  uint64_t v4 = AMSError(5LL, @"FDS Error", @"Platform Not Supported", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_sanitizedForSecureCoding"));
    v7[2](v7, 0LL, v6);
  }
}

- (void)createODISessionWithSessionIdentifier:(id)a3 accountType:(unint64_t)a4 bundleIdentifier:(id)a5 completion:(id)a6
{
}

- (void)getODIAssessmentForSessionIdentifier:(id)a3 clearCache:(BOOL)a4 completion:(id)a5
{
  id v6 = (void (**)(id, void, void *))a5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v7) {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v16 = 138543618;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to get ODI assessment, platform not supported",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v14 = AMSError(5LL, @"ODI Error", @"Platform not supported", 0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v6) {
    v6[2](v6, 0LL, v15);
  }
}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3 sessionIdentifier:(id)a4 clearCache:(BOOL)a5 completion:(id)a6
{
  unsigned __int8 v7 = (void (**)(id, void *))a6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class(self, v10);
    uint64_t v13 = AMSLogKey(v11, v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    int v17 = 138543618;
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    int v20 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to provide ODI feedback, platform not supported",  (uint8_t *)&v17,  0x16u);
  }

  uint64_t v15 = AMSError(5LL, @"ODI Error", @"Platform not supported", 0LL);
  int v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v7) {
    v7[2](v7, v16);
  }
}

- (void)updateODIWithAttributes:(id)a3 forSessionIdentifier:(id)a4 completion:(id)a5
{
  id v6 = (void (**)(id, void *))a5;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v7) {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_opt_class(self, v9);
    uint64_t v12 = AMSLogKey(v10, v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v16 = 138543618;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    __int16 v19 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to update ODI attributes, platform not supported",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v14 = AMSError(5LL, @"ODI Error", @"Platform not supported", 0LL);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v6) {
    v6[2](v6, v15);
  }
}

- (void)_createODISessionWithSessionIdentifier:(id)a3 cacheIdentifier:(id)a4 accountType:(unint64_t)a5 bundleIdentifier:(id)a6 completion:(id)a7
{
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, void *))a7;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  if (!v11) {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_opt_class(self, v13);
    uint64_t v16 = AMSLogKey(v14, v15);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    int v20 = 138543618;
    uint64_t v21 = v14;
    __int16 v22 = 2114;
    id v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] Failed to create ODI session, platform not supported",  (uint8_t *)&v20,  0x16u);
  }

  uint64_t v18 = AMSError(5LL, @"ODI Error", @"Platform not supported", 0LL);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v10) {
    v10[2](v10, v9, v19);
  }
}

- (void)_generateODIFDSWithRequest:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v4 = AMSError(5LL, @"FDS Error", @"Platform Not Supported", 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v6) {
    v6[2](v6, 0LL, v5);
  }
}

- (id)_serverEndpointIdentifierForFDSAction:(unint64_t)a3
{
  if (a3 > 3) {
    return 0LL;
  }
  else {
    return off_1000D7680[a3];
  }
}

+ (id)_fdsConsumedCache
{
  if (qword_1000F2078 != -1) {
    dispatch_once(&qword_1000F2078, &stru_1000D7580);
  }
  return (id)qword_1000F2080;
}

+ (id)_fdsConsumedCacheAccessQueue
{
  if (qword_1000F2088 != -1) {
    dispatch_once(&qword_1000F2088, &stru_1000D75A0);
  }
  return (id)qword_1000F2090;
}

+ (id)_fdsEvaluatorCache
{
  if (qword_1000F2098 != -1) {
    dispatch_once(&qword_1000F2098, &stru_1000D75C0);
  }
  return (id)qword_1000F20A0;
}

+ (id)_fdsEvaluatorCacheAccessQueue
{
  if (qword_1000F20A8 != -1) {
    dispatch_once(&qword_1000F20A8, &stru_1000D75E0);
  }
  return (id)qword_1000F20B0;
}

+ (id)_fdsResultCache
{
  if (qword_1000F20B8 != -1) {
    dispatch_once(&qword_1000F20B8, &stru_1000D7600);
  }
  return (id)qword_1000F20C0;
}

+ (id)_fdsResultCacheAccessQueue
{
  if (qword_1000F20C8 != -1) {
    dispatch_once(&qword_1000F20C8, &stru_1000D7620);
  }
  return (id)qword_1000F20D0;
}

+ (id)_odiSessionCache
{
  if (qword_1000F20D8 != -1) {
    dispatch_once(&qword_1000F20D8, &stru_1000D7640);
  }
  return (id)qword_1000F20E0;
}

+ (id)_odiSessionCacheAccessQueue
{
  if (qword_1000F20E8 != -1) {
    dispatch_once(&qword_1000F20E8, &stru_1000D7660);
  }
  return (id)qword_1000F20F0;
}

@end