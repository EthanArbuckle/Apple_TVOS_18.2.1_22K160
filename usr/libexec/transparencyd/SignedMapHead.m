@interface SignedMapHead
+ (id)signedTypeWithObject:(id)a3;
+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5;
- (MapHead)parsedMapHead;
- (id)copyManagedObject:(id *)a3;
- (id)createManagedObjectWithError:(id *)a3;
- (id)diagnosticsJsonDictionary;
- (unint64_t)overrideBeginTime;
- (unint64_t)verifyMMD:(double)a3 error:(id *)a4;
- (unint64_t)verifyWithError:(id *)a3;
- (void)setMMDVerifiedForMapHead:(unint64_t)a3 mmdError:(id)a4;
- (void)setOverrideBeginTime:(unint64_t)a3;
- (void)setOverrideBeginTimeFromLogEntry:(id)a3;
@end

@implementation SignedMapHead

+ (id)signedTypeWithObject:(id)a3 verifier:(id)a4 dataStore:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(&OBJC_CLASS___SignedMapHead);
  -[SignedObjectHolder setSignedObject:](v10, "setSignedObject:", v9);

  -[SignedObjectHolder setVerifier:](v10, "setVerifier:", v8);
  -[SignedObjectHolder setDataStore:](v10, "setDataStore:", v7);

  return v10;
}

+ (id)signedTypeWithObject:(id)a3
{
  return +[SignedMapHead signedTypeWithObject:verifier:dataStore:]( &OBJC_CLASS___SignedMapHead,  "signedTypeWithObject:verifier:dataStore:",  a3,  0LL,  0LL);
}

- (id)diagnosticsJsonDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SignedMapHead;
  id v3 = -[SignedObjectHolder diagnosticsJsonDictionary](&v10, "diagnosticsJsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 diagnosticsJsonDictionary]);
    [v5 setObject:v8 forKeyedSubscript:@"mapHead"];
  }

  return v5;
}

- (void)setOverrideBeginTimeFromLogEntry:(id)a3
{
  id v7 = a3;
  if ([v7 hasSlh])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v7 slh]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SignedLogHead signedTypeWithObject:](&OBJC_CLASS___SignedLogHead, "signedTypeWithObject:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 parsedLogHead]);
    -[SignedMapHead setOverrideBeginTime:](self, "setOverrideBeginTime:", [v6 logBeginningMs]);
  }
}

- (id)copyManagedObject:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 application]));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v6));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mapHeadHash]);
  unint64_t v11 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  if (v11)
  {
    id v12 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    id v12 = [v18 logBeginningMs];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  uint64_t v14 = (int)[v13 mapType];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "fetchTreeHead:isMapHead:application:logBeginTime:logType:revision:error:",  v10,  1,  v7,  v12,  v14,  objc_msgSend(v15, "revision"),  a3));

  if (!v11) {
  return v16;
  }
}

- (id)createManagedObjectWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 application]));
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder data](self, "data"));
  unint64_t v21 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  v22 = (void *)v6;
  if (v21)
  {
    id v20 = -[SignedMapHead overrideBeginTime](self, "overrideBeginTime");
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    id v20 = [v19 logBeginningMs];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mapHeadHash]);
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  uint64_t v12 = (int)[v11 mapType];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  id v14 = [v13 revision];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  LOWORD(v18) = [v15 populating];
  v16 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "createMapHead:application:logBeginTime:logHeadHash:logType:revision:populating:gossip:",  v8,  v22,  v20,  v10,  v12,  v14,  v18));

  if (!v21) {
  return v16;
  }
}

- (MapHead)parsedMapHead
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead"));
  if (v3
    && (v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead")),
        id v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead mapHead](self, "mapHead"));
    id v13 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyGPBMessage parseFromData:error:]( &OBJC_CLASS___MapHead,  "parseFromData:error:",  v7,  &v13));
    id v9 = v13;

    if (v9)
    {
      if (qword_1002EEEA0 != -1) {
        dispatch_once(&qword_1002EEEA0, &stru_100289898);
      }
      objc_super v10 = (os_log_s *)qword_1002EEEA8;
      if (os_log_type_enabled((os_log_t)qword_1002EEEA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "failed to parse map head from SignedMapHead: %@",  buf,  0xCu);
      }
    }
  }

  else
  {
    if (qword_1002EEEA0 != -1) {
      dispatch_once(&qword_1002EEEA0, &stru_100289878);
    }
    unint64_t v11 = (os_log_s *)qword_1002EEEA8;
    if (os_log_type_enabled((os_log_t)qword_1002EEEA8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SMH missing map head", buf, 2u);
    }

    id v8 = 0LL;
  }

  return (MapHead *)v8;
}

- (unint64_t)verifyWithError:(id *)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001C41FC;
  v12[3] = &unk_100285C28;
  v12[4] = self;
  id v5 = objc_retainBlock(v12);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 application]));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySMHEvent",  v8));
  id v10 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:validateType:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:validateType:error:block:",  v9,  3LL,  a3,  v5);

  return (unint64_t)v10;
}

- (void)setMMDVerifiedForMapHead:(unint64_t)a3 mmdError:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignedObjectHolder dataStore](self, "dataStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001C4818;
  v9[3] = &unk_1002794B0;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (unint64_t)verifyMMD:(double)a3 error:(id *)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001C4B28;
  v15[3] = &unk_100289960;
  v15[4] = self;
  *(double *)&v15[5] = a3;
  id v6 = objc_retainBlock(v15);
  id v14 = 0LL;
  id v7 = -[SignedMapHead verifyWithError:](self, "verifyWithError:", &v14);
  id v8 = v14;
  +[TransparencyMapEntryVerifier storeSMHSignatureResult:smh:error:]( &OBJC_CLASS___TransparencyMapEntryVerifier,  "storeSMHSignatureResult:smh:error:",  v7,  self,  v8);
  if (a4 && v8) {
    *a4 = v8;
  }
  if (v7 == (id)1)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignedMapHead parsedMapHead](self, "parsedMapHead"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v9 application]));
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationIdentifierForValue:]( &OBJC_CLASS___TransparencyApplication,  "applicationIdentifierForValue:",  v10));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics formatEventName:application:]( &OBJC_CLASS___TransparencyAnalytics,  "formatEventName:application:",  @"VerifySMHEvent",  v11));
    id v7 = +[TransparencyAnalytics doKTResultWithAnalyticsForEventName:error:block:]( &OBJC_CLASS___TransparencyAnalytics,  "doKTResultWithAnalyticsForEventName:error:block:",  v12,  a4,  v6);
  }

  return (unint64_t)v7;
}

- (unint64_t)overrideBeginTime
{
  return self->_overrideBeginTime;
}

- (void)setOverrideBeginTime:(unint64_t)a3
{
  self->_overrideBeginTime = a3;
}

@end