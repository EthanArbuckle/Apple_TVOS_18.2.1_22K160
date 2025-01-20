@interface NSConstantArray
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (NSConstantArray)new;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (NSConstantArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation NSConstantArray

- (NSConstantArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  qword_18C539A70 = (uint64_t)"attempting to allocate a constant object";
  __break(1u);
  return self;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t count = self->_count;
  if ((a3 & 0x8000000000000000LL) == 0 && count > a3) {
    return (id)self->_objects[a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (count)
  {
    uint64_t v8 = count - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndex:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[NSConstantArray objectAtIndex:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[NSConstantArray objectAtIndex:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[NSConstantArray objectAtIndex:]",  a3);
  }

  v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  -[NSConstantArray getObjects:range:](v11, v12, v13, v15);
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v10 = _os_log_pack_size();
    unint64_t count = v29;
    v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSConstantArray getObjects:range:]",  length);
LABEL_15:
    _NSRange v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v10);
    objc_exception_throw(v15);
    goto LABEL_16;
  }

  if (a4.length >> 61)
  {
    NSUInteger v13 = a4.length;
    uint64_t v10 = _os_log_pack_size();
    unint64_t count = v29;
    v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSConstantArray getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v13;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSConstantArray getObjects:range:]",  v13);
    goto LABEL_15;
  }

  unint64_t count = (void *)self->_count;
  if ((a4.location & 0x8000000000000000LL) != 0 || (unint64_t)count < a4.location + a4.length)
  {
LABEL_16:
    NSUInteger location = a4.location;
    NSUInteger v17 = a4.length;
    if (count)
    {
      uint64_t v18 = _os_log_pack_size();
      v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill();
      uint64_t v23 = (uint64_t)count - 1;
      double v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v22,  (uint64_t)"-[NSConstantArray getObjects:range:]",  location,  v17,  v23);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v24,  "-[NSConstantArray getObjects:range:]",  location,  v17,  v23);
    }

    else
    {
      uint64_t v18 = _os_log_pack_size();
      v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[NSConstantArray getObjects:range:]", location, v17);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v21,  "-[NSConstantArray getObjects:range:]",  location,  v17,  v28);
    }

    v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v18);
    objc_exception_throw(v25);
    -[NSConstantArray objectEnumerator](v26, v27);
    return;
  }

  v5 = (void **)&self->_objects[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v5, 8 * a4.length);
  }

  else
  {
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        uint64_t v6 = *v5++;
        *a3++ = v6;
LABEL_9:
        uint64_t v7 = *v5++;
        *a3++ = v7;
LABEL_10:
        uint64_t v8 = *v5++;
        *a3++ = v8;
LABEL_11:
        *a3 = *v5;
        break;
      default:
        return;
    }
  }

- (id)objectEnumerator
{
  return  -[__NSConstantArrayEnumerator initWithConstantArray:]( objc_alloc(&OBJC_CLASS_____NSConstantArrayEnumerator),  "initWithConstantArray:",  self);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  unint64_t count = self->_count;
  if ((a3 & 0x8000000000000000LL) == 0 && count > a3) {
    return (id)self->_objects[a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (count)
  {
    uint64_t v8 = count - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[NSConstantArray objectAtIndexedSubscript:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[NSConstantArray objectAtIndexedSubscript:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[NSConstantArray objectAtIndexedSubscript:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[NSConstantArray objectAtIndexedSubscript:]",  a3);
  }

  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  return +[NSConstantArray new](v11, v12);
}

+ (NSConstantArray)new
{
  return (NSConstantArray *)objc_opt_new();
}

- (id)mutableCopy
{
  return (id)__NSArrayM_new(self->_objects, self->_count, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)__NSArrayM_new(self->_objects, self->_count, 0);
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1LL;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end