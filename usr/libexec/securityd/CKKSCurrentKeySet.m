@interface CKKSCurrentKeySet
+ (id)loadForZone:(id)a3 contextID:(id)a4;
- (BOOL)proposed;
- (CKKSCurrentKeyPointer)currentClassAPointer;
- (CKKSCurrentKeyPointer)currentClassCPointer;
- (CKKSCurrentKeyPointer)currentTLKPointer;
- (CKKSCurrentKeySet)initWithZoneID:(id)a3 contextID:(id)a4;
- (CKKSKey)classA;
- (CKKSKey)classC;
- (CKKSKey)tlk;
- (CKRecordZoneID)zoneID;
- (NSArray)pendingTLKShares;
- (NSError)error;
- (NSString)contextID;
- (id)asKeychainBackedSet:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setClassA:(id)a3;
- (void)setClassC:(id)a3;
- (void)setCurrentClassAPointer:(id)a3;
- (void)setCurrentClassCPointer:(id)a3;
- (void)setCurrentTLKPointer:(id)a3;
- (void)setError:(id)a3;
- (void)setPendingTLKShares:(id)a3;
- (void)setProposed:(BOOL)a3;
- (void)setTlk:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCurrentKeySet

- (CKKSCurrentKeySet)initWithZoneID:(id)a3 contextID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CKKSCurrentKeySet;
  v9 = -[CKKSCurrentKeySet init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneID, a3);
    objc_storeStrong((id *)&v10->_contextID, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));

  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet contextID](self, "contextID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet zoneID](self, "zoneID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneName]);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](self, "currentTLKPointer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v18 currentKeyUUID]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](self, "currentClassAPointer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentKeyUUID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](self, "currentClassCPointer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentKeyUUID]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  BOOL v11 = -[CKKSCurrentKeySet proposed](self, "proposed");
  BOOL v12 = v11;
  if (v3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));
    BOOL v17 = v12;
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d %@>",  v20,  v22,  v21,  v4,  v6,  v7,  v9,  v10,  v17,  v13));
  }

  else
  {
    v14 = (void *)v20;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSCurrentKeySet[%@](%@): %@:%@ %@:%@ %@:%@ new:%d>",  v20,  v22,  v21,  v4,  v6,  v7,  v9,  v10,  v11));
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class(self, a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet zoneID](self, "zoneID"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setZoneID:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](self, "currentTLKPointer"));
  id v9 = [v8 copyWithZone:a3];
  [v5 setCurrentTLKPointer:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](self, "currentClassAPointer"));
  id v11 = [v10 copyWithZone:a3];
  [v5 setCurrentClassAPointer:v11];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](self, "currentClassCPointer"));
  id v13 = [v12 copyWithZone:a3];
  [v5 setCurrentClassCPointer:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  id v15 = [v14 copyWithZone:a3];
  [v5 setTlk:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  id v17 = [v16 copyWithZone:a3];
  [v5 setClassA:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  id v19 = [v18 copyWithZone:a3];
  [v5 setClassC:v19];

  objc_msgSend(v5, "setProposed:", -[CKKSCurrentKeySet proposed](self, "proposed"));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet error](self, "error"));
  id v21 = [v20 copyWithZone:a3];
  [v5 setError:v21];

  return v5;
}

- (id)asKeychainBackedSet:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet tlk](self, "tlk"));
  id v20 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getKeychainBackedKey:&v20]);
  id v7 = v20;

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classA](self, "classA"));
  id v19 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getKeychainBackedKey:&v19]);
  id v10 = v19;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet classC](self, "classC"));
  id v18 = 0LL;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 getKeychainBackedKey:&v18]);
  id v13 = v18;

  if (v6 && v9 && v12)
  {
    v14 = -[CKKSKeychainBackedKeySet initWithTLK:classA:classC:newUpload:]( objc_alloc(&OBJC_CLASS___CKKSKeychainBackedKeySet),  "initWithTLK:classA:classC:newUpload:",  v6,  v9,  v12,  -[CKKSCurrentKeySet proposed](self, "proposed"));
  }

  else if (a3)
  {
    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = v13;
    }
    if (v7) {
      id v16 = v7;
    }
    else {
      id v16 = v15;
    }
    v14 = 0LL;
    *a3 = objc_autorelease((id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  53LL,  @"unable to make keychain backed set; key is missing",
                                   v16)));
  }

  else
  {
    v14 = 0LL;
  }

  return v14;
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setError:(id)a3
{
}

- (CKKSKey)tlk
{
  return (CKKSKey *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setTlk:(id)a3
{
}

- (CKKSKey)classA
{
  return (CKKSKey *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setClassA:(id)a3
{
}

- (CKKSKey)classC
{
  return (CKKSKey *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setClassC:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentTLKPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCurrentTLKPointer:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentClassAPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCurrentClassAPointer:(id)a3
{
}

- (CKKSCurrentKeyPointer)currentClassCPointer
{
  return (CKKSCurrentKeyPointer *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCurrentClassCPointer:(id)a3
{
}

- (BOOL)proposed
{
  return self->_proposed;
}

- (void)setProposed:(BOOL)a3
{
  self->_proposed = a3;
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setPendingTLKShares:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)loadForZone:(id)a3 contextID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  context = objc_autoreleasePoolPush();
  id v7 = -[CKKSCurrentKeySet initWithZoneID:contextID:]( objc_alloc(&OBJC_CLASS___CKKSCurrentKeySet),  "initWithZoneID:contextID:",  v5,  v6);
  id v39 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"tlk",  v6,  v5,  &v39));
  id v9 = v39;
  -[CKKSCurrentKeySet setCurrentTLKPointer:](v7, "setCurrentTLKPointer:", v8);

  id v38 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classA",  v6,  v5,  &v38));
  id v11 = v38;

  -[CKKSCurrentKeySet setCurrentClassAPointer:](v7, "setCurrentClassAPointer:", v10);
  id v37 = v11;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeyPointer tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSCurrentKeyPointer,  "tryFromDatabase:contextID:zoneID:error:",  @"classC",  v6,  v5,  &v37));
  id v13 = v37;

  -[CKKSCurrentKeySet setCurrentClassCPointer:](v7, "setCurrentClassCPointer:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](v7, "currentTLKPointer"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentKeyUUID]);
  if (v15)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentTLKPointer](v7, "currentTLKPointer"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 currentKeyUUID]);
    id v36 = v13;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v17,  v6,  v5,  &v36));
    id v19 = v36;

    -[CKKSCurrentKeySet setTlk:](v7, "setTlk:", v18);
    id v13 = v19;
  }

  else
  {
    -[CKKSCurrentKeySet setTlk:](v7, "setTlk:", 0LL);
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](v7, "currentClassAPointer"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentKeyUUID]);
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassAPointer](v7, "currentClassAPointer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 currentKeyUUID]);
    id v35 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v23,  v6,  v5,  &v35));
    id v25 = v35;

    -[CKKSCurrentKeySet setClassA:](v7, "setClassA:", v24);
    id v13 = v25;
  }

  else
  {
    -[CKKSCurrentKeySet setClassA:](v7, "setClassA:", 0LL);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](v7, "currentClassCPointer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 currentKeyUUID]);
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSCurrentKeySet currentClassCPointer](v7, "currentClassCPointer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue([v28 currentKeyUUID]);
    id v34 = v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey tryFromDatabase:contextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "tryFromDatabase:contextID:zoneID:error:",  v29,  v6,  v5,  &v34));
    id v31 = v34;

    -[CKKSCurrentKeySet setClassC:](v7, "setClassC:", v30);
    id v13 = v31;
  }

  else
  {
    -[CKKSCurrentKeySet setClassC:](v7, "setClassC:", 0LL);
  }

  -[CKKSCurrentKeySet setPendingTLKShares:](v7, "setPendingTLKShares:", 0LL);
  -[CKKSCurrentKeySet setProposed:](v7, "setProposed:", 0LL);
  -[CKKSCurrentKeySet setError:](v7, "setError:", v13);

  objc_autoreleasePoolPop(context);
  return v7;
}

@end