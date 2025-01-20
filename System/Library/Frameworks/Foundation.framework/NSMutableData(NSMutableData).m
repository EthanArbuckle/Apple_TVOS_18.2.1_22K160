@interface NSMutableData(NSMutableData)
+ (_NSClrDatM)_newZeroingDataWithBytes:()NSMutableData length:;
+ (id)allocWithZone:()NSMutableData;
+ (id)dataWithCapacity:()NSMutableData;
+ (id)dataWithLength:()NSMutableData;
- (uint64_t)_isCompact;
- (uint64_t)classForCoder;
- (uint64_t)increaseLengthBy:()NSMutableData;
- (uint64_t)setData:()NSMutableData;
- (void)appendBytes:()NSMutableData length:;
- (void)appendData:()NSMutableData;
- (void)initWithCapacity:()NSMutableData;
- (void)initWithLength:()NSMutableData;
- (void)mutableBytes;
- (void)replaceBytesInRange:()NSMutableData withBytes:;
- (void)replaceBytesInRange:()NSMutableData withBytes:length:;
- (void)resetBytesInRange:()NSMutableData;
- (void)setLength:()NSMutableData;
@end

@implementation NSMutableData(NSMutableData)

+ (id)allocWithZone:()NSMutableData
{
  if ((objc_class *)objc_opt_self() == a1) {
    return +[NSData _alloc](&OBJC_CLASS___NSConcreteMutableData, "_alloc");
  }
  else {
    return NSAllocateObject(a1, 0LL, a3);
  }
}

+ (id)dataWithLength:()NSMutableData
{
  return (id)[objc_allocWithZone(a1) initWithLength:a3];
}

- (void)mutableBytes
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A78])(a1, v2, *MEMORY[0x189604A10]);
  }
  v5 = NSClassFromString((NSString *)@"NSMutableData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)setLength:()NSMutableData
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A78])(a1, v2, *MEMORY[0x189604A10]);
  }
  v5 = NSClassFromString((NSString *)@"NSMutableData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (uint64_t)_isCompact
{
  return 1LL;
}

- (void)replaceBytesInRange:()NSMutableData withBytes:length:
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v6, *MEMORY[0x189604A10]);
  }
  unint64_t v13 = -[objc_class length](a1, "length");
  if (__CFADD__(a4, a3))
  {
    v25 = _NSMethodExceptionProem(a1, a2);
    v36.location = a3;
    v36.length = a4;
    v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v25,  NSStringFromRange(v36),  v33);
LABEL_35:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v26 userInfo:0]);
    -[NSMutableData(NSMutableData) appendBytes:length:]();
    return;
  }

  unint64_t v14 = v13;
  size_t v15 = v13 - (a3 + a4);
  if (v13 < a3 + a4)
  {
    v27 = _NSMethodExceptionProem(a1, a2);
    v28 = v27;
    if (a4)
    {
      v38.location = a3;
      v38.length = a4;
      v32 = NSStringFromRange(v38);
      unint64_t v34 = v14;
      v31 = v28;
      v29 = @"%@: range %@ exceeds data length %lu";
    }

    else
    {
      v32 = (NSString *)a3;
      unint64_t v34 = v14;
      v31 = v27;
      v29 = @"%@: location %lu exceeds data length %lu";
    }

    v26 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v29, v31, v32, v34);
    goto LABEL_35;
  }

  if (__CFADD__(a6, v13 - a4))
  {
    v30 = _NSMethodExceptionProem(a1, a2);
    v37.location = v14 - a4;
    v37.length = a6;
    v26 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v30,  NSStringFromRange(v37),  v33);
    goto LABEL_35;
  }

  unint64_t v16 = v13 - a4 + a6;
  unint64_t v17 = -[objc_class mutableBytes](a1, "mutableBytes");
  uint64_t v18 = v17;
  v19 = (char *)a5;
  if (!a5) {
    goto LABEL_16;
  }
  v19 = (char *)a5;
  if (!v17) {
    goto LABEL_16;
  }
  v19 = (char *)a5;
  if (v17 + v14 <= a5) {
    goto LABEL_16;
  }
  v19 = (char *)a5;
  if (v17 >= a5 + a6) {
    goto LABEL_16;
  }
  unint64_t v20 = (unint64_t)malloc(a6);
  v19 = (char *)v20;
  v21 = (char *)a5;
  size_t v22 = a6;
  if (a6 >= 0x80000)
  {
    size_t v22 = a6;
    v21 = (char *)a5;
    if (((*MEMORY[0x1895FD590] - 1LL) & (v20 | a5)) != 0) {
      goto LABEL_15;
    }
    malloc_default_zone();
    int v23 = malloc_zone_claimed_address();
    unint64_t v20 = (unint64_t)v19;
    size_t v22 = a6;
    v21 = (char *)a5;
    if (v23) {
      goto LABEL_15;
    }
    NSUInteger v35 = -*MEMORY[0x1895FD590] & a6;
    NSCopyMemoryPages((const void *)a5, v19, v35);
    v21 = (char *)(a5 + v35);
    unint64_t v20 = (unint64_t)&v19[v35];
    size_t v22 = a6 - v35;
  }

  if (v22) {
LABEL_15:
  }
    memmove((void *)v20, v21, v22);
LABEL_16:
  if (v16 > v14)
  {
    -[objc_class setLength:](a1, "setLength:", v16);
    uint64_t v18 = -[objc_class mutableBytes](a1, "mutableBytes");
  }

  if (v16 != v14) {
    memmove((void *)(v18 + a3 + a6), (const void *)(v18 + a3 + a4), v15);
  }
  if (a6)
  {
    v24 = (void *)(v18 + a3);
    if (v19) {
      memmove(v24, v19, a6);
    }
    else {
      bzero(v24, a6);
    }
  }

  if (v16 < v14) {
    -[objc_class setLength:](a1, "setLength:", v16);
  }
}

- (void)appendBytes:()NSMutableData length:
{
  NSUInteger v5 = a4;
  if (*MEMORY[0x189604A78])
  {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v4, *MEMORY[0x189604A10]);
    if (!v5) {
      return;
    }
  }

  else if (!a4)
  {
    return;
  }

  NSUInteger v9 = -[objc_class length](a1, "length");
  if (__CFADD__(v5, v9))
  {
    size_t v22 = _NSMethodExceptionProem(a1, a2);
    v24.location = v9;
    v24.length = v5;
    int v23 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: range %@ causes integer overflow", v22, NSStringFromRange(v24)), 0 reason userInfo];
    objc_exception_throw(v23);
    -[NSMutableData(NSMutableData) appendData:]();
    return;
  }

  unint64_t v10 = -[objc_class mutableBytes](a1, "mutableBytes");
  unint64_t v11 = a3;
  if (v10)
  {
    unint64_t v11 = a3;
    if (v10 + v9 > a3)
    {
      unint64_t v11 = a3;
      if (v10 < a3 + v5)
      {
        unint64_t v12 = (unint64_t)malloc(v5);
        unint64_t v11 = v12;
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (v5 < 0x80000) {
          goto LABEL_12;
        }
        size_t v15 = (void *)MEMORY[0x1895FD590];
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (((*MEMORY[0x1895FD590] - 1LL) & (v12 | a3)) != 0) {
          goto LABEL_12;
        }
        malloc_default_zone();
        int v16 = malloc_zone_claimed_address();
        unint64_t v12 = v11;
        size_t v13 = v5;
        unint64_t v14 = (char *)a3;
        if (v16) {
          goto LABEL_12;
        }
        NSUInteger v17 = -*v15 & v5;
        NSCopyMemoryPages((const void *)a3, (void *)v11, v17);
        size_t v13 = v5 - v17;
        if (v5 != v17)
        {
          unint64_t v14 = (char *)(a3 + v17);
          unint64_t v12 = v11 + v17;
LABEL_12:
          memmove((void *)v12, v14, v13);
        }
      }
    }
  }

  -[objc_class setLength:](a1, "setLength:", v9 + v5);
  NSUInteger v18 = -[objc_class mutableBytes](a1, "mutableBytes") + v9;
  if (v5 < 0x80000
    || (v19 = (void *)MEMORY[0x1895FD590], ((*MEMORY[0x1895FD590] - 1LL) & (v18 | v11)) != 0)
    || (malloc_default_zone(), malloc_zone_claimed_address()))
  {
    unint64_t v20 = (char *)v11;
LABEL_17:
    memmove((void *)v18, v20, v5);
    goto LABEL_18;
  }

  NSUInteger v21 = -*v19 & v5;
  NSCopyMemoryPages((const void *)v11, (void *)v18, v21);
  v5 -= v21;
  if (v5)
  {
    unint64_t v20 = (char *)(v11 + v21);
    v18 += v21;
    goto LABEL_17;
  }

- (void)appendData:()NSMutableData
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v3, *MEMORY[0x189604A10]);
  }
  uint64_t v7 = [a3 length];
  if (v7)
  {
    size_t v8 = v7;
    unint64_t v9 = [a3 bytes];
    NSUInteger v10 = -[objc_class length](a1, "length");
    uint64_t v11 = [a3 length];
    if (__CFADD__(v11, v10))
    {
      NSUInteger v24 = v11;
      v25 = _NSMethodExceptionProem(a1, a2);
      v27.location = v10;
      v27.length = v24;
      v26 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: range %@ causes integer overflow", v25, NSStringFromRange(v27)), 0 reason userInfo];
      objc_exception_throw(v26);
      -[NSMutableData(NSMutableData) increaseLengthBy:]();
      return;
    }

    unint64_t v12 = -[objc_class mutableBytes](a1, "mutableBytes");
    if (v12 && v9 < v12 + v10 && v12 < v9 + v8)
    {
      unint64_t v13 = (unint64_t)malloc(v8);
      unint64_t v14 = v13;
      if (v8 < 0x80000
        || (size_t v15 = (void *)MEMORY[0x1895FD590], ((*MEMORY[0x1895FD590] - 1LL) & (v13 | v9)) != 0)
        || (malloc_default_zone(), malloc_zone_claimed_address()))
      {
        int v16 = (char *)v14;
        size_t v17 = v8;
        NSUInteger v18 = (const void *)v9;
      }

      else
      {
        NSUInteger v23 = v8 & -*v15;
        NSCopyMemoryPages((const void *)v9, (void *)v14, v23);
        size_t v17 = v8 - v23;
        if (v8 == v23) {
          goto LABEL_14;
        }
        NSUInteger v18 = (const void *)(v9 + v23);
        int v16 = (char *)(v14 + v23);
      }

      memmove(v16, v18, v17);
    }

    else
    {
      unint64_t v14 = v9;
    }

- (uint64_t)increaseLengthBy:()NSMutableData
{
  if (*MEMORY[0x189604A78]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v3, *MEMORY[0x189604A10]);
  }
  if (a3 >= 0x8000000000000001LL)
  {
    unint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: absurd %s: %lu, maximum size: %llu bytes",  _NSMethodExceptionProem(a1, a2),  "extra length",  a3,  0x8000000000000000LL);
    NSUInteger v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = (void *)MEMORY[0x189603A60];
  }

  else
  {
    uint64_t v7 = -[objc_class length](a1, "length");
    if (!__CFADD__(a3, v7)) {
      return -[objc_class setLength:](a1, "setLength:", v7 + a3);
    }
    NSUInteger v12 = v7;
    unint64_t v13 = _NSMethodExceptionProem(a1, a2);
    v14.location = v12;
    v14.length = a3;
    unint64_t v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v13,  NSStringFromRange(v14));
    NSUInteger v10 = (void *)MEMORY[0x189603F70];
    uint64_t v11 = (void *)MEMORY[0x189603B40];
  }

  objc_exception_throw((id)[v10 exceptionWithName:*v11 reason:v9 userInfo:0]);
  return -[NSMutableData(NSMutableData) replaceBytesInRange:withBytes:]();
}

- (void)replaceBytesInRange:()NSMutableData withBytes:
{
  NSUInteger v7 = a4;
  if (*MEMORY[0x189604A78])
  {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v5, *MEMORY[0x189604A10]);
    if (!v7) {
      return;
    }
  }

  else if (!a4)
  {
    return;
  }

  unint64_t v11 = -[objc_class length](a1, "length");
  unint64_t v12 = v11;
  if (a3 > v11)
  {
    v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: location %lu exceeds data length %lu",  _NSMethodExceptionProem(a1, a2),  a3,  v11);
LABEL_29:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v25 userInfo:0]);
    -[NSMutableData(NSMutableData) resetBytesInRange:]();
    return;
  }

  if (__CFADD__(v7, a3))
  {
    v26 = _NSMethodExceptionProem(a1, a2);
    v28.location = a3;
    v28.length = v7;
    v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v26,  NSStringFromRange(v28),  v27);
    goto LABEL_29;
  }

  unint64_t v13 = (char *)a5;
  if (v11 < a3 + v7)
  {
    unint64_t v14 = -[objc_class mutableBytes](a1, "mutableBytes");
    unint64_t v13 = (char *)a5;
    if (!v14) {
      goto LABEL_15;
    }
    unint64_t v13 = (char *)a5;
    if (v14 + v12 <= a5) {
      goto LABEL_15;
    }
    unint64_t v13 = (char *)a5;
    if (v14 >= a5 + v7) {
      goto LABEL_15;
    }
    unint64_t v15 = (unint64_t)malloc(v7);
    unint64_t v13 = (char *)v15;
    size_t v16 = v7;
    size_t v17 = (char *)a5;
    if (v7 >= 0x80000)
    {
      NSUInteger v18 = (void *)MEMORY[0x1895FD590];
      size_t v16 = v7;
      size_t v17 = (char *)a5;
      if (((*MEMORY[0x1895FD590] - 1LL) & (v15 | a5)) == 0)
      {
        malloc_default_zone();
        int v19 = malloc_zone_claimed_address();
        unint64_t v15 = (unint64_t)v13;
        size_t v16 = v7;
        size_t v17 = (char *)a5;
        if (!v19)
        {
          NSUInteger v20 = v7 & -*v18;
          NSCopyMemoryPages((const void *)a5, v13, v20);
          size_t v16 = v7 - v20;
          if (v7 == v20)
          {
LABEL_15:
            -[objc_class setLength:](a1, "setLength:", a3 + v7);
            goto LABEL_16;
          }

          size_t v17 = (char *)(a5 + v20);
          unint64_t v15 = (unint64_t)&v13[v20];
        }
      }
    }

    memmove((void *)v15, v17, v16);
    goto LABEL_15;
  }

- (void)resetBytesInRange:()NSMutableData
{
  if (*MEMORY[0x189604A78])
  {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A78])(a1, v4, *MEMORY[0x189604A10]);
    if (!a4) {
      return;
    }
  }

  else if (!a4)
  {
    return;
  }

  unint64_t v9 = -[objc_class length](a1, "length");
  if (a3 > v9)
  {
    NSUInteger v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: location %lu exceeds data length %lu",  _NSMethodExceptionProem(a1, a2),  a3,  v9);
LABEL_12:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v10 userInfo:0]);
    -[NSMutableData(NSMutableData) setData:]();
    return;
  }

  if (__CFADD__(a4, a3))
  {
    unint64_t v11 = _NSMethodExceptionProem(a1, a2);
    v13.location = a3;
    v13.length = a4;
    NSUInteger v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v11,  NSStringFromRange(v13),  v12);
    goto LABEL_12;
  }

  if (v9 < a3 + a4) {
    -[objc_class setLength:](a1, "setLength:");
  }
  bzero((void *)(-[objc_class mutableBytes](a1, "mutableBytes") + a3), a4);
}

- (uint64_t)setData:()NSMutableData
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A78]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A78])(a1, v3, *MEMORY[0x189604A10]);
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __40__NSMutableData_NSMutableData__setData___block_invoke;
  v7[3] = &unk_189C99E28;
  v7[4] = a1;
  [a3 enumerateByteRangesUsingBlock:v7];
  return objc_msgSend(a1, "setLength:", objc_msgSend(a3, "length"));
}

+ (id)dataWithCapacity:()NSMutableData
{
  return (id)[objc_allocWithZone(a1) initWithCapacity:a3];
}

- (void)initWithCapacity:()NSMutableData
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSMutableData");
  NSRequestConcreteImplementation(a1, a2, v4);
}

- (void)initWithLength:()NSMutableData
{
  uint64_t v4 = (void *)objc_msgSend(a1, "initWithCapacity:");
  [v4 setLength:a3];
  return v4;
}

+ (_NSClrDatM)_newZeroingDataWithBytes:()NSMutableData length:
{
  return -[NSConcreteMutableData initWithBytes:length:copy:deallocator:]( objc_alloc(&OBJC_CLASS____NSClrDatM),  "initWithBytes:length:copy:deallocator:",  a3,  a4,  1LL,  0LL);
}

@end