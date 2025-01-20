@interface __NSPlaceholderSet
+ (void)initialize;
- (__NSPlaceholderSet)init;
- (__NSPlaceholderSet)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (__NSPlaceholderSet)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation __NSPlaceholderSet

- (unint64_t)count
{
  v4 = "mutable";
  v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v6 = "immutable";
  }
  else {
    v6 = v4;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v7 = "NSSet";
  }
  else {
    v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s set object",  v9,  v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  return (unint64_t)-[__NSPlaceholderSet member:](v11, v12, v13);
}

- (id)member:(id)a3
{
  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v8 = "NSSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s set object",  v10,  v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  return -[__NSPlaceholderSet objectEnumerator](v12, v13);
}

- (id)objectEnumerator
{
  v4 = "mutable";
  v5 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v6 = "immutable";
  }
  else {
    v6 = v4;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v7 = "NSSet";
  }
  else {
    v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s set object",  v9,  v6);
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  -[__NSPlaceholderSet addObject:](v11, v12, v13);
  return result;
}

- (void)addObject:(id)a3
{
  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v8 = "NSSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s set object",  v10,  v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  -[__NSPlaceholderSet removeObject:](v12, v13, v14);
}

- (void)removeObject:(id)a3
{
  v5 = "mutable";
  v6 = "NSMutableSet";
  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    v8 = "NSSet";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s set object",  v10,  v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  +[__NSPlaceholderSet initialize](v12, v13);
}

+ (void)initialize
{
  if (&OBJC_CLASS_____NSPlaceholderSet == a1) {
    __NSSet0__ = __NSSetI_new(0LL, 0LL, 0LL, 0);
  }
}

- (__NSPlaceholderSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    uint64_t v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSPlaceholderSet initWithObjects:count:]",  a4);
    goto LABEL_17;
  }

  if (a4)
  {
    uint64_t v4 = 0LL;
    while (a3[v4])
    {
      if (a4 == ++v4) {
        goto LABEL_8;
      }
    }

    uint64_t v5 = v4;
    uint64_t v6 = _os_log_pack_size();
    v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[__NSPlaceholderSet initWithObjects:count:]",  v5);
    while (1)
    {
LABEL_17:
      uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v7,  v6);
      objc_exception_throw(v9);
LABEL_18:
      unint64_t v10 = a4;
      uint64_t v6 = _os_log_pack_size();
      v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSPlaceholderSet initWithObjects:count:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = v10;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSPlaceholderSet initWithObjects:count:]",  v10);
    }
  }

- (__NSPlaceholderSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a4) {
    goto LABEL_12;
  }
  v7 = (__objc2_class *)objc_opt_class();
  BOOL v8 = v7 == &OBJC_CLASS_____NSSetI || v7 == &OBJC_CLASS_____NSSetM;
  if (!v8 && v7 != &OBJC_CLASS_____NSFrozenSetM) {
    goto LABEL_12;
  }
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet) {
    return (__NSPlaceholderSet *)[a3 mutableCopyWithZone:0];
  }
  if (self != (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
LABEL_12:
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS_____NSPlaceholderSet;
    return -[NSSet initWithSet:copyItems:](&v11, sel_initWithSet_copyItems_, a3, v4);
  }

  return (__NSPlaceholderSet *)[a3 copyWithZone:0];
}

- (__NSPlaceholderSet)initWithCapacity:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderSet initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: capacity (%lu) is ridiculous",  "-[__NSPlaceholderSet initWithCapacity:]",  a3);
    v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v7);
    goto LABEL_6;
  }

  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet)
  {
LABEL_6:
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderSet, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }

  if (self != (__NSPlaceholderSet *)&___mutablePlaceholderSet) {
    goto LABEL_7;
  }
  return (__NSPlaceholderSet *)__NSSetM_new(0LL, a3, 0);
}

- (__NSPlaceholderSet)init
{
  if (self == (__NSPlaceholderSet *)&___immutablePlaceholderSet) {
    return -[__NSPlaceholderSet initWithObjects:count:](&___immutablePlaceholderSet, "initWithObjects:count:", 0LL, 0LL);
  }
  if (self == (__NSPlaceholderSet *)&___mutablePlaceholderSet) {
    return -[__NSPlaceholderSet initWithCapacity:](&___mutablePlaceholderSet, "initWithCapacity:", 0LL);
  }
  __break(1u);
  return self;
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end