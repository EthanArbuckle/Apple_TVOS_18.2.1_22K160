@interface ZhuGeService
- (Class)supportAssistantClass;
- (NSString)armoryClassName;
- (NSString)baseEntitlement;
- (NSString)domainString;
- (id)isCallerEntitledforInternalKey:(id)a3 withError:(id *)a4;
- (id)isCallerEntitledforKey:(id)a3 withError:(id *)a4;
- (void)assertCallerEntitledForInternalService;
- (void)assertCallerEntitledForService;
- (void)initData;
- (void)setBulkInternalKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkInternalMGKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setBulkMGKeys:(id)a3 getValuesAndError:(id)a4;
- (void)setInternalKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6;
- (void)setInternalMGKey:(id)a3 getValueAndError:(id)a4;
- (void)setKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6;
- (void)setMGKey:(id)a3 getValueAndError:(id)a4;
@end

@implementation ZhuGeService

- (void)initData
{
  baseEntitlement = self->_baseEntitlement;
  self->_baseEntitlement = (NSString *)@"com.apple.private.ZhuGeSupport.CopyValue";

  self->_supportAssistantClass = (Class)objc_opt_class(&OBJC_CLASS___ZhuGeSupportAssistant);
  armoryClassName = self->_armoryClassName;
  self->_armoryClassName = (NSString *)@"OBJC_CLASS_$_AppleDeviceQueryArmory";

  domainString = self->_domainString;
  self->_domainString = (NSString *)&stru_100014878;
}

- (void)assertCallerEntitledForService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A8D8;
  block[3] = &unk_1000146E8;
  block[4] = self;
  if (qword_10001A2A8 != -1) {
    dispatch_once(&qword_10001A2A8, block);
  }
  if ((byte_10001A2B0 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 xpcConnection]);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 processIdentifier]));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService assertCallerEntitledForService]",  87LL,  @"Failed to validate ZhuGe service entitlement for pid %@!",  v5,  v6,  v7,  (uint64_t)v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 xpcConnection]);
    [v9 invalidate];
  }

- (id)isCallerEntitledforKey:(id)a3 withError:(id *)a4
{
  id v9 = a3;
  if (qword_10001A2B8 != -1) {
    dispatch_once(&qword_10001A2B8, &stru_100014708);
  }
  if (!v9)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  112LL,  @"key pointer is nil!",  v6,  v7,  v8,  v43);
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    v15 = 0LL;
    v16 = 0LL;
    id v17 = 0LL;
LABEL_7:
    *a4 = v18;
    goto LABEL_8;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([(id)qword_10001A2C0 getCacheForKey:v9]);
  v11 = (void *)qword_10001A2C8;
  qword_10001A2C8 = v10;

  if (qword_10001A2C8)
  {
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  120LL,  @"Get entitlement validation result for key %@ from cache",  v12,  v13,  v14,  (uint64_t)v9);
    v15 = 0LL;
    v16 = 0LL;
    id v17 = 0LL;
    goto LABEL_8;
  }

  v21 = -[ZhuGeService supportAssistantClass](self, "supportAssistantClass");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeService armoryClassName](self, "armoryClassName"));
  id v46 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class getSharedInstanceByName:withError:](v21, "getSharedInstanceByName:withError:", v22, &v46));
  id v17 = v46;

  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  127LL,  @"Failed to get the dylib shared instance!",  v23,  v24,  v25,  v43);
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  13LL,  0LL));
    v16 = 0LL;
    goto LABEL_7;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue([v15 helper]);
  id v45 = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v26 getConfigOfKey:v9 withError:&v45]);
  id v27 = v45;

  if (!v16)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  134LL,  @"Failed to get configuration for key %@!",  v28,  v29,  v30,  (uint64_t)v9);
    id v18 = v27;
    id v17 = v18;
    goto LABEL_7;
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue([v31 xpcConnection]);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"ENTITLEMENT"]);
  char v34 = isXPCConnectionEntitled(v32, v33);

  if ((v34 & 1) != 0)
  {
    v38 = (void *)qword_10001A2C8;
    qword_10001A2C8 = (uint64_t)&__kCFBooleanTrue;

    id v44 = v27;
    unsigned __int8 v39 = [(id)qword_10001A2C0 setCache:qword_10001A2C8 forKey:v9 withError:&v44];
    id v17 = v44;

    if ((v39 & 1) == 0) {
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  149LL,  @"Failed to cache entitlement validation result for key %@, error: %@!",  v40,  v41,  v42,  (uint64_t)v9);
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforKey:withError:]",  140LL,  @"Current XPC connection is not entitled for key %@!",  v35,  v36,  v37,  (uint64_t)v9);
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  68LL,  0LL));
  }

- (void)assertCallerEntitledForInternalService
{
  if (qword_10001A2D0 != -1) {
    dispatch_once(&qword_10001A2D0, &stru_100014728);
  }
  if ((byte_10001A2D8 & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 xpcConnection]);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v3 processIdentifier]));
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService assertCallerEntitledForInternalService]",  170LL,  @"Failed to validate ZhuGe internal service entitlement for pid %@!",  v5,  v6,  v7,  (uint64_t)v4);

    id v9 = (id)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 xpcConnection]);
    [v8 invalidate];
  }

- (id)isCallerEntitledforInternalKey:(id)a3 withError:(id *)a4
{
  id v8 = a3;
  if (qword_10001A2E0 != -1) {
    dispatch_once(&qword_10001A2E0, &stru_100014748);
  }
  if (!v8)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  195LL,  @"key pointer is nil!",  v5,  v6,  v7,  v41);
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    uint64_t v14 = 0LL;
    v15 = 0LL;
    id v16 = 0LL;
LABEL_7:
    *a4 = v17;
    goto LABEL_8;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([(id)qword_10001A2E8 getCacheForKey:v8]);
  uint64_t v10 = (void *)qword_10001A2F0;
  qword_10001A2F0 = v9;

  if (qword_10001A2F0)
  {
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  203LL,  @"Get entitlement validation result for internal key %@ from cache",  v11,  v12,  v13,  (uint64_t)v8);
    uint64_t v14 = 0LL;
    v15 = 0LL;
    id v16 = 0LL;
    goto LABEL_8;
  }

  id v44 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeSupportAssistant getSharedInstanceByName:withError:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "getSharedInstanceByName:withError:",  @"OBJC_CLASS_$_ZhuGeInternalArmory",  &v44));
  id v23 = v44;
  if (!v14)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  210LL,  @"Failed to get the internal dylib shared instance!",  v20,  v21,  v22,  v41);
    id v17 = v23;
    id v16 = v17;
    v15 = 0LL;
    goto LABEL_7;
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v14 helper]);
  id v43 = v23;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v24 getConfigOfKey:v8 withError:&v43]);
  id v25 = v43;

  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  217LL,  @"Failed to get configuration for internal key %@!",  v26,  v27,  v28,  (uint64_t)v8);
    id v17 = v25;
    id v16 = v17;
    goto LABEL_7;
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[ZhuGeSingletonService sharedInstance](&OBJC_CLASS___ZhuGeLockerService, "sharedInstance"));
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 xpcConnection]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"ENTITLEMENT"]);
  char v32 = isXPCConnectionEntitled(v30, v31);

  if ((v32 & 1) != 0)
  {
    uint64_t v36 = (void *)qword_10001A2F0;
    qword_10001A2F0 = (uint64_t)&__kCFBooleanTrue;

    id v42 = v25;
    unsigned __int8 v37 = [(id)qword_10001A2E8 setCache:qword_10001A2F0 forKey:v8 withError:&v42];
    id v16 = v42;

    if ((v37 & 1) == 0) {
      ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  232LL,  @"Failed to cache entitlement validation result for internal key %@, error: %@!",  v38,  v39,  v40,  (uint64_t)v8);
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService isCallerEntitledforInternalKey:withError:]",  223LL,  @"Current XPC connection is not entitled for internal key %@!",  v33,  v34,  v35,  (uint64_t)v8);
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  68LL,  0LL));
  }

- (void)setKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *, id))a6;
  -[ZhuGeService assertCallerEntitledForService](self, "assertCallerEntitledForService");
  if (!v10)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]",  256LL,  @"key pointer is nil!",  v14,  v15,  v16,  v33);
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v17 = 0LL;
LABEL_8:
    uint64_t v24 = 0LL;
    uint64_t v29 = 0LL;
    goto LABEL_9;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]",  261LL,  @"Received key: \"%@\"",  v14,  v15,  v16,  (uint64_t)v10);
  id v37 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[ZhuGeService isCallerEntitledforKey:withError:]( self,  "isCallerEntitledforKey:withError:",  v10,  &v37));
  id v21 = v37;
  if (!v17)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]",  265LL,  @"The caller is not entitled for key %@!",  v18,  v19,  v20,  (uint64_t)v10);
    goto LABEL_8;
  }

  uint64_t v22 = -[ZhuGeService supportAssistantClass](self, "supportAssistantClass");
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeService armoryClassName](self, "armoryClassName"));
  id v36 = v21;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class getSharedInstanceByName:withError:](v22, "getSharedInstanceByName:withError:", v23, &v36));
  id v25 = v36;

  if (v24)
  {
    id v35 = v25;
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v24 queryKey:v10 andOptions:v11 andPreferences:v12 withError:&v35]);
    id v21 = v35;

    if (!v29) {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]",  290LL,  @"%@ query failed!",  v30,  v31,  v32,  (uint64_t)v10);
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]",  284LL,  @"Failed to get the dylib shared instance!",  v26,  v27,  v28,  v34);
    uint64_t v29 = 0LL;
    id v21 = v25;
  }

- (void)setBulkKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  id v36 = (void (**)(id, id, void *))a4;
  -[ZhuGeService assertCallerEntitledForService](self, "assertCallerEntitledForService");
  id v35 = v6;
  if (v6)
  {
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkKeys:getValuesAndError:]",  313LL,  @"Begin: bulk query keys",  v7,  v8,  v9,  v32);
    uint64_t v38 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v11)
    {
      uint64_t v37 = *(void *)v53;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v13]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"Options"]);

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v13]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"Preferences"]);

          uint64_t v46 = 0LL;
          v47 = &v46;
          uint64_t v48 = 0x3032000000LL;
          v49 = sub_10000BA20;
          v50 = sub_10000BA30;
          id v51 = 0LL;
          uint64_t v40 = 0LL;
          uint64_t v41 = &v40;
          uint64_t v42 = 0x3032000000LL;
          id v43 = sub_10000BA20;
          id v44 = sub_10000BA30;
          id v45 = 0LL;
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeService domainString](self, "domainString"));
          ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkKeys:getValuesAndError:]",  324LL,  @"In bulk query, query key: %@ in %@entrusted way",  v18,  v19,  v20,  v13);

          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472LL;
          v39[2] = sub_10000BA38;
          v39[3] = &unk_100014770;
          v39[4] = &v46;
          v39[5] = &v40;
          -[ZhuGeService setKey:andOptions:andPreferences:getValueAndError:]( self,  "setKey:andOptions:andPreferences:getValueAndError:",  v13,  v15,  v17,  v39);
          uint64_t v24 = v47[5];
          if (v24)
          {
            v56 = @"Value";
            uint64_t v57 = v24;
            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v57,  &v56,  1LL));
          }

          else
          {
            ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkKeys:getValuesAndError:]",  332LL,  @"In bulk query, key %@ failed! Error: %@",  v21,  v22,  v23,  v13);
            uint64_t v26 = v41[5];
            v58 = @"Error";
            uint64_t v59 = v26;
            id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v59,  &v58,  1LL));
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v38, "setObject:forKeyedSubscript:", v25, v13);

          _Block_object_dispose(&v40, 8);
          _Block_object_dispose(&v46, 8);
        }

        id v11 = [v10 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }

      while (v11);
    }

    uint64_t v30 = v38;
    uint64_t v31 = 0LL;
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkKeys:getValuesAndError:]",  308LL,  @"keysDict pointer is nil!",  v7,  v8,  v9,  v32);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    uint64_t v30 = 0LL;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkKeys:getValuesAndError:]",  344LL,  @"End: bulk query keys",  v27,  v28,  v29,  v33);
  v36[2](v36, v30, v31);
}

- (void)setInternalKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 getValueAndError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, id))a6;
  uint64_t v39 = 0LL;
  uint64_t v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = sub_10000BA20;
  id v43 = sub_10000BA30;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = sub_10000BA20;
  uint64_t v37 = sub_10000BA30;
  id v38 = 0LL;
  -[ZhuGeService assertCallerEntitledForInternalService](self, "assertCallerEntitledForInternalService");
  if (!v10)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]",  363LL,  @"key pointer is nil!",  v14,  v15,  v16,  v29);
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v28 = v40[5];
    v40[5] = (id)v27;

LABEL_7:
    uint64_t v23 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_8;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]",  368LL,  @"Received internal key: \"%@\"",  v14,  v15,  v16,  (uint64_t)v10);
  id v17 = v40;
  id obj = v40[5];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[ZhuGeService isCallerEntitledforInternalKey:withError:]( self,  "isCallerEntitledforInternalKey:withError:",  v10,  &obj));
  objc_storeStrong(v17 + 5, obj);
  if (!v18)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]",  372LL,  @"The caller is not entitled for internal key %@!",  v19,  v20,  v21,  (uint64_t)v10);
    goto LABEL_7;
  }

  uint64_t v22 = v40;
  id v31 = v40[5];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeInternalSupportAssistant getXpcProxyWithError:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "getXpcProxyWithError:",  &v31));
  objc_storeStrong(v22 + 5, v31);
  if (v23)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000BD78;
    v30[3] = &unk_100014770;
    v30[4] = &v33;
    v30[5] = &v39;
    [v23 setKey:v10 andOptions:v11 andPreferences:v12 getValueAndError:v30];
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalKey:andOptions:andPreferences:getValueAndError:]",  379LL,  @"Failed to get internal service proxy for internal key %@!",  v24,  v25,  v26,  (uint64_t)v10);
    uint64_t v23 = 0LL;
  }

- (void)setBulkInternalKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v31 = 0LL;
  uint64_t v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_10000BA20;
  uint64_t v35 = sub_10000BA30;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = sub_10000BA20;
  uint64_t v29 = sub_10000BA30;
  id v30 = 0LL;
  -[ZhuGeService assertCallerEntitledForInternalService](self, "assertCallerEntitledForInternalService");
  if (!v6)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]",  403LL,  @"keysDict pointer is nil!",  v8,  v9,  v10,  v21);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v20 = v32[5];
    v32[5] = (id)v19;

LABEL_7:
    id v12 = 0LL;
    goto LABEL_8;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]",  408LL,  @"Begin: bulk query internal keys",  v8,  v9,  v10,  v21);
  id v11 = v32;
  id obj = v32[5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeInternalSupportAssistant getXpcProxyWithError:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "getXpcProxyWithError:",  &obj));
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]",  413LL,  @"In bulk query, failed to get internal service proxy for internal keys!",  v13,  v14,  v15,  v22);
    goto LABEL_7;
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000C064;
  v23[3] = &unk_100014798;
  v23[4] = &v25;
  v23[5] = &v31;
  [v12 setBulkKeys:v6 getValuesAndError:v23];
  if (!v26[5]) {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]",  423LL,  @"In bulk query, failed to query internal keys!",  v16,  v17,  v18,  v22);
  }
LABEL_8:
  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalKeys:getValuesAndError:]",  428LL,  @"End: bulk query internal keys",  v16,  v17,  v18,  v22);
  v7[2](v7, v26[5], v32[5]);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (void)setMGKey:(id)a3 getValueAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  -[ZhuGeService assertCallerEntitledForService](self, "assertCallerEntitledForService");
  if (v6)
  {
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setMGKey:getValueAndError:]",  447LL,  @"Trying MG key \"%@\"",  v8,  v9,  v10,  (uint64_t)v6);
    id v18 = 0LL;
    id v11 = MGQuery(v6, &v18);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    id v16 = v18;
    if (!v12) {
      ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setMGKey:getValueAndError:]",  452LL,  @"%@ query failed!",  v13,  v14,  v15,  (uint64_t)v6);
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setMGKey:getValueAndError:]",  442LL,  @"key pointer is nil!",  v8,  v9,  v10,  v17);
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v12 = 0LL;
  }

  v7[2](v7, v12, v16);
}

- (void)setBulkMGKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v32 = (void (**)(id, id, void *))a4;
  -[ZhuGeService assertCallerEntitledForService](self, "assertCallerEntitledForService");
  uint64_t v31 = v6;
  if (v6)
  {
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkMGKeys:getValuesAndError:]",  476LL,  @"Begin: bulk query MG keys",  v7,  v8,  v9,  v28);
    uint64_t v34 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v6;
    id v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v49;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8LL * (void)i);
          uint64_t v42 = 0LL;
          id v43 = &v42;
          uint64_t v44 = 0x3032000000LL;
          id v45 = sub_10000BA20;
          uint64_t v46 = sub_10000BA30;
          id v47 = 0LL;
          uint64_t v36 = 0LL;
          uint64_t v37 = &v36;
          uint64_t v38 = 0x3032000000LL;
          uint64_t v39 = sub_10000BA20;
          uint64_t v40 = sub_10000BA30;
          id v41 = 0LL;
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[ZhuGeService domainString](self, "domainString"));
          ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkMGKeys:getValuesAndError:]",  485LL,  @"In bulk query, query key: %@ from %@entrusted MG",  v14,  v15,  v16,  v13);

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_10000C5E8;
          v35[3] = &unk_100014770;
          v35[4] = &v42;
          v35[5] = &v36;
          -[ZhuGeService setMGKey:getValueAndError:](self, "setMGKey:getValueAndError:", v13, v35);
          uint64_t v20 = v43[5];
          if (v20)
          {
            __int128 v52 = @"Value";
            uint64_t v53 = v20;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
          }

          else
          {
            ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkMGKeys:getValuesAndError:]",  493LL,  @"In bulk query, MG Key %@ failed! Error: %@",  v17,  v18,  v19,  v13);
            uint64_t v22 = v37[5];
            __int128 v54 = @"Error";
            uint64_t v55 = v22;
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v21, v13);

          _Block_object_dispose(&v36, 8);
          _Block_object_dispose(&v42, 8);
        }

        id v10 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      }

      while (v10);
    }

    uint64_t v26 = v34;
    uint64_t v27 = 0LL;
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkMGKeys:getValuesAndError:]",  471LL,  @"keysList pointer is nil!",  v7,  v8,  v9,  v28);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    uint64_t v26 = 0LL;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkMGKeys:getValuesAndError:]",  505LL,  @"End: bulk query MG keys",  v23,  v24,  v25,  v29);
  v32[2](v32, v26, v27);
}

- (void)setInternalMGKey:(id)a3 getValueAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v27 = 0LL;
  uint64_t v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_10000BA20;
  uint64_t v31 = sub_10000BA30;
  id v32 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10000BA20;
  uint64_t v25 = sub_10000BA30;
  id v26 = 0LL;
  -[ZhuGeService assertCallerEntitledForInternalService](self, "assertCallerEntitledForInternalService");
  if (!v6)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalMGKey:getValueAndError:]",  520LL,  @"key pointer is nil!",  v8,  v9,  v10,  v18);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v17 = v28[5];
    v28[5] = (id)v16;

LABEL_6:
    id v12 = 0LL;
    goto LABEL_7;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalMGKey:getValueAndError:]",  525LL,  @"Trying internal MG key \"%@\"",  v8,  v9,  v10,  (uint64_t)v6);
  uint64_t v11 = v28;
  id obj = v28[5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeInternalSupportAssistant getXpcProxyWithError:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "getXpcProxyWithError:",  &obj));
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setInternalMGKey:getValueAndError:]",  530LL,  @"Failed to get internal service proxy for internal MG key %@!",  v13,  v14,  v15,  (uint64_t)v6);
    goto LABEL_6;
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10000C884;
  v19[3] = &unk_100014770;
  v19[4] = &v21;
  v19[5] = &v27;
  [v12 setMGKey:v6 getValueAndError:v19];
LABEL_7:
  v7[2](v7, v22[5], v28[5]);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

- (void)setBulkInternalMGKeys:(id)a3 getValuesAndError:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  uint64_t v31 = 0LL;
  id v32 = (id *)&v31;
  uint64_t v33 = 0x3032000000LL;
  uint64_t v34 = sub_10000BA20;
  uint64_t v35 = sub_10000BA30;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = sub_10000BA20;
  uint64_t v29 = sub_10000BA30;
  id v30 = 0LL;
  -[ZhuGeService assertCallerEntitledForInternalService](self, "assertCallerEntitledForInternalService");
  if (!v6)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]",  554LL,  @"keysList pointer is nil!",  v8,  v9,  v10,  v21);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSError errorWithZhuGeErrorCode:underlyingError:]( &OBJC_CLASS___NSError,  "errorWithZhuGeErrorCode:underlyingError:",  45LL,  0LL));
    id v20 = v32[5];
    v32[5] = (id)v19;

LABEL_7:
    id v12 = 0LL;
    goto LABEL_8;
  }

  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]",  559LL,  @"Begin: bulk query internal MG keys",  v8,  v9,  v10,  v21);
  uint64_t v11 = v32;
  id obj = v32[5];
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ZhuGeInternalSupportAssistant getXpcProxyWithError:]( &OBJC_CLASS___ZhuGeInternalSupportAssistant,  "getXpcProxyWithError:",  &obj));
  objc_storeStrong(v11 + 5, obj);
  if (!v12)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]",  564LL,  @"In bulk query, failed to get internal service proxy for internal MG keys!",  v13,  v14,  v15,  v22);
    goto LABEL_7;
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10000CB70;
  v23[3] = &unk_100014798;
  v23[4] = &v25;
  v23[5] = &v31;
  [v12 setBulkMGKeys:v6 getValuesAndError:v23];
  if (!v26[5]) {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]",  574LL,  @"In bulk query, failed to query internal MG keys!",  v16,  v17,  v18,  v22);
  }
LABEL_8:
  ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m",  "-[ZhuGeService setBulkInternalMGKeys:getValuesAndError:]",  579LL,  @"End: bulk query internal MG keys",  v16,  v17,  v18,  v22);
  v7[2](v7, v26[5], v32[5]);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
}

- (NSString)baseEntitlement
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (Class)supportAssistantClass
{
  return self->_supportAssistantClass;
}

- (NSString)armoryClassName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)domainString
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void).cxx_destruct
{
}

@end