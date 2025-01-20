@interface OS_dispatch_object
- (OS_dispatch_object)init;
- (id)debugDescription;
@end

@implementation OS_dispatch_object

- (OS_dispatch_object)init
{
  qword_18C51C2A8 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    Class isa = self->super.super.isa[7].isa;
    if (isa)
    {
      ((void (*)(OS_dispatch_object *, _BYTE *, uint64_t))isa)(self, v6, 2048LL);
    }

    else
    {
      object_getClassName(self);
      __strlcpy_chk();
    }

    id result = (id)[v4 stringWithUTF8String:"<%s: %s>"];
    if (result) {
      return (id)objc_msgSend(v4, "stringWithFormat:", result, object_getClassName(self), v6);
    }
  }

  return result;
}

@end