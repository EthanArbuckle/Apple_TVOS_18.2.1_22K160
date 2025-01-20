@interface UMUserPersonaContext
+ (id)currentPersonaContext;
- (UMUserPersonaContext)init;
- (id)copyPersonaContext:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)contextAdopt;
@end

@implementation UMUserPersonaContext

+ (id)currentPersonaContext
{
  return (id)objc_opt_new();
}

- (UMUserPersonaContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UMUserPersonaContext;
  v2 = -[UMUserPersonaContext init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = voucher_copy();
    voucher = v2->_voucher;
    v2->_voucher = (OS_voucher *)v3;
  }

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (void)contextAdopt
{
  voucher = self->_voucher;
  if (voucher)
  {
    v4 = voucher;

    v5 = self->_voucher;
    self->_voucher = 0LL;
  }

  else
  {
    v5 = (void *)voucher_adopt();
  }
}

- (id)copyPersonaContext:(id *)a3
{
  if (a3) {
    *a3 = 0LL;
  }
  return 0LL;
}

- (void).cxx_destruct
{
}

@end