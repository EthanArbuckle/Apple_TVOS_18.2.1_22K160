@interface __NSArray0
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
@end

@implementation __NSArray0

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (unint64_t)count
{
  return 0LL;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = _os_log_pack_size();
  uint64_t v5 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v5 = 136315394;
  *(void *)(v5 + 4) = "-[__NSArray0 objectAtIndex:]";
  *(_WORD *)(v5 + 12) = 2048;
  *(void *)(v5 + 14) = a3;
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArray0 objectAtIndex:]",  a3);
  v6 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v4);
  objc_exception_throw(v6);
  return -[__NSArray0 objectEnumerator](v7, v8);
}

- (id)objectEnumerator
{
  return &__NSEnumerator0__struct;
}

@end