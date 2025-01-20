@interface NSPipe
+ (NSPipe)allocWithZone:(_NSZone *)a3;
+ (NSPipe)pipe;
- (NSFileHandle)fileHandleForReading;
- (NSFileHandle)fileHandleForWriting;
- (NSPipe)init;
@end

@implementation NSPipe

- (NSPipe)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPipe;
  return -[NSPipe init](&v3, sel_init);
}

+ (NSPipe)allocWithZone:(_NSZone *)a3
{
  if (&OBJC_CLASS___NSPipe == a1) {
    a1 = (id)objc_opt_self();
  }
  return (NSPipe *)NSAllocateObject((Class)a1, 0LL, a3);
}

+ (NSPipe)pipe
{
  return (NSPipe *)(id)[objc_allocWithZone((Class)NSPipe) init];
}

- (NSFileHandle)fileHandleForReading
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPipe");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSFileHandle)fileHandleForWriting
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPipe");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end