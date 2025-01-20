@interface SignedMutationTimestamp
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (NSString)application;
- (id)createManagedObject:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6;
- (id)diagnosticsJsonDictionary;
- (id)parsedMutationWithError:(id *)a3;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setApplication:(id)a3;
@end

@implementation SignedMutationTimestamp

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___SignedMutationTimestamp);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMutationTimestamp signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMutationTimestamp,  "signedTypeWithObject:verifier:dataStore:",  a3,  0LL,  0LL);
}

- (id)parsedMutationWithError:(id *)a3
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation"));
  if (v5
    && (v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation")),
        id v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp mutation](self, "mutation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IdsMutation parseFromData:error:](&OBJC_CLASS___IdsMutation, "parseFromData:error:", v9, a3));
  }

  else
  {
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -4LL,  @"SMT missing mutation"));
    }
    if (qword_1002EEBA8 != -1) {
      dispatch_once(&qword_1002EEBA8, &stru_100286050);
    }
    v11 = (os_log_s *)qword_1002EEBB0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBB0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMT missing mutation", v13, 2u);
    }

    v10 = 0LL;
  }

  return v10;
}

- (id)createManagedObject:(id)a3 uri:(id)a4 serverHint:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp parsedMutationWithError:](self, "parsedMutationWithError:", a6));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
    [v13 mutationMs];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder signature](self, "signature"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 signingKeySpkihash]);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    id v19 = v10;
    v20 = (void *)v18;
    id v21 = v11;
    v22 = v19;
    v29 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "createMutation:application:uri:mutationMs:spkiHash:receiptTime:", v15));

    if (v23)
    {
      [v23 setReceiptServerHint:v12];
      id v24 = v23;
      id v10 = v22;
      id v11 = v29;
    }

    else
    {
      if (a6) {
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAlloc,  -60LL,  @"failed to create KTMutation entity"));
      }
      id v10 = v22;
      if (qword_1002EEBA8 != -1) {
        dispatch_once(&qword_1002EEBA8, &stru_100286090);
      }
      id v11 = v29;
      v27 = (os_log_s *)qword_1002EEBB0;
      if (os_log_type_enabled((os_log_t)qword_1002EEBB0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "failed to create KTMutation entity", buf, 2u);
      }
    }
  }

  else
  {
    if (a6) {
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorDecode,  -73LL,  *a6));
    }
    if (qword_1002EEBA8 != -1) {
      dispatch_once(&qword_1002EEBA8, &stru_100286070);
    }
    v25 = (os_log_s *)qword_1002EEBB0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBB0, OS_LOG_TYPE_ERROR))
    {
      if (a6) {
        id v26 = *a6;
      }
      else {
        id v26 = 0LL;
      }
      *(_DWORD *)buf = 138412290;
      id v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "mutation failed to parse: %@", buf, 0xCu);
    }

    v23 = 0LL;
  }

  return v23;
}

- (id)diagnosticsJsonDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SignedMutationTimestamp;
  id v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v10, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp parsedMutationWithError:](self, "parsedMutationWithError:", 0LL));
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 diagnosticsJsonDictionary]);
    [v5 setObject:v8 forKeyedSubscript:@"mutation"];
  }

  return v5;
}

- (unint64_t)verifyWithError:(id *)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100180650;
  v10[3] = &unk_100285C28;
  v10[4] = self;
  id v5 = objc_retainBlock(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMutationTimestamp application](self, "application"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySmtEvent",  v6));
  id v8 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v7,  3LL,  a3,  v5);

  return (unint64_t)v8;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end