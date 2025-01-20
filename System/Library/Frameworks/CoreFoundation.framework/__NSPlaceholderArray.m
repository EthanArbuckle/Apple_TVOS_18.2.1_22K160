@interface __NSPlaceholderArray
- (__NSPlaceholderArray)init;
- (__NSPlaceholderArray)initWithArray:(id)a3;
- (__NSPlaceholderArray)initWithArray:(id)a3 copyItems:(BOOL)a4;
- (__NSPlaceholderArray)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderArray)initWithContentsOfFile:(id)a3;
- (__NSPlaceholderArray)initWithContentsOfURL:(id)a3;
- (__NSPlaceholderArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSPlaceholderArray

- (unint64_t)count
{
  v4 = "mutable";
  v5 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v6 = "immutable";
  }
  else {
    v6 = v4;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v7 = "NSArray";
  }
  else {
    v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s array object",  v9,  v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  return (unint64_t)-[__NSPlaceholderArray objectAtIndex:](v11, v12, v13);
}

- (id)objectAtIndex:(unint64_t)a3
{
  v5 = "mutable";
  v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v8 = "NSArray";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s array object",  v10,  v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  -[__NSPlaceholderArray insertObject:atIndex:](v12, v13, v14, v15);
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v6 = "mutable";
  v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v8 = "immutable";
  }
  else {
    v8 = v6;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v9 = "NSArray";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s array object",  v11,  v8);
  SEL v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v12);
  -[__NSPlaceholderArray removeObjectAtIndex:](v13, v14, v15);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v5 = "mutable";
  v6 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v8 = "NSArray";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s array object",  v10,  v7);
  uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  -[__NSPlaceholderArray replaceObjectAtIndex:withObject:](v12, v13, v14, v15);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v6 = "mutable";
  v7 = "NSMutableArray";
  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    v8 = "immutable";
  }
  else {
    v8 = v6;
  }
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    uint64_t v9 = "NSArray";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s array object",  v11,  v8);
  SEL v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v12);
  __NSArrayImmutablePlaceholder();
}

- (__NSPlaceholderArray)init
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    return -[__NSPlaceholderArray initWithObjects:count:]( &___immutablePlaceholderArray,  "initWithObjects:count:",  0LL,  0LL);
  }
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    return -[__NSPlaceholderArray initWithCapacity:](&___mutablePlaceholderArray, "initWithCapacity:", 0LL);
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderArray)initWithArray:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3);
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS_____NSPlaceholderArray;
    return -[NSArray initWithArray:copyItems:](&v6, sel_initWithArray_copyItems_, a3, 0LL);
  }

  return result;
}

- (__NSPlaceholderArray)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a4 || (id result = (__NSPlaceholderArray *)__initWithArrayDontCopyItems((__objc2_class **)self, a3)) == 0LL)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS_____NSPlaceholderArray;
    return -[NSArray initWithArray:copyItems:](&v8, sel_initWithArray_copyItems_, a3, v4);
  }

  return result;
}

- (__NSPlaceholderArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSPlaceholderArray initWithObjects:count:]",  a4);
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
    uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[__NSPlaceholderArray initWithObjects:count:]",  v5);
    while (1)
    {
LABEL_17:
      uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v7,  v6);
      objc_exception_throw(v9);
LABEL_18:
      unint64_t v10 = a4;
      uint64_t v6 = _os_log_pack_size();
      uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v11 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSPlaceholderArray initWithObjects:count:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = v10;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSPlaceholderArray initWithObjects:count:]",  v10);
    }
  }

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray) {
    return (id)__NSArrayI_transferNew(a3, a4);
  }
  if (self == (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    return (id)__NSArrayM_transferNew(a3, a4, a5);
  }
  return 0LL;
}

- (__NSPlaceholderArray)initWithCapacity:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderArray initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: capacity (%lu) is ridiculous",  "-[__NSPlaceholderArray initWithCapacity:]",  a3);
    uint64_t v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v7);
    goto LABEL_6;
  }

  if (self == (__NSPlaceholderArray *)&___immutablePlaceholderArray)
  {
LABEL_6:
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderArray, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }

  if (self != (__NSPlaceholderArray *)&___mutablePlaceholderArray) {
    goto LABEL_7;
  }
  return (__NSPlaceholderArray *)__NSArrayM_new(0LL, a3, 0);
}

- (__NSPlaceholderArray)initWithContentsOfFile:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a3 || (_NSIsNSString((uint64_t)a3) & 1) != 0) {
    return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:]( &OBJC_CLASS___NSArray,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[__NSPlaceholderArray initWithContentsOfFile:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: string argument is not an NSString",  "-[__NSPlaceholderArray initWithContentsOfFile:]");
  uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  return -[__NSPlaceholderArray initWithContentsOfURL:](v9, v10, v11);
}

- (__NSPlaceholderArray)initWithContentsOfURL:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (atomic_load(&initWithContentsOfURL____cls_NSURL))
  {
    if (!a3) {
      return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:]( &OBJC_CLASS___NSArray,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
    }
  }

  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL);
    if (!a3) {
      return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:]( &OBJC_CLASS___NSArray,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
    }
  }

  atomic_load(&initWithContentsOfURL____cls_NSURL);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[__NSPlaceholderArray initWithContentsOfURL:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: url argument is not an NSURL",  "-[__NSPlaceholderArray initWithContentsOfURL:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
    JUMPOUT(0x180A64694LL);
  }

  return (__NSPlaceholderArray *)+[NSArray newWithContentsOf:immutable:]( &OBJC_CLASS___NSArray,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderArray *)&___immutablePlaceholderArray);
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end