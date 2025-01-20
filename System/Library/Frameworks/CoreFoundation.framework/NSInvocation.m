@interface NSInvocation
+ (NSInvocation)invocationWithMethodSignature:(NSMethodSignature *)sig;
+ (id)_invocationWithMethodSignature:(id)a3 frame:(void *)a4;
+ (uint64_t)requiredStackSizeForSignature:(uint64_t)a1;
- (BOOL)argumentsRetained;
- (NSInvocation)init;
- (NSMethodSignature)methodSignature;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)target;
- (uint64_t)_initWithMethodSignature:(const void *)a3 frame:(void *)a4 buffer:(size_t)a5 size:;
- (void)_addAttachedObject:(id)a3;
- (void)dealloc;
- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
- (void)getReturnValue:(void *)retLoc;
- (void)invoke;
- (void)invokeUsingIMP:(IMP)imp;
- (void)invokeWithTarget:(id)target;
- (void)retainArguments;
- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx;
- (void)setReturnValue:(void *)retLoc;
- (void)setSelector:(SEL)selector;
- (void)setTarget:(id)target;
@end

@implementation NSInvocation

+ (uint64_t)requiredStackSizeForSignature:(uint64_t)a1
{
  return [a2 frameLength] + 320;
}

- (uint64_t)_initWithMethodSignature:(const void *)a3 frame:(void *)a4 buffer:(size_t)a5 size:
{
  if (!a1) {
    return a1;
  }
  uint64_t result = [a2 frameLength];
  if (result + 320 <= a5)
  {
    *(void *)(a1 + 24) = a2;
    *(void *)(a1 + 32) = 0LL;
    *(void *)(a1 + 16) = a4;
    bzero(a4, a5);
    *(void *)(a1 + 8) = *(void *)(a1 + 16) + 320LL;
    if (magic_cookie_oGuard != -1) {
      dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
    }
    *(_DWORD *)(a1 + 48) = magic_cookie_oValue;
    if (a3) {
      memmove(*(void **)(a1 + 8), a3, [a2 frameLength]);
    }
    *(_WORD *)(a1 + 52) = 256;
    return a1;
  }

  __break(1u);
  return result;
}

+ (id)_invocationWithMethodSignature:(id)a3 frame:(void *)a4
{
  if (!a3)
  {
    uint64_t v19 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: method signature argument cannot be nil",  v19);
LABEL_11:
    v15 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v15);
    return +[NSInvocation invocationWithMethodSignature:](v16, v17, v18);
  }

  unint64_t v8 = [a3 frameLength];
  size_t v9 = v8 + 320;
  uint64_t v10 = v8 >= 0xFFFFFFFFFFFFFEC0LL;
  uint64_t v11 = v10 << 63 >> 63;
  if (v11 != v10 || v11 < 0)
  {
    uint64_t v20 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"Overflow while allocating space for method signature %@",  v20);
    goto LABEL_11;
  }

  id v12 = objc_alloc((Class)a1);
  *((void *)v12 + 3) = a3;
  v13 = (char *)calloc(1uLL, v9);
  *((void *)v12 + 1) = v13 + 320;
  *((void *)v12 + 2) = v13;
  *((void *)v12 + 4) = 0LL;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  *((_DWORD *)v12 + 12) = magic_cookie_oValue;
  if (a4) {
    memmove(*((void **)v12 + 1), a4, [a3 frameLength]);
  }
  *((_BYTE *)v12 + 52) = 0;
  return v12;
}

+ (NSInvocation)invocationWithMethodSignature:(NSMethodSignature *)sig
{
  return (NSInvocation *)[a1 _invocationWithMethodSignature:sig frame:0];
}

- (NSInvocation)init
{
  return 0LL;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_stackAllocated == 1)
  {

    objc_destructInstance(self);
  }

  else
  {
    retdata = self->_retdata;
    if (retdata) {
      free(retdata);
    }
    self->_frame = 0LL;
    self->_retdata = 0LL;

    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___NSInvocation;
    -[NSInvocation dealloc](&v4, sel_dealloc);
  }

- (NSMethodSignature)methodSignature
{
  return self->_signature;
}

- (void)retainArguments
{
  qword_18C539A70 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (BOOL)argumentsRetained
{
  return self->_retainedArgs != 0;
}

- (void)_addAttachedObject:(id)a3
{
  if (a3)
  {
    container = self->_container;
    if (!container)
    {
      container = (NSMutableArray *)objc_opt_new();
      self->_container = container;
    }

    -[NSMutableArray addObject:](container, "addObject:", a3);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int magic = self->_magic;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  if (magic != magic_cookie_oValue) {
    -[NSInvocation copyWithZone:].cold.1();
  }
  uint64_t v5 = objc_alloc((Class)objc_opt_class());
  v5[3] = self->_signature;
  v6 = (char *)calloc(1uLL, -[NSMethodSignature frameLength](self->_signature, "frameLength") + 320);
  v5[1] = v6 + 320;
  v5[2] = v6;
  v5[4] = 0LL;
  *((_DWORD *)v5 + 12) = self->_magic;
  if (self->_retainedArgs) {
    [v5 retainArguments];
  }
  return v5;
}

- (id)target
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = 0LL;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v3, 0LL);
  return (id)v3[0];
}

- (void)setTarget:(id)target
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = target;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v3, 0LL);
}

- (SEL)selector
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = 0LL;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v3, 1LL);
  return (SEL)v3[0];
}

- (void)setSelector:(SEL)selector
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = selector;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v3, 1LL);
}

- (void)getReturnValue:(void *)retLoc
{
}

- (void)setReturnValue:(void *)retLoc
{
}

- (void)getArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  retdata = self->_retdata;
  signature = self->_signature;
  frame = self->_frame;
  NSInteger v10 = -[NSMethodSignature numberOfArguments](signature, "numberOfArguments");
  if (idx < -1 || v10 <= idx)
  {
    NSInteger v12 = v10;
    uint64_t v20 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: index (%ld) out of bounds [-1, %ld]",  v20,  idx,  v12 - 1);
    goto LABEL_10;
  }

  if (!argumentLocation)
  {
    idx = (NSInteger)&__kCFAllocatorSystemDefault;
    uint64_t v21 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@: NULL address argument", v21);
LABEL_10:
    v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v13);
    if (v15 == 1)
    {
      id v16 = objc_begin_catch(v14);
      uint64_t v17 = [v16 reason];
      uint64_t v18 = __CFExceptionProem((objc_class *)self, sel_getArgument_atIndex_);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: %@ at index %ld",  v18,  v17,  idx);
      uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:]( NSException,  "exceptionWithName:reason:userInfo:",  [v16 name],  _CFAutoreleasePoolAddObject(),  0);
      objc_exception_throw(v19);
      __break(1u);
      JUMPOUT(0x180B63E30LL);
    }

    _Unwind_Resume(v14);
  }

  uint64_t v11 = -[NSMethodSignature _argInfo:](signature, "_argInfo:", idx);
  if ((idx & 0x8000000000000000LL) == 0 || (*(_WORD *)(v11 + 34) & 0x80) != 0) {
    retdata = frame;
  }
  __NSI1(v11, (uint64_t)retdata, (char *)argumentLocation, 1);
}

- (void)setArgument:(void *)argumentLocation atIndex:(NSInteger)idx
{
  NSInteger v8 = -[NSMethodSignature numberOfArguments](self->_signature, "numberOfArguments");
  NSInteger v9 = v8;
  if (idx < -1 || v8 <= idx)
  {
    uint64_t v22 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: index (%ld) out of bounds [-1, %ld]",  v22,  idx,  v9 - 1);
    goto LABEL_18;
  }

  NSInteger v10 = -[NSMethodSignature _argInfo:](self->_signature, "_argInfo:", idx);
  if (!argumentLocation)
  {
    idx = (NSInteger)&__kCFAllocatorSystemDefault;
    uint64_t v23 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@: NULL address argument", v23);
LABEL_18:
    int v15 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v15);
    if (v17 == 1)
    {
      id v18 = objc_begin_catch(v16);
      uint64_t v19 = [v18 reason];
      uint64_t v20 = __CFExceptionProem((objc_class *)self, a2);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: %@ at index %ld",  v20,  v19,  idx);
      uint64_t v21 = +[NSException exceptionWithName:reason:userInfo:]( NSException,  "exceptionWithName:reason:userInfo:",  [v18 name],  _CFAutoreleasePoolAddObject(),  0);
      objc_exception_throw(v21);
      __break(1u);
      JUMPOUT(0x180B64084LL);
    }

    _Unwind_Resume(v16);
  }

  uint64_t v11 = (const UInt8 *)v10;
  if ((idx & 0x8000000000000000LL) == 0)
  {
    Class frame = (Class)self->_frame;
LABEL_6:
    __NSICreateBackingForArgumentIfNeeded((uint64_t)self, (uint64_t)v10, idx, 0);
    goto LABEL_11;
  }

  __int16 v13 = *((_WORD *)v10 + 17);
  uint64_t v14 = 1LL;
  if ((v13 & 0x80) == 0) {
    uint64_t v14 = 2LL;
  }
  Class frame = (&self->super.isa)[v14];
LABEL_11:
  __NSI2((uint64_t)v11, (uint64_t)frame, (double *)argumentLocation, 1);
}

- (void)invoke
{
  qword_18C539A70 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)invokeUsingIMP:(IMP)imp
{
  v11[1] = *MEMORY[0x1895F89C0];
  unsigned int magic = self->_magic;
  if (magic_cookie_oGuard != -1) {
    dispatch_once(&magic_cookie_oGuard, &__block_literal_global_29);
  }
  if (magic != magic_cookie_oValue) {
    -[NSInvocation invokeUsingIMP:].cold.1();
  }
  v11[0] = 0LL;
  -[NSInvocation getArgument:atIndex:](self, "getArgument:atIndex:", v11, 0LL);
  if (v11[0])
  {
    v6 = -[NSMethodSignature _frameDescriptor](self->_signature, "_frameDescriptor");
    uint64_t var0 = (uint64_t)v6->var0;
    if ((*((_WORD *)v6->var0 + 17) & 0x80) != 0
      && !*(void *)((char *)self->_frame + *(_DWORD *)(var0 + 28) + *(unsigned __int8 *)(var0 + 32)))
    {
      __NSICreateBackingForArgumentIfNeeded((uint64_t)self, var0, -1LL, 0);
    }

    __invoking___( (uint64_t (*)(unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, unint64_t, __n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))imp,  (uint64_t)self->_retdata,  (__n128 *)self->_frame,  -[NSMethodSignature frameLength](self->_signature, "frameLength"));
    if (self->_retainedArgs)
    {
      NSInteger v8 = (const UInt8 *)v6->var0;
      uint64_t v9 = 1LL;
      if ((*((_WORD *)v6->var0 + 17) & 0x80) == 0) {
        uint64_t v9 = 2LL;
      }
      Class frame = (&self->super.isa)[v9];
LABEL_12:
      __NSI3(v8, (uint64_t)frame, (id *)&self->_container, 1);
      while (1)
      {
        v6 = (NSMethodFrameDescriptor *)v6->var1;
        if (!v6) {
          break;
        }
        if ((WORD1(v6[1].var1) & 3) != 1)
        {
          Class frame = (Class)self->_frame;
          NSInteger v8 = (const UInt8 *)v6;
          goto LABEL_12;
        }
      }
    }
  }

- (void)invokeWithTarget:(id)target
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = target;
  -[NSInvocation setArgument:atIndex:](self, "setArgument:atIndex:", v4, 0LL);
  -[NSInvocation invoke](self, "invoke");
}

- (void)copyWithZone:.cold.1()
{
  qword_18C539A70 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

- (void)invokeUsingIMP:.cold.1()
{
  qword_18C539A70 = (uint64_t)"Corrupt NSInvocation detected.";
  __break(1u);
}

@end