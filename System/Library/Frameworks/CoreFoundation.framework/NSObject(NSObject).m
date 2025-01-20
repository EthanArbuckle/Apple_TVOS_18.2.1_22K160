@interface NSObject(NSObject)
+ (BOOL)dealloc;
+ (CFTypeRef)_copyDescription;
+ (NSMethodSignature)instanceMethodSignatureForSelector:()NSObject;
+ (NSMethodSignature)methodSignatureForSelector:()NSObject;
+ (uint64_t)description;
+ (uint64_t)doesNotRecognizeSelector:()NSObject;
+ (uint64_t)init;
+ (uint64_t)load;
+ (void)__allocWithZone_OA:()NSObject;
- (CFTypeRef)_copyDescription;
- (NSMethodSignature)methodSignatureForSelector:()NSObject;
- (uint64_t)___tryRetain_OA;
- (uint64_t)__autorelease_OA;
- (uint64_t)__release_OA;
- (uint64_t)__retain_OA;
- (uint64_t)description;
- (uint64_t)doesNotRecognizeSelector:()NSObject;
- (void)__dealloc_zombie;
@end

@implementation NSObject(NSObject)

+ (uint64_t)load
{
  return _objc_setBadAllocHandler();
}

+ (uint64_t)doesNotRecognizeSelector:()NSObject
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (cls)
  {
    Name = class_getName(cls);
    if (sel) {
      goto LABEL_3;
    }
  }

  else
  {
    Name = "(null class)";
    if (sel)
    {
LABEL_3:
      v6 = sel_getName(sel);
      goto LABEL_6;
    }
  }

  v6 = "(null selector)";
LABEL_6:
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"+[%s %s]: unrecognized selector sent to class %p",  Name,  v6,  cls);
  uint64_t v7 = _CFAutoreleasePoolAddObject();
  strlen(Name);
  int is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v6);
  int v9 = _dyld_is_memory_immutable();
  uint64_t v10 = _os_log_pack_size();
  uint64_t v11 = _os_log_pack_fill();
  if (is_memory_immutable) {
    v12 = Name;
  }
  else {
    v12 = "(dynamic class)";
  }
  if (v9) {
    v13 = v6;
  }
  else {
    v13 = "(dynamic selector)";
  }
  v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  v7,  0LL,  (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10,  __os_log_helper_1_2_3_8_32_8_32_8_0(v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)cls));
  objc_exception_throw(v14);
  return _CFAutoreleasePoolAddObject();
}

- (uint64_t)doesNotRecognizeSelector:()NSObject
{
  v20[1] = *MEMORY[0x1895F89C0];
  v5 = (objc_class *)objc_opt_class();
  if (v5)
  {
    Name = class_getName(v5);
    if (a3) {
      goto LABEL_3;
    }
  }

  else
  {
    Name = "(null class)";
    if (a3)
    {
LABEL_3:
      uint64_t v7 = sel_getName(a3);
      goto LABEL_6;
    }
  }

  uint64_t v7 = "(null selector)";
LABEL_6:
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"-[%s %s]: unrecognized selector sent to instance %p",  Name,  v7,  a1);
  uint64_t v8 = _CFAutoreleasePoolAddObject();
  strlen(Name);
  int is_memory_immutable = _dyld_is_memory_immutable();
  strlen(v7);
  int v10 = _dyld_is_memory_immutable();
  uint64_t v11 = _os_log_pack_size();
  uint64_t v12 = _os_log_pack_fill();
  if (is_memory_immutable) {
    v13 = Name;
  }
  else {
    v13 = "(dynamic class)";
  }
  if (v10) {
    v14 = v7;
  }
  else {
    v14 = "(dynamic selector)";
  }
  v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  v8,  0LL,  (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11,  __os_log_helper_1_2_3_8_32_8_32_8_0(v12, (uint64_t)v13, (uint64_t)v14, a1));
  objc_exception_throw(v15);
  return +[NSObject(NSObject) instanceMethodSignatureForSelector:](v16, v17, v18);
}

+ (NSMethodSignature)instanceMethodSignatureForSelector:()NSObject
{
  if (name && __methodDescriptionForSelector(a1, name)) {
    return +[NSMethodSignature signatureWithObjCTypes:](&OBJC_CLASS___NSMethodSignature, "signatureWithObjCTypes:", v3);
  }
  else {
    return 0LL;
  }
}

+ (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  if (a3 && (Class = object_getClass(a1), __methodDescriptionForSelector(Class, a3))) {
    return +[NSMethodSignature signatureWithObjCTypes:](&OBJC_CLASS___NSMethodSignature, "signatureWithObjCTypes:", v5);
  }
  else {
    return 0LL;
  }
}

- (NSMethodSignature)methodSignatureForSelector:()NSObject
{
  if (a3 && (v4 = (objc_class *)objc_opt_class(), __methodDescriptionForSelector(v4, a3))) {
    return +[NSMethodSignature signatureWithObjCTypes:](&OBJC_CLASS___NSMethodSignature, "signatureWithObjCTypes:", v5);
  }
  else {
    return 0LL;
  }
}

+ (uint64_t)description
{
  Name = class_getName(a1);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%s", Name);
  return _CFAutoreleasePoolAddObject();
}

- (uint64_t)description
{
  v2 = (objc_class *)objc_opt_class();
  Name = class_getName(v2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"<%s: %p>", Name, a1);
  return _CFAutoreleasePoolAddObject();
}

+ (CFTypeRef)_copyDescription
{
  v2 = (void *)MEMORY[0x186E03CAC]();
  uint64_t v3 = (const void *)[a1 description];
  if (v3) {
    CFTypeRef v4 = CFRetain(v3);
  }
  else {
    CFTypeRef v4 = 0LL;
  }
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (CFTypeRef)_copyDescription
{
  v2 = (void *)MEMORY[0x186E03CAC]();
  uint64_t v3 = (const void *)[a1 description];
  if (v3) {
    CFTypeRef v4 = CFRetain(v3);
  }
  else {
    CFTypeRef v4 = 0LL;
  }
  _CFAutoreleasePoolPop(v2);
  return v4;
}

- (uint64_t)__retain_OA
{
  uint64_t v0 = _objc_rootRetain();
  __CFRecordAllocationEvent();
  return v0;
}

- (uint64_t)___tryRetain_OA
{
  uint64_t v0 = _objc_rootTryRetain();
  if ((_DWORD)v0) {
    __CFRecordAllocationEvent();
  }
  return v0;
}

- (uint64_t)__release_OA
{
  return _objc_rootRelease();
}

- (uint64_t)__autorelease_OA
{
  return _CFAutoreleasePoolAddObject();
}

+ (void)__allocWithZone_OA:()NSObject
{
  uint64_t v0 = (void *)_objc_rootAllocWithZone();
  v1 = v0;
  if (v0)
  {
    object_getClassName(v0);
    __CFSetLastAllocationEventName();
  }

  return v1;
}

- (void)__dealloc_zombie
{
  name[1] = *(char **)MEMORY[0x1895F89C0];
  if ((a1 & 0x8000000000000000LL) == 0)
  {
    if (__CFZombieEnabled)
    {
      Class = object_getClass((id)a1);
      name[0] = 0LL;
      uint64_t v3 = class_getName(Class);
      asprintf(name, "_NSZombie_%s", v3);
      CFTypeRef v4 = objc_lookUpClass(name[0]);
      if (!v4)
      {
        uint64_t v5 = objc_lookUpClass("_NSZombie_");
        CFTypeRef v4 = objc_duplicateClass(v5, name[0], 0LL);
      }

      free(name[0]);
      objc_destructInstance((id)a1);
      object_setClass((id)a1, v4);
      if (__CFDeallocateZombies) {
        free((void *)a1);
      }
    }

    else
    {
      _objc_rootDealloc();
    }
  }

+ (uint64_t)init
{
  Name = class_getName(a1);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** +[%s<%p> init]: cannot init a class object.",  Name,  a1);
  CFTypeRef v4 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v4);
  return +[NSObject(NSObject) dealloc]();
}

+ (BOOL)dealloc
{
  Name = class_getName(a1);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** +[%s<%p> dealloc]: cannot dealloc a class object.",  Name,  a1);
  uint64_t v3 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v3);
  return -[NSObject isNSArray__](v4, v5);
}

@end