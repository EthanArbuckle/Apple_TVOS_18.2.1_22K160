@interface NSMethodSignature
+ (NSMethodSignature)signatureWithObjCTypes:(const char *)types;
+ (void)initialize;
- (BOOL)_isAllObjects;
- (BOOL)_isBlock;
- (BOOL)_isHiddenStructRet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOneway;
- (Class)_classForObjectAtArgumentIndex:(int64_t)a3;
- (NSMethodFrameArgInfo)_argInfo:(int64_t)a3;
- (NSMethodSignature)init;
- (NSUInteger)frameLength;
- (NSUInteger)methodReturnLength;
- (NSUInteger)numberOfArguments;
- (const)_cTypeString;
- (const)getArgumentTypeAtIndex:(NSUInteger)idx;
- (const)methodReturnType;
- (id)_initWithROMEntry:(const CFMethodSignatureROMEntry *)a3;
- (id)_protocolsForObjectAtArgumentIndex:(int64_t)a3;
- (id)_signatureForBlockAtArgumentIndex:(int64_t)a3;
- (id)_typeString;
- (id)debugDescription;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSMethodSignature

+ (void)initialize
{
  if (&OBJC_CLASS___NSMethodSignature == a1 && *MEMORY[0x189616650] != 0LL) {
    _objc_registerTaggedPointerClass();
  }
}

+ (NSMethodSignature)signatureWithObjCTypes:(const char *)types
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  if (!types) {
    return 0LL;
  }
  size_t v5 = strlen(types);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = __CFSearchSignatureROM((unsigned __int8 *)types, v5);
  if (v6 != -1)
  {
    unint64_t Value = (8 * (v6 & 0xFFFFFFFFFFFFFLL)) | 0x8600000000000007LL;
    unint64_t v8 = *MEMORY[0x189616658] ^ Value;
    if ((~v8 & 0xC000000000000007LL) != 0) {
      return (NSMethodSignature *)(v8 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v8 & 7)));
    }
    return (NSMethodSignature *)Value;
  }

  if (!signatureWithObjCTypes__cache)
  {
    *(_OWORD *)keyCallBacks = xmmword_1899EB378;
    *(_OWORD *)&keyCallBacks[16] = *(_OWORD *)&off_1899EB388;
    *(_OWORD *)&keyCallBacks[32] = xmmword_1899EB398;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  (const CFDictionaryKeyCallBacks *)keyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    while (!__ldaxr((unint64_t *)&signatureWithObjCTypes__cache))
    {
    }

    __clrex();
    CFRelease(Mutable);
  }

- (id)_initWithROMEntry:(const CFMethodSignatureROMEntry *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMethodSignature;
  id result = -[NSMethodSignature init](&v6, sel_init);
  if (result)
  {
    *((void *)result + 1) = a3->var0;
    unint64_t var2 = a3->var2;
    *((void *)result + 2) = a3->var1;
    *((void *)result + 3) = var2;
  }

  return result;
}

- (NSMethodSignature)init
{
  return 0LL;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if ((self->_flags & 4) == 0)
  {
    frameDescriptor = self->_frameDescriptor;
    if (frameDescriptor)
    {
      __NSMethodFrameArgInfoDestroy(&frameDescriptor->var0->var0);
      __NSMethodFrameArgInfoDestroy(&self->_frameDescriptor->var1->var0);
      free(self->_frameDescriptor);
    }

    if (self->_typeString)
    {
      strlen(self->_typeString);
      if ((_dyld_is_memory_immutable() & 1) == 0) {
        free(self->_typeString);
      }
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSMethodSignature;
  -[NSMethodSignature dealloc](&v4, sel_dealloc);
}

- (NSMethodFrameArgInfo)_argInfo:(int64_t)a3
{
  FrameDescriptor = (NSMethodFrameArgInfo **)_getFrameDescriptor((uint64_t)self);
  if (a3 == -1) {
    return *FrameDescriptor;
  }
  id result = FrameDescriptor[1];
  if (a3 >= 1)
  {
    unint64_t v6 = a3 + 1;
    do
    {
      id result = result->var1;
      --v6;
    }

    while (v6 > 1);
  }

  return result;
}

- (const)_cTypeString
{
  uint64_t v2 = 0LL;
  uint64_t v3 = *MEMORY[0x189616658];
  unint64_t v4 = v3 ^ (unint64_t)self;
  unint64_t v5 = v4 & 7;
  do
  {
    ++v2;
  }

  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000LL) == 0x600000000000000LL)
  {
    BOOL v6 = v5 == 7;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v6) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    p_typeString = (char **)(__CFGetSignatureROMEntryAtIndex(v7 & (v4 >> 3)) + 1);
  }

  else
  {
LABEL_12:
    p_typeString = &self->_typeString;
  }

  return *p_typeString;
}

- (id)_typeString
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  uint64_t v3 = *(const char **)FrameDescriptor;
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34LL) & 0x80) != 0) {
    uint64_t v3 = *(const char **)v3;
  }
  unint64_t v4 = v3 + 37;
  size_t v5 = strlen(v3 + 37);
  for (i = *(const char **)(FrameDescriptor + 8); i; i = (const char *)*((void *)i + 1))
  {
    uint64_t v7 = i;
    if ((*((_WORD *)i + 17) & 0x80) != 0) {
      uint64_t v7 = *(const char **)i;
    }
    v5 += strlen(v7 + 37);
  }

  size_t v8 = v5 + 1;
  if (v8 < 0x401)
  {
    if (v8) {
      v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    }
    else {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = (char *)malloc(v8);
  }

  strlcpy(v9, v4, v8);
  while (1)
  {
    uint64_t FrameDescriptor = *(void *)(FrameDescriptor + 8);
    if (!FrameDescriptor) {
      break;
    }
    uint64_t v10 = FrameDescriptor;
    if ((*(_WORD *)(FrameDescriptor + 34) & 0x80) != 0) {
      uint64_t v10 = *(void *)FrameDescriptor;
    }
    strlcat(v9, (const char *)(v10 + 37), v8);
  }

  CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, v9, 0x8000100u);
  v11 = (void *)_CFAutoreleasePoolAddObject();
  if (v8 >= 0x401) {
    free(v9);
  }
  return v11;
}

- (id)_signatureForBlockAtArgumentIndex:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id result = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3);
  if (result)
  {
    if ((~*((unsigned __int16 *)result + 17) & 0xA000) != 0 || !*(void *)result)
    {
      return 0LL;
    }

    else
    {
      size_t v4 = strnlen((const char *)result + 37, 0x400uLL);
      id result = 0LL;
      if (v4 >= 7 && v4 != 1024)
      {
        size_t v5 = v4 - 4;
        __strncpy_chk();
        v6[v5] = 0;
        return +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  v6);
      }
    }
  }

  return result;
}

- (Class)_classForObjectAtArgumentIndex:(int64_t)a3
{
  if (a3 >= -1
    && (a3 < 0 || -[NSMethodSignature numberOfArguments](self, "numberOfArguments") > a3)
    && (size_t v5 = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3)) != 0LL
    && (*((_WORD *)v5 + 17) & 0x2000) != 0
    && (var0 = v5->var0) != 0LL
    && (*((_WORD *)var0 + 17) & 0x2000) != 0)
  {
    return objc_getClass(var0->var25);
  }

  else
  {
    return 0LL;
  }

- (id)_protocolsForObjectAtArgumentIndex:(int64_t)a3
{
  if (a3 < -1) {
    return 0LL;
  }
  uint64_t v13 = v4;
  uint64_t v14 = v3;
  if ((a3 & 0x8000000000000000LL) == 0 && -[NSMethodSignature numberOfArguments](self, "numberOfArguments") <= a3) {
    return 0LL;
  }
  id result = -[NSMethodSignature _argInfo:](self, "_argInfo:", a3, v13, v14, v5, v6);
  if (!result) {
    return result;
  }
  if ((*((_WORD *)result + 17) & 0x2000) == 0) {
    return 0LL;
  }
  uint64_t v10 = *(void *)result;
  if (!*(void *)result) {
    return 0LL;
  }
  if ((*(_WORD *)(v10 + 34) & 0x2000) != 0)
  {
    uint64_t v10 = *(void *)(v10 + 8);
    if (!v10) {
      return 0LL;
    }
  }

  v11 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
  do
  {
    Protocol = objc_getProtocol((const char *)(v10 + 37));
    if (Protocol) {
      -[NSArray addObject:](v11, "addObject:", Protocol);
    }
    uint64_t v10 = *(void *)(v10 + 8);
  }

  while (v10);
  if (-[NSArray count](v11, "count")) {
    return v11;
  }
  else {
    return 0LL;
  }
}

- (NSUInteger)numberOfArguments
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 16);
}

- (const)getArgumentTypeAtIndex:(NSUInteger)idx
{
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  if (*(unsigned int *)(FrameDescriptor + 16) <= idx)
  {
    uint64_t v9 = FrameDescriptor;
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: index (%lu) out of bounds [0, %ld]",  v10,  idx,  *(unsigned int *)(v9 + 16) - 1LL);
    v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v11);
    return (const char *)-[NSMethodSignature frameLength](v12, v13);
  }

  else
  {
    uint64_t v7 = -[NSMethodSignature _argInfo:](self, "_argInfo:", idx);
    if ((*((_WORD *)v7 + 17) & 0x80) != 0) {
      uint64_t v7 = v7->var0;
    }
    return v7->var25;
  }

- (NSUInteger)frameLength
{
  return *(unsigned int *)(_getFrameDescriptor((uint64_t)self) + 20);
}

- (BOOL)isOneway
{
  return ((unsigned __int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", -1LL)[34] >> 5) & 1;
}

- (const)methodReturnType
{
  uint64_t v2 = -[NSMethodSignature _argInfo:](self, "_argInfo:", -1LL);
  if ((*((_WORD *)v2 + 17) & 0x80) != 0) {
    uint64_t v2 = v2->var0;
  }
  return v2->var25;
}

- (NSUInteger)methodReturnLength
{
  uint64_t v2 = -[NSMethodSignature _argInfo:](self, "_argInfo:", -1LL);
  if ((*((_WORD *)v2 + 17) & 0x80) != 0) {
    uint64_t v2 = v2->var0;
  }
  return v2->var2;
}

- (BOOL)_isHiddenStructRet
{
  return ((unsigned __int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", -1LL)[34] >> 6) & 1;
}

- (BOOL)_isAllObjects
{
  return ((unint64_t)_getFlags((uint64_t)self) >> 1) & 1;
}

- (BOOL)_isBlock
{
  return (int64_t)-[NSMethodSignature numberOfArguments](self, "numberOfArguments") >= 1
      && (__int16)-[NSMethodSignature _argInfo:](self, "_argInfo:", 0LL)[34] < 0;
}

- (unint64_t)hash
{
  uint64_t FrameDescriptor = (void **)_getFrameDescriptor((uint64_t)self);
  uint64_t v3 = __NSMS5(*FrameDescriptor);
  return (unint64_t)v3 + (void)__NSMS5(FrameDescriptor[1]);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }

  else if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t FrameDescriptor = (uint64_t *)_getFrameDescriptor((uint64_t)self);
    uint64_t v6 = (uint64_t *)_getFrameDescriptor((uint64_t)a3);
    int v7 = __NSMS6(*FrameDescriptor, *v6);
    if (v7) {
      LOBYTE(v7) = __NSMS6(FrameDescriptor[1], v6[1]);
    }
  }

  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)debugDescription
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t FrameDescriptor = _getFrameDescriptor((uint64_t)self);
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSMethodSignature;
  id v5 = -[NSObject description](&v11, sel_description);
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34LL) & 0x40) != 0) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  -[__CFString appendFormat:]( Mutable,  "appendFormat:",  @"%@\n    number of arguments = %d\n    frame size = %d\n    is special struct return? %s\n",  v5,  *(unsigned int *)(FrameDescriptor + 16),  *(unsigned int *)(FrameDescriptor + 20),  v6);
  -[__CFString appendFormat:]( Mutable,  "appendFormat:",  @"    return value: -------- -------- -------- --------\n");
  int v7 = *(uint64_t **)FrameDescriptor;
  if ((*(_WORD *)(*(void *)FrameDescriptor + 34LL) & 0x80) != 0) {
    int v7 = (uint64_t *)*v7;
  }
  __NSMS7(Mutable, v7, 2LL);
  size_t v8 = *(uint64_t **)(FrameDescriptor + 8);
  if (v8)
  {
    uint64_t v9 = 0LL;
    do
    {
      -[__CFString appendFormat:]( Mutable,  "appendFormat:",  @"    argument %ld: -------- -------- -------- --------\n",  v9);
      __NSMS7(Mutable, v8, 2LL);
      ++v9;
      size_t v8 = (uint64_t *)v8[1];
    }

    while (v8);
  }

  return Mutable;
}

@end