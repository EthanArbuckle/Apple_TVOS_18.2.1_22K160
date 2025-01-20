@interface NSInputStream(NSInputStream)
+ (NSCFInputStream)allocWithZone:()NSInputStream;
+ (id)inputStreamWithData:()NSInputStream;
+ (id)inputStreamWithFileAtPath:()NSInputStream;
+ (id)inputStreamWithURL:()NSInputStream;
- (id)dealloc;
- (id)initWithData:()NSInputStream;
- (id)initWithURL:()NSInputStream;
- (void)getBuffer:()NSInputStream length:;
- (void)hasBytesAvailable;
- (void)read:()NSInputStream maxLength:;
@end

@implementation NSInputStream(NSInputStream)

+ (NSCFInputStream)allocWithZone:()NSInputStream
{
  if ((objc_class *)MEMORY[0x189603F80] == a1) {
    return +[NSCFInputStream allocWithZone:](&OBJC_CLASS___NSCFInputStream, "allocWithZone:");
  }
  else {
    return (NSCFInputStream *)NSAllocateObject(a1, 0LL, a3);
  }
}

+ (id)inputStreamWithData:()NSInputStream
{
  return (id)[objc_allocWithZone(a1) initWithData:a3];
}

+ (id)inputStreamWithFileAtPath:()NSInputStream
{
  return (id)[objc_allocWithZone(a1) initWithFileAtPath:a3];
}

+ (id)inputStreamWithURL:()NSInputStream
{
  return (id)[objc_allocWithZone(a1) initWithURL:a3];
}

- (id)initWithData:()NSInputStream
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)initWithURL:()NSInputStream
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_CLASS___NSInputStream_0;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  MEMORY[0x186E1EB38]();
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_CLASS___NSInputStream_0;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (void)read:()NSInputStream maxLength:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)getBuffer:()NSInputStream length:
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)hasBytesAvailable
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSStream");
  NSRequestConcreteImplementation(a1, a2, v4);
}

@end