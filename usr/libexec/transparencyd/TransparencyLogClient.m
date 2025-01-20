@interface TransparencyLogClient
+ (double)timeShift:(id)a3;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 useReversePush:(BOOL)a6 completionHandler:(id)a7;
- (BOOL)needsReauthorization:(id)a3 metadata:(id)a4;
- (BOOL)needsRetry:(id)a3;
- (BOOL)needsTimeShift:(id)a3 metadata:(id)a4;
- (BOOL)ready;
- (TransparencyAnalytics)transparencyAnalytics;
- (TransparencyIDSConfigBag)idsConfigBag;
- (TransparencyLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6;
- (TransparencyLogSession)session;
- (TransparencyManagedDataStore)dataStore;
- (TransparencySettingsProtocol)settings;
- (void)deleteDownloadId:(id)a3;
- (void)fetchRequest:(id)a3 completionHandler:(id)a4;
- (void)renewAccountTokenForFetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6;
- (void)setDataStore:(id)a3;
- (void)setIdsConfigBag:(id)a3;
- (void)setSession:(id)a3;
- (void)setSettings:(id)a3;
- (void)setTransparencyAnalytics:(id)a3;
@end

@implementation TransparencyLogClient

- (TransparencyLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TransparencyLogClient;
  v14 = -[TransparencyLogClient init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[TransparencyLogClient setSession:](v14, "setSession:", v10);
    -[TransparencyLogClient setDataStore:](v15, "setDataStore:", v12);
    -[TransparencyLogClient setTransparencyAnalytics:](v15, "setTransparencyAnalytics:", v11);
    -[TransparencyLogClient setSettings:](v15, "setSettings:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyIDSConfigBag sharedInstance](&OBJC_CLASS___TransparencyIDSConfigBag, "sharedInstance"));
    -[TransparencyLogClient setIdsConfigBag:](v15, "setIdsConfigBag:", v16);
  }

  return v15;
}

- (BOOL)ready
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 auth]);
  unsigned int v5 = [v4 isSupported];

  if (!v5) {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 auth]);
  unsigned __int8 v8 = [v7 ready];

  return v8;
}

- (BOOL)needsRetry:(id)a3
{
  return a3 && [a3 code] == (id)-174;
}

- (BOOL)needsReauthorization:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  if (-[TransparencyLogClient needsRetry:](self, "needsRetry:", a3))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"x-auth-status"]);
    unsigned __int8 v8 = v7;
    if (v7)
    {
      if ([v7 isEqualToString:@"unauthorized"])
      {
        if (qword_1002EEF60 != -1) {
          dispatch_once(&qword_1002EEF60, &stru_10028A250);
        }
        uint64_t v9 = qword_1002EEF68;
        if (!os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        LOWORD(v16) = 0;
        id v10 = "authorization failed";
        id v11 = (os_log_s *)v9;
        uint32_t v12 = 2;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
LABEL_16:

        BOOL v13 = 1;
        goto LABEL_17;
      }

      if (([v8 isEqualToString:@"time-drift"] & 1) == 0)
      {
        if (qword_1002EEF60 != -1) {
          dispatch_once(&qword_1002EEF60, &stru_10028A270);
        }
        uint64_t v14 = qword_1002EEF68;
        if (!os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_ERROR)) {
          goto LABEL_16;
        }
        int v16 = 138412290;
        v17 = v8;
        id v10 = "unknown auth status %@";
        id v11 = (os_log_s *)v14;
        uint32_t v12 = 12;
        goto LABEL_15;
      }
    }
  }

  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)needsTimeShift:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  if (!-[TransparencyLogClient needsRetry:](self, "needsRetry:", a3)) {
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"x-auth-status"]);
  unsigned __int8 v8 = v7;
  if (!v7 || ![v7 isEqualToString:@"time-drift"])
  {

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }

  if (qword_1002EEF60 != -1) {
    dispatch_once(&qword_1002EEF60, &stru_10028A290);
  }
  uint64_t v9 = (os_log_s *)qword_1002EEF68;
  if (os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "authorization failed due to time drift",  v12,  2u);
  }

  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (double)timeShift:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"Date"]);
  v4 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US"));
  -[NSDateFormatter setLocale:](v4, "setLocale:", v5);

  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", @"EE, dd MMM yyyy HH:mm:ss 'GMT'");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](&OBJC_CLASS___NSTimeZone, "timeZoneForSecondsFromGMT:", 0LL));
  -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v4, "dateFromString:", v3));
  unsigned __int8 v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSinceNow];
    double v10 = v9;
  }

  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (void)renewAccountTokenForFetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001CE110;
  v17[3] = &unk_10028A2B8;
  id v11 = a6;
  id v19 = v11;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  BOOL v20 = a4;
  BOOL v21 = a5;
  BOOL v13 = objc_retainBlock(v17);
  id v16 = 0LL;
  LOBYTE(v10) = +[TransparencyAccount initiateCredentialRenewal:completionHandler:]( &OBJC_CLASS___TransparencyAccount,  "initiateCredentialRenewal:completionHandler:",  &v16,  v13);
  id v14 = v16;
  if ((v10 & 1) == 0)
  {
    if (qword_1002EEF60 != -1) {
      dispatch_once(&qword_1002EEF60, &stru_10028A2D8);
    }
    v15 = (os_log_s *)qword_1002EEF68;
    if (os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Failed to initiate credential renewal: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0LL, 0LL, v14);
  }
}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 useReversePush:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1001CE26C;
  v18[3] = &unk_10028A328;
  BOOL v21 = a4;
  id v19 = v12;
  id v20 = v13;
  v18[4] = self;
  BOOL v22 = v9;
  char v23 = v8;
  id v15 = v12;
  id v16 = v13;
  LOBYTE(v8) = [v14 fetch:v15 allowEmptyData:v9 useReversePush:v8 completionHandler:v18];

  return v8;
}

- (BOOL)fetch:(id)a3 shouldRetry:(BOOL)a4 allowEmptyData:(BOOL)a5 completionHandler:(id)a6
{
  return -[TransparencyLogClient fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:]( self,  "fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:",  a3,  a4,  a5,  0LL,  a6);
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  return -[TransparencyLogClient fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:]( self,  "fetch:shouldRetry:allowEmptyData:useReversePush:completionHandler:",  a3,  1LL,  a4,  a5,  a6);
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return -[TransparencyLogClient fetch:allowEmptyData:useReversePush:completionHandler:]( self,  "fetch:allowEmptyData:useReversePush:completionHandler:",  a3,  a4,  0LL,  a5);
}

- (void)fetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient session](self, "session"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 auth]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001CE74C;
  v12[3] = &unk_10028A378;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v10 createRequestForAuthentication:v9 completionHandler:v12];
}

- (void)deleteDownloadId:(id)a3
{
  id v4 = a3;
  if (qword_1002EEF60 != -1) {
    dispatch_once(&qword_1002EEF60, &stru_10028A398);
  }
  unsigned int v5 = (os_log_s *)qword_1002EEF68;
  if (os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting downloadId %{public}@", buf, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient dataStore](self, "dataStore"));
  id v10 = 0LL;
  unsigned __int8 v7 = [v6 deleteDownloadRecordById:v4 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_1002EEF60 != -1) {
      dispatch_once(&qword_1002EEF60, &stru_10028A3B8);
    }
    BOOL v9 = (os_log_s *)qword_1002EEF68;
    if (os_log_type_enabled((os_log_t)qword_1002EEF68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "failed to delete downloadId %{public}@: %@",  buf,  0x16u);
    }
  }
}

- (TransparencyLogSession)session
{
  return (TransparencyLogSession *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSession:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDataStore:(id)a3
{
}

- (TransparencyAnalytics)transparencyAnalytics
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTransparencyAnalytics:(id)a3
{
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSettings:(id)a3
{
}

- (TransparencyIDSConfigBag)idsConfigBag
{
  return (TransparencyIDSConfigBag *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setIdsConfigBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end