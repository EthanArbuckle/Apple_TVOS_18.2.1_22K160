@interface __NSPlaceholderOrderedSet
- (__NSPlaceholderOrderedSet)init;
- (__NSPlaceholderOrderedSet)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)retainCount;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSPlaceholderOrderedSet

- (__NSPlaceholderOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    uint64_t v6 = _os_log_pack_size();
    v8 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSPlaceholderOrderedSet initWithObjects:count:]",  a4);
    goto LABEL_17;
  }

  if (a4)
  {
    uint64_t v4 = 0LL;
    while (a3[v4])
    {
      if (a4 == ++v4)
      {
        if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetI_new((uint64_t)a3, a4, 0);
        }
LABEL_11:
        if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet) {
          return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new((id *)a3, a4, 0);
        }
        __break(1u);
        return self;
      }
    }

    uint64_t v5 = v4;
    uint64_t v6 = _os_log_pack_size();
    v8 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[__NSPlaceholderOrderedSet initWithObjects:count:]",  v5);
    while (1)
    {
LABEL_17:
      v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
      objc_exception_throw(v10);
LABEL_18:
      unint64_t v11 = a4;
      uint64_t v6 = _os_log_pack_size();
      v8 = (char *)v17 - ((MEMORY[0x1895F8858](v6, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSPlaceholderOrderedSet initWithObjects:count:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = v11;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSPlaceholderOrderedSet initWithObjects:count:]",  v11);
    }
  }

  if (self != (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    goto LABEL_11;
  }
  if (initWithObjects_count__static_init != -1) {
    dispatch_once(&initWithObjects_count__static_init, &__block_literal_global_37);
  }
  return (__NSPlaceholderOrderedSet *)(id)initWithObjects_count____NSOrderedSet0__;
}

- (__NSPlaceholderOrderedSet)initWithCapacity:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderOrderedSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: capacity (%lu) is ridiculous",  "-[__NSPlaceholderOrderedSet initWithCapacity:]",  a3);
    uint64_t v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v7);
    goto LABEL_6;
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet)
  {
LABEL_6:
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderOrderedSet, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }

  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet) {
    goto LABEL_7;
  }
  return (__NSPlaceholderOrderedSet *)__NSOrderedSetM_new(0LL, a3, 0);
}

- (__NSPlaceholderOrderedSet)init
{
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    return -[__NSPlaceholderOrderedSet initWithObjects:count:]( &___immutablePlaceholderOrderedSet,  "initWithObjects:count:",  0LL,  0LL);
  }
  if (self == (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet) {
    return -[__NSPlaceholderOrderedSet initWithCapacity:](&___mutablePlaceholderOrderedSet, "initWithCapacity:", 0LL);
  }
  __break(1u);
  return self;
}

- (unint64_t)retainCount
{
  return -1LL;
}

- (unint64_t)count
{
  uint64_t v4 = "mutable";
  uint64_t v5 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v4 = "<unknown>";
    uint64_t v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v6 = "immutable";
  }
  else {
    uint64_t v6 = v4;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "NSOrderedSet";
  }
  else {
    uint64_t v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v9,  v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  return -[__NSPlaceholderOrderedSet indexOfObject:](v11, v12, v13);
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    v8 = "NSOrderedSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v10,  v7);
  unint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  return (unint64_t)-[__NSPlaceholderOrderedSet objectAtIndex:](v12, v13, v14);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    v8 = "NSOrderedSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v10,  v7);
  unint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  -[__NSPlaceholderOrderedSet insertObject:atIndex:](v12, v13, v14, v15);
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    v8 = "immutable";
  }
  else {
    v8 = v6;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v9 = "NSOrderedSet";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v11,  v8);
  SEL v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v12);
  -[__NSPlaceholderOrderedSet removeObjectAtIndex:](v13, v14, v15);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v5 = "mutable";
  uint64_t v6 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v5 = "<unknown>";
    uint64_t v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v7 = "immutable";
  }
  else {
    uint64_t v7 = v5;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    v8 = "NSOrderedSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v10,  v7);
  uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  -[__NSPlaceholderOrderedSet replaceObjectAtIndex:withObject:](v12, v13, v14, v15);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v6 = "mutable";
  uint64_t v7 = "NSMutableOrderedSet";
  if (self != (__NSPlaceholderOrderedSet *)&___mutablePlaceholderOrderedSet)
  {
    uint64_t v6 = "<unknown>";
    uint64_t v7 = "<unknown>";
  }

  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    v8 = "immutable";
  }
  else {
    v8 = v6;
  }
  if (self == (__NSPlaceholderOrderedSet *)&___immutablePlaceholderOrderedSet) {
    uint64_t v9 = "NSOrderedSet";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s ordered set object",  v11,  v8);
  SEL v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v12);
  CFBundleCopyLocalizedString(v13, v14, v15, v16);
}

@end