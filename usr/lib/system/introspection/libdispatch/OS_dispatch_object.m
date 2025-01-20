@interface OS_dispatch_object
- (OS_dispatch_object)init;
- (id)debugDescription;
@end

@implementation OS_dispatch_object

- (OS_dispatch_object)init
{
  qword_61228 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (id)debugDescription
{
  id result = objc_lookUpClass("NSString");
  if (result)
  {
    id v4 = result;
    Class isa = self->super.super.isa[7].isa;
    if (isa)
    {
      ((void (*)(OS_dispatch_object *, _BYTE *, uint64_t))isa)(self, v7, 2048LL);
    }

    else
    {
      ClassName = object_getClassName(self);
      __strlcpy_chk(v7, ClassName, 2048LL, 2048LL);
    }

    id result = [v4 stringWithUTF8String:"<%s: %s>"];
    if (result) {
      return objc_msgSend(v4, "stringWithFormat:", result, object_getClassName(self), v7);
    }
  }

  return result;
}

@end