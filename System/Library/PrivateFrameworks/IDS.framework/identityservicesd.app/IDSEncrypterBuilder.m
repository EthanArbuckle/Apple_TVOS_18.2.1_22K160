@interface IDSEncrypterBuilder
+ (id)builderWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11;
- (BOOL)avoidMainQueue;
- (IDSDAccountController)accountController;
- (IDSDServiceController)serviceController;
- (IDSEncrypterBuilder)initWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11;
- (IDSOTRController)OTRController;
- (IDSPeerIDManager)peerIDManager;
- (IDSPublicKeyStorage)publicKeyStorage;
- (IDSRateLimiter)rateLimiter;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_createHashingDeviceIdentityEncrypter;
- (id)encrypterWithDeviceID:(id)a3;
- (id)encrypterWithEndpoint:(id)a3;
- (id)encrypterWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7;
- (id)encrypterWithOTRToken:(id)a3;
- (id)signerWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5;
- (id)verifierWithEndpoint:(id)a3 keyType:(unsigned int)a4 keyDiversifier:(id)a5;
- (id)verifierWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)a9;
- (int64_t)forceEncryptionType;
- (void)setAccountController:(id)a3;
- (void)setAvoidMainQueue:(BOOL)a3;
- (void)setForceEncryptionType:(int64_t)a3;
- (void)setOTRController:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setPublicKeyStorage:(id)a3;
- (void)setRateLimiter:(id)a3;
- (void)setRegistrationKeyManager:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSEncrypterBuilder

+ (id)builderWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11
{
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  LOBYTE(v27) = a10;
  id v25 = [objc_alloc((Class)a1) initWithPublicKeyStorage:v24 peerIDManager:v23 accountController:v22 registrationKeyManager:v21 rateLimiter:v20 OTRController:v19 serv iceController:v18 avoidMainQueue:v27 forceEncryptionType:a11];

  return v25;
}

- (IDSEncrypterBuilder)initWithPublicKeyStorage:(id)a3 peerIDManager:(id)a4 accountController:(id)a5 registrationKeyManager:(id)a6 rateLimiter:(id)a7 OTRController:(id)a8 serviceController:(id)a9 avoidMainQueue:(BOOL)a10 forceEncryptionType:(int64_t)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___IDSEncrypterBuilder;
  id v20 = -[IDSEncrypterBuilder init](&v28, "init");
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_publicKeyStorage, a3);
    objc_storeStrong((id *)&v21->_peerIDManager, a4);
    objc_storeStrong((id *)&v21->_accountController, a5);
    objc_storeStrong((id *)&v21->_registrationKeyManager, a6);
    objc_storeStrong((id *)&v21->_rateLimiter, a7);
    objc_storeStrong((id *)&v21->_OTRController, a8);
    objc_storeStrong((id *)&v21->_serviceController, a9);
    v21->_avoidMainQueue = a10;
    v21->_forceEncryptionType = a11;
  }

  return v21;
}

- (id)_createHashingDeviceIdentityEncrypter
{
  v3 = -[IDSMPFullDeviceIdentityContainerEncrypter initWithRegistrationKeyManager:]( objc_alloc(&OBJC_CLASS___IDSMPFullDeviceIdentityContainerEncrypter),  "initWithRegistrationKeyManager:",  self->_registrationKeyManager);
  v4 = -[IDSMessageHashChecker initWithRegistrationKeyManager:]( objc_alloc(&OBJC_CLASS___IDSMessageHashChecker),  "initWithRegistrationKeyManager:",  self->_registrationKeyManager);
  v5 = -[IDSHashingDeviceIdentityEncrypter initWithDeviceIdentityContainerEncrypter:messageHashChecker:]( objc_alloc(&OBJC_CLASS___IDSHashingDeviceIdentityEncrypter),  "initWithDeviceIdentityContainerEncrypter:messageHashChecker:",  v3,  v4);

  return v5;
}

- (id)encrypterWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7
{
  id v25 = a7;
  id v24 = a6;
  id v23 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncrypterBuilder _createHashingDeviceIdentityEncrypter]( self,  "_createHashingDeviceIdentityEncrypter"));
  v15 = objc_alloc(&OBJC_CLASS___IDSURIEncrypter);
  peerIDManager = self->_peerIDManager;
  rateLimiter = self->_rateLimiter;
  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 replayStateCommitter]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPublicIdentityCache sharedInstance](&OBJC_CLASS___IDSPublicIdentityCache, "sharedInstance"));
  id v21 = -[IDSURIEncrypter initWithPeerIDManager:fullDeviceIdentityContainerEncrypter:rateLimiter:replayCommitter:publicIdentityCache:avoidMainQueue:]( v15,  "initWithPeerIDManager:fullDeviceIdentityContainerEncrypter:rateLimiter:replayCommitter:publicIdentityCache:avoidMainQueue:",  peerIDManager,  v14,  rateLimiter,  v19,  v20,  self->_avoidMainQueue);

  -[IDSURIEncrypter setForceLegacy:]( v21,  "setForceLegacy:",  (id)-[IDSEncrypterBuilder forceEncryptionType](self, "forceEncryptionType") == (id)1);
  -[IDSURIEncrypter setupWithLocalURI:remoteURI:pushToken:service:cert:]( v21,  "setupWithLocalURI:remoteURI:pushToken:service:cert:",  v13,  v12,  v23,  v24,  v25);

  return v21;
}

- (id)encrypterWithDeviceID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncrypterBuilder _createHashingDeviceIdentityEncrypter]( self,  "_createHashingDeviceIdentityEncrypter"));
  v6 = -[IDSDeviceIDEncrypter initWithPublicKeyStorage:accountController:fullDeviceIdentityContainerEncrypter:rateLimiter:forceLegacy:]( objc_alloc(&OBJC_CLASS___IDSDeviceIDEncrypter),  "initWithPublicKeyStorage:accountController:fullDeviceIdentityContainerEncrypter:rateLimiter:forceLegacy:",  self->_publicKeyStorage,  self->_accountController,  v5,  self->_rateLimiter,  (id)-[IDSEncrypterBuilder forceEncryptionType](self, "forceEncryptionType") == (id)1);
  -[IDSDeviceIDEncrypter setDeviceID:](v6, "setDeviceID:", v4);

  return v6;
}

- (id)encrypterWithEndpoint:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSEncrypterBuilder _createHashingDeviceIdentityEncrypter]( self,  "_createHashingDeviceIdentityEncrypter"));
  v6 = objc_alloc(&OBJC_CLASS___IDSEndpointEncrypter);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 replayStateCommitter]);
  v9 = -[IDSEndpointEncrypter initWithEndpoint:fullDeviceIdentityContainerEncrypter:replayCommitter:forceEncryptionType:]( v6,  "initWithEndpoint:fullDeviceIdentityContainerEncrypter:replayCommitter:forceEncryptionType:",  v4,  v5,  v8,  -[IDSEncrypterBuilder forceEncryptionType](self, "forceEncryptionType"));

  return v9;
}

- (id)encrypterWithOTRToken:(id)a3
{
  id v4 = a3;
  v5 = -[IDSOTREncrypter initWithOTRController:OTRToken:]( objc_alloc(&OBJC_CLASS___IDSOTREncrypter),  "initWithOTRController:OTRToken:",  self->_OTRController,  v4);

  return v5;
}

- (id)signerWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = -[IDSMPFullDeviceIdentityContainerEncrypter initWithRegistrationKeyManager:]( objc_alloc(&OBJC_CLASS___IDSMPFullDeviceIdentityContainerEncrypter),  "initWithRegistrationKeyManager:",  self->_registrationKeyManager);
  v11 = -[IDSSigningEncrypter initWithKeyType:keyDiversifier:service:serviceController:fullDeviceIdentitySigner:]( objc_alloc(&OBJC_CLASS___IDSSigningEncrypter),  "initWithKeyType:keyDiversifier:service:serviceController:fullDeviceIdentitySigner:",  v6,  v9,  v8,  self->_serviceController,  v10);

  return v11;
}

- (id)verifierWithLocalURI:(id)a3 remoteURI:(id)a4 pushToken:(id)a5 service:(id)a6 cert:(id)a7 keyType:(unsigned int)a8 keyDiversifier:(id)a9
{
  id v26 = a9;
  id v27 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = -[IDSMPFullDeviceIdentityContainerEncrypter initWithRegistrationKeyManager:]( objc_alloc(&OBJC_CLASS___IDSMPFullDeviceIdentityContainerEncrypter),  "initWithRegistrationKeyManager:",  self->_registrationKeyManager);
  id v20 = objc_alloc(&OBJC_CLASS___IDSURIEncrypter);
  peerIDManager = self->_peerIDManager;
  rateLimiter = self->_rateLimiter;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPublicIdentityCache sharedInstance](&OBJC_CLASS___IDSPublicIdentityCache, "sharedInstance"));
  id v24 = -[IDSURIEncrypter initWithPeerIDManager:fullDeviceIdentitySigner:rateLimiter:publicIdentityCache:avoidMainQueue:]( v20,  "initWithPeerIDManager:fullDeviceIdentitySigner:rateLimiter:publicIdentityCache:avoidMainQueue:",  peerIDManager,  v19,  rateLimiter,  v23,  self->_avoidMainQueue);

  -[IDSURIEncrypter setupWithLocalURI:remoteURI:pushToken:service:cert:keyType:keyDiversifier:]( v24,  "setupWithLocalURI:remoteURI:pushToken:service:cert:keyType:keyDiversifier:",  v18,  v17,  v16,  v15,  v27,  a8,  v26);
  return v24;
}

- (id)verifierWithEndpoint:(id)a3 keyType:(unsigned int)a4 keyDiversifier:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = -[IDSMPFullDeviceIdentityContainerEncrypter initWithRegistrationKeyManager:]( objc_alloc(&OBJC_CLASS___IDSMPFullDeviceIdentityContainerEncrypter),  "initWithRegistrationKeyManager:",  self->_registrationKeyManager);
  v11 = -[IDSEndpointEncrypter initWithEndpoint:fullDeviceIdentitySigner:keyType:keyDiversifier:]( objc_alloc(&OBJC_CLASS___IDSEndpointEncrypter),  "initWithEndpoint:fullDeviceIdentitySigner:keyType:keyDiversifier:",  v9,  v10,  v5,  v8);

  return v11;
}

- (IDSPublicKeyStorage)publicKeyStorage
{
  return self->_publicKeyStorage;
}

- (void)setPublicKeyStorage:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void)setRegistrationKeyManager:(id)a3
{
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (IDSOTRController)OTRController
{
  return self->_OTRController;
}

- (void)setOTRController:(id)a3
{
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (BOOL)avoidMainQueue
{
  return self->_avoidMainQueue;
}

- (void)setAvoidMainQueue:(BOOL)a3
{
  self->_avoidMainQueue = a3;
}

- (int64_t)forceEncryptionType
{
  return self->_forceEncryptionType;
}

- (void)setForceEncryptionType:(int64_t)a3
{
  self->_forceEncryptionType = a3;
}

- (void).cxx_destruct
{
}

@end