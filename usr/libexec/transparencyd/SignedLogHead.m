@interface SignedLogHead
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (BOOL)gossip;
- (LogHead)parsedLogHead;
- (id)copyManagedObject:(id *)a3;
- (id)createManagedObjectWithError:(id *)a3;
- (id)diagnosticsJsonDictionary;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setGossip:(BOOL)a3;
- (void)storeSignatureResult:(unint64_t)a3 signatureError:(id *)a4;
@end

@implementation SignedLogHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___SignedLogHead);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedLogHead signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedLogHead,  "signedTypeWithObject:verifier:dataStore:",  a3,  0LL,  0LL);
}

- (id)diagnosticsJsonDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SignedLogHead;
  id v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v9, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 diagnosticsJsonDictionary]);
  [v5 setObject:v7 forKeyedSubscript:@"logHead"];

  return v5;
}

- (LogHead)parsedLogHead
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead"));
  if (v3
    && (v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead")),
        id v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead logHead](self, "logHead"));
    id v13 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___LogHead,  "parseFromData:error:",  v7,  &v13));
    id v9 = v13;

    if (v9)
    {
      if (qword_1002EEE90 != -1) {
        dispatch_once(&qword_1002EEE90, &stru_1002897B0);
      }
      v10 = (os_log_s *)qword_1002EEE98;
      if (os_log_type_enabled((os_log_t)qword_1002EEE98, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to parse log head from Signed Log Head: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    if (qword_1002EEE90 != -1) {
      dispatch_once(&qword_1002EEE90, &stru_100289790);
    }
    v11 = (os_log_s *)qword_1002EEE98;
    if (os_log_type_enabled((os_log_t)qword_1002EEE98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SLH missing log head", buf, 2u);
    }

    id v8 = 0LL;
  }

  return (LogHead *)v8;
}

- (id)copyManagedObject:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 application]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 logHeadHash]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v12 = [v11 logBeginningMs];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  uint64_t v14 = (int)[v13 logType];
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:",  v10,  0,  v7,  v12,  v14,  objc_msgSend(v15, "revision"),  a3));

  return v16;
}

- (id)createManagedObjectWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 application]));
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v5));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v18 = [v8 logBeginningMs];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 logHeadHash]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  uint64_t v12 = (int)[v11 logType];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v14 = [v13 revision];
  LOBYTE(v17) = -[SignedLogHead gossip](self, "gossip");
  id v15 = (void *)objc_claimAutoreleasedReturnValue( [v6 createTreeHead:v7 isMapHead:0 application:v19 logBeginTime:v18 logHeadHash:v10 logType:v12 revision:v14 gossip:v17]);

  return v15;
}

- (void)storeSignatureResult:(unint64_t)a3 signatureError:(id *)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001C2CF0;
  v8[3] = &unk_1002897F8;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  [v7 performBlockAndWait:v8];
}

- (unint64_t)verifyWithError:(id *)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001C307C;
  v12[3] = &unk_100285C28;
  v12[4] = self;
  id v5 = objc_retainBlock(v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedLogHead parsedLogHead](self, "parsedLogHead"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 application]));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySTHEvent",  v8));
  id v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v9,  3LL,  a3,  v5);

  return (unint64_t)v10;
}

- (BOOL)gossip
{
  return self->_gossip;
}

- (void)setGossip:(BOOL)a3
{
  self->_gossip = a3;
}

@end