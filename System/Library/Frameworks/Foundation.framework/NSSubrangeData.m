@interface NSSubrangeData
- (BOOL)_isCompact;
- (NSSubrangeData)init;
- (NSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation NSSubrangeData

- (unint64_t)length
{
  return self->_range.length;
}

- (const)bytes
{
  return -[NSData bytes](self->_data, "bytes") + self->_range.location;
}

- (BOOL)_isCompact
{
  return -[NSData _isCompact](self->_data, "_isCompact");
}

- (void)getBytes:(void *)a3
{
  int v5 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v5)
  {
    -[NSData getBytes:range:](data, "getBytes:range:", a3, self->_range.location, self->_range.length);
    return;
  }

  uint64_t v7 = -[NSData bytes](data, "bytes");
  NSUInteger location = self->_range.location;
  size_t length = self->_range.length;
  NSUInteger v10 = v7 + location;
  if (length < 0x80000)
  {
LABEL_7:
    if (!length) {
      return;
    }
    goto LABEL_8;
  }

  v11 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (v10 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v12 = length & -*v11;
      NSCopyMemoryPages((const void *)v10, a3, v12);
      v10 += v12;
      a3 = (char *)a3 + v12;
      length -= v12;
      goto LABEL_7;
    }
  }

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  p_range = &self->_range;
  if (self->_range.length >= a4) {
    size_t length = a4;
  }
  else {
    size_t length = self->_range.length;
  }
  int v8 = _CFExecutableLinkedOnOrAfter();
  data = self->_data;
  if (v8)
  {
    -[NSData getBytes:range:](data, "getBytes:range:", a3, p_range->location, length);
    return;
  }

  uint64_t v10 = (uint64_t)(-[NSData bytes](data, "bytes") + p_range->location);
  if (length < 0x80000)
  {
LABEL_10:
    if (!length) {
      return;
    }
    goto LABEL_11;
  }

  v11 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (v10 | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v12 = length & -*v11;
      NSCopyMemoryPages((const void *)v10, a3, v12);
      v10 += v12;
      a3 = (char *)a3 + v12;
      length -= v12;
      goto LABEL_10;
    }
  }

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    int v9 = _CFExecutableLinkedOnOrAfter();
    NSUInteger v10 = self->_range.length;
    if (v9)
    {
      if (__CFADD__(length, location))
      {
        v18 = _NSMethodExceptionProem((objc_class *)self, a2);
        v26.NSUInteger location = location;
        v26.NSUInteger length = length;
        v22 = v18;
        v23 = NSStringFromRange(v26);
        v14 = @"%@: range %@ causes integer overflow";
        goto LABEL_18;
      }

      if (location + length > v10)
      {
        v11 = a2;
        NSUInteger v12 = self->_range.length;
        v13 = _NSMethodExceptionProem((objc_class *)self, v11);
        v25.NSUInteger location = location;
        v25.NSUInteger length = length;
        v23 = NSStringFromRange(v25);
        NSUInteger v24 = v12;
        v22 = v13;
        v14 = @"%@: range %@ exceeds data length %lu";
LABEL_18:
        v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v22, v23, v24);
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v19 userInfo:0]);
        -[NSSubrangeData init](v20, v21);
        return;
      }
    }

    else
    {
      if (v10 <= location)
      {
        v23 = (NSString *)location;
        NSUInteger v24 = self->_range.length;
        v22 = _NSMethodExceptionProem((objc_class *)self, a2);
        v14 = @"%@: location %lu exceeds data length %lu";
        goto LABEL_18;
      }

      if (length >= v10 - location) {
        NSUInteger length = v10 - location;
      }
    }

    unint64_t v15 = (unint64_t)(-[NSData bytes](self->_data, "bytes") + self->_range.location + location);
    if (length >= 0x80000)
    {
      v16 = (void *)MEMORY[0x1895FD590];
      malloc_default_zone();
      NSUInteger v17 = length & -*v16;
      NSCopyMemoryPages((const void *)v15, a3, v17);
      v15 += v17;
      a3 = (char *)a3 + v17;
      length -= v17;
    }

    if (length) {
LABEL_14:
    }
      memmove(a3, (const void *)v15, length);
  }

- (NSSubrangeData)init
{
  v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: should never be called",  _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v3 userInfo:0]);
  return -[NSSubrangeData initWithData:range:](v4, v5, v6, v8);
}

- (NSSubrangeData)initWithData:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = [a3 length];
  if (__CFADD__(length, location))
  {
    NSUInteger v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24.NSUInteger location = location;
    v24.NSUInteger length = length;
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v12,  NSStringFromRange(v24),  v22);
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v13 userInfo:0]);
    -[NSSubrangeData dealloc](v18, v19);
    return result;
  }

  if (location + length > v9)
  {
    unint64_t v14 = v9;
    unint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
    v16 = v15;
    if (length)
    {
      v25.NSUInteger location = location;
      v25.NSUInteger length = length;
      SEL v21 = NSStringFromRange(v25);
      unint64_t v23 = v14;
      v20 = v16;
      NSUInteger v17 = @"%@: range %@ exceeds data length %lu";
    }

    else
    {
      SEL v21 = (NSString *)location;
      unint64_t v23 = v14;
      v20 = v15;
      NSUInteger v17 = @"%@: location %lu exceeds data length %lu";
    }

    v13 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v20, v21, v23);
    goto LABEL_14;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->_range.NSUInteger location = *((void *)a3 + 1) + location;
    self->_range.NSUInteger length = length;
    NSUInteger v10 = (NSData *)*((id *)a3 + 3);
  }

  else
  {
    self->_range.NSUInteger location = location;
    self->_range.NSUInteger length = length;
    NSUInteger v10 = (NSData *)[a3 copyWithZone:0];
  }

  self->_data = v10;
  if (!v10)
  {

    return 0LL;
  }

  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSubrangeData;
  -[NSSubrangeData dealloc](&v3, sel_dealloc);
}

@end