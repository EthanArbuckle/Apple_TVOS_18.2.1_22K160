@interface _SFECKeySpecifier
+ (BOOL)supportsSecureCoding;
+ (Class)keyClass;
- (_SFECKeySpecifier)initWithCoder:(id)a3;
- (_SFECKeySpecifier)initWithCurve:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)curve;
- (void)setCurve:(int64_t)a3;
@end

@implementation _SFECKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECKeySpecifier)initWithCurve:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____SFECKeySpecifier;
  v4 = -[_SFECKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___SFECKeySpecifier_Ivars);
    id ecKeySpecifierInternal = v4->_ecKeySpecifierInternal;
    v4->_id ecKeySpecifierInternal = v5;

    *((void *)v4->_ecKeySpecifierInternal + 1) = a3;
  }

  return v4;
}

- (_SFECKeySpecifier)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____SFECKeySpecifier;
  return -[_SFECKeySpecifier init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithCurve:",  *((void *)self->_ecKeySpecifierInternal + 1));
}

- (id)description
{
  if (*((void *)self->_ecKeySpecifierInternal + 1) >= 8uLL) {
    v2 = 0LL;
  }
  else {
    v2 = @"nistp521-compressed";
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____SFECKeySpecifier;
  v3 = -[_SFECKeySpecifier description](&v7, sel_description);
  [NSString stringWithFormat:@" curve: %@", v2];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingString:v4];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)curve
{
  return *((void *)self->_ecKeySpecifierInternal + 1);
}

- (void)setCurve:(int64_t)a3
{
  *((void *)self->_ecKeySpecifierInternal + 1) = a3;
}

- (void).cxx_destruct
{
}

@end