@interface __NSSingleObjectArrayI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isEqualToArray:(id)a3;
- (id)firstObject;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSSingleObjectArrayI

- (unint64_t)count
{
  return 1LL;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    double v7 = __os_log_helper_1_2_3_8_32_8_0_8_0(v6, (uint64_t)"-[__NSSingleObjectArrayI objectAtIndex:]", a3, 0LL);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v7,  "-[__NSSingleObjectArrayI objectAtIndex:]",  a3,  0LL);
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v8);
  }

  return self->_object;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if ((a4.location & 0x8000000000000000LL) != 0
    || (a4.length & 0x8000000000000000LL) != 0
    || a4.location + a4.length >= 2)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    double v8 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v7,  (uint64_t)"-[__NSSingleObjectArrayI getObjects:range:]",  location,  length,  0LL);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v8,  "-[__NSSingleObjectArrayI getObjects:range:]",  location,  length,  0LL);
    v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v9);
    goto LABEL_10;
  }

  if (!a3 && a4.length)
  {
LABEL_10:
    NSUInteger v10 = a4.length;
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSSingleObjectArrayI getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v10;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSingleObjectArrayI getObjects:range:]",  v10);
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
    objc_exception_throw(v13);
  }

  if (a4.length) {
    *a3 = self->_object;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v7 = _os_log_pack_size();
    double v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_10;
  }

  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    double v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSingleObjectArrayI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_10:
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v7);
    objc_exception_throw(v12);
  }

  if (a3->var0) {
    return 0LL;
  }
  a3->var1 = &self->_object;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_7;
  a3->var0 = -1LL;
  return 1LL;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSSingleObjectArrayI enumerateObjectsWithOptions:usingBlock:]");
    double v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v6);
    objc_exception_throw(v8);
  }

  v9[7] = 0;
  uint64_t v5 = (void *)_CFAutoreleasePoolPush();
  __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (id)firstObject
{
  return self->_object;
}

- (BOOL)isEqualToArray:(id)a3
{
  v3 = self;
  v13[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((_NSIsNSArray((uint64_t)a3) & 1) != 0)
    {
      if (a3 == v3) {
        goto LABEL_7;
      }
      if ([a3 count] != 1)
      {
        LOBYTE(self) = 0;
        return (char)self;
      }

      uint64_t v5 = [a3 objectAtIndexedSubscript:0];
      id object = v3->_object;
      if (object == (id)v5 || (LODWORD(self) = objc_msgSend(object, "isEqual:"), (_DWORD)self)) {
LABEL_7:
      }
        LOBYTE(self) = 1;
    }

    else
    {
      uint64_t v7 = _os_log_pack_size();
      uint64_t v8 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v8 = 136315138;
      *(void *)(v8 + 4) = "-[__NSSingleObjectArrayI isEqualToArray:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[__NSSingleObjectArrayI isEqualToArray:]");
      uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
      objc_exception_throw(v9);
      LOBYTE(self) = -[__NSSingleObjectArrayI lastObject](v10, v11);
    }
  }

  else
  {
    LOBYTE(self) = self == 0LL;
  }

  return (char)self;
}

- (id)lastObject
{
  return self->_object;
}

- (id)objectEnumerator
{
  return (id)[objc_allocWithZone((Class)__NSSingleObjectEnumerator) initWithObject:self->_object collection:self];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t object = (uint64_t)self->_object;
  if (object >= 1) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSSingleObjectArrayI;
  -[__NSSingleObjectArrayI dealloc](&v4, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)__NSArrayM_new(&self->_object, 1uLL, 0);
}

@end