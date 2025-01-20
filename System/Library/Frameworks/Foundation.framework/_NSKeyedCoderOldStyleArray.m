@interface _NSKeyedCoderOldStyleArray
+ (BOOL)supportsSecureCoding;
- (_NSKeyedCoderOldStyleArray)initWithCoder:(id)a3;
- (_NSKeyedCoderOldStyleArray)initWithObjCType:(char)a3 count:(unint64_t)a4 at:(const void *)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fillObjCType:(char)a3 count:(unint64_t)a4 at:(void *)a5;
@end

@implementation _NSKeyedCoderOldStyleArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSKeyedCoderOldStyleArray)initWithObjCType:(char)a3 count:(unint64_t)a4 at:(const void *)a5
{
  int v7 = a3;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  typePtr[0] = a3;
  typePtr[1] = 0;
  NSGetSizeAndAlignment(typePtr, &sizep, &alignp);
  NSUInteger v10 = alignp;
  NSUInteger v9 = sizep;
  if (sizep) {
    BOOL v11 = alignp == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {

    v13 = _NSMethodExceptionProem((objc_class *)self, sel_encodeArrayOfObjCType_count_at_);
    v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: size (%ld) or alignment (%ld) of type ('%c') is zero",  v13,  sizep,  alignp,  v7);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v14 userInfo:0]);
  }

  self->_type = v7;
  self->_addr = (void *)a5;
  self->_count = a4;
  if (v9 <= v10) {
    NSUInteger v9 = v10;
  }
  self->_size = v9;
  self->_decoded = 0;
  return self;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self->_decoded)
  {
    addr = self->_addr;
    if (addr) {
      free(addr);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSKeyedCoderOldStyleArray;
  -[_NSKeyedCoderOldStyleArray dealloc](&v4, sel_dealloc);
}

- (void)fillObjCType:(char)a3 count:(unint64_t)a4 at:(void *)a5
{
  unint64_t count = self->_count;
  if (count && (unint64_t size = self->_size) != 0)
  {
    if (count == a4 && self->_type == a3)
    {
      memmove(a5, self->_addr, size * a4);
      return;
    }

    NSUInteger v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: type ('%c') or count (%ld) does not match stored type and count ('%c', %ld)",  _NSMethodExceptionProem((objc_class *)self, sel_decodeArrayOfObjCType_count_at_),  a3,  a4,  self->_type,  self->_count);
    NSUInteger v10 = (void *)MEMORY[0x189603F70];
    BOOL v11 = (void *)MEMORY[0x189603A60];
  }

  else
  {

    NSUInteger v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: stored element size (%ld) or count (%ld) is zero",  _NSMethodExceptionProem((objc_class *)self, a2),  self->_size,  self->_count);
    NSUInteger v10 = (void *)MEMORY[0x189603F70];
    BOOL v11 = (void *)MEMORY[0x189603A58];
  }

  objc_exception_throw((id)[v10 exceptionWithName:*v11 reason:v9 userInfo:0]);
  -[_NSKeyedCoderOldStyleArray encodeWithCoder:](v12, v13, v14);
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_count)
  {
    unint64_t v5 = 0LL;
    do
      _compatEncodeValueOfObjCType( (objc_class *)a3,  self->_type,  (double *)((char *)self->_addr + self->_size * v5++),  sel_encodeArrayOfObjCType_count_at_);
    while (v5 < self->_count);
  }

- (_NSKeyedCoderOldStyleArray)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v6 = [a3 decodeInt32ForKey:@"NS.count"];
  uint64_t v7 = v6;
  if ((v6 & 0x80000000) != 0)
  {
    v15 = _NSMethodExceptionProem((objc_class *)self, a2);

    objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: unable to decode array with negative count (%d)",  v15,  v7);
  }

  else
  {
    uint64_t v8 = v6;
    self->_unint64_t count = v6;
    uint64_t v9 = [a3 decodeInt32ForKey:@"NS.size"];
    uint64_t v10 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      v16 = _NSMethodExceptionProem((objc_class *)self, a2);

      objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: unable to decode array with negative size (%d)",  v16,  v10);
    }

    else
    {
      uint64_t v11 = v9;
      self->_unint64_t size = v9;
      uint64_t v12 = [a3 decodeInt32ForKey:@"NS.type"];
      uint64_t v13 = v12;
      if ((_DWORD)v12 == (char)v12)
      {
        self->_type = v12;
        typePtr[0] = v12;
        typePtr[1] = 0;
        NSGetSizeAndAlignment(typePtr, &sizep, &alignp);
        if (sizep <= alignp) {
          NSUInteger v18 = alignp;
        }
        else {
          NSUInteger v18 = sizep;
        }
        self->_unint64_t size = v18;
        v19 = calloc(self->_count, v18);
        self->_addr = v19;
        if (v19)
        {
          self->_decoded = 1;
          if (!self->_count) {
            return self;
          }
          uint64_t v20 = 0LL;
          while ((_compatDecodeValueOfObjCType( (uint64_t)a3,  (NSString *)self->_type,  (BOOL *)self->_addr + self->_size * v20,  sel_decodeArrayOfObjCType_count_at_) & 1) != 0)
          {
            if (++v20 >= self->_count) {
              return self;
            }
          }

          v22 = _NSMethodExceptionProem((objc_class *)self, a2);

          if (![a3 error]) {
            objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: unable to decode element in array of size (%ld) and count (%ld)",  v22,  v11,  v8);
          }
        }

        else
        {
          v21 = _NSMethodExceptionProem((objc_class *)self, a2);

          objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  *MEMORY[0x189603B38],  4864,  @"%@: unable to allocate memory for size (%ld) and count (%ld)",  v21,  v11,  v8);
        }
      }

      else
      {
        id v14 = _NSMethodExceptionProem((objc_class *)self, a2);

        objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: unable to decode array with invalid type (%d)",  v14,  v13);
      }
    }
  }

  return 0LL;
}

@end