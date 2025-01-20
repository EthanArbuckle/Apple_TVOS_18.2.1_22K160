@interface NSOutputStream(NSOutputStream)
+ (NSCFOutputStream)allocWithZone:()NSOutputStream;
+ (id)outputStreamToBuffer:()NSOutputStream capacity:;
+ (id)outputStreamToFileAtPath:()NSOutputStream append:;
+ (id)outputStreamToMemory;
+ (id)outputStreamWithURL:()NSOutputStream append:;
- (id)dealloc;
- (id)initToBuffer:()NSOutputStream capacity:;
- (id)initToMemory;
- (id)initWithURL:()NSOutputStream append:;
- (void)hasSpaceAvailable;
- (void)write:()NSOutputStream maxLength:;
@end

@implementation NSOutputStream(NSOutputStream)

+ (NSCFOutputStream)allocWithZone:()NSOutputStream
{
  if ((objc_class *)MEMORY[0x189603FF8] == a1) {
    return +[NSCFOutputStream allocWithZone:](&OBJC_CLASS___NSCFOutputStream, "allocWithZone:");
  }
  else {
    return (NSCFOutputStream *)NSAllocateObject(a1, 0LL, a3);
  }
}

- (void)write:()NSOutputStream maxLength:
{
  v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasSpaceAvailable
{
  v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

+ (id)outputStreamToMemory
{
  return (id)[objc_allocWithZone(a1) initToMemory];
}

+ (id)outputStreamToBuffer:()NSOutputStream capacity:
{
  return (id)[objc_allocWithZone(a1) initToBuffer:a3 capacity:a4];
}

+ (id)outputStreamToFileAtPath:()NSOutputStream append:
{
  return (id)[objc_allocWithZone(a1) initToFileAtPath:a3 append:a4];
}

+ (id)outputStreamWithURL:()NSOutputStream append:
{
  return (id)[objc_allocWithZone(a1) initWithURL:a3 append:a4];
}

- (id)initToMemory
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initToBuffer:()NSOutputStream capacity:
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSOutputStream append:
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSOutputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  MEMORY[0x186E1EE20]();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_CLASS___NSOutputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

@end