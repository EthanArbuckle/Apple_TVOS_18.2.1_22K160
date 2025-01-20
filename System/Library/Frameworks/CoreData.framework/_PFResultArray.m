@interface _PFResultArray
+ (BOOL)accessInstanceVariablesDirectly;
+ (Class)classForKeyedUnarchiver;
+ (void)initialize;
- (BOOL)_setPurgeable:(BOOL)a3;
- (Class)classForCoder;
- (_PFResultArray)initWithObjects:(id *)a3 count:(unsigned int)a4 store:(id)a5 metadata:(id)a6;
- (_PFResultArray)retain;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)release;
@end

@implementation _PFResultArray

+ (void)initialize
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFResultArray)initWithObjects:(id *)a3 count:(unsigned int)a4 store:(id)a5 metadata:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PFResultArray;
  v9 = -[_PFResultArray init](&v12, sel_init, a3, *(void *)&a4);
  v10 = v9;
  if (v9)
  {
    v9->_count = a3->var0;
    v9->_weakRequestStore = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  a5);
    v10->_resultSet = a3;
    v10->_resultType = 2;
    v10->_metadata = (NSKnownKeysDictionary *)a6;
  }

  return v10;
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[_PFResultArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0LL, self->_count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v8 = a4.location + a4.length;
  uint64_t v9 = [a3 methodForSelector:sel_isEqual_];
  if (location >= v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = (uint64_t (*)(id, char *, id))v9;
  while (1)
  {
    id v11 = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", location);
    if (v11 == a3 || (v10(a3, sel_isEqual_, v11) & 1) != 0) {
      break;
    }
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return location;
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFResultArray indexOfObjectIdenticalTo:inRange:]( self,  "indexOfObjectIdenticalTo:inRange:",  a3,  0LL,  self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location >= a4.location + a4.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (-[_PFResultArray objectAtIndex:](self, "objectAtIndex:", location) != a3)
  {
    ++location;
    if (!--length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return location;
}

- (void)dealloc
{
  resultSet = self->_resultSet;
  if (resultSet) {
    bufferResultSetDeallocate((uint64_t)resultSet);
  }

  self->_weakRequestStore = 0LL;
  self->_metadata = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PFResultArray;
  -[_PFResultArray dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0LL;
  }
  else {
    return self->_count;
  }
}

- (BOOL)_setPurgeable:(BOOL)a3
{
  resultSet = self->_resultSet;
  if (a3) {
    return bufferResultSetPurgeable((uint64_t)resultSet);
  }
  else {
    return bufferResultSetNonPurgeable((uint64_t)resultSet);
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  resultSet = self->_resultSet;
  $832F591C28F8B7CE1ACC7DCBC97655CC var7 = resultSet->var7;
  if ((*(_BYTE *)&var7 & 0x10) != 0)
  {
    if ((*(_BYTE *)&var7 & 0x40) != 0)
    {
      v16 = (void *)MEMORY[0x189603F70];
      uint64_t v17 = *MEMORY[0x189603A60];
      uint64_t v25 = _NSMethodExceptionProem();
      v18 = @"%@: backing buffer has been purged";
    }

    else
    {
      if ((*(_BYTE *)&var7 & 0x20) == 0) {
        goto LABEL_2;
      }
      v16 = (void *)MEMORY[0x189603F70];
      uint64_t v17 = *MEMORY[0x189603A60];
      uint64_t v25 = _NSMethodExceptionProem();
      v18 = @"%@: backing buffer can be purged";
    }

    objc_msgSend(v16, "raise:format:", v17, v18, v25, v26, v27);
    return 0LL;
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if ((*(_BYTE *)&self->_resultSet->var7 & 0x40) != 0) {
    return 0LL;
  }
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&self->_count;
  }
  unint64_t result = 0LL;
  a3->var1 = a4;
  if (a5)
  {
    unint64_t count = self->_count;
    if (var0 < count)
    {
      unint64_t result = 0LL;
      do
      {
        unint64_t v12 = result;
        unint64_t v13 = var0 + result;
        id v14 = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", var0 + result);
        unint64_t result = v12 + 1;
        a4[v12] = v14;
      }

      while (v13 + 1 < count && result < a5);
      var0 += result;
    }
  }

  a3->unint64_t var0 = var0;
  return result;
}

- (void)getObjects:(id *)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  unsigned int count = self->_count;
  MEMORY[0x1895F8858](self);
  NSUInteger v8 = (char *)v12 - v7;
  if (count > 0x200)
  {
    NSUInteger v8 = (char *)NSAllocateScannedUncollectable();
    if (self->_count)
    {
LABEL_3:
      unint64_t v9 = 0LL;
      do
      {
        *(void *)&v8[8 * v9] = -[_PFResultArray objectAtIndex:](self, "objectAtIndex:", v9);
        ++v9;
        unint64_t v10 = self->_count;
      }

      while (v9 < v10);
      size_t v11 = 8 * v10;
      goto LABEL_8;
    }
  }

  else
  {
    bzero((char *)v12 - v7, 8LL * v6);
    if (count) {
      goto LABEL_3;
    }
  }

  size_t v11 = 0LL;
LABEL_8:
  memmove(a3, v8, v11);
  if (count >= 0x201) {
    NSZoneFree(0LL, v8);
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = self;
  v13[1] = *MEMORY[0x1895F89C0];
  if (a4.location + a4.length > self->_count) {
    self = (_PFResultArray *)[MEMORY[0x189603F70] raise:*MEMORY[0x189603B40], @"%@: index (%lu) beyond bounds (%lu)", _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count format];
  }
  if (length)
  {
    MEMORY[0x1895F8858](self);
    unint64_t v9 = (char *)v13 - v8;
    if (length > 0x200) {
      unint64_t v9 = (char *)NSAllocateScannedUncollectable();
    }
    else {
      bzero((char *)v13 - v8, 8 * length);
    }
    if (location < v7->_count)
    {
      unint64_t v10 = 0LL;
      do
      {
        NSUInteger v11 = location + v10;
        *(void *)&v9[8 * v10] = -[_PFResultArray objectAtIndex:](v7, "objectAtIndex:", location + v10);
        ++v10;
      }

      while (v11 + 1 < v7->_count && length > v10);
    }

    memmove(a3, v9, 8 * length);
    if (length >= 0x201) {
      NSZoneFree(0LL, v9);
    }
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (_PFResultArray)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  p_cd_rc = &self->_cd_rc;
  do
    int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    *p_cd_rc += 0x20000000;
    -[_PFResultArray dealloc](self, "dealloc");
  }

- (unint64_t)retainCount
{
  return self->_cd_rc + 1LL;
}

@end