@interface _SFAESKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFAESKeySpecifier)initWithBitSize:(int64_t)a3;
- (_SFAESKeySpecifier)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bitSize;
- (int64_t)blockSize;
- (int64_t)keyLengthInBytes;
- (void)setBitSize:(int64_t)a3;
@end

@implementation _SFAESKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFAESKeySpecifier)initWithBitSize:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____SFAESKeySpecifier;
  v4 = -[_SFAESKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SFAESKeySpecifier_Ivars);
    id aesKeySpecifierInternal = v4->_aesKeySpecifierInternal;
    v4->_id aesKeySpecifierInternal = v5;

    *((void *)v4->_aesKeySpecifierInternal + 1) = a3;
  }

  return v4;
}

- (_SFAESKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFAESKeySpecifier;
  return -[_SFAESKeySpecifier init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithBitSize:*((void *)self->_aesKeySpecifierInternal + 1)];
}

- (id)description
{
  v3 = (void *)NSString;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____SFAESKeySpecifier;
  -[_SFAESKeySpecifier description](&v7, sel_description);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@ bitSize: %ld", v4, 8 * -[_SFAESKeySpecifier keyLengthInBytes](self, "keyLengthInBytes")];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)bitSize
{
  return *((void *)self->_aesKeySpecifierInternal + 1);
}

- (void)setBitSize:(int64_t)a3
{
  *((void *)self->_aesKeySpecifierInternal + 1) = a3;
}

- (int64_t)keyLengthInBytes
{
  unint64_t v2 = *((void *)self->_aesKeySpecifierInternal + 1);
  if (v2 < 3) {
    return 8 * v2 + 16;
  }
  [MEMORY[0x1896077D8] currentHandler];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SFKey.m" lineNumber:305 description:@"unexected AES key bit size"];

  return result;
}

- (int64_t)blockSize
{
  return 16LL;
}

- (void).cxx_destruct
{
}

@end