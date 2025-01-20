@interface SecConcrete_sec_array
- (SecConcrete_sec_array)init;
- (void)dealloc;
@end

@implementation SecConcrete_sec_array

- (SecConcrete_sec_array)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_array;
  v2 = -[SecConcrete_sec_array init](&v7, sel_init);
  if (v2)
  {
    v3 = (OS_xpc_object *)xpc_array_create(0LL, 0LL);
    xpc_array = v2->xpc_array;
    v2->xpc_array = v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  xpc_array = self->xpc_array;
  if (xpc_array)
  {
    applier[0] = MEMORY[0x1895F87A8];
    applier[1] = 3221225472LL;
    applier[2] = __32__SecConcrete_sec_array_dealloc__block_invoke;
    applier[3] = &unk_189667548;
    applier[4] = self;
    xpc_array_apply(xpc_array, applier);
    v4 = self->xpc_array;
    self->xpc_array = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SecConcrete_sec_array;
  -[SecConcrete_sec_array dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end