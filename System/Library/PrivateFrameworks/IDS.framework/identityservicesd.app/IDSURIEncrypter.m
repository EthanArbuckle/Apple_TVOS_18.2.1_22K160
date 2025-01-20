@interface IDSURIEncrypter
- (BOOL)_isNGMKeyType;
- (BOOL)_isReplayError:(id)a3;
- (BOOL)_isSecKeyType;
- (BOOL)avoidMainQueue;
- (BOOL)forceLegacy;
- (IDSCertifiedDeliveryReplayCommitter)replayCommitter;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicIdentityCache)publicIdentityCache;
- (IDSRateLimiter)rateLimiter;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (IDSURI)localURI;
- (IDSURI)remoteURI;
- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 rateLimiter:(id)a5 replayCommitter:(id)a6 publicIdentityCache:(id)a7 avoidMainQueue:(BOOL)a8;
- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentitySigner:(id)a4 rateLimiter:(id)a5 publicIdentityCache:(id)a6 avoidMainQueue:(BOOL)a7;
- (NSData)cert;
- (NSData)pushToken;
- (NSString)service;
- (__SecKey)_copyLookupSecVerificationIdentity;
- (id)_lookupEndpoint;
- (id)_lookupIdentityWithLastResortFallback:(BOOL *)a3;
- (id)_lookupNGMVerificationIdentityShouldUseLastResort:(BOOL)a3 usedLastResort:(BOOL *)a4;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 usedIdentifier:(id *)a5 error:(id *)a6;
- (unsigned)keyType;
- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9;
- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)setForceLegacy:(BOOL)a3;
- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7;
- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)obj;
- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7;
@end

@implementation IDSURIEncrypter

- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 rateLimiter:(id)a5 replayCommitter:(id)a6 publicIdentityCache:(id)a7 avoidMainQueue:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___IDSURIEncrypter;
  v18 = -[IDSURIEncrypter init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_peerIDManager, a3);
    objc_storeStrong((id *)&v19->_fullDeviceIdentityContainerEncrypter, a4);
    objc_storeStrong((id *)&v19->_rateLimiter, a5);
    objc_storeStrong((id *)&v19->_replayCommitter, a6);
    objc_storeStrong((id *)&v19->_publicIdentityCache, a7);
    v19->_avoidMainQueue = a8;
    v19->_forceLegacy = 0;
  }

  return v19;
}

- (IDSURIEncrypter)initWithPeerIDManager:(id)a3 fullDeviceIdentitySigner:(id)a4 rateLimiter:(id)a5 publicIdentityCache:(id)a6 avoidMainQueue:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___IDSURIEncrypter;
  id v17 = -[IDSURIEncrypter init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_peerIDManager, a3);
    objc_storeStrong((id *)&v18->_fullDeviceIdentitySigner, a4);
    objc_storeStrong((id *)&v18->_rateLimiter, a5);
    objc_storeStrong((id *)&v18->_publicIdentityCache, a6);
    v18->_avoidMainQueue = a7;
  }

  return v18;
}

- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7
{
  v12 = (IDSURI *)a3;
  id v13 = (IDSURI *)a4;
  id v14 = (NSData *)a5;
  id v15 = (NSString *)a6;
  id v16 = (NSData *)a7;
  localURI = self->_localURI;
  self->_localURI = v12;
  v25 = v12;

  remoteURI = self->_remoteURI;
  self->_remoteURI = v13;
  v19 = v13;

  pushToken = self->_pushToken;
  self->_pushToken = v14;
  v21 = v14;

  service = self->_service;
  self->_service = v15;
  objc_super v23 = v15;

  cert = self->_cert;
  self->_cert = v16;
}

- (void)setupWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)obj
{
  self->_keyType = a8;
  objc_storeStrong((id *)&self->_keyDiversifier, obj);
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  -[IDSURIEncrypter setupWithLocalURI:remoteURI:pushToken:service:cert:]( self,  "setupWithLocalURI:remoteURI:pushToken:service:cert:",  v19,  v18,  v17,  v16,  v15);
}

- (id)_lookupEndpoint
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter peerIDManager](self, "peerIDManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter pushToken](self, "pushToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[IDSPushToken pushTokenWithData:withServiceLoggingHint:]( &OBJC_CLASS___IDSPushToken,  "pushTokenWithData:withServiceLoggingHint:",  v4,  self->_service));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter remoteURI](self, "remoteURI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter service](self, "service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter localURI](self, "localURI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 endpointForPushToken:v5 URI:v6 service:v7 fromURI:v8]);

  return v9;
}

- (id)_lookupIdentityWithLastResortFallback:(BOOL *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter _lookupEndpoint](self, "_lookupEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 publicDeviceIdentityContainer]);
  if (v5)
  {
    BOOL v7 = 0;
    if (a3) {
LABEL_3:
    }
      *a3 = v7;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter publicIdentityCache](self, "publicIdentityCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter pushToken](self, "pushToken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter remoteURI](self, "remoteURI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter service](self, "service"));
    id v18 = 0LL;
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v9 identityForToken:v10 uri:v11 service:v12 error:&v18]);
    id v14 = v18;

    if (v14)
    {
      uint64_t v15 = OSLogHandleForIDSCategory("Encryption");
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Error retrieving data from last resort cache: { error: %@ }",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v17)) {
        _IDSLogEventV( @"IDSFoundation",  @"Encryption",  @"Error retrieving data from last resort cache: { error: %@ }");
      }
    }

    BOOL v7 = v13 != 0;

    v6 = (void *)v13;
    if (a3) {
      goto LABEL_3;
    }
  }

  return v6;
}

- (BOOL)_isReplayError:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  uint64_t v7 = IDSDecryptionErrorDomain;
  if ([v6 isEqualToString:IDSDecryptionErrorDomain]
    && [v3 code] == (id)15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    else {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  else {
    BOOL v11 = 0;
  }

  return v9 || v11;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 usedIdentifier:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter _lookupEndpoint](self, "_lookupEndpoint"));
  if (a5) {
    *a5 = IDSMPLegacyIdentityIdentifier;
  }
  fullDeviceIdentityContainerEncrypter = self->_fullDeviceIdentityContainerEncrypter;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 publicDeviceIdentityContainer]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter legacyEncryptData:withEncryptedAttributes:withPublicDeviceIdentityContainer:error:]( fullDeviceIdentityContainerEncrypter,  "legacyEncryptData:withEncryptedAttributes:withPublicDeviceIdentityContainer:error:",  v11,  v10,  v14,  a6));

  return v15;
}

- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10006CFA0;
  v16[3] = &unk_1008F8440;
  v16[4] = self;
  id v17 = v10;
  id v19 = a5;
  id v20 = a6;
  id v18 = v11;
  id v12 = v19;
  id v13 = v20;
  id v14 = v11;
  id v15 = v10;
  [v12 performAsyncBlock:v16];
}

- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10006DC74;
  v26[3] = &unk_1008F85D0;
  v26[4] = self;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  BOOL v33 = a7;
  id v31 = v18;
  id v32 = a9;
  id v30 = v19;
  id v20 = v18;
  id v21 = v32;
  id v22 = v19;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  [v20 performAsyncBlock:v26];
}

- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006F350;
  v19[3] = &unk_1008F86E8;
  v19[4] = self;
  id v20 = v12;
  id v23 = a7;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v15 = v14;
  id v16 = v13;
  id v17 = v12;
  id v18 = v23;
  [v15 performAsyncBlock:v19];
}

- (BOOL)_isNGMKeyType
{
  return -[IDSURIEncrypter keyType](self, "keyType") == 0;
}

- (BOOL)_isSecKeyType
{
  return -[IDSURIEncrypter keyType](self, "keyType") == 1;
}

- (id)_lookupNGMVerificationIdentityShouldUseLastResort:(BOOL)a3 usedLastResort:(BOOL *)a4
{
  if (-[IDSURIEncrypter keyType](self, "keyType"))
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    if (a3)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[IDSURIEncrypter _lookupIdentityWithLastResortFallback:]( self,  "_lookupIdentityWithLastResortFallback:",  a4));
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 ngmPublicDeviceIdentity]);
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter _lookupEndpoint](self, "_lookupEndpoint"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 publicDeviceIdentityContainer]);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v9 ngmPublicDeviceIdentity]);
    }
  }

  return v7;
}

- (__SecKey)_copyLookupSecVerificationIdentity
{
  if (-[IDSURIEncrypter keyType](self, "keyType") != 1) {
    return 0LL;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter _lookupEndpoint](self, "_lookupEndpoint"));
  if ([v3 applicationPublicDeviceIdentity])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSURIEncrypter _lookupEndpoint](self, "_lookupEndpoint"));
    v5 = (__SecKey *)CFRetain([v4 applicationPublicDeviceIdentity]);
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (IDSCertifiedDeliveryReplayCommitter)replayCommitter
{
  return self->_replayCommitter;
}

- (IDSPublicIdentityCache)publicIdentityCache
{
  return self->_publicIdentityCache;
}

- (BOOL)avoidMainQueue
{
  return self->_avoidMainQueue;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner
{
  return self->_fullDeviceIdentitySigner;
}

- (IDSURI)localURI
{
  return self->_localURI;
}

- (IDSURI)remoteURI
{
  return self->_remoteURI;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSString)service
{
  return self->_service;
}

- (NSData)cert
{
  return self->_cert;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (BOOL)forceLegacy
{
  return self->_forceLegacy;
}

- (void)setForceLegacy:(BOOL)a3
{
  self->_forceLegacy = a3;
}

- (void).cxx_destruct
{
}

@end