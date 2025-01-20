@interface NSConcreteData
- (BOOL)_copyWillRetain;
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (NSConcreteData)init;
- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7;
- (const)bytes;
- (id)_createDispatchData;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (void)dealloc;
- (void)getBytes:(void *)a3;
- (void)getBytes:(void *)a3 length:(unint64_t)a4;
- (void)getBytes:(void *)a3 range:(_NSRange)a4;
@end

@implementation NSConcreteData

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  v7 = self;
  if (a4 < 0x8000000000000001LL)
  {
    if (!a4)
    {
      self->_bytes = 0LL;
      if (a6) {
        (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, self->_length);
      }
      goto LABEL_17;
    }

    if (!a5)
    {
      self->_bytes = a3;
      if (a6) {
        self->_deallocator = _Block_copy(a6);
      }
      goto LABEL_17;
    }

    v10 = malloc_default_zone();
    unint64_t v11 = (unint64_t)malloc_zone_malloc(v10, a4);
    v7->_bytes = (void *)v11;
    if (!v11)
    {

      return 0LL;
    }

    v12 = (char *)v11;
    if (a4 < 0x80000
      || (v13 = (void *)MEMORY[0x1895FD590], ((*MEMORY[0x1895FD590] - 1LL) & (v11 | (unint64_t)a3)) != 0)
      || (malloc_default_zone(), malloc_zone_claimed_address()))
    {
      size_t v14 = a4;
      v15 = (char *)a3;
    }

    else
    {
      NSUInteger v17 = -*v13 & a4;
      NSCopyMemoryPages(a3, v12, v17);
      size_t v14 = a4 - v17;
      if (a4 == v17)
      {
LABEL_10:
        v7->_deallocator = _Block_copy(&__block_literal_global_6);
        if (a6) {
          (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
        }
LABEL_17:
        v7->_length = a4;
        return v7;
      }

      v15 = (char *)a3 + v17;
      v12 += v17;
    }

    memmove(v12, v15, v14);
    goto LABEL_10;
  }

  v18 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "length", a4, 0x8000000000000000), 0 reason userInfo];
  objc_exception_throw(v18);
  return (NSConcreteData *)+[NSPropertyListSerialization propertyListWithData:options:format:error:]( v19,  v20,  v21,  v22,  v23,  v24);
}

- (unint64_t)length
{
  return self->_length;
}

- (const)bytes
{
  return self->_bytes;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    bytes = self->_bytes;
    if (bytes)
    {
      deallocator[2](deallocator, bytes, self->_length);
      deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    }

    _Block_release(deallocator);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSConcreteData;
  -[NSConcreteData dealloc](&v5, sel_dealloc);
}

- (BOOL)_copyWillRetain
{
  return !_CFExecutableLinkedOnOrAfter() || self->_deallocator != 0LL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (-[NSConcreteData _copyWillRetain](self, "_copyWillRetain")) {
    return self;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSConcreteData;
  return -[NSData copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (BOOL)_isCompact
{
  return 1;
}

- (void)getBytes:(void *)a3
{
  v3 = (char *)a3;
  unint64_t bytes = (unint64_t)self->_bytes;
  size_t length = self->_length;
  if (length < 0x80000)
  {
LABEL_5:
    if (!length) {
      return;
    }
    goto LABEL_6;
  }

  objc_super v6 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v7 = length & -*v6;
      NSCopyMemoryPages((const void *)bytes, v3, v7);
      bytes += v7;
      v3 += v7;
      length -= v7;
      goto LABEL_5;
    }
  }

- (void)getBytes:(void *)a3 length:(unint64_t)a4
{
  v4 = (char *)a3;
  if (self->_length >= a4) {
    size_t length = a4;
  }
  else {
    size_t length = self->_length;
  }
  unint64_t bytes = (unint64_t)self->_bytes;
  if (length < 0x80000)
  {
LABEL_8:
    if (!length) {
      return;
    }
    goto LABEL_9;
  }

  NSUInteger v7 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (bytes | (unint64_t)a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v8 = length & -*v7;
      NSCopyMemoryPages((const void *)bytes, v4, v8);
      bytes += v8;
      v4 += v8;
      length -= v8;
      goto LABEL_8;
    }
  }

- (void)getBytes:(void *)a3 range:(_NSRange)a4
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    int v9 = _CFExecutableLinkedOnOrAfter();
    unint64_t v10 = self->_length;
    if (v9)
    {
      if (__CFADD__(length, location))
      {
        v18 = _NSMethodExceptionProem((objc_class *)self, a2);
        v26.NSUInteger location = location;
        v26.NSUInteger length = length;
        NSPropertyListReadOptions v22 = v18;
        v23 = NSStringFromRange(v26);
        size_t v14 = @"%@: range %@ causes integer overflow";
        goto LABEL_18;
      }

      if (location + length > v10)
      {
        unint64_t v11 = a2;
        unint64_t v12 = self->_length;
        v13 = _NSMethodExceptionProem((objc_class *)self, v11);
        v25.NSUInteger location = location;
        v25.NSUInteger length = length;
        v23 = NSStringFromRange(v25);
        unint64_t v24 = v12;
        NSPropertyListReadOptions v22 = v13;
        size_t v14 = @"%@: range %@ exceeds data length %lu";
LABEL_18:
        id v19 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v22, v23, v24);
        objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v19 userInfo:0]);
        -[NSConcreteData init](v20, v21);
        return;
      }
    }

    else
    {
      if (v10 <= location)
      {
        v23 = (NSString *)location;
        unint64_t v24 = self->_length;
        NSPropertyListReadOptions v22 = _NSMethodExceptionProem((objc_class *)self, a2);
        size_t v14 = @"%@: location %lu exceeds data length %lu";
        goto LABEL_18;
      }

      if (length >= v10 - location) {
        NSUInteger length = v10 - location;
      }
    }

    unint64_t v15 = (unint64_t)self->_bytes + location;
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

- (NSConcreteData)init
{
  return -[NSConcreteData initWithBytes:length:copy:freeWhenDone:bytesAreVM:]( self,  "initWithBytes:length:copy:freeWhenDone:bytesAreVM:",  0LL,  0LL,  0LL,  0LL,  0LL);
}

- (NSConcreteData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 freeWhenDone:(BOOL)a6 bytesAreVM:(BOOL)a7
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSConcreteData;
  return -[NSData initWithBytes:length:copy:freeWhenDone:bytesAreVM:]( &v8,  sel_initWithBytes_length_copy_freeWhenDone_bytesAreVM_,  a3,  a4,  a5,  a6,  a7);
}

- (id)_createDispatchData
{
  return (id)_NSDataCreateDispatchDataFromData(self, !-[NSConcreteData _copyWillRetain](self, "_copyWillRetain"));
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

@end