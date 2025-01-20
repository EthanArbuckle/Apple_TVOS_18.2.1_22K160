@interface IDSHashingDeviceIdentityEncrypter
- (IDSHashingDeviceIdentityEncrypter)initWithDeviceIdentityContainerEncrypter:(id)a3 messageHashChecker:(id)a4;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSMessageHashChecker)messageHashChecker;
- (id)_checkMessageHashForData:(id)a3 identifier:(id)a4 isRetry:(BOOL)a5 delayedCommitBlock:(id *)a6;
- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 usingIdentifier:(id)a5 isRetry:(BOOL)a6;
- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
@end

@implementation IDSHashingDeviceIdentityEncrypter

- (IDSHashingDeviceIdentityEncrypter)initWithDeviceIdentityContainerEncrypter:(id)a3 messageHashChecker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IDSHashingDeviceIdentityEncrypter;
  v9 = -[IDSHashingDeviceIdentityEncrypter init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fullDeviceIdentityContainerEncrypter, a3);
    objc_storeStrong((id *)&v10->_messageHashChecker, a4);
  }

  return v10;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  return -[IDSMPFullDeviceIdentityContainerEncrypter legacyEncryptData:withEncryptedAttributes:withPublicDeviceIdentityContainer:error:]( self->_fullDeviceIdentityContainerEncrypter,  "legacyEncryptData:withEncryptedAttributes:withPublicDeviceIdentityContainer:error:",  a3,  a4,  a5,  a6);
}

- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11
{
  return -[IDSMPFullDeviceIdentityContainerEncrypter encryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttributes:withPublicDeviceIdentityContainer:usedIdentifier:metadata:error:]( self->_fullDeviceIdentityContainerEncrypter,  "encryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttributes:withPublicDeviceIdent ityContainer:usedIdentifier:metadata:error:",  a3,  a4,  a5,  a6,  a7,  a8);
}

- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  return -[IDSMPFullDeviceIdentityContainerEncrypter offGridKeyDistributionEncryptData:encryptionContext:withPublicDeviceIdentityContainer:error:]( self->_fullDeviceIdentityContainerEncrypter,  "offGridKeyDistributionEncryptData:encryptionContext:withPublicDeviceIdentityContainer:error:",  a3,  a4,  a5,  a6);
}

- (id)_checkMessageHashForData:(id)a3 identifier:(id)a4 isRetry:(BOOL)a5 delayedCommitBlock:(id *)a6
{
  id v10 = a3;
  if ([a4 isEqualToString:IDSMPLegacyIdentityIdentifier])
  {
    unsigned __int8 v11 = -[IDSMessageHashChecker allowMessageData:withDelayedCommitBlock:]( self->_messageHashChecker,  "allowMessageData:withDelayedCommitBlock:",  v10,  a6);
    objc_super v12 = 0LL;
    if ((v11 & 1) == 0 && !a5) {
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  IDSDecryptionErrorDomain,  5LL,  0LL));
    }
  }

  else
  {
    objc_super v12 = 0LL;
  }

  return v12;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[IDSHashingDeviceIdentityEncrypter _checkMessageHashForData:identifier:isRetry:delayedCommitBlock:]( self,  "_checkMessageHashForData:identifier:isRetry:delayedCommitBlock:",  v12,  v14,  v7,  0LL));
  v16 = v15;
  if (a5 && v15)
  {
    v17 = 0LL;
    *a5 = v15;
  }

  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter decryptData:withPublicDeviceIdentityContainer:error:usingIdentifier:isRetry:]( self->_fullDeviceIdentityContainerEncrypter,  "decryptData:withPublicDeviceIdentityContainer:error:usingIdentifier:isRetry:",  v12,  v13,  a5,  v14,  v7));
  }

  return v17;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 usingIdentifier:(id)a5 isRetry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v20 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IDSHashingDeviceIdentityEncrypter _checkMessageHashForData:identifier:isRetry:delayedCommitBlock:]( self,  "_checkMessageHashForData:identifier:isRetry:delayedCommitBlock:",  v10,  v12,  v6,  &v20));
  id v14 = v20;
  if (v13)
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
    [v15 failWithError:v13];
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 promise]);
  }

  else
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:]( self->_fullDeviceIdentityContainerEncrypter,  "decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:",  v10,  0LL,  v11,  v12,  v6));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000BD1C4;
    v18[3] = &unk_1008F9208;
    id v19 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 then:v18]);
  }

  return v16;
}

- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v23 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[IDSHashingDeviceIdentityEncrypter _checkMessageHashForData:identifier:isRetry:delayedCommitBlock:]( self,  "_checkMessageHashForData:identifier:isRetry:delayedCommitBlock:",  v12,  v15,  v7,  &v23));
  id v17 = v23;
  if (v16)
  {
    id v18 = objc_alloc_init(&OBJC_CLASS___CUTUnsafePromiseSeal);
    [v18 failWithError:v16];
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 promise]);
  }

  else
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue( -[IDSMPFullDeviceIdentityContainerEncrypter decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:]( self->_fullDeviceIdentityContainerEncrypter,  "decryptData:decryptionContext:withPublicDeviceIdentityContainer:usingIdentifier:isRetry:",  v12,  v13,  v14,  v15,  v7));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000BD42C;
    v21[3] = &unk_1008F9208;
    id v22 = v17;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 then:v21]);
  }

  return v19;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (IDSMessageHashChecker)messageHashChecker
{
  return self->_messageHashChecker;
}

- (void).cxx_destruct
{
}

@end