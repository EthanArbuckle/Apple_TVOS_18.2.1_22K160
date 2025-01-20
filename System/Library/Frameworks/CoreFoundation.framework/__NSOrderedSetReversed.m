@interface __NSOrderedSetReversed
- (__NSOrderedSetReversed)initWithOrderedSet:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
@end

@implementation __NSOrderedSetReversed

- (__NSOrderedSetReversed)initWithOrderedSet:(id)a3
{
  v4 = (void *)[a3 copy];
  self->_orderedSet = v4;
  self->_cnt = [v4 count];
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSOrderedSetReversed;
  -[__NSOrderedSetReversed dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return self->_cnt;
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v4 = [self->_orderedSet indexOfObject:a3];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_cnt + ~v4;
  }
  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  unint64_t cnt = self->_cnt;
  if ((a3 & 0x8000000000000000LL) == 0 && cnt > a3) {
    return (id)[self->_orderedSet objectAtIndex:cnt + ~a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (cnt)
  {
    uint64_t v8 = cnt - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSOrderedSetReversed objectAtIndex:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSOrderedSetReversed objectAtIndex:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSOrderedSetReversed objectAtIndex:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetReversed objectAtIndex:]",  a3);
  }

  v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  return __CFPropertyListCreateError(v11, v12);
}

@end