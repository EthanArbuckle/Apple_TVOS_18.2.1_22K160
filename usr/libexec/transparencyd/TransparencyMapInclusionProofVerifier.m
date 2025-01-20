@interface TransparencyMapInclusionProofVerifier
- (NSString)application;
- (TransparencyMapInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4;
- (TransparencyMapInclusionProofVerifier)initWithKeyStore:(id)a3 application:(id)a4;
- (TransparencyPublicKeyBag)keyBag;
- (unint64_t)verifyInclusionProofWithMapEntry:(id)a3 perAppLogEntry:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6;
- (unint64_t)verifyPerApplicationTreeEntry:(id)a3 mapHead:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6;
- (void)setApplication:(id)a3;
- (void)setInclusionResult:(unint64_t)a3 mapHead:(id)a4 failure:(id)a5;
@end

@implementation TransparencyMapInclusionProofVerifier

- (TransparencyMapInclusionProofVerifier)initWithKeyBag:(id)a3 application:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TransparencyMapInclusionProofVerifier;
  v9 = -[TransparencyMapInclusionProofVerifier init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBag, a3);
    objc_storeStrong((id *)&v10->_application, a4);
  }

  return v10;
}

- (void)setInclusionResult:(unint64_t)a3 mapHead:(id)a4 failure:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 dataStore]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100177210;
  v12[3] = &unk_1002794B0;
  id v14 = v8;
  unint64_t v15 = a3;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockAndWait:v12];
}

- (unint64_t)verifyPerApplicationTreeEntry:(id)a3 mapHead:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1001776F0;
    v23[3] = &unk_100285BE0;
    id v13 = v10;
    id v24 = v13;
    id v25 = v11;
    v26 = self;
    id v14 = objc_retainBlock(v23);
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyMapInclusionProofVerifier application](self, "application"));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyPATInclusionProofEvent",  v15));
    unint64_t v17 = (unint64_t)+[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v16,  3LL,  a6,  v14);

    if (v17 == 1)
    {
      if (v12)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v13 slh]);
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[SignedLogHead signedTypeWithObject:]( &OBJC_CLASS___SignedLogHead,  "signedTypeWithObject:",  v18));

        unint64_t v17 = (unint64_t)[v12 verifyTLTEntryForPerApplicationLogHead:v19 error:a6];
      }

      else
      {
        if (qword_1002EEB10 != -1) {
          dispatch_once(&qword_1002EEB10, &stru_100285C00);
        }
        v21 = (os_log_s *)qword_1002EEB18;
        unint64_t v17 = 1LL;
        if (os_log_type_enabled((os_log_t)qword_1002EEB18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          unint64_t v17 = 1LL;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "failed to get TLT inclusion proof for PAT head; deferring inclusion verification",
            buf,
            2u);
        }
      }
    }
  }

  else
  {
    if (qword_1002EEB10 != -1) {
      dispatch_once(&qword_1002EEB10, &stru_100285B58);
    }
    v20 = (os_log_s *)qword_1002EEB18;
    if (os_log_type_enabled((os_log_t)qword_1002EEB18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "failed to get PAT inclusion proof for PAM head; deferring inclusion verification",
        buf,
        2u);
    }

    -[TransparencyMapInclusionProofVerifier setInclusionResult:mapHead:failure:]( self,  "setInclusionResult:mapHead:failure:",  2LL,  v11,  0LL);
    unint64_t v17 = 1LL;
  }

  return v17;
}

- (unint64_t)verifyInclusionProofWithMapEntry:(id)a3 perAppLogEntry:(id)a4 topLevelTreeEntry:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100177EAC;
  v27[3] = &unk_100285C28;
  id v13 = v10;
  id v28 = v13;
  id v14 = objc_retainBlock(v27);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyMapInclusionProofVerifier application](self, "application"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyMapInclusionProofEvent",  v15));
  id v17 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v16,  3LL,  a6,  v14);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v13 smh]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SignedMapHead signedTypeWithObject:](&OBJC_CLASS___SignedMapHead, "signedTypeWithObject:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue([v13 dataStore]);
  [v19 setDataStore:v20];

  if (v11)
  {
    [v19 setOverrideBeginTimeFromLogEntry:v11];
  }

  else
  {
    id v26 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 metadata]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:@"overrideLogBeginTime"]);
    id v23 = [v22 longLongValue];

    if (v23)
    {
      [v19 setOverrideBeginTime:v23];
      id v12 = v26;
    }

    else
    {
      if (qword_1002EEB10 != -1) {
        dispatch_once(&qword_1002EEB10, &stru_100285C48);
      }
      id v12 = v26;
      id v24 = (os_log_s *)qword_1002EEB18;
      if (os_log_type_enabled((os_log_t)qword_1002EEB18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "verifyInclusionProofWithMapEntry couldn't find an override time despite needing one. This SMH will leak to long-term gc: %@",  buf,  0xCu);
      }
    }
  }

  if (v17 == (id)1) {
    id v17 = -[TransparencyMapInclusionProofVerifier verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:]( self,  "verifyPerApplicationTreeEntry:mapHead:topLevelTreeEntry:error:",  v11,  v19,  v12,  a6);
  }

  return (unint64_t)v17;
}

- (TransparencyPublicKeyBag)keyBag
{
  return (TransparencyPublicKeyBag *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

- (TransparencyMapInclusionProofVerifier)initWithKeyStore:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 keyBag]);
  id v8 = -[TransparencyMapInclusionProofVerifier initWithKeyBag:application:](self, "initWithKeyBag:application:", v7, v6);

  return v8;
}

@end