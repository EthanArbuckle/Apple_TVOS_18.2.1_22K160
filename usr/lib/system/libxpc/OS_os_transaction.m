@interface OS_os_transaction
- (OS_os_transaction)init;
- (id)description;
- (void)dealloc;
@end

@implementation OS_os_transaction

- (OS_os_transaction)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_os_transaction;
  -[OS_os_transaction dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    uint64_t description = os_transaction_get_description((uint64_t)self);
    uint64_t v6 = [v4 stringWithUTF8String:"<%s: %s>"];
    v7 = (objc_class *)objc_opt_class();
    return (id)objc_msgSend(v4, "stringWithFormat:", v6, class_getName(v7), description);
  }

  return result;
}

@end