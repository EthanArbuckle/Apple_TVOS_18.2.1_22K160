@interface ConsistencyProofResponse_LogConsistencyResponse
+ (id)descriptor;
- (BOOL)forwards;
- (KTOptInManagerServer)optInServer;
- (NSDictionary)metadata;
- (NSNumber)startRevision;
- (TransparencyConsistencyProofVerifier)verifier;
- (TransparencyFollowUpProtocol)followUp;
- (TransparencyManagedDataStore)dataStore;
- (unint64_t)verifyWithError:(id *)a3;
- (void)checkSplitsFor:(id)a3;
- (void)setDataStore:(id)a3;
- (void)setFollowUp:(id)a3;
- (void)setForwards:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 key:(id)a4;
- (void)setOptInServer:(id)a3;
- (void)setResult:(unint64_t)a3 treeHead:(id)a4 error:(id)a5;
- (void)setStartRevision:(id)a3;
- (void)setVerifier:(id)a3;
@end

@implementation ConsistencyProofResponse_LogConsistencyResponse

+ (id)descriptor
{
  id v2 = (id)qword_1002EE8B8;
  if (!qword_1002EE8B8)
  {
    LODWORD(v4) = 28;
    id v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:]( &OBJC_CLASS___TransparencyGPBDescriptor,  "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:",  &OBJC_CLASS___ConsistencyProofResponse_LogConsistencyResponse,  @"LogConsistencyResponse",  &unk_1002E46D0,  &off_1002E47A8,  3LL,  32LL,  v4);
    [v2 setupExtraTextInfo:&unk_10024C0AD];
    [v2 setupContainingMessageClass:ConsistencyProofResponse];
    qword_1002EE8B8 = (uint64_t)v2;
  }

  return v2;
}

- (TransparencyConsistencyProofVerifier)verifier
{
  return (TransparencyConsistencyProofVerifier *)objc_getAssociatedObject(self, @"verifierKey");
}

- (void)setVerifier:(id)a3
{
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStoreKey");
}

- (void)setDataStore:(id)a3
{
}

- (NSNumber)startRevision
{
  return (NSNumber *)objc_getAssociatedObject(self, @"startRevisionKey");
}

- (void)setStartRevision:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](self, "metadata"));
    v8 = (NSMutableDictionary *)[v7 mutableCopy];

    if (!v8) {
      v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v6);
    -[ConsistencyProofResponse_LogConsistencyResponse setMetadata:](self, "setMetadata:", v8);
  }
}

- (BOOL)forwards
{
  id AssociatedObject = objc_getAssociatedObject(self, @"directionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)setForwards:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, @"directionKey", v4, (void *)1);
}

- (KTOptInManagerServer)optInServer
{
  return (KTOptInManagerServer *)objc_getAssociatedObject(self, @"optInServerKey");
}

- (void)setOptInServer:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"optInServerKey", a3, (void *)1);
  }
}

- (TransparencyFollowUpProtocol)followUp
{
  return (TransparencyFollowUpProtocol *)objc_getAssociatedObject(self, @"followUpKey");
}

- (void)setFollowUp:(id)a3
{
  if (a3) {
    objc_setAssociatedObject(self, @"followUpKey", a3, (void *)1);
  }
}

- (void)setResult:(unint64_t)a3 treeHead:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [v8 setUnsigned:"consistencyVerified" value:a3];
  if (a3 || !v8)
  {
    [v8 receiptTime];
    double v14 = v13;
    double Current = CFAbsoluteTimeGetCurrent();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current - v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"ConsistencyProofTime",  v18));
    [v16 logMetric:v17 withName:v19];

    v11 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
    NSLog(@"%@", v11);
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 createSignedTreeHeadFailure]);

    if (v9)
    {
      objc_msgSend(v11, "setErrorCode:", objc_msgSend(v9, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
      [v11 setErrorDomain:v12];
    }

    else
    {
      [v11 setErrorCode:-120];
      [v11 setErrorDomain:kTransparencyErrorUnknown];
    }

    [v11 setSth:v8];
    [v11 setVerificationType:2];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse optInServer](self, "optInServer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v20 createFailureEvent:v9 application:v21 optInServer:v22]);

    [v8 setFailureEvent:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse optInServer](self, "optInServer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 getAggregateOptInState:0]);

    if (qword_1002EEE50 != -1) {
      dispatch_once(&qword_1002EEE50, &stru_1002891D0);
    }
    v26 = (void *)qword_1002EEE58;
    if (os_log_type_enabled((os_log_t)qword_1002EEE58, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue([v23 eventId]);
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Created failure eventId %{public}@ for STH consistency validation, optInState %@",  buf,  0x16u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse followUp](self, "followUp"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v8 application]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v23 eventId]);
    objc_msgSend( v29,  "postFollowup:type:eventId:errorCode:optInState:infoLink:additionalInfo:error:",  v30,  2,  v31,  objc_msgSend(v9, "code"),  v25,  0,  0,  0);
  }
}

- (void)checkSplitsFor:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 logHeadHash]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 application]);
  id v51 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "fetchTreeHeadsWithoutHash:isMapHead:application:logBeginTime:logType:revision:error:",  v6,  0,  v7,  objc_msgSend(v4, "getUnsigned:"),  objc_msgSend(v4, "logType"),  objc_msgSend(v4, "getUnsigned:"),  &v51));
  id v39 = v51;

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -189LL,  @"duplicate revision found with different head hash from consistent SLH"));
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id obj = v8;
  id v46 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v48;
    v42 = v4;
    v43 = self;
    uint64_t v40 = kTransparencyResponseMetadataKeyServerHint;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v48 != v45) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sth]);
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[SignedObjectHolder parseFromData:error:]( &OBJC_CLASS___SignedLogHead,  "parseFromData:error:",  v11,  0LL));

        if (v12)
        {
          double v13 = v4;
          double v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse verifier](self, "verifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 trustedKeyStore]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 signatureVerifier]);
          [v12 setVerifier:v16];

          if ([v12 verifyWithError:0] == (id)1)
          {
            v17 = self;
            v18 = (void *)objc_claimAutoreleasedReturnValue([v12 parsedLogHead]);
            v19 = v13;
            v20 = (void *)objc_claimAutoreleasedReturnValue([v13 application]);
            v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v18 application]));
            v22 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v21));
            if ([v20 isEqual:v22])
            {
              id v23 = [v13 getUnsigned:"logBeginTime"];
              if (v23 == [v18 logBeginningMs]
                && (id v24 = [v19 logType], v24 == (id)(int)objc_msgSend(v18, "logType"))
                && (id v25 = [v19 getUnsigned:"revision"], v25 == objc_msgSend(v18, "revision")))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue([v19 logHeadHash]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v18 logHeadHash]);
                unsigned __int8 v28 = [v26 isEqual:v27];

                if ((v28 & 1) != 0)
                {
                  id v4 = v42;
                  self = v43;
                  goto LABEL_20;
                }

                self = v43;
                if (qword_1002EEE50 != -1) {
                  dispatch_once(&qword_1002EEE50, &stru_1002891F0);
                }
                v29 = (void *)qword_1002EEE58;
                if (os_log_type_enabled((os_log_t)qword_1002EEE58, OS_LOG_TYPE_ERROR))
                {
                  v30 = v29;
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v18 logHeadHash]);
                  id v32 = [v42 revision];
                  *(_DWORD *)buf = 138412546;
                  v53 = v31;
                  __int16 v54 = 2048;
                  id v55 = v32;
                  _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "found inconsistent head hash %@ for revision %llu with consistent head hash",  buf,  0x16u);
                }

                -[ConsistencyProofResponse_LogConsistencyResponse setResult:treeHead:error:]( v43,  "setResult:treeHead:error:",  0LL,  v10,  v41);
                v33 = (void *)objc_claimAutoreleasedReturnValue([v10 application]);
                v20 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyConsistencyProofEvent",  v33));

                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](v43, "metadata"));
                v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKeyedSubscript:v40]);

                if (v35)
                {
                  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse metadata](v43, "metadata"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKeyedSubscript:v40]);
                  [v21 setObject:v37 forKeyedSubscript:v40];
                }

                v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
                [v22 logResultForEvent:v20 hardFailure:1 result:v41 withAttributes:v21];
                double v13 = v42;
              }

              else
              {
                double v13 = v19;
                self = v43;
              }
            }

            else
            {
              self = v17;
            }
          }

          else
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
            [v18 deleteObject:v10];
          }

          id v4 = v13;
        }

        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse dataStore](self, "dataStore"));
          [v18 deleteObject:v10];
        }

- (unint64_t)verifyWithError:(id *)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001BC914;
  v14[3] = &unk_100285C28;
  v14[4] = self;
  v5 = objc_retainBlock(v14);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConsistencyProofResponse_LogConsistencyResponse startSlh](self, "startSlh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 parsedLogHead]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 application]));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifyConsistencyProofEvent",  v10));
  id v12 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v11,  3LL,  a3,  v5);

  return (unint64_t)v12;
}

@end