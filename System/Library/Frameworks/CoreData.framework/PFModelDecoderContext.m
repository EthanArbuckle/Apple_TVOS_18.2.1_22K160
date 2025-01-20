@interface PFModelDecoderContext
+ (id)retainedContext;
- (void)dealloc;
@end

@implementation PFModelDecoderContext

+ (id)retainedContext
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v3 = *(void **)(StatusReg + 688);
  if (v3)
  {
    v4 = v3;
  }

  else
  {
    v3 = objc_alloc_init((Class)a1);
    v7.version = *MEMORY[0x189605258];
    *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
    v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x189605258] + 24LL);
    v7.equal = 0LL;
    v7.hash = 0LL;
    v7.copyDescription = v5;
    v3[3] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, &v7);
    *(void *)(StatusReg + 688) = v3;
  }

  return v3;
}

- (void)dealloc
{
  self->model = 0LL;
  self->entity = 0LL;

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFModelDecoderContext;
  -[PFModelDecoderContext dealloc](&v3, sel_dealloc);
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 688) = 0LL;
}

@end