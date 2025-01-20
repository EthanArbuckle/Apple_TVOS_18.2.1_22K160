@interface SFSymmetricEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
+ (int64_t)_defaultEncryptionMode;
- (SFSymmetricEncryptionOperation)init;
- (SFSymmetricEncryptionOperation)initWithCoder:(id)a3;
- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3;
- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4;
- (_SFSymmetricKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6;
- (int64_t)mode;
- (void)setEncryptionKeySpecifier:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation SFSymmetricEncryptionOperation

+ (int64_t)_defaultEncryptionMode
{
  return 0LL;
}

+ (id)_defaultEncryptionOperation
{
  return objc_alloc_init((Class)a1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSymmetricEncryptionOperation)init
{
  v3 = -[_SFAESKeySpecifier initWithBitSize:](objc_alloc(&OBJC_CLASS____SFAESKeySpecifier), "initWithBitSize:", 0LL);
  v4 = -[SFSymmetricEncryptionOperation initWithKeySpecifier:](self, "initWithKeySpecifier:", v3);

  return v4;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[SFSymmetricEncryptionOperation initWithKeySpecifier:mode:]( self,  "initWithKeySpecifier:mode:",  v4,  [(id)objc_opt_class() _defaultEncryptionMode]);

  return v5;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 469, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SFSymmetricEncryptionOperation;
  v9 = -[SFSymmetricEncryptionOperation init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_symmetricEncryptionOperationInternal + 2, a3);
    *((void *)v10->_symmetricEncryptionOperationInternal + 1) = a4;
  }

  return v10;
}

- (SFSymmetricEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFSymmetricEncryptionOperation;
  return -[SFSymmetricEncryptionOperation init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithKeySpecifier:mode:",  *((void *)self->_symmetricEncryptionOperationInternal + 2),  *((void *)self->_symmetricEncryptionOperationInternal + 1));
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0LL;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return 0LL;
}

- (int64_t)mode
{
  return *((void *)self->_symmetricEncryptionOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((void *)self->_symmetricEncryptionOperationInternal + 1) = a3;
}

- (_SFSymmetricKeySpecifier)encryptionKeySpecifier
{
  return (_SFSymmetricKeySpecifier *)(id)[*((id *)self->_symmetricEncryptionOperationInternal + 2) copy];
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  uint64_t v4 = [a3 copy];
  symmetricEncryptionOperationInternal = self->_symmetricEncryptionOperationInternal;
  v6 = (void *)symmetricEncryptionOperationInternal[2];
  symmetricEncryptionOperationInternal[2] = v4;
}

- (void).cxx_destruct
{
}

@end