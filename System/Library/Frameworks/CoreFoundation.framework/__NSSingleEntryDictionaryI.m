@interface __NSSingleEntryDictionaryI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isEqualToDictionary:(id)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation __NSSingleEntryDictionaryI

- (unint64_t)count
{
  return 1LL;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  v3 = self;
  v12[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((_NSIsNSDictionary((uint64_t)a3) & 1) != 0)
    {
      if (a3 == v3)
      {
        LOBYTE(self) = 1;
      }

      else if ([a3 count] == 1)
      {
        self = (__NSSingleEntryDictionaryI *)[a3 objectForKey:v3->_key];
        if (self) {
          LOBYTE(self) = [v3->_obj isEqual:self];
        }
      }

      else
      {
        LOBYTE(self) = 0;
      }
    }

    else
    {
      uint64_t v5 = _os_log_pack_size();
      uint64_t v6 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v6 = 136315138;
      *(void *)(v6 + 4) = "-[__NSSingleEntryDictionaryI isEqualToDictionary:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[__NSSingleEntryDictionaryI isEqualToDictionary:]");
      v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
      objc_exception_throw(v7);
      LOBYTE(self) = -[__NSSingleEntryDictionaryI objectForKey:](v8, v9, v10);
    }
  }

  else
  {
    LOBYTE(self) = self == 0LL;
  }

  return (char)self;
}

- (id)objectForKey:(id)a3
{
  id key = self->_key;
  else {
    return 0LL;
  }
}

- (id)keyEnumerator
{
  return  -[__NSSingleObjectEnumerator initWithObject:collection:]( objc_alloc(&OBJC_CLASS_____NSSingleObjectEnumerator),  "initWithObject:collection:",  self->_key,  self);
}

- (id)objectEnumerator
{
  return  -[__NSSingleObjectEnumerator initWithObject:collection:]( objc_alloc(&OBJC_CLASS_____NSSingleObjectEnumerator),  "initWithObject:collection:",  self->_obj,  self);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = a5 >> 61;
  if (a3)
  {
    if (v5) {
      goto LABEL_10;
    }
    if (!a5) {
      return;
    }
    *a3 = self->_obj;
  }

  if (!a4) {
    return;
  }
  if (v5)
  {
LABEL_10:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v8 + 4) = "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]";
    *(_WORD *)(v8 + 12) = 2048;
    *(void *)(v8 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSingleEntryDictionaryI getObjects:andKeys:count:]",  a5);
    SEL v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
    -[__NSSingleEntryDictionaryI __apply:context:](v10, v11, v12, v13);
    return;
  }

  if (a5) {
    *a4 = self->_key;
  }
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (a3)
  {
    ((void (*)(id, id, void *))a3)(self->_key, self->_obj, a4);
  }

  else
  {
    uint64_t v4 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v4);
    unint64_t v5 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v5);
    -[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:](v6, v7, v8, v9, v10);
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_10;
  }

  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSingleEntryDictionaryI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_10:
    v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v7);
    objc_exception_throw(v12);
  }

  if (a3->var0) {
    return 0LL;
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_2;
  *a4 = self->_key;
  unint64_t result = 1LL;
  a3->var0 = 1LL;
  return result;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSSingleEntryDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v6);
    objc_exception_throw(v8);
  }

  v9[7] = 0;
  unint64_t v5 = (void *)_CFAutoreleasePoolPush();
  __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t obj = (uint64_t)self->_obj;
  if (obj >= 1) {

  }
  uint64_t key = (uint64_t)self->_key;
  if (key >= 1) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSSingleEntryDictionaryI;
  -[__NSSingleEntryDictionaryI dealloc](&v5, sel_dealloc);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return result;
}

@end