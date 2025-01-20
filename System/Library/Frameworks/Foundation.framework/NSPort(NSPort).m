@interface NSPort(NSPort)
+ (id)allocWithZone:()NSPort;
+ (id)port;
+ (id)portWithMachPort:()NSPort;
- (uint64_t)classForCoder;
- (uint64_t)classForPortCoder;
- (uint64_t)initWithCoder:()NSPort;
- (uint64_t)initWithMachPort:()NSPort;
- (uint64_t)machPort;
- (uint64_t)replacementObjectForCoder:()NSPort;
- (uint64_t)reservedSpaceLength;
- (uint64_t)sendBeforeDate:()NSPort msgid:components:from:reserved:;
- (void)delegate;
- (void)invalidate;
- (void)isValid;
- (void)sendBeforeDate:()NSPort components:from:reserved:;
- (void)setDelegate:()NSPort;
@end

@implementation NSPort(NSPort)

+ (id)allocWithZone:()NSPort
{
  if ((objc_class *)MEMORY[0x189604000] == a1) {
    return (id)objc_msgSend(MEMORY[0x189603F98], "allocWithZone:");
  }
  else {
    return NSAllocateObject(a1, 0LL, a3);
  }
}

+ (id)port
{
  return (id)[objc_allocWithZone(a1) init];
}

+ (id)portWithMachPort:()NSPort
{
  return (id)[objc_allocWithZone(MEMORY[0x189603F98]) initWithMachPort:a3];
}

- (uint64_t)initWithMachPort:()NSPort
{
  return 0LL;
}

- (void)invalidate
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)isValid
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)machPort
{
  return 0LL;
}

- (void)setDelegate:()NSPort
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)delegate
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)reservedSpaceLength
{
  return 0LL;
}

- (uint64_t)replacementObjectForCoder:()NSPort
{
  return 0LL;
}

- (uint64_t)classForPortCoder
{
  return objc_opt_self();
}

- (uint64_t)classForCoder
{
  uint64_t v0 = objc_opt_class();
  v1 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ asked to archive; %@ only codes for port coding (Distributed Objects).",
                   v0,
                   objc_opt_class()),
                 0LL);
  objc_exception_throw(v1);
  return -[NSPort(NSPort) initWithCoder:]();
}

- (uint64_t)initWithCoder:()NSPort
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSPort_0;
  objc_msgSendSuper2(&v2, sel_dealloc);
  return 0LL;
}

- (void)sendBeforeDate:()NSPort components:from:reserved:
{
  v4 = NSClassFromString((NSString *)@"NSPort");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (uint64_t)sendBeforeDate:()NSPort msgid:components:from:reserved:
{
  return [a1 sendBeforeDate:a3 components:a5 from:a6 reserved:a7];
}

@end