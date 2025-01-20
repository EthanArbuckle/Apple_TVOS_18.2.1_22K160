@interface __NSSingleObjectSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
@end

@implementation __NSSingleObjectSetI

- (unint64_t)count
{
  return 1LL;
}

- (id)member:(id)a3
{
  id element = self->element;
  return element;
}

- (id)objectEnumerator
{
  return (id)[objc_allocWithZone((Class)__NSSingleObjectEnumerator) initWithObject:self->element collection:self];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (BOOL)containsObject:(id)a3
{
  id element = self->element;
  if (element == a3 || (int v4 = [a3 isEqual:element]) != 0) {
    LOBYTE(v4) = element != 0LL;
  }
  return v4;
}

- (unint64_t)countForObject:(id)a3
{
  id element = self->element;
  return (element == a3 || [a3 isEqual:element]) && element != 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_12;
  }

  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSingleObjectSetI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_12:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v13);
  }

  unint64_t var0 = a3->var0;
  if (a3->var0) {
    return 0LL;
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_1;
  if (a4 && a5)
  {
    *a4 = self->element;
    unint64_t var0 = 1LL;
    a3->unint64_t var0 = 1LL;
  }

  return var0;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSSingleObjectSetI enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v6);
    objc_exception_throw(v8);
  }

  v9[7] = 0;
  v5 = (void *)_CFAutoreleasePoolPush();
  __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
  _CFAutoreleasePoolPop(v5);
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSingleObjectSetI getObjects:count:]",  a4);
    goto LABEL_9;
  }

  if (a4 >> 61)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSSingleObjectSetI getObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSingleObjectSetI getObjects:count:]",  a4);
LABEL_9:
    uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v6,  v5);
    objc_exception_throw(v10);
  }

  if (a4) {
    *a3 = self->element;
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t element = (uint64_t)self->element;
  if (element >= 1) {

  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSSingleObjectSetI;
  -[__NSSingleObjectSetI dealloc](&v4, sel_dealloc);
}

@end