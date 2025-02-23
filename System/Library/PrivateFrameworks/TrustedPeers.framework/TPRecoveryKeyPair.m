@interface TPRecoveryKeyPair
- (NSData)encryptionKeyData;
- (NSData)signingKeyData;
- (TPRecoveryKeyPair)initWithSigningKeyData:(id)a3 encryptionKeyData:(id)a4;
- (TPRecoveryKeyPair)initWithStableInfo:(id)a3;
@end

@implementation TPRecoveryKeyPair

- (TPRecoveryKeyPair)initWithSigningKeyData:(id)a3 encryptionKeyData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TPRecoveryKeyPair;
  v9 = -[TPRecoveryKeyPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_signingKeyData, a3);
    objc_storeStrong((id *)&v10->_encryptionKeyData, a4);
  }

  return v10;
}

- (TPRecoveryKeyPair)initWithStableInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TPRecoveryKeyPair;
  v5 = -[TPRecoveryKeyPair init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 recoverySigningPublicKey];
    signingKeyData = v5->_signingKeyData;
    v5->_signingKeyData = (NSData *)v6;

    uint64_t v8 = [v4 recoveryEncryptionPublicKey];
    encryptionKeyData = v5->_encryptionKeyData;
    v5->_encryptionKeyData = (NSData *)v8;
  }

  return v5;
}

- (NSData)signingKeyData
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSData)encryptionKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end