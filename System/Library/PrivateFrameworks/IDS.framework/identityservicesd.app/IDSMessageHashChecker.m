@interface IDSMessageHashChecker
- (BOOL)allowMessageData:(id)a3;
- (BOOL)allowMessageData:(id)a3 withDelayedCommitBlock:(id *)a4;
- (BOOL)usePairingKey;
- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3;
- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3 messageHashStore:(id)a4 usePairingKey:(BOOL)a5;
- (IDSMessageHashStore)messageHashStore;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_legacyIdentity;
- (void)setMessageHashStore:(id)a3;
- (void)setUsePairingKey:(BOOL)a3;
@end

@implementation IDSMessageHashChecker

- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IDSMessageHashStore sharedInstance](&OBJC_CLASS___IDSMessageHashStore, "sharedInstance"));
  v6 = -[IDSMessageHashChecker initWithRegistrationKeyManager:messageHashStore:usePairingKey:]( self,  "initWithRegistrationKeyManager:messageHashStore:usePairingKey:",  v4,  v5,  1LL);

  return v6;
}

- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3 messageHashStore:(id)a4 usePairingKey:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSMessageHashChecker;
  v11 = -[IDSMessageHashChecker init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_registrationKeyManager, a3);
    objc_storeStrong((id *)&v12->_messageHashStore, a4);
    v12->_usePairingKey = a5;
  }

  return v12;
}

- (BOOL)allowMessageData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMessageHashChecker _legacyIdentity](self, "_legacyIdentity"));
  v6 = v5;
  BOOL v7 = 0;
  if (v4 && v5)
  {
    id v13 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 protectedHashOfMessageData:v4 error:&v13]);
    id v9 = v13;
    if (v8)
    {
      unsigned int v10 = -[IDSMessageHashStore containsMessageHash:]( self->_messageHashStore,  "containsMessageHash:",  v8);
      messageHashStore = self->_messageHashStore;
      if (!v10)
      {
        -[IDSMessageHashStore addMessageHash:](messageHashStore, "addMessageHash:", v8);
        BOOL v7 = 1;
        goto LABEL_8;
      }

      -[IDSMessageHashStore updateCreationDateForHash:](messageHashStore, "updateCreationDateForHash:", v8);
    }

    BOOL v7 = 0;
LABEL_8:
  }

  return v7;
}

- (BOOL)allowMessageData:(id)a3 withDelayedCommitBlock:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSMessageHashChecker _legacyIdentity](self, "_legacyIdentity"));
  v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    id v15 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v7 protectedHashOfMessageData:v6 error:&v15]);
    id v11 = v15;
    if (v10)
    {
      if (!-[IDSMessageHashStore containsMessageHash:]( self->_messageHashStore,  "containsMessageHash:",  v10))
      {
        if (a4)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472LL;
          v13[2] = sub_1001216CC;
          v13[3] = &unk_1008FB020;
          v13[4] = self;
          id v14 = v10;
          *a4 = objc_retainBlock(v13);
        }

        else
        {
          -[IDSMessageHashStore addMessageHash:](self->_messageHashStore, "addMessageHash:", v10);
        }

        BOOL v9 = 1;
        goto LABEL_11;
      }

      -[IDSMessageHashStore updateCreationDateForHash:](self->_messageHashStore, "updateCreationDateForHash:", v10);
    }

    BOOL v9 = 0;
LABEL_11:
  }

  return v9;
}

- (id)_legacyIdentity
{
  BOOL usePairingKey = self->_usePairingKey;
  registrationKeyManager = self->_registrationKeyManager;
  if (usePairingKey)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:]( registrationKeyManager,  "latestMessageProtectionFullIdentityForDataProtectionClass:",  2LL));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[IDSRegistrationKeyManager fullDeviceIdentityContainer]( registrationKeyManager,  "fullDeviceIdentityContainer"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 legacyFullIdentity]);
  }

  return v4;
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (BOOL)usePairingKey
{
  return self->_usePairingKey;
}

- (void)setUsePairingKey:(BOOL)a3
{
  self->_BOOL usePairingKey = a3;
}

- (IDSMessageHashStore)messageHashStore
{
  return self->_messageHashStore;
}

- (void)setMessageHashStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end