@interface SFX963KeyDerivationOperation
+ (BOOL)supportsSecureCoding;
+ (int64_t)keySource;
- (SFDigestOperation)digestOperation;
- (SFKeyDerivingOperation)sharedSecretOperation;
- (SFX963KeyDerivationOperation)init;
- (SFX963KeyDerivationOperation)initWithCoder:(id)a3;
- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3;
- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3 digestOperation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5;
- (void)setDigestOperation:(id)a3;
- (void)setSharedSecretOperation:(id)a3;
@end

@implementation SFX963KeyDerivationOperation

+ (int64_t)keySource
{
  return 2LL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFX963KeyDerivationOperation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFX963KeyDerivationOperation initWithSharedSecretOperation:](self, "initWithSharedSecretOperation:", v3);

  return v4;
}

- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3
{
  id v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFX963KeyDerivationOperation initWithSharedSecretOperation:digestOperation:]( self,  "initWithSharedSecretOperation:digestOperation:",  v4,  v5);

  return v6;
}

- (SFX963KeyDerivationOperation)initWithSharedSecretOperation:(id)a3 digestOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SFX963KeyDerivationOperation;
  v9 = -[SFX963KeyDerivationOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_x963KeyDerivationOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_x963KeyDerivationOperationInternal + 2, a4);
  }

  return v10;
}

- (SFX963KeyDerivationOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFX963KeyDerivationOperation;
  return -[SFX963KeyDerivationOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  return -[SFX963KeyDerivationOperation initWithSharedSecretOperation:digestOperation:]( v3,  "initWithSharedSecretOperation:digestOperation:",  *((void *)v3->_x963KeyDerivationOperationInternal + 1),  *((void *)v3->_x963KeyDerivationOperationInternal + 2));
}

- (id)deriveKeyWithSpecifier:(id)a3 fromKeySource:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (SFKeyDerivingOperation)sharedSecretOperation
{
  return (SFKeyDerivingOperation *)(id)[*((id *)self->_x963KeyDerivationOperationInternal + 1) copyWithZone:0];
}

- (void)setSharedSecretOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  x963KeyDerivationOperationInternal = self->_x963KeyDerivationOperationInternal;
  v6 = (void *)x963KeyDerivationOperationInternal[1];
  x963KeyDerivationOperationInternal[1] = v4;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)[*((id *)self->_x963KeyDerivationOperationInternal + 2) copyWithZone:0];
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  x963KeyDerivationOperationInternal = self->_x963KeyDerivationOperationInternal;
  v6 = (void *)x963KeyDerivationOperationInternal[2];
  x963KeyDerivationOperationInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end