@interface NSInvocationOperation
- (NSInvocation)invocation;
- (NSInvocationOperation)init;
- (NSInvocationOperation)initWithInvocation:(NSInvocation *)inv;
- (NSInvocationOperation)initWithTarget:(id)target selector:(SEL)sel object:(id)arg;
- (id)result;
- (void)dealloc;
- (void)main;
@end

@implementation NSInvocationOperation

- (NSInvocationOperation)init
{
  return -[NSInvocationOperation initWithInvocation:](self, "initWithInvocation:", 0LL);
}

- (NSInvocationOperation)initWithTarget:(id)target selector:(SEL)sel object:(id)arg
{
  v19[1] = *MEMORY[0x1895F89C0];
  v19[0] = arg;
  v9 = (void *)[target methodSignatureForSelector:sel];
  if (!v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___NSInvocationOperation;
    -[NSOperation init](&v18, sel_init);
LABEL_10:

    return 0LL;
  }

  v10 = v9;
  unint64_t v11 = [v9 numberOfArguments];
  unint64_t v12 = v11;
  if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v11 >= 4)
    {
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = NSStringFromSelector(sel);
      NSLog((NSString *)@"%@: method '%@' requires more than 1 argument", v15, v16);
    }

    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___NSInvocationOperation;
    -[NSOperation init](&v17, sel_init);
    goto LABEL_10;
  }

  v13 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v10];
  [v13 setTarget:target];
  [v13 setSelector:sel];
  if (v12 >= 3) {
    [v13 setArgument:v19 atIndex:2];
  }
  return -[NSInvocationOperation initWithInvocation:](self, "initWithInvocation:", v13);
}

- (NSInvocationOperation)initWithInvocation:(NSInvocation *)inv
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (inv)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSInvocationOperation;
    v5 = -[NSOperation init](&v7, sel_init);
    -[NSInvocation retainArguments](inv, "retainArguments");
    v5->_inv = inv;
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___NSInvocationOperation;
    -[NSOperation init](&v8, sel_init);

    return 0LL;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSInvocationOperation;
  -[NSOperation dealloc](&v3, sel_dealloc);
}

- (NSInvocation)invocation
{
  return self->_inv;
}

- (void)main
{
}

- (id)result
{
  v24[1] = *MEMORY[0x1895F89C0];
  v24[0] = 0LL;
  BOOL v5 = -[NSOperation isFinished](self, "isFinished");
  id result = 0LL;
  if (!v5) {
    return result;
  }
  if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v20 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: operation was cancelled",  _NSMethodExceptionProem((objc_class *)self, a2));
    objc_super v18 = (void *)MEMORY[0x189603F70];
    v19 = @"NSInvocationOperationCancelledException";
    goto LABEL_14;
  }

  p_iop = (os_unfair_lock_s *)&self->super._iop;
  os_unfair_lock_lock(&self->super._iop.__lock);
  exception = self->_exception;
  if (exception)
  {
LABEL_15:
    v21 = exception;
    iop_unlock(p_iop);
    objc_exception_throw(v21);
    -[_NSBarrierOperation main](v22, v23);
    return result;
  }

  inv = self->_inv;
  if (!inv
    || !-[NSMethodSignature methodReturnLength]( -[NSInvocation methodSignature](inv, "methodSignature"),  "methodReturnLength"))
  {
    objc_super v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: operation had void result",  _NSMethodExceptionProem((objc_class *)self, a2));
    iop_unlock(p_iop);
    objc_super v18 = (void *)MEMORY[0x189603F70];
    v19 = @"NSInvocationOperationVoidResultException";
    v20 = v17;
LABEL_14:
    objc_exception_throw((id)[v18 exceptionWithName:v19 reason:v20 userInfo:0]);
    goto LABEL_15;
  }

  uint64_t v9 = -[NSInvocation methodSignature](self->_inv, "methodSignature");
  v10 = -[NSMethodSignature methodReturnType](v9, "methodReturnType");
  unint64_t v11 = &v10[strspn(v10, "norNORV+0123456789")];
  int v12 = *(unsigned __int8 *)v11;
  if (v12 == 64 || v12 == 35)
  {
    -[NSInvocation getReturnValue:](self->_inv, "getReturnValue:", v24);
  }

  else
  {
    uint64_t v13 = -[NSMethodSignature methodReturnLength](v9, "methodReturnLength");
    *(void *)&double v14 = MEMORY[0x1895F8858](v13).n128_u64[0];
    v16 = (char *)v24 - v15;
    -[NSInvocation getReturnValue:](self->_inv, "getReturnValue:", (char *)v24 - v15, v14);
    v24[0] = +[NSValue valueWithBytes:objCType:](&OBJC_CLASS___NSValue, "valueWithBytes:objCType:", v16, v11);
  }

  os_unfair_lock_unlock(&self->super._iop.__lock);
  return (id)v24[0];
}

@end