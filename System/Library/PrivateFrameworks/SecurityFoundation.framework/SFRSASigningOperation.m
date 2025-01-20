@interface SFRSASigningOperation
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (SFRSASigningOperation)init;
- (SFRSASigningOperation)initWithCoder:(id)a3;
- (SFRSASigningOperation)initWithKeySpecifier:(id)a3;
- (SFRSASigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4;
- (_SFRSAKeySpecifier)signingKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setDigestOperation:(id)a3;
- (void)setSigningKeySpecifier:(id)a3;
@end

@implementation SFRSASigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSASigningOperation)init
{
  v3 = -[_SFRSAKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFRSAKeySpecifier), "initWithBitSize:", 2048LL);
  v4 = -[SFRSASigningOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  _defaultDigestOperation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SFRSASigningOperation initWithKeySpecifier:digestOperation:]( self,  "initWithKeySpecifier:digestOperation:",  v4,  v5);

  return v6;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SFRSASigningOperation;
  v9 = -[SFRSASigningOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_rsaSigningOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_rsaSigningOperationInternal + 2, a4);
  }

  return v10;
}

- (SFRSASigningOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFRSASigningOperation;
  return -[SFRSASigningOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithKeySpecifier:*((void *)self->_rsaSigningOperationInternal + 1) digestOperation:*((void *)self->_rsaSigningOperationInternal + 2)];
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (_SFRSAKeySpecifier)signingKeySpecifier
{
  return (_SFRSAKeySpecifier *)(id)[*((id *)self->_rsaSigningOperationInternal + 1) copy];
}

- (void)setSigningKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  rsaSigningOperationInternal = self->_rsaSigningOperationInternal;
  v6 = (void *)rsaSigningOperationInternal[1];
  rsaSigningOperationInternal[1] = v4;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)[*((id *)self->_rsaSigningOperationInternal + 2) copyWithZone:0];
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  rsaSigningOperationInternal = self->_rsaSigningOperationInternal;
  v6 = (void *)rsaSigningOperationInternal[2];
  rsaSigningOperationInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end