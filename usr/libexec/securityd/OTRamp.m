@interface OTRamp
- (BOOL)cachedFeatureAllowed;
- (BOOL)checkRampStateWithError:(id *)a3;
- (CKContainer)container;
- (CKDatabase)database;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (Class)fetchRecordRecordsOperationClass;
- (NSDate)lastFetch;
- (NSString)localSettingName;
- (NSString)recordName;
- (OTRamp)initWithRecordName:(id)a3 localSettingName:(id)a4 container:(id)a5 database:(id)a6 zoneID:(id)a7 accountTracker:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 fetchRecordRecordsOperationClass:(Class)a11;
- (double)retryAfter;
- (int64_t)accountStatus;
- (void)fetchRampRecordWithReply:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountTracker:(id)a3;
- (void)setCachedFeatureAllowed:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setLastFetch:(id)a3;
- (void)setLocalSettingName:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setRecordName:(id)a3;
- (void)setRetryAfter:(double)a3;
- (void)setZone:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation OTRamp

- (OTRamp)initWithRecordName:(id)a3 localSettingName:(id)a4 container:(id)a5 database:(id)a6 zoneID:(id)a7 accountTracker:(id)a8 lockStateTracker:(id)a9 reachabilityTracker:(id)a10 fetchRecordRecordsOperationClass:(Class)a11
{
  id v33 = a3;
  id v32 = a4;
  id v17 = a5;
  id v18 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___OTRamp;
  v20 = -[OTRamp init](&v34, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_container, a5);
    v22 = (NSString *)[v33 copy];
    recordName = v21->_recordName;
    v21->_recordName = v22;

    v24 = (NSString *)[v32 copy];
    localSettingName = v21->_localSettingName;
    v21->_localSettingName = v24;

    objc_storeStrong((id *)&v21->_database, a6);
    objc_storeStrong((id *)&v21->_zoneID, a7);
    objc_storeStrong((id *)&v21->_accountTracker, a8);
    objc_storeStrong((id *)&v21->_lockStateTracker, a9);
    objc_storeStrong((id *)&v21->_reachabilityTracker, a10);
    objc_storeStrong((id *)&v21->_fetchRecordRecordsOperationClass, a11);
    uint64_t v26 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastFetch = v21->_lastFetch;
    v21->_lastFetch = (NSDate *)v26;

    v21->_retryAfter = 86400.0;
    v21->_cachedFeatureAllowed = 0;
  }

  return v21;
}

- (void)fetchRampRecordWithReply:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___CKOperationConfiguration);
  -[CKOperationConfiguration setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", 1LL);
  -[CKOperationConfiguration setIsCloudKitSupportOperation:](v5, "setIsCloudKitSupportOperation:", 1LL);
  v6 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  self->_recordName,  self->_zoneID);
  id v7 = objc_alloc((Class)objc_opt_class(-[OTRamp fetchRecordRecordsOperationClass](self, "fetchRecordRecordsOperationClass")));
  v21 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
  id v9 = [v7 initWithRecordIDs:v8];

  v20[0] = @"FeatureAllowed";
  v20[1] = @"FeaturePromoted";
  v20[2] = @"FeatureVisible";
  v20[3] = @"RetryAfter";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 4LL));
  [v9 setDesiredKeys:v10];

  [v9 setConfiguration:v5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000FDB2C;
  v17[3] = &unk_100286770;
  id v18 = v6;
  id v19 = v4;
  id v11 = v4;
  v12 = v6;
  [v9 setFetchRecordsCompletionBlock:v17];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp database](self, "database"));
  [v13 addOperation:v9];

  v14 = sub_10001267C("octagon");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Attempting to fetch ramp state from CloudKit",  v16,  2u);
  }
}

- (BOOL)checkRampStateWithError:(id *)a3
{
  uint64_t v90 = 0LL;
  v91 = &v90;
  uint64_t v92 = 0x2020000000LL;
  char v93 = 0;
  uint64_t v84 = 0LL;
  v85 = &v84;
  uint64_t v86 = 0x3032000000LL;
  v87 = sub_1000FD9E8;
  v88 = sub_1000FD9F8;
  id v89 = 0LL;
  uint64_t v80 = 0LL;
  v81 = &v80;
  uint64_t v82 = 0x2020000000LL;
  uint64_t v83 = 0LL;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTRamp localSettingName](self, "localSettingName"));
  CFBooleanRef v6 = (CFBooleanRef)CFPreferencesCopyValue( v5,  @"com.apple.security",  kCFPreferencesCurrentUser,  kCFPreferencesAnyHost);

  id v7 = sub_10001267C("octagon");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTRamp localSettingName](self, "localSettingName"));
    if (v6) {
      v10 = "True";
    }
    else {
      v10 = "False";
    }
    if (v6)
    {
      CFTypeID v11 = CFGetTypeID(v6);
      CFTypeID TypeID = CFBooleanGetTypeID();
      v13 = "False";
      if (v11 == TypeID && v6 == kCFBooleanTrue) {
        v13 = "True";
      }
    }

    else
    {
      v13 = "False";
    }

    *(_DWORD *)buf = 138413058;
    v107 = v9;
    __int16 v108 = 2080;
    v109 = "False";
    __int16 v110 = 2080;
    v111 = v10;
    __int16 v112 = 2080;
    v113 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ Defaults availability: SecCKKSTestsEnabled[%s] DefaultsPointer[%s] DefaultsValue[%s]",  buf,  0x2Au);
  }

  if (!v6)
  {
LABEL_20:
    v21 = objc_alloc_init(&OBJC_CLASS___NSDate);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp lastFetch](self, "lastFetch"));
    -[NSDate timeIntervalSinceDate:](v21, "timeIntervalSinceDate:", v22);
    double v24 = v23;
    -[OTRamp retryAfter](self, "retryAfter");
    BOOL v26 = v24 < v25;

    if (v26)
    {
      unsigned __int8 v15 = -[OTRamp cachedFeatureAllowed](self, "cachedFeatureAllowed");
LABEL_54:

      goto LABEL_55;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp lockStateTracker](self, "lockStateTracker"));
    unsigned int v28 = [v27 isLocked];

    if (v28)
    {
      id v29 = sub_10001267C("octagon");
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "device is locked! can't check ramp state",  buf,  2u);
      }

      NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
      v105 = @"device is locked";
      id v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v105,  &v104,  1LL));
      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kCFErrorDomainOSStatus,  -25308LL,  v31));
      id v33 = (void *)v85[5];
      v85[5] = v32;

      if (a3)
      {
LABEL_52:
        unsigned __int8 v15 = 0;
        *a3 = (id) v85[5];
        goto LABEL_54;
      }
    }

    else
    {
      objc_super v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp accountTracker](self, "accountTracker"));
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 ckAccountInfoInitialized]);
      [v35 wait:5000000000];

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp accountTracker](self, "accountTracker"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v36 currentCKAccountInfo]);
      BOOL v38 = [v37 accountStatus] == (id)1;

      if (v38)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTRamp reachabilityTracker](self, "reachabilityTracker"));
        unsigned __int8 v40 = [v39 currentReachability];

        if ((v40 & 1) != 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
          v42 = (void *)objc_claimAutoreleasedReturnValue( [v41 logSystemMetricsForActivityNamed:@"CKKSActivityOTFetchRampState" withAction:0]);
          dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
          [v42 start];
          v72 = _NSConcreteStackBlock;
          uint64_t v73 = 3221225472LL;
          v74 = sub_1000FDA00;
          v75 = &unk_100286798;
          v77 = &v90;
          v78 = &v80;
          v79 = &v84;
          v44 = v43;
          v76 = v44;
          -[OTRamp fetchRampRecordWithReply:](self, "fetchRampRecordWithReply:", &v72);
          dispatch_time_t v45 = dispatch_time(0LL, 65000000000LL);
          if (dispatch_semaphore_wait(v44, v45))
          {
            v46 = sub_10001267C("octagon");
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "timed out waiting for response from CloudKit\n",  buf,  2u);
            }

            NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
            v99 = @"timed out waiting for response from CloudKit";
            v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL,  v72,  v73,  v74,  v75));
            uint64_t v49 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  23LL,  v48));
            v50 = (void *)v85[5];
            v85[5] = v49;

            uint64_t v51 = v85[5];
            v96 = @"OTFailureReason";
            v97 = @"cloud kit timed out";
            v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v97,  &v96,  1LL));
            [v41 logUnrecoverableError:v51 forEvent:@"OctagonEventRamp" withAttributes:v52];
          }

          objc_msgSend(v42, "stop", v72, v73, v74, v75);
          if (v81[3] >= 1)
          {
            v53 = sub_10001267C("octagon");
            v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              v55 = (const __CFString *)v81[3];
              *(_DWORD *)buf = 134217984;
              v107 = v55;
              _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "cloud kit asked security to retry: %lu",  buf,  0xCu);
            }

            -[OTRamp setRetryAfter:](self, "setRetryAfter:", (double)v81[3]);
          }

          if (v85[5])
          {
            v56 = sub_10001267C("SecError");
            v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v58 = (const __CFString *)v85[5];
              *(_DWORD *)buf = 138412290;
              v107 = v58;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "octagon: had an error fetching ramp state: %@",  buf,  0xCu);
            }

            uint64_t v59 = v85[5];
            v94 = @"OTFailureReason";
            v95 = @"fetching ramp state";
            v60 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v95,  &v94,  1LL));
            [v41 logUnrecoverableError:v59 forEvent:@"OctagonEventRamp" withAttributes:v60];

            if (a3) {
              *a3 = (id) v85[5];
            }
          }

          if (*((_BYTE *)v91 + 24)) {
            [v41 logSuccessForEventNamed:@"OctagonEventRamp"];
          }
          -[OTRamp setLastFetch:](self, "setLastFetch:", v21);
          -[OTRamp setCachedFeatureAllowed:](self, "setCachedFeatureAllowed:", *((unsigned __int8 *)v91 + 24));
          unsigned __int8 v15 = *((_BYTE *)v91 + 24) != 0;

          goto LABEL_54;
        }

        v66 = sub_10001267C("octagon");
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v67,  OS_LOG_TYPE_DEFAULT,  "no network! can't check ramp state",  buf,  2u);
        }

        NSErrorUserInfoKey v100 = NSLocalizedDescriptionKey;
        v101 = @"no network";
        v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
        uint64_t v69 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  24LL,  v68));
        v70 = (void *)v85[5];
        v85[5] = v69;

        if (a3) {
          goto LABEL_52;
        }
      }

      else
      {
        v61 = sub_10001267C("octagon");
        v62 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_DEFAULT,  "not signed in! can't check ramp state",  buf,  2u);
        }

        NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
        v103 = @"not signed in";
        v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v103,  &v102,  1LL));
        uint64_t v64 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  25LL,  v63));
        v65 = (void *)v85[5];
        v85[5] = v64;

        if (a3) {
          goto LABEL_52;
        }
      }
    }

    unsigned __int8 v15 = 0;
    goto LABEL_54;
  }

  CFTypeID v14 = CFGetTypeID(v6);
  if (v14 != CFBooleanGetTypeID())
  {
    CFRelease(v6);
    goto LABEL_20;
  }

  unsigned __int8 v15 = v6 == kCFBooleanTrue;
  v16 = sub_10001267C("octagon");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[OTRamp recordName](self, "recordName"));
    id v19 = (void *)v18;
    v20 = @"disabled";
    if (v6 == kCFBooleanTrue) {
      v20 = @"enabled";
    }
    *(_DWORD *)buf = 138412546;
    v107 = v20;
    __int16 v108 = 2112;
    v109 = (const char *)v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "feature is %@: %@ (local config)", buf, 0x16u);
  }

  CFRelease(v6);
LABEL_55:
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v84, 8);

  _Block_object_dispose(&v90, 8);
  return v15;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSString)localSettingName
{
  return self->_localSettingName;
}

- (void)setLocalSettingName:(id)a3
{
}

- (CKKSAccountStateTracker)accountTracker
{
  return self->_accountTracker;
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return self->_reachabilityTracker;
}

- (void)setReachabilityTracker:(id)a3
{
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (Class)fetchRecordRecordsOperationClass
{
  return (Class)objc_getProperty(self, a2, 96LL, 1);
}

- (NSDate)lastFetch
{
  return (NSDate *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLastFetch:(id)a3
{
}

- (double)retryAfter
{
  return self->_retryAfter;
}

- (void)setRetryAfter:(double)a3
{
  self->_retryAfter = a3;
}

- (BOOL)cachedFeatureAllowed
{
  return self->_cachedFeatureAllowed;
}

- (void)setCachedFeatureAllowed:(BOOL)a3
{
  self->_cachedFeatureAllowed = a3;
}

- (void).cxx_destruct
{
}

@end