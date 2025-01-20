@interface SFRSA_WrappedKeyEncryptionOperation
+ (BOOL)supportsSecureCoding;
- (SFRSAEncryptionOperation)keyWrappingOperation;
- (SFRSA_WrappedKeyEncryptionOperation)init;
- (SFRSA_WrappedKeyEncryptionOperation)initWithCoder:(id)a3;
- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3;
- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3 sessionEncryptionOperation:(id)a4;
- (SFSymmetricEncryptionOperation)sessionEncryptionOperation;
- (_SFKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setKeyWrappingOperation:(id)a3;
- (void)setSessionEncryptionOperation:(id)a3;
@end

@implementation SFRSA_WrappedKeyEncryptionOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSA_WrappedKeyEncryptionOperation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFRSA_WrappedKeyEncryptionOperation initWithKeyWrappingOperation:](self, "initWithKeyWrappingOperation:", v3);

  return v4;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3
{
  id v4 = a3;
  v5 = +[SFSymmetricEncryptionOperation _defaultEncryptionOperation]( &OBJC_CLASS___SFSymmetricEncryptionOperation,  "_defaultEncryptionOperation");
  v6 = -[SFRSA_WrappedKeyEncryptionOperation initWithKeyWrappingOperation:sessionEncryptionOperation:]( self,  "initWithKeyWrappingOperation:sessionEncryptionOperation:",  v4,  v5);

  return v6;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3 sessionEncryptionOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SFRSA_WrappedKeyEncryptionOperation;
  v9 = -[SFRSA_WrappedKeyEncryptionOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_wrappedKeyEncryptionOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_wrappedKeyEncryptionOperationInternal + 2, a4);
  }

  return v10;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFRSA_WrappedKeyEncryptionOperation;
  return -[SFRSA_WrappedKeyEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithKeyWrappingOperation:*((void *)self->_wrappedKeyEncryptionOperationInternal + 1) sessionEncryptionOperation:*((void *)self->_wrappedKeyEncryptionOperationInternal + 2)];
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (_SFKeySpecifier)encryptionKeySpecifier
{
  return (_SFKeySpecifier *)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 1) encryptionKeySpecifier];
}

- (SFRSAEncryptionOperation)keyWrappingOperation
{
  return (SFRSAEncryptionOperation *)(id)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 1) copy];
}

- (void)setKeyWrappingOperation:(id)a3
{
  uint64_t v4 = [a3 copy];
  wrappedKeyEncryptionOperationInternal = self->_wrappedKeyEncryptionOperationInternal;
  v6 = (void *)wrappedKeyEncryptionOperationInternal[1];
  wrappedKeyEncryptionOperationInternal[1] = v4;
}

- (SFSymmetricEncryptionOperation)sessionEncryptionOperation
{
  return (SFSymmetricEncryptionOperation *)(id)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 2) copy];
}

- (void)setSessionEncryptionOperation:(id)a3
{
  uint64_t v4 = [a3 copy];
  wrappedKeyEncryptionOperationInternal = self->_wrappedKeyEncryptionOperationInternal;
  v6 = (void *)wrappedKeyEncryptionOperationInternal[2];
  wrappedKeyEncryptionOperationInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end