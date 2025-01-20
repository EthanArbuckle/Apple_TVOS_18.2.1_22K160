@interface VoucherStore
- (VoucherStore)init;
@end

@implementation VoucherStore

- (VoucherStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VoucherStore;
  v2 = -[VoucherStore init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    vouchers = v2->_vouchers;
    v2->_vouchers = v3;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end