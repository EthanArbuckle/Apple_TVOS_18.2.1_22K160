@interface OS_dispatch_data
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_bytesAreVM;
- (BOOL)_isCompact;
- (NSString)debugDescription;
- (OS_dispatch_data)init;
- (OS_dispatch_data)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7;
- (id)debugDescription;
- (unint64_t)length;
- (void)_getContext;
- (void)_setContext:(void *)a3;
- (void)_setFinalizer:(void *)a3;
- (void)_setTargetQueue:(id)a3;
- (void)dealloc;
@end

@implementation OS_dispatch_data

+ (id)allocWithZone:(_NSZone *)a3
{
  return _dispatch_objc_alloc((objc_class *)a1, 64LL);
}

- (OS_dispatch_data)init
{
  return -[OS_dispatch_data initWithBytes:length:copy:freeWhenDone:bytesAreVM:]( self,  "initWithBytes:length:copy:freeWhenDone:bytesAreVM:",  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (OS_dispatch_data)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  if (a5)
  {
    v9 = 0LL;
  }

  else
  {
    if (a6)
    {
      if (a7) {
        v10 = (Block_layout **)&_dispatch_data_destructor_vm_deallocate;
      }
      else {
        v10 = (Block_layout **)&_dispatch_data_destructor_free;
      }
    }

    else
    {
      v10 = &_dispatch_data_destructor_none;
    }

    v9 = *v10;
  }

  _dispatch_data_init_with_bytes(self, (mach_vm_address_t)a3, a4, v9);
  return self;
}

- (void)dealloc
{
  Class isa = self[2].super.isa;
  v3 = (void (__cdecl *)(void *))self[3].super.isa;
  global_queue = (dispatch_queue_s *)self[1].super.isa;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OS_dispatch_data;
  -[OS_dispatch_data dealloc](&v8, "dealloc");
  if (v3) {
    BOOL v7 = isa == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (!global_queue) {
      global_queue = dispatch_get_global_queue(0LL, 0LL);
    }
    dispatch_channel_async_f(global_queue, isa, v3);
  }

  if (global_queue) {
    _os_object_release_internal(global_queue, v6);
  }
}

- (BOOL)_bytesAreVM
{
  return self[5].super.isa == (Class)&__block_literal_global_30;
}

- (void)_setContext:(void *)a3
{
  self[2].super.Class isa = (Class)a3;
}

- (void)_getContext
{
  return self[2].super.isa;
}

- (void)_setFinalizer:(void *)a3
{
  self[3].super.Class isa = (Class)a3;
}

- (void)_setTargetQueue:(id)a3
{
}

- (NSString)debugDescription
{
  result = (NSString *)objc_lookUpClass("NSString");
  if (result)
  {
    -[OS_dispatch_data debugDescription].cold.1(self, result, &v4);
    return v4;
  }

  return result;
}

- (unint64_t)length
{
  return (unint64_t)self[6].super.isa;
}

- (BOOL)_isCompact
{
  if (self[6].super.isa)
  {
    Class isa = self[7].super.isa;
    if (isa == (Class)((char *)&dword_0 + 1))
    {
      v6 = self + 8;
      self = (OS_dispatch_data *)self[8].super.isa;
      Class v3 = v6[1].super.isa;
      if (!self[7].super.isa) {
        goto LABEL_4;
      }
    }

    else
    {
      Class v3 = 0LL;
      if (!isa)
      {
LABEL_4:
        v4 = (char *)self[4].super.isa + (unint64_t)v3;
        return v4 != 0LL;
      }
    }

    Class v7 = self[4].super.isa;
    v4 = (char *)v3 + (void)v7;
    if (!v7) {
      v4 = 0LL;
    }
    return v4 != 0LL;
  }

  return 1;
}

- (id)debugDescription
{
  id result = [a2 stringWithUTF8String:"<%s: %s>"];
  if (result) {
    id result = objc_msgSend(a2, "stringWithFormat:", result, object_getClassName(a1), __str);
  }
  *a3 = result;
  return result;
}

@end