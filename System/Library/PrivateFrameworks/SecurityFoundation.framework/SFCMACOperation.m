@interface SFCMACOperation
- (SFCMACOperation)init;
- (SFCMACOperation)initWithCoder:(id)a3;
- (SFCMACOperation)initWithEncryptionOperation:(id)a3;
- (SFSymmetricEncryptionOperation)encryptionOperation;
- (void)setEncryptionOperation:(id)a3;
@end

@implementation SFCMACOperation

- (SFCMACOperation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFCMACOperation initWithEncryptionOperation:](self, "initWithEncryptionOperation:", v3);

  return v4;
}

- (SFCMACOperation)initWithEncryptionOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SFCMACOperation;
  v6 = -[SFMessageAuthenticationCodeOperation init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_cmacOperationInternal + 1, a3);
  }

  return v7;
}

- (SFCMACOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFCMACOperation;
  return -[SFMessageAuthenticationCodeOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFSymmetricEncryptionOperation)encryptionOperation
{
  return (SFSymmetricEncryptionOperation *)(id)[*((id *)self->_cmacOperationInternal + 1) copy];
}

- (void)setEncryptionOperation:(id)a3
{
  uint64_t v4 = [a3 copy];
  cmacOperationInternal = self->_cmacOperationInternal;
  v6 = (void *)cmacOperationInternal[1];
  cmacOperationInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end