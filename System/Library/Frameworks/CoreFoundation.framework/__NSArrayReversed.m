@interface __NSArrayReversed
- (__NSArrayReversed)initWithArray:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayReversed

- (unint64_t)count
{
  return self->_cnt;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t cnt = self->_cnt;
  if ((a3 & 0x8000000000000000LL) == 0 && cnt > a3) {
    return (id)[self->_array objectAtIndex:cnt + ~a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (cnt)
  {
    uint64_t v8 = cnt - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayReversed objectAtIndex:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSArrayReversed objectAtIndex:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSArrayReversed objectAtIndex:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayReversed objectAtIndex:]",  a3);
  }

  v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  -[__NSArrayReversed getObjects:range:](v11, v12, v13, v15);
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  uint64_t v6 = a3;
  v26[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4.length)
  {
    uint64_t location = _os_log_pack_size();
    v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayReversed getObjects:range:]",  length);
LABEL_12:
    v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  location);
    objc_exception_throw(v13);
    goto LABEL_13;
  }

  if (a4.length >> 61)
  {
    uint64_t location = _os_log_pack_size();
    v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayReversed getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayReversed getObjects:range:]",  length);
    goto LABEL_12;
  }

  unint64_t v8 = -[__NSArrayReversed count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && v8 >= location + length)
  {
    if (length)
    {
      uint64_t v9 = ~location;
      do
      {
        *v6++ = (id)[self->_array objectAtIndex:v9 + self->_cnt];
        --v9;
        --length;
      }

      while (length);
    }

    return;
  }

- (__NSArrayReversed)initWithArray:(id)a3
{
  v4 = (void *)[a3 copy];
  self->_array = v4;
  self->_unint64_t cnt = [v4 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSArrayReversed;
  -[__NSArrayReversed dealloc](&v3, sel_dealloc);
}

@end