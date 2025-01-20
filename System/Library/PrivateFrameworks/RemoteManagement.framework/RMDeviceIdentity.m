@interface RMDeviceIdentity
+ (RMDeviceIdentity)sharedDeviceIdentity;
+ (id)deviceIdentityForTesting;
- (BOOL)_validDeviceIdentityCache;
- (NSArray)certificates;
- (RMDeviceIdentity)deviceIdentityWithCompletionHandler:(id)a3;
- (RMDeviceIdentity)init;
- (__SecKey)privateKey;
- (void)_cachePrivateKey:(__SecKey *)a3 certificates:(id)a4;
- (void)_copyPersistedIdentityWithFileName:(id)a3 isBAA:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchDeviceIdentityCertificateWithCompletionHandler:(id)a3;
- (void)_fetchOrCreateSelfSignedCertificateWithCompletionHandler:(id)a3;
- (void)_issueDeviceIdentityCertificateWithCompletionHandler:(id)a3;
- (void)_persistIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 fileName:(id)a5 isBAA:(BOOL)a6;
- (void)setCertificates:(id)a3;
- (void)setPrivateKey:(__SecKey *)a3;
@end

@implementation RMDeviceIdentity

+ (RMDeviceIdentity)sharedDeviceIdentity
{
  if (qword_1000CF0A0 != -1) {
    dispatch_once(&qword_1000CF0A0, &stru_1000B9890);
  }
  return (RMDeviceIdentity *)(id)qword_1000CF098;
}

+ (id)deviceIdentityForTesting
{
  return objc_opt_new(&OBJC_CLASS___RMDeviceIdentity);
}

- (RMDeviceIdentity)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RMDeviceIdentity;
  v2 = -[RMDeviceIdentity init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    certificates = v2->_certificates;
    v2->_privateKey = 0LL;
    v2->_certificates = 0LL;

    v5 = objc_opt_new(&OBJC_CLASS___NSObject);
    identityLock = v3->_identityLock;
    v3->_identityLock = v5;
  }

  return v3;
}

- (BOOL)_validDeviceIdentityCache
{
  if (-[RMDeviceIdentity privateKey](self, "privateKey")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceIdentity certificates](self, "certificates")),
        v3,
        v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceIdentity certificates](self, "certificates"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:0]);

    return +[RMSecurityUtilities checkValidAfterWithCertificate:interval:]( &OBJC_CLASS___RMSecurityUtilities,  "checkValidAfterWithCertificate:interval:",  v5,  3600.0);
  }

  else
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceIdentity](&OBJC_CLASS___RMLog, "deviceIdentity"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100026CD0();
    }

    return 0;
  }

- (void)_cachePrivateKey:(__SecKey *)a3 certificates:(id)a4
{
  id v6 = a4;
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceIdentity](&OBJC_CLASS___RMLog, "deviceIdentity"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100026CFC();
  }

  if (-[RMDeviceIdentity privateKey](self, "privateKey"))
  {
    CFRelease(-[RMDeviceIdentity privateKey](self, "privateKey"));
    -[RMDeviceIdentity setPrivateKey:](self, "setPrivateKey:", 0LL);
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceIdentity certificates](self, "certificates"));

  if (v8) {
    -[RMDeviceIdentity setCertificates:](self, "setCertificates:", 0LL);
  }
  -[RMDeviceIdentity setPrivateKey:](self, "setPrivateKey:", a3);
  CFRetain(-[RMDeviceIdentity privateKey](self, "privateKey"));
  -[RMDeviceIdentity setCertificates:](self, "setCertificates:", v6);
}

- (RMDeviceIdentity)deviceIdentityWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, __SecKey *, void *, void))a3;
  v5 = self->_identityLock;
  objc_sync_enter(v5);
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "DeviceIdentity: retrieving",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceIdentity](&OBJC_CLASS___RMLog, "deviceIdentity"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100026D28();
  }

  if (-[RMDeviceIdentity _validDeviceIdentityCache](self, "_validDeviceIdentityCache"))
  {
    objc_super v8 = -[RMDeviceIdentity privateKey](self, "privateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RMDeviceIdentity certificates](self, "certificates"));
    v4[2](v4, v8, v9, 0LL);
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100026644;
    v11[3] = &unk_1000B98B8;
    v11[4] = self;
    v12 = v4;
    -[RMDeviceIdentity _fetchDeviceIdentityCertificateWithCompletionHandler:]( self,  "_fetchDeviceIdentityCertificateWithCompletionHandler:",  v11);
    v9 = v12;
  }

  os_activity_scope_leave(&state);
  objc_sync_exit(v5);

  return result;
}

- (void)_fetchDeviceIdentityCertificateWithCompletionHandler:(id)a3
{
}

- (void)_issueDeviceIdentityCertificateWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog deviceIdentity](&OBJC_CLASS___RMLog, "deviceIdentity"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100026E88();
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  4LL));
  [v5 setObject:&off_1000BEB48 forKeyedSubscript:kMAOptionsBAAValidity];
  [v5 setObject:&off_1000BEB60 forKeyedSubscript:kMAOptionsBAASCRTAttestation];
  uint64_t v11 = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  [v5 setObject:v6 forKeyedSubscript:kMAOptionsBAAOIDSToInclude];

  [v5 setObject:@"com.apple.remotemanagementd.device-identity" forKeyedSubscript:kMAOptionsBAAKeychainLabel];
  id v7 = [v5 copy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100026964;
  v9[3] = &unk_1000B98E0;
  id v10 = v3;
  id v8 = v3;
  DeviceIdentityIssueClientCertificateWithCompletion(0LL, v7, v9);
}

- (void)_fetchOrCreateSelfSignedCertificateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createDeviceIdentityNotFoundError]( &OBJC_CLASS___RMErrorUtilities,  "createDeviceIdentityNotFoundError"));
  (*((void (**)(id, void, void, id))a3 + 2))(v4, 0LL, 0LL, v5);
}

- (void)_copyPersistedIdentityWithFileName:(id)a3 isBAA:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations identityDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "identityDirectoryURLCreateIfNeeded:",  1LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:0];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 URLByAppendingPathComponent:v7 isDirectory:0]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v10,  0LL));
  if (v11)
  {
    if (v5) {
      +[RMSecurityUtilities deserializeBAAIdentity:completionHandler:]( &OBJC_CLASS___RMSecurityUtilities,  "deserializeBAAIdentity:completionHandler:",  v11,  v13);
    }
    else {
      +[RMSecurityUtilities deserializeIdentity:completionHandler:]( &OBJC_CLASS___RMSecurityUtilities,  "deserializeIdentity:completionHandler:",  v11,  v13);
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RMErrorUtilities createInternalError](&OBJC_CLASS___RMErrorUtilities, "createInternalError"));
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0LL, 0LL, v12);
  }
}

- (void)_persistIdentityWithPrivateKey:(__SecKey *)a3 certificateChain:(id)a4 fileName:(id)a5 isBAA:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMLocations identityDirectoryURLCreateIfNeeded:]( &OBJC_CLASS___RMLocations,  "identityDirectoryURLCreateIfNeeded:",  1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:0];

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v9 isDirectory:0]);
  if (v6)
  {
    uint64_t v22 = 0LL;
    v14 = (id *)&v22;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[RMSecurityUtilities serializeBAAIdentityWithPrivateKey:certificateChain:error:]( &OBJC_CLASS___RMSecurityUtilities,  "serializeBAAIdentityWithPrivateKey:certificateChain:error:",  a3,  v10,  &v22));
  }

  else
  {
    uint64_t v21 = 0LL;
    v14 = (id *)&v21;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[RMSecurityUtilities serializeIdentityWithPrivateKey:certificateChain:error:]( &OBJC_CLASS___RMSecurityUtilities,  "serializeIdentityWithPrivateKey:certificateChain:error:",  a3,  v10,  &v21));
  }

  v16 = (void *)v15;

  id v17 = *v14;
  v18 = v17;
  if (v16)
  {
    id v20 = v17;
    [v16 writeToURL:v13 error:&v20];
    id v19 = v20;

    v18 = v19;
  }
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end