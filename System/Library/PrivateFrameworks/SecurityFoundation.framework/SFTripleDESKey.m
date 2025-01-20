@interface SFTripleDESKey
- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4;
@end

@implementation SFTripleDESKey

- (id)initRandomKeyWithSpecifier:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SFTripleDESKey;
  return -[_SFSymmetricKey initRandomKeyWithSpecifier:error:](&v5, sel_initRandomKeyWithSpecifier_error_, a3, a4);
}

- (void).cxx_destruct
{
}

@end