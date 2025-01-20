@interface NSIndexSet
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSIndexSet)allocWithZone:(_NSZone *)a3;
+ (NSIndexSet)indexSet;
+ (NSIndexSet)indexSetWithBitfield:(unint64_t)a3;
+ (NSIndexSet)indexSetWithIndex:(NSUInteger)value;
+ (NSIndexSet)indexSetWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
+ (NSIndexSet)indexSetWithIndexesInRange:(NSRange)range;
+ (id)_alloc;
+ (void)initialize;
- (BOOL)containsIndex:(NSUInteger)value;
- (BOOL)containsIndexes:(NSIndexSet *)indexSet;
- (BOOL)containsIndexesInRange:(NSRange)range;
- (BOOL)getBitfield:(unint64_t *)a3;
- (BOOL)intersectsIndexesInRange:(NSRange)range;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIndexSet:(NSIndexSet *)indexSet;
- (Class)classForCoder;
- (NSIndexSet)indexesInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesPassingTest:(void *)predicate;
- (NSIndexSet)indexesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)initWithBitfield:(unint64_t)a3;
- (NSIndexSet)initWithCoder:(id)a3;
- (NSIndexSet)initWithIndex:(NSUInteger)value;
- (NSIndexSet)initWithIndexSet:(NSIndexSet *)indexSet;
- (NSIndexSet)initWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
- (NSIndexSet)initWithIndexesInRange:(NSRange)range;
- (NSUInteger)count;
- (NSUInteger)countOfIndexesInRange:(NSRange)range;
- (NSUInteger)firstIndex;
- (NSUInteger)getIndexes:(NSUInteger *)indexBuffer maxCount:(NSUInteger)bufferSize inIndexRange:(NSRangePointer)range;
- (NSUInteger)indexGreaterThanIndex:(NSUInteger)value;
- (NSUInteger)indexGreaterThanOrEqualToIndex:(NSUInteger)value;
- (NSUInteger)indexInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexLessThanIndex:(NSUInteger)value;
- (NSUInteger)indexLessThanOrEqualToIndex:(NSUInteger)value;
- (NSUInteger)indexPassingTest:(void *)predicate;
- (NSUInteger)indexWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)lastIndex;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (id)_init;
- (id)_numberEnumerator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)replacementObjectForPortCoder:(id)a3;
- (uint64_t)_indexClosestToIndex:(int)a3 equalAllowed:(int)a4 following:;
- (unint64_t)__getContainmentVector:(BOOL *)a3 inRange:(_NSRange)a4;
- (unint64_t)_indexAtIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeAfterOrContainingIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeBeforeOrContainingIndex:(unint64_t)a3;
- (unint64_t)_indexOfRangeContainingIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rangeCount;
- (void)__forwardEnumerateRanges:(id)a3;
- (void)_setContentToContentFromIndexSet:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateIndexesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateIndexesUsingBlock:(void *)block;
- (void)enumerateIndexesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateRangesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateRangesUsingBlock:(void *)block;
- (void)enumerateRangesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
@end

@implementation NSIndexSet

+ (NSIndexSet)allocWithZone:(_NSZone *)a3
{
  v4 = (objc_class *)objc_opt_class();
  if (v4 == (objc_class *)&OBJC_CLASS___NSIndexSet) {
    return (NSIndexSet *)&___placeholderIndexSet;
  }
  else {
    return (NSIndexSet *)NSAllocateObject(v4, 0LL, a3);
  }
}

- (NSIndexSet)initWithIndexesInRange:(NSRange)range
{
  unint64_t length = range.length;
  NSUInteger location = range.location;
  result = -[NSIndexSet _init](self, "_init");
  if (result)
  {
    unint64_t v7 = location + length;
    if (length && (v7 & 0x8000000000000000LL) != 0)
    {
      v9 = result;
      v10 = _NSMethodExceptionProem((objc_class *)result, a2);
      v14.NSUInteger location = location;
      v14.unint64_t length = length;
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range %@ exceeds maximum index value of NSNotFound - 1",  v10,  NSStringFromRange(v14));

      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v11 userInfo:0]);
      return (NSIndexSet *)-[NSIndexSet _init](v12, v13);
    }

    else
    {
      if (length && (location > 0x3F || v7 > 0x40 || v7 < location))
      {
        *(_DWORD *)&result->_indexSetFlags &= ~2u;
        result->_internal._singleRange._range.NSUInteger location = location;
        uint64_t v8 = 3LL;
      }

      else
      {
        if (length) {
          unint64_t length = 0xFFFFFFFFFFFFFFFFLL >> -(char)length << location;
        }
        else {
          unint64_t length = 0LL;
        }
        uint64_t v8 = 2LL;
      }

      (&result->super.isa)[v8] = (Class)length;
    }
  }

  return result;
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSIndexSet;
  id result = -[NSIndexSet init](&v3, sel_init);
  if (result) {
    *((_DWORD *)result + 2) |= 3u;
  }
  return result;
}

- (void)enumerateIndexesUsingBlock:(void *)block
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    free(self->_internal._multipleRanges._data);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSIndexSet;
  -[NSIndexSet dealloc](&v3, sel_dealloc);
}

+ (NSIndexSet)indexSet
{
  if (_NSTaggedIndexSetAllowed != 1 || &OBJC_CLASS___NSIndexSet != a1) {
    return (NSIndexSet *)objc_alloc_init((Class)a1);
  }
  id result = (NSIndexSet *)0x8580000000000007LL;
  unint64_t v3 = *MEMORY[0x189616658] ^ 0x8580000000000007LL;
  if ((~v3 & 0xC000000000000007LL) != 0) {
    return (NSIndexSet *)(v3 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v3 & 7)));
  }
  return result;
}

+ (NSIndexSet)indexSetWithIndex:(NSUInteger)value
{
  if (_NSTaggedIndexSetAllowed != 1 || value > 0x33 || &OBJC_CLASS___NSIndexSet != a1) {
    return (NSIndexSet *)(id)[objc_alloc((Class)a1) initWithIndex:value];
  }
  id result = (NSIndexSet *)((8LL << value) & 0x7FFFFFFFFFFFF8LL | 0x8580000000000007LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    id v4 = self;
    if ((__objc2_class *)objc_opt_class() == &OBJC_CLASS___NSIndexSet) {
      return v4;
    }
    else {
      return -[NSIndexSet initWithIndexSet:]( +[NSIndexSet allocWithZone:](&OBJC_CLASS___NSIndexSet, "allocWithZone:", a3),  "initWithIndexSet:",  v4);
    }
  }

  return self;
}

- (NSUInteger)count
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = *MEMORY[0x189616658];
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v4 & (v3 >> 3);
    goto LABEL_12;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
LABEL_12:
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)location);
    v9.i16[0] = vaddlv_u8(v9);
    return v9.u32[0];
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0) {
    return self->_internal._singleRange._range.length;
  }
  NSUInteger v7 = self->_internal._singleRange._range.location;
  if (*(void *)(v7 + 8)) {
    return *(void *)(v7 + 16);
  }
  else {
    return 0LL;
  }
}

- (NSUInteger)lastIndex
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = *MEMORY[0x189616658];
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v4 & (v3 >> 3);
    if (!location) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    return __clz(location) ^ 0x3F;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (location) {
      return __clz(location) ^ 0x3F;
    }
  }

  else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      uint64_t v10 = 0LL;
      p_internal = &self->_internal;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }

  else
  {
    NSUInteger v7 = self->_internal._singleRange._range.location;
    uint64_t v8 = *(void *)(v7 + 8);
    if (v8)
    {
      p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(v7 + 16LL * *(void *)(v7 + 24) + 64);
      uint64_t v10 = v8 - 1;
      return p_internal[v10]._singleRange._range.location + p_internal[v10]._singleRange._range.length - 1;
    }
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSUInteger)indexLessThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 0);
}

- (uint64_t)_indexClosestToIndex:(int)a3 equalAllowed:(int)a4 following:
{
  if (!a1) {
    return 0LL;
  }
  char v5 = a3;
  unint64_t v6 = a2;
  if (a1 < 0)
  {
    uint64_t v8 = *MEMORY[0x189616658];
    if ((~a1 & 0xC000000000000007LL) == 0) {
      uint64_t v8 = 0LL;
    }
    unint64_t v9 = v8 ^ a1;
    uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v9 & 7) == 0) {
      uint64_t v10 = 0xFFFFFFFFFFFFFLL;
    }
    uint64_t v11 = v10 & (v9 >> 3);
    if (!v11) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_17:
    uint64_t v18 = 1LL;
    if (!a4) {
      uint64_t v18 = -1LL;
    }
    if (a3) {
      uint64_t v18 = 0LL;
    }
    uint64_t v19 = v18 + a2;
    if (a4)
    {
      unint64_t v20 = v19 & ~(v19 >> 63);
      if (v20 > 0x3F) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      unint64_t v22 = v11 & (-1LL << v20);
      BOOL v21 = v22 == 0;
      unint64_t v23 = __clz(__rbit64(v22));
    }

    else
    {
      if (v19 < 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v19 >= 63) {
        LOBYTE(v19) = 63;
      }
      unint64_t v24 = v11 & (0xFFFFFFFFFFFFFFFFLL >> ~(_BYTE)v19);
      BOOL v21 = v24 == 0;
      unint64_t v23 = __clz(v24) ^ 0x3F;
    }

    if (v21) {
      unint64_t v17 = -1LL;
    }
    else {
      unint64_t v17 = v23;
    }
    if (v17 < 0x40) {
      return v17;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  int v12 = *(_DWORD *)(a1 + 8);
  if ((v12 & 2) != 0)
  {
    uint64_t v11 = *(void *)(a1 + 16);
    if (!v11) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_17;
  }

  if ((v12 & 1) != 0)
  {
    uint64_t v25 = *(void *)(a1 + 24);
    if (!v25) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v26 = *(void *)(a1 + 16);
    unint64_t v27 = v26 + v25 - 1;
    if (a4)
    {
      unint64_t v17 = *(void *)(a1 + 16);
      if (a3)
      {
        if (v26 >= a2) {
          return v17;
        }
        unint64_t v17 = a2;
        if (v27 >= a2) {
          return v17;
        }
        goto LABEL_53;
      }

      if (v26 > a2) {
        return v17;
      }
      if (v27 > a2) {
        return a2 + 1;
      }
LABEL_51:
      if (v6 > 0x7FFFFFFFFFFFFFFELL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      ++v6;
LABEL_53:
      uint64_t v28 = a1 + 16;
      uint64_t v29 = a1 + 16;
      if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
        uint64_t v29 = *(void *)v28 + 16LL * *(void *)(*(void *)v28 + 24LL) + 64;
      }
      uint64_t v30 = [(id)a1 _indexOfRangeAfterOrContainingIndex:v6];
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v31 = v30;
        unint64_t v32 = *(void *)(v29 + 16 * v30);
        if (v6 <= v32) {
          unint64_t v17 = v32;
        }
        else {
          unint64_t v17 = v6;
        }
        pthread_t v33 = pthread_self();
        unint64_t v34 = atomic_load((unint64_t *)(*(void *)v28 + 56LL));
        if (v33 != (pthread_t)v34)
        {
          v35 = (unint64_t *)(*(void *)v28 + 56LL);
          while (!__ldaxr(v35))
          {
          }

- (NSUInteger)firstIndex
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = *MEMORY[0x189616658];
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v5 = v4 & (v3 >> 3);
    goto LABEL_12;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) == 0)
  {
    if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      if (self->_internal._singleRange._range.length)
      {
        p_internal = &self->_internal;
        return p_internal->_singleRange._range.location;
      }
    }

    else
    {
      NSUInteger location = self->_internal._singleRange._range.location;
      if (*(void *)(location + 8))
      {
        p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(location + 16LL * *(void *)(location + 24) + 64);
        return p_internal->_singleRange._range.location;
      }
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v5 = self->_internal._singleRange._range.location;
LABEL_12:
  int v9 = __clz(__rbit64(v5));
  if (v5) {
    int v10 = v9;
  }
  else {
    int v10 = -1;
  }
  if (v10 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

- (unint64_t)_indexOfRangeBeforeOrContainingIndex:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (((unint64_t)self & 0x8000000000000000LL) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    v16[0] = 0LL;
    v16[1] = v16;
    v16[2] = 0x2020000000LL;
    v16[3] = 0LL;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke;
    v15[3] = &unk_189C9DA70;
    v15[5] = v16;
    v15[6] = a3;
    v15[4] = &v17;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v15);
    unint64_t v8 = v18[3];
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
    return v8;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v7 = 0LL;
      goto LABEL_10;
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v6 = *(void *)(self->_internal._singleRange._range.location + 8);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 - 1;
LABEL_10:
  if (-[NSIndexSet lastIndex](self, "lastIndex") <= a3) {
    return v7;
  }
  if (-[NSIndexSet firstIndex](self, "firstIndex") > a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
  }
  unint64_t v11 = 0LL;
  while (v11 < v7)
  {
    unint64_t v8 = (v7 + v11) >> 1;
    int v12 = &p_internal[v8];
    if (v12->_singleRange._range.location <= a3)
    {
      if (v12->_singleRange._range.location + v12->_singleRange._range.length - 1 >= a3) {
        return v8;
      }
      unint64_t v11 = v8 + 1;
    }

    else
    {
      unint64_t v7 = (v7 + v11) >> 1;
    }
  }

  unint64_t location = p_internal[v11]._singleRange._range.location;
  unint64_t v14 = v11 - 1;
  if (!v11) {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (location > a3) {
    return v14;
  }
  else {
    return v11;
  }
}

- (unint64_t)rangeCount
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = *MEMORY[0x189616658];
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v4 & (v3 >> 3);
    if (location) {
      goto LABEL_7;
    }
    return 0LL;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) == 0)
  {
    if ((*(_BYTE *)&indexSetFlags & 1) != 0) {
      return self->_internal._singleRange._range.length != 0;
    }
    else {
      return *(void *)(self->_internal._singleRange._range.location + 8);
    }
  }

  NSUInteger location = self->_internal._singleRange._range.location;
  if (!location) {
    return 0LL;
  }
LABEL_7:
  unint64_t result = 1LL;
  unint64_t v7 = location;
  while (1)
  {
    unint64_t v8 = (-1LL << __clz(__rbit64(v7))) & ~location;
    if (!v8) {
      break;
    }
    ++result;
    unint64_t v7 = (-1LL << __clz(__rbit64(v8))) & location;
    if (!v7) {
      return --result;
    }
  }

  return result;
}

+ (id)_alloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NSIndexSet;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSIndexSet == a1)
  {
    _objc_registerTaggedPointerClass();
    _NSTaggedIndexSetAllowed = 1;
  }

+ (NSIndexSet)indexSetWithIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (&OBJC_CLASS___NSIndexSet != a1) {
    return (NSIndexSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithIndexesInRange:",  range.location,  range.length);
  }
  NSUInteger v5 = range.location + range.length;
  if (range.length && (v5 & 0x8000000000000000LL) != 0)
  {
    unint64_t v8 = _NSMethodExceptionProem((objc_class *)a1, a2);
    v14.NSUInteger location = location;
    v14.NSUInteger length = length;
    int v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v8, NSStringFromRange(v14)), 0 reason userInfo];
    objc_exception_throw(v9);
    return +[NSIndexSet indexSetWithIndexes:count:](v10, v11, v12, v13);
  }

  if (_NSTaggedIndexSetAllowed != 1 || range.length && (range.location > 0x33 || v5 > 0x34 || v5 < range.location)) {
    return (NSIndexSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithIndexesInRange:",  range.location,  range.length);
  }
  if (range.length) {
    unint64_t result = (NSIndexSet *)((8
  }
                           * ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007LL);
  else {
    unint64_t result = (NSIndexSet *)0x8580000000000007LL;
  }
  unint64_t v7 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v7 & 0xC000000000000007LL) != 0) {
    return (NSIndexSet *)(v7 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v7 & 7)));
  }
  return result;
}

+ (NSIndexSet)indexSetWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  if (!a4) {
    return (NSIndexSet *)objc_msgSend(a1, "indexSet", a3);
  }
  uint64_t v5 = 0LL;
  unint64_t v6 = a4 - 1;
  while (1)
  {
    unint64_t v7 = a3[v6];
    if (v7 > 0x3F) {
      break;
    }
    v5 |= 1LL << v7;
LABEL_6:
    if (--v6 == -1LL) {
      return (NSIndexSet *)[a1 indexSetWithBitfield:v5];
    }
  }

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  return (NSIndexSet *)(id)[objc_alloc((Class)a1) initWithIndexes:a3 count:a4];
}

+ (NSIndexSet)indexSetWithBitfield:(unint64_t)a3
{
  unint64_t result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (NSIndexSet)initWithIndex:(NSUInteger)value
{
  char v3 = value;
  if (value > 0x3F) {
    return -[NSIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:", value, 1LL);
  }
  unint64_t result = -[NSIndexSet _init](self, "_init");
  if (result) {
    result->_internal._singleRange._range.NSUInteger location = 1LL << v3;
  }
  return result;
}

- (void)_setContentToContentFromIndexSet:(id)a3
{
  if (a3)
  {
    uint64_t v5 = (__objc2_class *)objc_opt_class();
    if (&OBJC_CLASS___NSIndexSet != v5
      && &OBJC_CLASS____NSConstantIndexSet != v5
      && &OBJC_CLASS___NSMutableIndexSet != v5)
    {
      v35 = -[NSIndexSet initWithIndexSet:](objc_alloc(&OBJC_CLASS___NSIndexSet), "initWithIndexSet:", a3);
      -[NSIndexSet _setContentToContentFromIndexSet:](self, "_setContentToContentFromIndexSet:", v35);

      return;
    }

    $A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->_indexSetFlags | 1);
    self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = indexSetFlags;
    if (((unint64_t)a3 & 0x8000000000000000LL) != 0)
    {
      uint64_t v7 = *MEMORY[0x189616658];
      unint64_t v8 = v7 ^ (unint64_t)a3;
      uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v8 & 7) == 0) {
        uint64_t v9 = 0xFFFFFFFFFFFFFLL;
      }
      NSUInteger v10 = v9 & (v8 >> 3);
      goto LABEL_35;
    }

    if ((*((_BYTE *)a3 + 8) & 2) != 0)
    {
      NSUInteger v10 = *((void *)a3 + 2);
LABEL_35:
      self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 2);
      self->_internal._singleRange._range.NSUInteger location = v10;
      return;
    }

    unint64_t v11 = [a3 lastIndex];
    int v12 = *((_DWORD *)a3 + 2);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 <= 0x3F)
    {
      uint64_t v16 = 0LL;
      unint64_t v17 = 0LL;
      NSUInteger v10 = 0LL;
      uint64_t v18 = (char *)a3 + 16;
      uint64_t v19 = (char *)a3 + 24;
      if ((v12 & 2) != 0) {
        uint64_t v19 = (char *)a3 + 16;
      }
      while (1)
      {
        uint64_t v20 = (uint64_t *)v19;
        if ((v12 & 3) == 0) {
          uint64_t v20 = (uint64_t *)(*(void *)v18 + 8LL);
        }
        uint64_t v21 = *v20;
        unint64_t v22 = *v20 != 0;
        if ((v12 & 1) == 0 && v21) {
          unint64_t v22 = *(void *)(*(void *)v18 + 8LL);
        }
        if (v17 >= v22) {
          break;
        }
        unint64_t v23 = (char *)a3 + 16;
        if ((v12 & 1) == 0) {
          unint64_t v23 = (char *)(*(void *)v18 + 16LL * *(void *)(*(void *)v18 + 24LL) + 64);
        }
        unint64_t v24 = &v23[v16];
        uint64_t v26 = *(void *)v24;
        uint64_t v25 = *((void *)v24 + 1);
        unint64_t v27 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v25 << v26;
        if (v25) {
          unint64_t v28 = v27;
        }
        else {
          unint64_t v28 = 0LL;
        }
        v10 |= v28;
        ++v17;
        v16 += 16LL;
      }

      $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
      goto LABEL_35;
    }

    $A8859644891BA8F5A580113D622AC538 v13 = self->_indexSetFlags;
    if ((v12 & 1) != 0)
    {
      self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFD);
      uint64_t v29 = ($BA656A43A73A71AF6C4B982E4240B787 *)((char *)a3 + 16);
      if ((*((_BYTE *)a3 + 8) & 1) == 0) {
        uint64_t v29 = ($BA656A43A73A71AF6C4B982E4240B787 *)(v29->_singleRange._range.location
      }
                                                  + 16LL * *(void *)(v29->_singleRange._range.location + 24)
                                                  + 64);
      self->_internal = *v29;
    }

    else
    {
      self->_$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&v13 & 0xFFFFFFFC);
      int v14 = *((_DWORD *)a3 + 2);
      if ((v14 & 2) != 0)
      {
        unint64_t v15 = (char *)a3 + 16;
      }

      else if ((v14 & 1) != 0)
      {
        unint64_t v15 = (char *)a3 + 24;
      }

      else
      {
        unint64_t v15 = (char *)(*((void *)a3 + 2) + 8LL);
      }

      if (*(void *)v15)
      {
        if ((v14 & 1) != 0) {
          uint64_t v30 = 1LL;
        }
        else {
          uint64_t v30 = *(void *)(*((void *)a3 + 2) + 8LL);
        }
      }

      else
      {
        uint64_t v30 = 0LL;
      }

      uint64_t v31 = (unint64_t *)malloc(16 * v30 + 64);
      self->_internal._singleRange._range.NSUInteger location = (NSUInteger)v31;
      atomic_store(0LL, v31 + 7);
      *uint64_t v31 = v30;
      v31[1] = v30;
      v31[2] = 0LL;
      v31[3] = 0LL;
      unint64_t v32 = (char *)a3 + 16;
      if ((*((_BYTE *)a3 + 8) & 1) == 0) {
        unint64_t v32 = (char *)(*(void *)v32 + 16LL * *(void *)(*(void *)v32 + 24LL) + 64);
      }
      memcpy(v31 + 8, v32, 16 * v30);
      if (v30)
      {
        pthread_t v33 = (uint64_t *)(v31 + 9);
        do
        {
          uint64_t v34 = *v33;
          v33 += 2;
          *(void *)(self->_internal._singleRange._range.location + 16) += v34;
          --v30;
        }

        while (v30);
      }
    }
  }

- (NSIndexSet)initWithIndexSet:(NSIndexSet *)indexSet
{
  unint64_t v4 = -[NSIndexSet _init](self, "_init");
  uint64_t v5 = v4;
  if (v4) {
    -[NSIndexSet _setContentToContentFromIndexSet:](v4, "_setContentToContentFromIndexSet:", indexSet);
  }
  return v5;
}

- (NSIndexSet)initWithIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = a4 - 1;
    while (1)
    {
      unint64_t v8 = a3[v7];
      if (v8 > 0x3F)
      {
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
          unint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              uint64_t v15 = 0LL;
              do
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = [*(id *)(*((void *)&v20 + 1) + 8 * v15) rangeValue];
                -[NSMutableIndexSet addIndexesInRange:](v11, "addIndexesInRange:", v16, v17);
                ++v15;
              }

              while (v13 != v15);
              uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
            }

            while (v13);
          }

          uint64_t v18 = -[NSIndexSet initWithIndexSet:](self, "initWithIndexSet:", v11);

          return v18;
        }
      }

      else
      {
        v6 |= 1LL << v8;
      }

      if (--v7 == -1LL) {
        return -[NSIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
      }
    }
  }

  uint64_t v6 = 0LL;
  return -[NSIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
}

- (NSIndexSet)initWithBitfield:(unint64_t)a3
{
  if (_NSTaggedIndexSetAllowed == 1
    && (__objc2_class *)objc_opt_class() == &OBJC_CLASS___NSIndexSet
    && (!a3 || (__clz(a3) ^ 0x3C) <= 0x33))
  {

    unint64_t result = (NSIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007LL);
    unint64_t v6 = *MEMORY[0x189616658] ^ (unint64_t)result;
    if ((~v6 & 0xC000000000000007LL) != 0) {
      return (NSIndexSet *)(v6 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v6 & 7)));
    }
  }

  else
  {
    unint64_t result = -[NSIndexSet _init](self, "_init");
    if (result) {
      result->_internal._singleRange._range.NSUInteger location = a3;
    }
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unint64_t v5 = -[NSIndexSet rangeCount](self, "rangeCount");
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:v5 forKey:@"NSRangeCount"];
    if (v5)
    {
      if (v5 == 1)
      {
        uint64_t v6 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", 0LL);
        uint64_t v8 = v7;
        [a3 encodeInteger:v6 forKey:@"NSLocation"];
        [a3 encodeInteger:v8 forKey:@"NSLength"];
      }

      else
      {
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:2 * v5 + 16];
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          unint64_t v14 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", i);
          uint64_t v16 = v24;
          if (v14 >= 0x80)
          {
            unint64_t v17 = v14;
            do
            {
              *v16++ = v17 | 0x80;
              unint64_t v14 = v17 >> 7;
              unint64_t v18 = v17 >> 14;
              v17 >>= 7;
            }

            while (v18);
          }

          _BYTE *v16 = v14;
          uint64_t v19 = v16 + 1;
          if (v15 < 0x80)
          {
            LOBYTE(v20) = v15;
          }

          else
          {
            do
            {
              *v19++ = v15 | 0x80;
              unint64_t v20 = v15 >> 7;
              unint64_t v21 = v15 >> 14;
              v15 >>= 7;
            }

            while (v21);
          }

          *uint64_t v19 = v20;
          [v12 appendBytes:v24 length:v19 - (_BYTE *)v24 + 1];
        }

        [a3 encodeObject:v12 forKey:@"NSRangeData"];
      }
    }
  }

  else
  {
    v24[0] = v5;
    [a3 encodeValueOfObjCType:"I" at:v24];
    if (v5)
    {
      for (uint64_t j = 0LL; j != v5; ++j)
      {
        int v10 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", j);
        int v22 = v11;
        int v23 = v10;
        [a3 encodeValueOfObjCType:"I" at:&v23];
        [a3 encodeValueOfObjCType:"I" at:&v22];
      }
    }
  }

- (NSIndexSet)initWithCoder:(id)a3
{
  v28[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    [a3 decodeValueOfObjCType:"I" at:&v22 size:4];
    uint64_t v8 = v22;
    if ((_DWORD)v22)
    {
      do
      {
        [a3 decodeValueOfObjCType:"I" at:&v21 size:4];
        [a3 decodeValueOfObjCType:"I" at:&v20 size:4];
        -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", v21, v20);
        --v8;
      }

      while (v8);
    }

    goto LABEL_17;
  }

  uint64_t v6 = [a3 decodeIntegerForKey:@"NSRangeCount"];
  if (v6)
  {
    uint64_t v7 = v6;
    if (v6 == 1)
    {
      -[NSMutableIndexSet addIndexesInRange:]( v5,  "addIndexesInRange:",  [a3 decodeIntegerForKey:@"NSLocation"],  objc_msgSend(a3, "decodeIntegerForKey:", @"NSLength"));
      goto LABEL_17;
    }

    if (([a3 containsValueForKey:@"NSRangeData"] & 1) == 0)
    {

      unint64_t v27 = @"NSLocalizedDescription";
      v28[0] = @"-[NSIndexSet initWithCoder:] decoder did not provide range data";
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1)));
      self = 0LL;
      goto LABEL_17;
    }

    uint64_t v9 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSRangeData"];
    int v10 = (unsigned __int8 *)[v9 bytes];
    int v22 = v10;
    if ([a3 requiresSecureCoding])
    {
      if (v9)
      {
        uint64_t v11 = [v9 length];
        for (uint64_t i = 0LL; v11; --v11)
        {
          unsigned int v13 = *v10++;
          i += (v13 >> 7) ^ 1;
        }

        if (i == 2 * v7) {
          goto LABEL_14;
        }

        int v23 = @"NSLocalizedDescription";
        uint64_t v24 = @"Range data did not match expected length.";
        unint64_t v17 = (void *)MEMORY[0x189603F68];
        unint64_t v18 = &v24;
        uint64_t v19 = &v23;
      }

      else
      {

        uint64_t v25 = @"NSLocalizedDescription";
        uint64_t v26 = @"Range data did not match expected length.";
        unint64_t v17 = (void *)MEMORY[0x189603F68];
        unint64_t v18 = &v26;
        uint64_t v19 = &v25;
      }

      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1)));
      return 0LL;
    }

    do
    {
LABEL_14:
      uint64_t v14 = _NSGetUnsignedInt2(&v22);
      -[NSMutableIndexSet addIndexesInRange:](v5, "addIndexesInRange:", v14, _NSGetUnsignedInt2(&v22));
      --v7;
    }

    while (v7);
  }

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSIndexSet;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (unint64_t)_indexOfRangeContainingIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (((unint64_t)self & 0x8000000000000000LL) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x2020000000LL;
    v14[3] = 0LL;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __43__NSIndexSet__indexOfRangeContainingIndex___block_invoke;
    v13[3] = &unk_189C9DA70;
    v13[5] = v14;
    v13[6] = a3;
    v13[4] = &v15;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v13);
    unint64_t v9 = v16[3];
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    return v9;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v9 = 0LL;
      p_internal = &self->_internal;
      goto LABEL_17;
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger location = self->_internal._singleRange._range.location;
  uint64_t v5 = *(void *)(location + 8);
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(location + 16LL * *(void *)(location + 24) + 64);
  unint64_t v7 = v5 - 1;
  if (v7)
  {
    unint64_t v8 = 0LL;
    do
    {
      unint64_t v9 = (v7 + v8) >> 1;
      int v10 = &p_internal[v9];
      if (v10->_singleRange._range.location <= a3)
      {
        if (v10->_singleRange._range.location + v10->_singleRange._range.length - 1 >= a3) {
          return v9;
        }
        unint64_t v8 = v9 + 1;
      }

      else
      {
        unint64_t v7 = (v7 + v8) >> 1;
      }
    }

    while (v8 < v7);
    unint64_t v9 = v8;
  }

  else
  {
    unint64_t v9 = 0LL;
  }

void *__43__NSIndexSet__indexOfRangeContainingIndex___block_invoke( void *result,  unint64_t a2,  unint64_t a3,  _BYTE *a4)
{
  unint64_t v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(void *)(*(void *)(result[4] + 8LL) + 24LL) = *(void *)(*(void *)(result[5] + 8LL) + 24LL);
LABEL_7:
    *a4 = 1;
    goto LABEL_8;
  }

  if (v4 < a2) {
    goto LABEL_7;
  }
LABEL_8:
  ++*(void *)(*(void *)(result[5] + 8LL) + 24LL);
  return result;
}

void *__51__NSIndexSet__indexOfRangeBeforeOrContainingIndex___block_invoke( void *result,  unint64_t a2,  unint64_t a3,  _BYTE *a4)
{
  unint64_t v4 = result[6];
  if (v4 >= a2 && v4 - a2 < a3)
  {
    *(void *)(*(void *)(result[4] + 8LL) + 24LL) = *(void *)(*(void *)(result[5] + 8LL) + 24LL);
LABEL_9:
    *a4 = 1;
    goto LABEL_10;
  }

  if (a2 + a3 >= v4)
  {
    if (v4 < a2) {
      goto LABEL_9;
    }
  }

  else
  {
    *(void *)(*(void *)(result[4] + 8LL) + 24LL) = *(void *)(*(void *)(result[5] + 8LL) + 24LL);
  }

- (unint64_t)_indexOfRangeAfterOrContainingIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (((unint64_t)self & 0x8000000000000000LL) != 0
    || ($A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags, (*(_BYTE *)&indexSetFlags & 2) != 0))
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    v17[0] = 0LL;
    v17[1] = v17;
    v17[2] = 0x2020000000LL;
    v17[3] = 0LL;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke;
    v16[3] = &unk_189C9DA70;
    v16[5] = v17;
    v16[6] = a3;
    void v16[4] = &v18;
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v16);
    unint64_t v8 = v19[3];
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
    return v8;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    if (self->_internal._singleRange._range.length)
    {
      unint64_t v7 = 0LL;
      goto LABEL_10;
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v6 = *(void *)(self->_internal._singleRange._range.location + 8);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6 - 1;
LABEL_10:
  if (-[NSIndexSet firstIndex](self, "firstIndex") >= a3) {
    return 0LL;
  }
  if (-[NSIndexSet lastIndex](self, "lastIndex") < a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
  }
  unint64_t v11 = 0LL;
  if (v7)
  {
    unint64_t v12 = v7;
    do
    {
      unint64_t v8 = (v12 + v11) >> 1;
      unsigned int v13 = &p_internal[v8];
      if (v13->_singleRange._range.location <= a3)
      {
        if (v13->_singleRange._range.location + v13->_singleRange._range.length - 1 >= a3) {
          return v8;
        }
        unint64_t v11 = v8 + 1;
      }

      else
      {
        unint64_t v12 = (v12 + v11) >> 1;
      }
    }

    while (v11 < v12);
  }

  unint64_t v14 = p_internal[v11]._singleRange._range.location + p_internal[v11]._singleRange._range.length - 1;
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 < v7) {
    unint64_t v15 = v11 + 1;
  }
  if (v14 < a3) {
    return v15;
  }
  else {
    return v11;
  }
}

void *__50__NSIndexSet__indexOfRangeAfterOrContainingIndex___block_invoke( void *result,  unint64_t a2,  unint64_t a3,  _BYTE *a4)
{
  unint64_t v4 = result[6];
  BOOL v5 = v4 - a2 < a3 && v4 >= a2;
  if (v4 < a2 || v5)
  {
    *(void *)(*(void *)(result[4] + 8LL) + 24LL) = *(void *)(*(void *)(result[5] + 8LL) + 24LL);
    *a4 = 1;
  }

  ++*(void *)(*(void *)(result[5] + 8LL) + 24LL);
  return result;
}

- (unint64_t)hash
{
  unint64_t result = -[NSIndexSet count](self, "count");
  if (result)
  {
    unint64_t v4 = result;
    NSUInteger v5 = -[NSIndexSet firstIndex](self, "firstIndex");
    return v5 + v4 + -[NSIndexSet lastIndex](self, "lastIndex");
  }

  return result;
}

- (BOOL)isEqualToIndexSet:(NSIndexSet *)indexSet
{
  if (indexSet == self) {
    goto LABEL_115;
  }
  if (!indexSet)
  {
LABEL_116:
    char v10 = 0;
    return v10 & 1;
  }

  NSUInteger v5 = (__objc2_class *)objc_opt_class();
  if (&OBJC_CLASS___NSIndexSet != v5
    && &OBJC_CLASS____NSConstantIndexSet != v5
    && &OBJC_CLASS___NSMutableIndexSet != v5
    || (uint64_t v6 = (__objc2_class *)objc_opt_class(), &OBJC_CLASS___NSIndexSet != v6)
    && &OBJC_CLASS____NSConstantIndexSet != v6
    && &OBJC_CLASS___NSMutableIndexSet != v6)
  {
    NSUInteger v7 = -[NSIndexSet count](self, "count");
    if (v7 == -[NSIndexSet count](indexSet, "count"))
    {
      if (v7)
      {
        NSUInteger v8 = -[NSIndexSet firstIndex](self, "firstIndex");
        NSUInteger v9 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
        do
        {
          char v10 = v8 == v9;
          if (v8 != v9) {
            break;
          }
          NSUInteger v8 = -[NSIndexSet indexGreaterThanIndex:](self, "indexGreaterThanIndex:", v9);
          NSUInteger v9 = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", v9);
          --v7;
        }

        while (v7);
        return v10 & 1;
      }

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSIndexSet isEqualToIndexSet:](self, "isEqualToIndexSet:", a3);
  }
  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSIndexSet initWithIndexSet:]( +[NSIndexSet allocWithZone:](&OBJC_CLASS___NSMutableIndexSet, "allocWithZone:", a3),  "initWithIndexSet:",  self);
}

- (NSUInteger)indexGreaterThanIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 0, 1);
}

- (NSUInteger)indexGreaterThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 1);
}

- (NSUInteger)indexLessThanOrEqualToIndex:(NSUInteger)value
{
  return -[NSIndexSet _indexClosestToIndex:equalAllowed:following:]((uint64_t)self, value, 1, 0);
}

- (NSUInteger)getIndexes:(NSUInteger *)indexBuffer maxCount:(NSUInteger)bufferSize inIndexRange:(NSRangePointer)range
{
  if (!bufferSize || !-[NSIndexSet count](self, "count")) {
    return 0LL;
  }
  if (range)
  {
    NSUInteger length = range->length;
    if (!length) {
      return 0LL;
    }
    NSUInteger location = range->location;
    NSUInteger v11 = length + range->location - 1;
  }

  else
  {
    NSUInteger location = -[NSIndexSet firstIndex](self, "firstIndex");
    NSUInteger v11 = -[NSIndexSet lastIndex](self, "lastIndex");
  }

  if (v11 < location) {
    return 0LL;
  }
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v12 = *MEMORY[0x189616658];
    unint64_t v13 = v12 ^ (unint64_t)self;
    uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v13 & 7) == 0) {
      uint64_t v14 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v15 = v14 & (v13 >> 3);
LABEL_24:
    if (location <= 0x3F)
    {
      NSUInteger v23 = 0LL;
      unint64_t v24 = 63LL;
      if (v11 < 0x3F) {
        unint64_t v24 = v11;
      }
      unint64_t v25 = location;
      while (v25 <= 0x3F)
      {
        unint64_t v26 = (-1LL << v25) & v15;
        if (!v26) {
          break;
        }
        unint64_t v27 = __clz(__rbit64(v26));
        if (v24 < v27) {
          break;
        }
        unint64_t v25 = v27 + 1;
        indexBuffer[v23++] = v27;
        if (bufferSize == v23)
        {
          NSUInteger v23 = bufferSize;
          break;
        }
      }

      if (range && v23)
      {
        NSUInteger v28 = indexBuffer[v23 - 1] - location + 1;
        NSUInteger v29 = v28 + range->location;
        NSUInteger v30 = range->length - v28;
        range->NSUInteger location = v29;
        range->NSUInteger length = v30;
      }

      return v23;
    }

    return 0LL;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger v15 = self->_internal._singleRange._range.location;
    goto LABEL_24;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0
    || (uint64_t v17 = (_opaque_pthread_t *)atomic_load((unint64_t *)(self->_internal._singleRange._range.location + 56)),
        pthread_self() != v17)
    || (NSUInteger v18 = self->_internal._singleRange._range.location, *(void *)(v18 + 32) != location)
    || (unint64_t v19 = *(void *)(v18 + 40), v19 == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v19 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", location);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0LL;
    }
  }

  $A8859644891BA8F5A580113D622AC538 v20 = self->_indexSetFlags;
  if ((*(_BYTE *)&v20 & 2) != 0)
  {
    p_internal = &self->_internal;
    BOOL v22 = (*(_DWORD *)&self->_indexSetFlags & 1) == 0;
  }

  else
  {
    if ((*(_BYTE *)&v20 & 1) != 0)
    {
      unint64_t v32 = self->_internal._singleRange._range.length != 0;
      goto LABEL_46;
    }

    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(self->_internal._singleRange._range.location + 8);
    BOOL v22 = 1;
  }

  if (p_internal->_singleRange._range.location)
  {
    if (v22)
    {
      NSUInteger v31 = self->_internal._singleRange._range.location;
      unint64_t v32 = *(void *)(v31 + 8);
LABEL_42:
      pthread_t v33 = ($BA656A43A73A71AF6C4B982E4240B787 *)(v31 + 16LL * *(void *)(v31 + 24) + 64);
      goto LABEL_47;
    }

    unint64_t v32 = 1LL;
  }

  else
  {
    if (v22)
    {
      unint64_t v32 = 0LL;
      NSUInteger v31 = self->_internal._singleRange._range.location;
      goto LABEL_42;
    }

    unint64_t v32 = 0LL;
  }

- (unint64_t)__getContainmentVector:(BOOL *)a3 inRange:(_NSRange)a4
{
  size_t length = a4.length;
  NSUInteger location = a4.location;
  v17[2] = *MEMORY[0x1895F89C0];
  if (a4.length >= 0x101) {
    int v8 = 1;
  }
  else {
    int v8 = 256;
  }
  NSUInteger v9 = (char *)&v17[-1] - ((8 * v8 + 15) & 0xFFFFFFF0);
  char v10 = v9;
  if (a4.length >= 0x101) {
    char v10 = (char *)malloc(8 * a4.length);
  }
  v17[0] = location;
  v17[1] = length;
  unint64_t v11 = -[NSIndexSet getIndexes:maxCount:inIndexRange:](self, "getIndexes:maxCount:inIndexRange:", v10, length, v17);
  bzero(a3, length);
  if (v11)
  {
    uint64_t v12 = v10;
    unint64_t v13 = v11;
    do
    {
      uint64_t v14 = *(void *)v12;
      v12 += 8;
      a3[v14 - location] = 1;
      --v13;
    }

    while (v13);
  }

  if (v10 != v9) {
    free(v10);
  }
  return v11;
}

- (NSUInteger)countOfIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  if (!range.length) {
    return length;
  }
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      NSUInteger v9 = self->_internal._singleRange._range.location;
      if (v9) {
        goto LABEL_13;
      }
    }

    else
    {
      if ((*(_BYTE *)&indexSetFlags & 1) != 0) {
        p_NSUInteger length = &self->_internal._singleRange._range.length;
      }
      else {
        p_NSUInteger length = (NSUInteger *)(self->_internal._singleRange._range.location + 8);
      }
      if (*p_length)
      {
        unint64_t v19 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:]( self,  "_indexOfRangeAfterOrContainingIndex:",  range.location);
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          p_internal = &self->_internal;
          if ((*(_DWORD *)&self->_indexSetFlags & 1) != 0)
          {
            uint64_t v25 = 2LL;
            if ((*(_DWORD *)&self->_indexSetFlags & 2) == 0) {
              uint64_t v25 = 3LL;
            }
            unint64_t v24 = (&self->super.isa)[v25] != 0LL;
          }

          else
          {
            NSUInteger v21 = p_internal->_singleRange._range.location;
            p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
                                                             + 16LL
            unint64_t v22 = *(void *)(v21 + 8);
            if (v22) {
              BOOL v23 = 0;
            }
            else {
              BOOL v23 = (*(_DWORD *)&self->_indexSetFlags & 2) == 0;
            }
            if (v23) {
              unint64_t v24 = 0LL;
            }
            else {
              unint64_t v24 = v22;
            }
          }

          NSUInteger v26 = location + length;
          unint64_t v27 = location + length - 1;
          NSUInteger v28 = &p_internal[v19];
          if (v28->_singleRange._range.location >= location)
          {
            NSUInteger length = 0LL;
          }

          else
          {
            NSUInteger v29 = v28->_singleRange._range.length + v28->_singleRange._range.location;
            if (v29 - 1 >= v27) {
              return length;
            }
            NSUInteger length = v29 - location;
            ++v19;
          }

          BOOL v30 = v24 > v19;
          unint64_t v31 = v24 - v19;
          if (v30)
          {
            for (uint64_t i = &p_internal[v19]._singleRange._range.length; ; i += 2)
            {
              unint64_t v33 = *(i - 1);
              NSUInteger v34 = *i;
              if (v33 + *i - 1 > v27) {
                break;
              }
              length += v34;
              if (!--v31) {
                return length;
              }
            }

            if (v33 <= v27) {
              return length + v26 - v33;
            }
          }

          return length;
        }
      }
    }

    return 0LL;
  }

  uint64_t v6 = *MEMORY[0x189616658];
  unint64_t v7 = v6 ^ (unint64_t)self;
  uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v7 & 7) == 0) {
    uint64_t v8 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v9 = v8 & (v7 >> 3);
  if (!v9) {
    return 0LL;
  }
LABEL_13:
  NSUInteger v12 = range.location + range.length;
  if (range.location + range.length >= 0x40) {
    NSUInteger v12 = 64LL;
  }
  NSUInteger v13 = v12 - range.location;
  if (range.location <= 0x3F) {
    char v14 = range.location;
  }
  else {
    char v14 = 0;
  }
  if (range.location > 0x3F) {
    NSUInteger v13 = 0LL;
  }
  unint64_t v15 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v13 << v14;
  if (v13) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = 0LL;
  }
  uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(v16 & v9));
  v17.i16[0] = vaddlv_u8(v17);
  return v17.u32[0];
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)self;
    uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0) {
      uint64_t v5 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v5 & (v4 >> 3);
LABEL_13:
    LOBYTE(v10) = 0;
    uint64_t v11 = -1LL;
    do
    {
      if (((-1LL << v10) & location) == 0) {
        break;
      }
      unint64_t v12 = __clz(__rbit64((-1LL << v10) & location));
      unint64_t v13 = (-1LL << v12) & ~location;
      unint64_t v10 = __clz(__rbit64(v13));
      if (a3 == ++v11) {
        goto LABEL_20;
      }
    }

    while (v13 && v10 < 0x40);
    char v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Index %ld out of bounds [0...%ld]",  a3,  _bitfieldSetRangesCount(location));
    goto LABEL_19;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    goto LABEL_13;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    unint64_t v9 = self->_internal._singleRange._range.length != 0;
    if (v9 >= a3)
    {
      p_internal = &self->_internal;
LABEL_25:
      uint8x8_t v17 = &p_internal[a3];
      unint64_t v12 = v17->_singleRange._range.location;
      NSUInteger length = v17->_singleRange._range.length;
      goto LABEL_26;
    }
  }

  else
  {
    NSUInteger v8 = self->_internal._singleRange._range.location;
    unint64_t v9 = *(void *)(v8 + 8);
    if (v9)
    {
      if (v9 < a3) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }

    if (!a3)
    {
LABEL_24:
      p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(v8 + 16LL * *(void *)(v8 + 24) + 64);
      goto LABEL_25;
    }

    unint64_t v9 = 0LL;
  }

- (BOOL)getBitfield:(unint64_t *)a3
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)self;
    uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0) {
      uint64_t v5 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v5 & (v4 >> 3);
    if (!a3) {
      return 1;
    }
LABEL_7:
    *a3 = location;
    return 1;
  }

  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (!a3) {
      return 1;
    }
    goto LABEL_7;
  }

  return 0;
}

- (BOOL)containsIndex:(NSUInteger)value
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v5 = *MEMORY[0x189616658];
    unint64_t v6 = v5 ^ (unint64_t)self;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v7 & (v6 >> 3);
LABEL_13:
    if (value <= 0x3F) {
      return (location >> value) & 1;
    }
    goto LABEL_17;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    goto LABEL_13;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    NSUInteger length = self->_internal._singleRange._range.length;
    if (length)
    {
      NSUInteger v15 = self->_internal._singleRange._range.location;
      if (v15 <= value)
      {
        LOBYTE(v13) = v15 + length - 1 >= value;
        return v13;
      }
    }

    goto LABEL_17;
  }

  p_internal = &self->_internal;
  NSUInteger v10 = self->_internal._singleRange._range.location;
  if (!*(void *)(v10 + 8))
  {
LABEL_17:
    LOBYTE(v13) = 0;
    return v13;
  }

  unint64_t v12 = (_opaque_pthread_t *)atomic_load((unint64_t *)(v10 + 56));
  if (pthread_self() != v12) {
    goto LABEL_11;
  }
  NSUInteger v16 = p_internal->_singleRange._range.location;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(v16 + 16LL * *(void *)(v16 + 24) + 64);
  }
  uint8x8_t v17 = &p_internal[*(void *)(v16 + 40)];
  if (v17->_singleRange._range.location <= value
    && v17->_singleRange._range.location + v17->_singleRange._range.length - 1 >= value)
  {
LABEL_24:
    LOBYTE(v13) = 1;
  }

  else
  {
LABEL_11:
    LOBYTE(v13) = -[NSIndexSet _indexOfRangeContainingIndex:](self, "_indexOfRangeContainingIndex:", value) != 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (BOOL)containsIndexesInRange:(NSRange)range
{
  if (!range.length) {
    return 0;
  }
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *MEMORY[0x189616658];
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v9 = v8 & (v7 >> 3);
LABEL_15:
    if (range.location <= 0x3F)
    {
      BOOL result = 0;
      BOOL v13 = __CFADD__(range.location, range.length);
      if (range.location + range.length <= 0x40 && !v13) {
        return ((0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location)) & ~v9) == 0;
      }
      return result;
    }

    return 0;
  }

  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger v9 = self->_internal._singleRange._range.location;
    goto LABEL_15;
  }

  unint64_t v11 = -[NSIndexSet _indexOfRangeContainingIndex:](self, "_indexOfRangeContainingIndex:", range.location);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  p_internal = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
  }
  return p_internal[v11]._singleRange._range.length + p_internal[v11]._singleRange._range.location >= location + length;
}

- (BOOL)containsIndexes:(NSIndexSet *)indexSet
{
  LOBYTE(v3) = 1;
  if (!indexSet || indexSet == self) {
    return v3;
  }
  uint64_t v6 = (__objc2_class *)objc_opt_class();
  if (&OBJC_CLASS___NSIndexSet != v6
    && &OBJC_CLASS____NSConstantIndexSet != v6
    && &OBJC_CLASS___NSMutableIndexSet != v6)
  {
    NSUInteger v7 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (NSUInteger i = v7;
            i != 0x7FFFFFFFFFFFFFFFLL;
            NSUInteger i = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", i))
      {
        BOOL v3 = -[NSIndexSet containsIndex:](self, "containsIndex:", i);
        if (!v3) {
          break;
        }
      }
    }

    return v3;
  }

  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v9 = *MEMORY[0x189616658];
    unint64_t v10 = v9 ^ (unint64_t)self;
    uint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v10 & 7) == 0) {
      uint64_t v11 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v11 & (v10 >> 3);
    goto LABEL_30;
  }

  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
    if (((unint64_t)indexSet & 0x8000000000000000LL) != 0)
    {
LABEL_17:
      uint64_t v13 = *MEMORY[0x189616658];
      unint64_t v14 = v13 ^ (unint64_t)indexSet;
      uint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v14 & 7) == 0) {
        uint64_t v15 = 0xFFFFFFFFFFFFFLL;
      }
      NSUInteger v16 = v15 & (v14 >> 3);
      goto LABEL_35;
    }

- (BOOL)intersectsIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *MEMORY[0x189616658];
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v9 = v8 & (v7 >> 3);
    goto LABEL_19;
  }

  if ((*(_BYTE *)&self->_indexSetFlags & 2) != 0)
  {
    NSUInteger v9 = self->_internal._singleRange._range.location;
LABEL_19:
    NSUInteger v15 = range.location + range.length;
    if (range.location + range.length >= 0x40) {
      NSUInteger v15 = 64LL;
    }
    NSUInteger v16 = v15 - range.location;
    if (range.location <= 0x3F) {
      char v17 = range.location;
    }
    else {
      char v17 = 0;
    }
    if (range.location > 0x3F) {
      NSUInteger v16 = 0LL;
    }
    unint64_t v18 = 0xFFFFFFFFFFFFFFFFLL >> -(char)v16 << v17;
    if (v16) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = 0LL;
    }
    return (v19 & v9) != 0;
  }

  if (!range.length) {
    return 0;
  }
  unint64_t v10 = -[NSIndexSet _indexOfRangeBeforeOrContainingIndex:]( self,  "_indexOfRangeBeforeOrContainingIndex:",  range.location);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    p_internal = &self->_internal;
    if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
      p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
    }
                                                       + 16LL
  }

  unint64_t v12 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", location);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v13 = &self->_internal;
  if ((*(_BYTE *)&self->_indexSetFlags & 1) == 0) {
    uint64_t v13 = ($BA656A43A73A71AF6C4B982E4240B787 *)(v13->_singleRange._range.location
  }
                                              + 16LL * *(void *)(v13->_singleRange._range.location + 24)
                                              + 64);
  return location + length - 1 >= v13[v12]._singleRange._range.location;
}

- (id)_numberEnumerator
{
  return  -[_NSIndexSetEnumerator initWithIndexSet:]( objc_alloc(&OBJC_CLASS____NSIndexSetEnumerator),  "initWithIndexSet:",  self);
}

- (id)description
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  BOOL v3 = +[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 128LL);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSIndexSet;
  -[NSMutableString appendString:](v3, "appendString:", -[NSIndexSet description](&v12, sel_description));
  NSUInteger v4 = -[NSIndexSet count](self, "count");
  if (v4)
  {
    NSUInteger v5 = v4;
    unint64_t v6 = -[NSIndexSet rangeCount](self, "rangeCount");
    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"[number of indexes: %lu (in %lu ranges), indexes: ("),  v5,  v6;
    if (v6)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (i) {
          -[NSMutableString appendString:](v3, "appendString:", @" ");
        }
        uint64_t v8 = -[NSIndexSet rangeAtIndex:](self, "rangeAtIndex:", i);
        unint64_t v10 = v9;
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"%lu", v8);
        if (v10 >= 2) {
          -[NSMutableString appendFormat:](v3, "appendFormat:", @"-%lu", v10 + v8 - 1);
        }
      }
    }

    -[NSMutableString appendString:](v3, "appendString:", @"]"));
  }

  else
  {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"(no indexes)");
  }

  return v3;
}

- (void)__forwardEnumerateRanges:(id)a3
{
  NSUInteger v5 = (__objc2_class *)objc_opt_class();
  if (&OBJC_CLASS___NSIndexSet != v5
    && &OBJC_CLASS____NSConstantIndexSet != v5
    && &OBJC_CLASS___NSMutableIndexSet != v5)
  {
    -[NSIndexSet enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", a3);
    return;
  }

  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v6 = *MEMORY[0x189616658];
    unint64_t v7 = v6 ^ (unint64_t)self;
    uint64_t v8 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v7 & 7) == 0) {
      uint64_t v8 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v8 & (v7 >> 3);
    goto LABEL_16;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->_indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
    NSUInteger location = self->_internal._singleRange._range.location;
LABEL_16:
    __NSIndexSetEnumerateBitfield(location, 0x4000000000000000LL, 0LL, 64LL, (uint64_t)a3);
    return;
  }

  p_internal = &self->_internal;
  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    unint64_t v12 = 1LL;
  }

  else
  {
    unint64_t v12 = *(void *)(p_internal->_singleRange._range.location + 8);
    if (!v12) {
      return;
    }
    p_internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
  }

  for (unint64_t i = 0LL; i < v12; ++i)
  {
    while (p_internal[i]._singleRange._range.length)
    {
      __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)a3);
      if (++i >= v12) {
        return;
      }
    }
  }

- (void)enumerateIndexesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  if ((opts & 2) != 0) {
    NSEnumerationOptions v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    NSEnumerationOptions v6 = opts;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v6, 0LL, 0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, v6, 0LL, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (void)enumerateIndexesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x800000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)block,  v9 | 0x800000000000000LL,  range.location,  range.length);
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (NSUInteger)indexPassingTest:(void *)predicate
{
  return -[NSIndexSet indexWithOptions:passingTest:](self, "indexWithOptions:passingTest:", 0LL, predicate);
}

- (NSUInteger)indexWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSEnumerationOptions v6 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v6 = opts;
  }
  uint64_t v7 = v6 | 0x2000000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)predicate,  v6 | 0x2000000000000000LL,  0LL,  0x7FFFFFFFFFFFFFFFLL);
  return __NSIndexSetEnumerate((uint64_t)self, v7, 0LL, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)predicate);
}

- (NSUInteger)indexInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xD7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2800000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)predicate,  v9 | 0x2800000000000000LL,  range.location,  range.length);
  return __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)predicate);
}

- (NSIndexSet)indexesPassingTest:(void *)predicate
{
  return -[NSIndexSet indexesWithOptions:passingTest:](self, "indexesWithOptions:passingTest:", 0LL, predicate);
}

- (NSIndexSet)indexesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ((opts & 2) != 0) {
    NSEnumerationOptions v6 = opts & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    NSEnumerationOptions v6 = opts;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v6, 0LL, 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v18 = 0LL;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  NSUInteger v21 = __Block_byref_object_copy__6;
  char v22 = __Block_byref_object_dispose__6;
  uint64_t v23 = 0LL;
  uint64_t v14 = 0LL;
  NSUInteger v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  uint64_t v17 = 0LL;
  int v13 = 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke;
  v12[3] = &unk_189C9DA98;
  v12[4] = predicate;
  v12[5] = &v14;
  v12[6] = &v18;
  v12[7] = &v13;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0LL, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)v12);
  uint64_t v7 = (void *)v19[5];
  if (v7)
  {
    uint64_t v8 = (void *)[v7 copy];

    NSEnumerationOptions v9 = v8;
  }

  else
  {
    NSEnumerationOptions v9 = +[NSIndexSet indexSetWithBitfield:](&OBJC_CLASS___NSIndexSet, "indexSetWithBitfield:", v15[3]);
  }

  uint64_t v10 = v9;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __45__NSIndexSet_indexesWithOptions_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16LL))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (!v4)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = -[NSIndexSet initWithBitfield:]( objc_alloc(&OBJC_CLASS___NSMutableIndexSet),  "initWithBitfield:",  *(void *)(*(void *)(*(void *)(a1 + 40)
                                                                                              + 8LL)
                                                                                  + 24LL));
        NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      }

      [v4 addIndex:a2];
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 1LL << a2;
    }

    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 56));
  }

- (NSIndexSet)indexesInRange:(NSRange)range options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  NSEnumerationOptions v9 = opts & 0xF7FFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x800000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)predicate,  v9 | 0x800000000000000LL,  range.location,  range.length);
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000LL;
  unint64_t v25 = __Block_byref_object_copy__6;
  uint64_t v26 = __Block_byref_object_dispose__6;
  uint64_t v27 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  int v17 = 0;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke;
  v16[3] = &unk_189C9DA98;
  void v16[4] = predicate;
  v16[5] = &v18;
  v16[6] = &v22;
  void v16[7] = &v17;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v16);
  uint64_t v11 = (void *)v23[5];
  if (v11)
  {
    unint64_t v12 = (void *)[v11 copy];

    int v13 = v12;
  }

  else
  {
    int v13 = +[NSIndexSet indexSetWithBitfield:](&OBJC_CLASS___NSIndexSet, "indexSetWithBitfield:", v19[3]);
  }

  uint64_t v14 = v13;
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v14;
}

void __49__NSIndexSet_indexesInRange_options_passingTest___block_invoke(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16LL))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 56));
    if (a2 > 0x3F)
    {
      NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      if (!v4)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = -[NSIndexSet initWithBitfield:]( objc_alloc(&OBJC_CLASS___NSMutableIndexSet),  "initWithBitfield:",  *(void *)(*(void *)(*(void *)(a1 + 40)
                                                                                              + 8LL)
                                                                                  + 24LL));
        NSUInteger v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
      }

      [v4 addIndex:a2];
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= 1LL << a2;
    }

    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 56));
  }

- (void)enumerateRangesUsingBlock:(void *)block
{
}

- (void)enumerateRangesWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSEnumerationOptions v6 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v6 = opts;
  }
  uint64_t v7 = v6 | 0x4000000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)block,  v6 | 0x4000000000000000LL,  0LL,  0x7FFFFFFFFFFFFFFFLL);
  __NSIndexSetEnumerate((uint64_t)self, v7, 0LL, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)block);
}

- (void)enumerateRangesInRange:(NSRange)range options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)block,  v9 | 0x4000000000000000LL,  range.location,  range.length);
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)block);
}

- (unint64_t)_indexAtIndex:(unint64_t)a3
{
  unint64_t result = -[NSIndexSet firstIndex](self, "firstIndex");
  while (a3)
  {
    --a3;
    unint64_t result = -[NSIndexSet indexGreaterThanIndex:](self, "indexGreaterThanIndex:", result);
  }

  return result;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSIndexSet;
    return -[NSIndexSet replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return self;
}

@end