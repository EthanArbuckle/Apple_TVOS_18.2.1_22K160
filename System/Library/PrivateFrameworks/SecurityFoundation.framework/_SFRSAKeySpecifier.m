@interface _SFRSAKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFRSAKeySpecifier)initWithBitSize:(int64_t)a3;
- (_SFRSAKeySpecifier)initWithCoder:(id)a3;
- (int64_t)bitSize;
- (void)setBitSize:(int64_t)a3;
@end

@implementation _SFRSAKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFRSAKeySpecifier)initWithBitSize:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____SFRSAKeySpecifier;
  v4 = -[_SFRSAKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SFRSAKeySpecifier_Ivars);
    id rsaKeySpecifierInternal = v4->_rsaKeySpecifierInternal;
    v4->_id rsaKeySpecifierInternal = v5;

    *((void *)v4->_rsaKeySpecifierInternal + 1) = a3;
  }

  return v4;
}

- (_SFRSAKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFRSAKeySpecifier;
  return -[_SFRSAKeySpecifier init](&v4, sel_init, a3);
}

- (int64_t)bitSize
{
  return *((void *)self->_rsaKeySpecifierInternal + 1);
}

- (void)setBitSize:(int64_t)a3
{
  *((void *)self->_rsaKeySpecifierInternal + 1) = a3;
}

- (void).cxx_destruct
{
}

@end