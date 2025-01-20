@interface SFRSAEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
- (SFRSAEncryptionOperation)init;
- (SFRSAEncryptionOperation)initWithCoder:(id)a3;
- (SFRSAEncryptionOperation)initWithKeySpecifier:(id)a3;
- (_SFRSAKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setEncryptionKeySpecifier:(id)a3;
@end

@implementation SFRSAEncryptionOperation

+ (id)_defaultEncryptionOperation
{
  v2 = objc_alloc(&OBJC_CLASS___SFRSA_PKCS1EncryptionOperation);
  v3 = -[_SFRSAKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFRSAKeySpecifier), "initWithBitSize:", 4096LL);
  v4 = -[SFRSAEncryptionOperation initWithKeySpecifier:](v2, "initWithKeySpecifier:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSAEncryptionOperation)init
{
  v3 = -[_SFRSAKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFRSAKeySpecifier), "initWithBitSize:", 4096LL);
  v4 = -[SFRSAEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFRSAEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 831, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SFRSAEncryptionOperation;
  v7 = -[SFRSAEncryptionOperation init](&v11, sel_init);
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)v7->_rsaEncryptionOperationInternal + 1, a3);
  }

  return v8;
}

- (SFRSAEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFRSAEncryptionOperation;
  return -[SFRSAEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithKeySpecifier:",  *((void *)self->_rsaEncryptionOperationInternal + 1));
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (_SFRSAKeySpecifier)encryptionKeySpecifier
{
  return (_SFRSAKeySpecifier *)(id)[*((id *)self->_rsaEncryptionOperationInternal + 1) copy];
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  rsaEncryptionOperationInternal = self->_rsaEncryptionOperationInternal;
  id v6 = (void *)rsaEncryptionOperationInternal[1];
  rsaEncryptionOperationInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end