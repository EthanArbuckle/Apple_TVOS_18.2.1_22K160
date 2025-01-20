@interface KTPCSOperations
+ (id)PCSOperationWithSpecificUser:(id)a3;
- (KTPCSOperations)initWithSpecificUser:(id)a3;
- (NSString)altDSID;
- (NSString)dsid;
- (_PCSIdentitySetData)set;
- (id)getCurrentKTPCSIdentity:(id)a3 error:(id *)a4;
- (void)createManateeIdentity:(id)a3 service:(id)a4 complete:(id)a5;
- (void)dealloc;
- (void)setAltDSID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setSet:(_PCSIdentitySetData *)a3;
@end

@implementation KTPCSOperations

+ (id)PCSOperationWithSpecificUser:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSpecificUser:v4];

  return v5;
}

- (KTPCSOperations)initWithSpecificUser:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KTPCSOperations;
  CFTypeRef cf = 0LL;
  id v5 = -[KTPCSOperations init](&v17, "init");
  if (!v5)
  {
LABEL_9:
    v13 = 0LL;
    goto LABEL_18;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 dsid]);
  -[KTPCSOperations setDsid:](v5, "setDsid:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](v5, "dsid"));
  if (!v7)
  {
    if (qword_1002EEC20 != -1) {
      dispatch_once(&qword_1002EEC20, &stru_100286730);
    }
    v14 = (os_log_s *)qword_1002EEC28;
    if (os_log_type_enabled((os_log_t)qword_1002EEC28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "initWithSpecificUser dsid is NULL", buf, 2u);
    }

    goto LABEL_9;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  -[KTPCSOperations setAltDSID:](v5, "setAltDSID:", v8);

  uint64_t v21 = kPCSSetupDSID;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](v5, "dsid"));
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  id v11 = [v10 mutableCopy];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](v5, "altDSID"));
  [v11 setObject:v12 forKeyedSubscript:kPCSSetupAltDSID];

  -[KTPCSOperations setSet:](v5, "setSet:", PCSIdentitySetCreate(v11, 0LL, &cf));
  if (-[KTPCSOperations set](v5, "set"))
  {
    v13 = v5;
  }

  else
  {
    if (qword_1002EEC20 != -1) {
      dispatch_once(&qword_1002EEC20, &stru_100286750);
    }
    v15 = (os_log_s *)qword_1002EEC28;
    if (os_log_type_enabled((os_log_t)qword_1002EEC28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v20 = cf;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "PCSIdentitySetCreate: %@", buf, 0xCu);
    }

    if (cf) {
      CFRelease(cf);
    }
    v13 = 0LL;
  }

LABEL_18:
  return v13;
}

- (void)dealloc
{
  set = self->_set;
  if (set)
  {
    CFRelease(set);
    self->_set = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KTPCSOperations;
  -[KTPCSOperations dealloc](&v4, "dealloc");
}

- (void)createManateeIdentity:(id)a3 service:(id)a4 complete:(id)a5
{
  id v8 = a5;
  v19[0] = kPCSSetupDSID;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](self, "dsid"));
  v19[1] = kPCSSetupSyncIdentity;
  v20[0] = v11;
  v20[1] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  2LL));
  id v13 = [v12 mutableCopy];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](self, "altDSID"));
  [v13 setObject:v14 forKeyedSubscript:kPCSSetupAltDSID];

  LODWORD(v14) = [v10 roll];
  if ((_DWORD)v14) {
    [v13 setObject:&__kCFBooleanTrue forKeyedSubscript:kPCSSetupRollIdentity];
  }
  v15 = -[KTPCSOperations set](self, "set");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001864D0;
  v17[3] = &unk_100286798;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  PCSIdentitySetCreateManatee(v15, v9, v13, v17);
}

- (id)getCurrentKTPCSIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v15 = 0LL;
  uint64_t v7 = kTransparencyFlagForceCDPWaiting;
  if (+[TransparencySettings getBool:defaultValue:]( &OBJC_CLASS___TransparencySettings,  "getBool:defaultValue:",  kTransparencyFlagForceCDPWaiting,  0LL))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -350LL,  @"Identity creation failed: %@ set",  v7));
    id v9 = v8;
    if (a4 && v8) {
      *a4 = v8;
    }
  }

  else
  {
    uint64_t v11 = PCSIdentitySetCopyCurrentIdentityPointer(-[KTPCSOperations set](self, "set"), v6, &v15);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v10) {
      goto LABEL_12;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations dsid](self, "dsid"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPCSOperations altDSID](self, "altDSID"));
      *(_DWORD *)buf = 138412802;
      objc_super v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PCSIdentitySetCopyCurrentIdentityWithError: %@[%@] %@",  buf,  0x20u);
    }

    if (a4)
    {
      id v10 = 0LL;
      *a4 = v15;
      goto LABEL_12;
    }
  }

  id v10 = 0LL;
LABEL_12:

  return v10;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (void).cxx_destruct
{
}

@end