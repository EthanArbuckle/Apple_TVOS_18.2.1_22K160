@interface __NSPlaceholderDictionary
- (__NSPlaceholderDictionary)init;
- (__NSPlaceholderDictionary)initWithCapacity:(unint64_t)a3;
- (__NSPlaceholderDictionary)initWithContentsOfFile:(id)a3;
- (__NSPlaceholderDictionary)initWithContentsOfURL:(id)a3;
- (__NSPlaceholderDictionary)initWithDictionary:(id)a3 copyItems:(BOOL)a4;
- (__NSPlaceholderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation __NSPlaceholderDictionary

- (unint64_t)count
{
  v4 = "mutable";
  v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v6 = "immutable";
  }
  else {
    v6 = v4;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v7 = "NSDictionary";
  }
  else {
    v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s dictionary object",  v9,  v6);
  v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  return (unint64_t)-[__NSPlaceholderDictionary objectForKey:](v11, v12, v13);
}

- (id)objectForKey:(id)a3
{
  v5 = "mutable";
  v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v8 = "NSDictionary";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s dictionary object",  v10,  v7);
  v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  return -[__NSPlaceholderDictionary keyEnumerator](v12, v13);
}

- (id)keyEnumerator
{
  v4 = "mutable";
  v5 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v4 = "<unknown>";
    v5 = "<unknown>";
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v6 = "immutable";
  }
  else {
    v6 = v4;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v7 = "NSDictionary";
  }
  else {
    v7 = v5;
  }
  v8 = __CFLookUpClass(v7);
  uint64_t v9 = __CFFullMethodName(v8, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s dictionary object",  v9,  v6);
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v10);
  -[__NSPlaceholderDictionary setObject:forKey:](v11, v12, v13, v14);
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v6 = "mutable";
  v7 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v6 = "<unknown>";
    v7 = "<unknown>";
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v8 = "immutable";
  }
  else {
    v8 = v6;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    uint64_t v9 = "NSDictionary";
  }
  else {
    uint64_t v9 = v7;
  }
  uint64_t v10 = __CFLookUpClass(v9);
  uint64_t v11 = __CFFullMethodName(v10, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s dictionary object",  v11,  v8);
  SEL v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v12);
  -[__NSPlaceholderDictionary removeObjectForKey:](v13, v14, v15);
}

- (void)removeObjectForKey:(id)a3
{
  v5 = "mutable";
  v6 = "NSMutableDictionary";
  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary)
  {
    v5 = "<unknown>";
    v6 = "<unknown>";
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v7 = "immutable";
  }
  else {
    v7 = v5;
  }
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    v8 = "NSDictionary";
  }
  else {
    v8 = v6;
  }
  uint64_t v9 = __CFLookUpClass(v8);
  uint64_t v10 = __CFFullMethodName(v9, (objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %@: method sent to an uninitialized %s dictionary object",  v10,  v7);
  uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v11);
  __NSDictionaryImmutablePlaceholder();
}

- (__NSPlaceholderDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5) {
    goto LABEL_22;
  }
  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSPlaceholderDictionary initWithObjects:forKeys:count:]",  a5);
    goto LABEL_21;
  }

  if (a5)
  {
    for (uint64_t i = 0LL; i != a5; ++i)
    {
      if (!a4[i]) {
        goto LABEL_20;
      }
    }

    if (!a3)
    {
      unint64_t v11 = a5;
      uint64_t v7 = _os_log_pack_size();
      v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      goto LABEL_25;
    }

    uint64_t i = 0LL;
    while (a3[i])
    {
      if (a5 == ++i) {
        goto LABEL_12;
      }
    }

- (__NSPlaceholderDictionary)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a4) {
    goto LABEL_12;
  }
  uint64_t v7 = (__objc2_class *)objc_opt_class();
  BOOL v8 = v7 == &OBJC_CLASS_____NSDictionaryI || v7 == &OBJC_CLASS_____NSDictionaryM;
  if (!v8 && v7 != &OBJC_CLASS_____NSFrozenDictionaryM) {
    goto LABEL_12;
  }
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary) {
    return (__NSPlaceholderDictionary *)[a3 mutableCopyWithZone:0];
  }
  if (self != (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
LABEL_12:
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS_____NSPlaceholderDictionary;
    return -[NSDictionary initWithDictionary:copyItems:](&v11, sel_initWithDictionary_copyItems_, a3, v4);
  }

  return (__NSPlaceholderDictionary *)[a3 copyWithZone:0];
}

- (__NSPlaceholderDictionary)initWithCapacity:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v6 + 4) = "-[__NSPlaceholderDictionary initWithCapacity:]";
    *(_WORD *)(v6 + 12) = 2048;
    *(void *)(v6 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: capacity (%lu) is ridiculous",  "-[__NSPlaceholderDictionary initWithCapacity:]",  a3);
    uint64_t v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v7);
    goto LABEL_6;
  }

  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary)
  {
LABEL_6:
    -[NSObject doesNotRecognizeSelector:](&___immutablePlaceholderDictionary, "doesNotRecognizeSelector:", a2);
LABEL_7:
    __break(1u);
  }

  if (self != (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary) {
    goto LABEL_7;
  }
  __NSDictionaryM_new(0LL, 0LL, a3, 3uLL);
  return result;
}

- (__NSPlaceholderDictionary)init
{
  if (self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary) {
    return -[__NSPlaceholderDictionary initWithObjects:forKeys:count:]( &___immutablePlaceholderDictionary,  "initWithObjects:forKeys:count:",  0LL,  0LL,  0LL);
  }
  if (self == (__NSPlaceholderDictionary *)&___mutablePlaceholderDictionary) {
    return -[__NSPlaceholderDictionary initWithCapacity:](&___mutablePlaceholderDictionary, "initWithCapacity:", 0LL);
  }
  __break(1u);
  return self;
}

- (__NSPlaceholderDictionary)initWithContentsOfFile:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a3 || (_NSIsNSString((uint64_t)a3) & 1) != 0) {
    return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:]( &OBJC_CLASS___NSDictionary,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfFile:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: string argument is not an NSString",  "-[__NSPlaceholderDictionary initWithContentsOfFile:]");
  BOOL v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  return -[__NSPlaceholderDictionary initWithContentsOfURL:](v9, v10, v11);
}

- (__NSPlaceholderDictionary)initWithContentsOfURL:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (atomic_load(&initWithContentsOfURL____cls_NSURL_0))
  {
    if (!a3) {
      return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:]( &OBJC_CLASS___NSDictionary,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
    }
  }

  else
  {
    atomic_store((unint64_t)objc_lookUpClass("NSURL"), &initWithContentsOfURL____cls_NSURL_0);
    if (!a3) {
      return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:]( &OBJC_CLASS___NSDictionary,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
    }
  }

  atomic_load(&initWithContentsOfURL____cls_NSURL_0);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[__NSPlaceholderDictionary initWithContentsOfURL:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: url argument is not an NSURL",  "-[__NSPlaceholderDictionary initWithContentsOfURL:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
    JUMPOUT(0x180BCFE9CLL);
  }

  return (__NSPlaceholderDictionary *)+[NSDictionary newWithContentsOf:immutable:]( &OBJC_CLASS___NSDictionary,  "newWithContentsOf:immutable:",  a3,  self == (__NSPlaceholderDictionary *)&___immutablePlaceholderDictionary);
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end