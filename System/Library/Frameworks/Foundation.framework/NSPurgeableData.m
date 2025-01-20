@interface NSPurgeableData
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (NSPurgeableData)init;
- (NSPurgeableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6;
- (NSPurgeableData)initWithCapacity:(unint64_t)a3;
- (const)bytes;
- (id)description;
- (unint64_t)length;
- (void)_destroyMemory;
- (void)dealloc;
- (void)discardContentIfPossible;
- (void)endContentAccess;
- (void)mutableBytes;
- (void)setLength:(unint64_t)a3;
@end

@implementation NSPurgeableData

- (unint64_t)length
{
  if (self->_accessCount && self->_reserved->var0) {
    return self->_length;
  }
  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls.", v4, NSStringFromClass(v5), self), 0 reason userInfo];
  objc_exception_throw(v6);
  return (unint64_t)-[NSPurgeableData bytes](v7, v8);
}

- (const)bytes
{
  if (self->_accessCount && self->_reserved->var0) {
    return (const void *)self->_reserved->var0;
  }
  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls.", v4, NSStringFromClass(v5), self), 0 reason userInfo];
  objc_exception_throw(v6);
  return -[NSPurgeableData mutableBytes](v7, v8);
}

- (void)mutableBytes
{
  if (self->_accessCount && self->_reserved->var0) {
    return (void *)self->_reserved->var0;
  }
  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls.", v4, NSStringFromClass(v5), self), 0 reason userInfo];
  objc_exception_throw(v6);
  -[NSPurgeableData setLength:](v7, v8, v9);
  return result;
}

- (void)setLength:(unint64_t)a3
{
  if (!self->_accessCount || (reserved = self->_reserved, !reserved->var0))
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    v20 = (objc_class *)objc_opt_class();
    v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: <%@: %p> accessed outside successful -beginContentAccess and -endContentAccess calls.",  v19,  NSStringFromClass(v20),  self);
    v22 = (void *)MEMORY[0x189603F70];
    v23 = (void *)MEMORY[0x189603A48];
LABEL_31:
    objc_exception_throw((id)[v22 exceptionWithName:*v23 reason:v21 userInfo:0]);
    -[NSPurgeableData description](v24, v25);
    return;
  }

  if (a3 >= 0x8000000000000001LL)
  {
    v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: absurd %s: %lu, maximum size: %llu bytes",  _NSMethodExceptionProem((objc_class *)self, a2),  "length",  a3,  0x8000000000000000LL);
    v22 = (void *)MEMORY[0x189603F70];
    v23 = (void *)MEMORY[0x189603A60];
    goto LABEL_31;
  }

  unint64_t var1 = reserved->var1;
  unint64_t length = self->_length;
  char v9 = 1;
  if (a3 >> 19) {
    char v9 = 2;
  }
  unint64_t v10 = (a3 >> v9) + a3;
  if (var1 > v10) {
    unint64_t v10 = var1;
  }
  if (a3 <= length) {
    unint64_t v10 = a3;
  }
  v11 = (void *)MEMORY[0x1895FD590];
  uint64_t v12 = v10 + *MEMORY[0x1895FD590] - 1;
  else {
    unint64_t v13 = v12 & -*MEMORY[0x1895FD590];
  }
  if (v13 == var1) {
    goto LABEL_25;
  }
  if (_CFDiscorporateMemoryAllocate())
  {
    v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unable to allocate memory for length (%lu)",  _NSMethodExceptionProem((objc_class *)self, a2),  v13);
    v22 = (void *)MEMORY[0x189603F70];
    v23 = (void *)MEMORY[0x189603B38];
    goto LABEL_31;
  }

  v14 = (char *)__dst[0];
  unint64_t var0 = self->_reserved->var0;
  if (length >= a3) {
    size_t v16 = a3;
  }
  else {
    size_t v16 = length;
  }
  if (v16 >= 0x80000)
  {
    malloc_default_zone();
    NSUInteger v17 = v16 & -*v11;
    NSCopyMemoryPages((const void *)var0, __dst[0], v17);
    var0 += v17;
    v14 = (char *)__dst[0] + v17;
    v16 -= v17;
  }

  if (v16) {
LABEL_23:
  }
    memmove(v14, (const void *)var0, v16);
  _CFDiscorporateMemoryDeallocate();
  v18 = self->_reserved;
  v18->var5 = v28;
  *(_OWORD *)&v18->unint64_t var0 = *(_OWORD *)__dst;
  *(_OWORD *)&v18->var2 = v27;
LABEL_25:
  if (a3 > length) {
    bzero((void *)(self->_reserved->var0 + length), a3 - length);
  }
  self->_unint64_t length = a3;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  objc_sync_enter(self);
  if (self->_accessCount)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSPurgeableData;
    v3 = -[NSData description](&v7, sel_description);
  }

  else
  {
    v4 = (objc_class *)objc_opt_class();
    v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p>",  NSStringFromClass(v4),  self);
  }

  v5 = v3;
  objc_sync_exit(self);
  return v5;
}

- (BOOL)beginContentAccess
{
  int accessCount = self->_accessCount;
  if (!accessCount)
  {
    if (!self->_reserved || _CFDiscorporateMemoryMaterialize())
    {
      BOOL v4 = 0;
      goto LABEL_8;
    }

    int accessCount = self->_accessCount;
  }

  if (accessCount != 0x7FFFFFFF) {
    self->_int accessCount = accessCount + 1;
  }
  BOOL v4 = 1;
LABEL_8:
  objc_sync_exit(self);
  return v4;
}

- (void)endContentAccess
{
  int accessCount = self->_accessCount;
  if (accessCount == 0x7FFFFFFF) {
    goto LABEL_5;
  }
  if (accessCount)
  {
    int v5 = accessCount - 1;
    self->_int accessCount = v5;
    if (!v5) {
      _CFDiscorporateMemoryDematerialize();
    }
LABEL_5:
    objc_sync_exit(self);
    return;
  }

  v6 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: called without successful matching -beginContentAccess", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v6);
  __break(1u);
}

- (void)_destroyMemory
{
  reserved = self->_reserved;
  if (reserved)
  {
    if (reserved->var2)
    {
      _CFDiscorporateMemoryDeallocate();
      reserved = self->_reserved;
    }

    free(reserved);
    self->_reserved = 0LL;
  }

- (void)discardContentIfPossible
{
  if (!self->_accessCount) {
    -[NSPurgeableData _destroyMemory](self, "_destroyMemory");
  }
  objc_sync_exit(self);
}

- (BOOL)isContentDiscarded
{
  if (!self->_reserved) {
    goto LABEL_5;
  }
  if (!self->_accessCount)
  {
    if (!_CFDiscorporateMemoryMaterialize())
    {
      _CFDiscorporateMemoryDematerialize();
      goto LABEL_3;
    }

- (NSPurgeableData)init
{
  return -[NSPurgeableData initWithCapacity:](self, "initWithCapacity:", 0LL);
}

- (NSPurgeableData)initWithCapacity:(unint64_t)a3
{
  BOOL v3 = self;
  if (a3 >= 0x8000000000000001LL)
  {
    int v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: absurd %s: %lu, maximum size: %llu bytes", _NSMethodExceptionProem((objc_class *)self, a2), "capacity", a3, 0x8000000000000000), 0 reason userInfo];
    objc_exception_throw(v5);
    return -[NSPurgeableData initWithBytes:length:copy:deallocator:](v6, v7, v8, v9, v10, v11);
  }

  else
  {
    self->_unint64_t length = 0LL;
    self->_reserved = ($76F2F73B8BE4E3FDC118F7A69FD479A2 *)malloc(0x28uLL);
    if (_CFDiscorporateMemoryAllocate())
    {

      return 0LL;
    }

    else
    {
      v3->_int accessCount = 1;
    }

    return v3;
  }

- (NSPurgeableData)initWithBytes:(void *)a3 length:(unint64_t)a4 copy:(BOOL)a5 deallocator:(id)a6
{
  if (a4 < 0x8000000000000001LL)
  {
    unint64_t v9 = -[NSPurgeableData initWithCapacity:](self, "initWithCapacity:", a4);
    BOOL v10 = v9;
    if (!v9) {
      return v10;
    }
    unint64_t var0 = v9->_reserved->var0;
    uint64_t v12 = (char *)a3;
    size_t v13 = a4;
    if (a4 >= 0x80000)
    {
      v14 = (void *)MEMORY[0x1895FD590];
      size_t v13 = a4;
      uint64_t v12 = (char *)a3;
      malloc_default_zone();
      int v15 = malloc_zone_claimed_address();
      size_t v13 = a4;
      uint64_t v12 = (char *)a3;
      if (v15) {
        goto LABEL_8;
      }
      NSUInteger v16 = -*v14 & a4;
      NSCopyMemoryPages(a3, (void *)var0, v16);
      uint64_t v12 = (char *)a3 + v16;
      var0 += v16;
      size_t v13 = a4 - v16;
    }

    if (!v13)
    {
LABEL_9:
      if (a6) {
        (*((void (**)(id, void *, unint64_t))a6 + 2))(a6, a3, a4);
      }
      v10->_unint64_t length = a4;
      return v10;
    }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSPurgeableData _destroyMemory](self, "_destroyMemory");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSPurgeableData;
  -[NSPurgeableData dealloc](&v3, sel_dealloc);
}

@end