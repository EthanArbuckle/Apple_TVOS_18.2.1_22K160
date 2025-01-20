@interface _NSDispatchData
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_isDispatchData;
- (Class)classForCoder;
- (_NSDispatchData)initWithCoder:(id)a3;
- (id)_createDispatchData;
- (id)subdataWithRange:(_NSRange)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateByteRangesUsingBlock:(id)a3;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation _NSDispatchData

- (void)getBytes:(void *)a3
{
}

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (-[NSData length](self, "length") < a4) {
    unint64_t v4 = -[NSData length](self, "length");
  }
  -[_NSDispatchData getBytes:range:](self, "getBytes:range:", a3, 0LL, v4);
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __49___NSDispatchData_enumerateByteRangesUsingBlock___block_invoke;
  v3[3] = &unk_189CA6958;
  v3[4] = a3;
  dispatch_data_apply((dispatch_data_t)self, v3);
}

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  v21[4] = *MEMORY[0x1895F89C0];
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    unint64_t v9 = -[NSData length](self, "length");
    if (__CFADD__(length, location))
    {
      v10 = _NSMethodExceptionProem((objc_class *)self, a2);
      v22.NSUInteger location = location;
      v22.NSUInteger length = length;
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v10,  NSStringFromRange(v22),  v19);
    }

    else
    {
      if (location + length <= v9)
      {
        v21[0] = 0LL;
        v21[1] = v21;
        v21[2] = 0x2020000000LL;
        v21[3] = a3;
        applier[0] = MEMORY[0x1895F87A8];
        applier[1] = 3221225472LL;
        applier[2] = __34___NSDispatchData_getBytes_range___block_invoke;
        applier[3] = &unk_189CA6980;
        applier[5] = location;
        applier[6] = length;
        applier[4] = v21;
        dispatch_data_apply((dispatch_data_t)self, applier);
        _Block_object_dispose(v21, 8);
        return;
      }

      unint64_t v12 = v9;
      v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23.NSUInteger location = location;
      v23.NSUInteger length = length;
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ exceeds data length %lu",  v13,  NSStringFromRange(v23),  v12);
    }

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v11 userInfo:0]);
    __34___NSDispatchData_getBytes_range___block_invoke(v14, v15, v16, v17, v18);
  }

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  size_t size = dispatch_data_get_size((dispatch_data_t)self);
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 3221225472LL;
  applier[2] = __23___NSDispatchData_hash__block_invoke;
  applier[3] = &unk_189CA69A8;
  applier[4] = &v13;
  applier[5] = size;
  BOOL v4 = dispatch_data_apply((dispatch_data_t)self, applier);
  unint64_t v5 = v14[3];
  if (!v5)
  {
    if (size >= 0x50) {
      size_t size = 80LL;
    }
    *(void *)&double v6 = MEMORY[0x1895F8858](v4).n128_u64[0];
    -[_NSDispatchData getBytes:range:](self, "getBytes:range:", (char *)&applier[-1] - v7, 0LL, size, v6);
    uint64_t v8 = CFHashBytes();
    unint64_t v9 = v14;
    v14[3] = v8;
    unint64_t v5 = v9[3];
  }

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (id)subdataWithRange:(_NSRange)a3
{
  if (!a3.length) {
    return (id)objc_msgSend(MEMORY[0x189603F48], "data", a3.location);
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v7 = -[NSData length](self, "length");
  if (__CFADD__(length, location))
  {
    unint64_t v9 = _NSMethodExceptionProem((objc_class *)self, a2);
    v17.NSUInteger location = location;
    v17.NSUInteger length = length;
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v9,  NSStringFromRange(v17),  v16);
  }

  else
  {
    if (location + length <= v7) {
      return dispatch_data_create_subrange((dispatch_data_t)self, location, length);
    }
    unint64_t v11 = v7;
    unint64_t v12 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18.NSUInteger location = location;
    v18.NSUInteger length = length;
    v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ exceeds data length %lu",  v12,  NSStringFromRange(v18),  v11);
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v10 userInfo:0]);
  return -[_NSDispatchData copyWithZone:](v13, v14, v15);
}

- (BOOL)_isDispatchData
{
  return 1;
}

- (id)_createDispatchData
{
  return self;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      xpc_object_t v5 = xpc_data_create_with_dispatch_data((dispatch_data_t)self);
      [a3 encodeXPCObject:v5 forKey:@"NS.xpcdata"];
      xpc_release(v5);
    }

    else
    {
      size_t v6 = -[NSData length](self, "length");
      if (-[NSData _isCompact](self, "_isCompact"))
      {
        objc_msgSend(a3, "encodeBytes:length:forKey:", -[NSData bytes](self, "bytes"), v6, @"NS.bytes");
      }

      else
      {
        unint64_t v7 = malloc(v6);
        -[_NSDispatchData getBytes:length:](self, "getBytes:length:", v7, v6);
        [a3 encodeBytes:v7 length:v6 forKey:@"NS.bytes"];
        free(v7);
      }
    }
  }

  else
  {
    [a3 encodeDataObject:self];
  }

- (_NSDispatchData)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Decoding an _NSDispatchData directly is not allowed" userInfo:0]);
  return (_NSDispatchData *)-[_NSDispatchData classForCoder](v3, v4);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end