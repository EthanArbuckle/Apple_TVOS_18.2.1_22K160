@interface NSMutableIndexSet
- (Class)classForCoder;
- (void)_addRangeToArray:(_NSRange)a3;
- (void)_convertToUsingRanges;
- (void)_ensureRangeCapacity:(unint64_t)a3;
- (void)_incrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4;
- (void)_insertRange:(_NSRange)a3 inArrayAtIndex:(unint64_t)a4;
- (void)_mergeOverlappingRangesStartingAtIndex:(unint64_t)a3;
- (void)_removeAndDecrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4;
- (void)_removeRangeInArrayAtIndex:(unint64_t)a3;
- (void)_replaceRangeInArrayAtIndex:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)addIndex:(NSUInteger)value;
- (void)addIndexes:(NSIndexSet *)indexSet;
- (void)addIndexes:(const unint64_t *)a3 count:(unint64_t)a4;
- (void)addIndexesInRange:(NSRange)range;
- (void)addIndexesWithBitfield:(unint64_t)a3;
- (void)removeAllIndexes;
- (void)removeIndex:(NSUInteger)value;
- (void)removeIndexes:(NSIndexSet *)indexSet;
- (void)removeIndexesInRange:(NSRange)range;
- (void)removeIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeIndexesPassingTest:(id)a3;
- (void)removeIndexesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)shiftIndexesStartingAtIndex:(NSUInteger)index by:(NSInteger)delta;
@end

@implementation NSMutableIndexSet

- (void)removeIndex:(NSUInteger)value
{
  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F) {
      self->super._internal._singleRange._range.location &= ~(1LL << value);
    }
  }

  else
  {
    -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", value, 1LL);
  }

- (void)addIndex:(NSUInteger)value
{
  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    if (value <= 0x3F)
    {
      self->super._internal._singleRange._range.location |= 1LL << value;
      return;
    }

    -[NSMutableIndexSet _convertToUsingRanges](self, "_convertToUsingRanges");
  }

  -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", value, 1LL);
}

- (void)_convertToUsingRanges
{
  p_internal = &self->super._internal;
  NSUInteger location = self->super._internal._singleRange._range.location;
  if (location)
  {
    NSUInteger v5 = ~location;
    uint64_t v6 = 1LL;
    unint64_t v7 = self->super._internal._singleRange._range.location;
    while (1)
    {
      unint64_t v8 = (-1LL << __clz(__rbit64(v7))) & v5;
      if (!v8) {
        break;
      }
      ++v6;
      unint64_t v7 = (-1LL << __clz(__rbit64(v8))) & location;
      if (!v7)
      {
        --v6;
        break;
      }
    }

    self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.length = 0LL;
    if (v6)
    {
      if (v6 == 1)
      {
        NSUInteger v9 = __clz(__rbit64(location));
        self->super._internal._singleRange._range.NSUInteger location = v9;
        self->super._internal._singleRange._range.length = __clz(__rbit64((-1LL << v9) & v5)) - v9;
      }

      else
      {
        -[NSMutableIndexSet _ensureRangeCapacity:](self, "_ensureRangeCapacity:", v6 + 1);
        uint64_t v10 = 0LL;
        unint64_t v11 = 0LL;
        *(void *)(self->super._internal._singleRange._range.location + 24) = 0LL;
LABEL_11:
        if (v11) {
          uint64_t v12 = v10;
        }
        else {
          uint64_t v12 = 0LL;
        }
        uint64_t v13 = v12 - 1;
        do
        {
          unint64_t v14 = (-1LL << v11) & location;
          if (!v14) {
            break;
          }
          unint64_t v15 = __clz(__rbit64(v14));
          unint64_t v16 = (-1LL << v15) & v5;
          unint64_t v11 = __clz(__rbit64(v16));
          if (v10 == ++v13)
          {
            uint64_t v17 = (uint64_t)p_internal;
            if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0) {
              uint64_t v17 = p_internal->_singleRange._range.location
            }
            v18 = (unint64_t *)(v17 + 16 * v10++);
            unint64_t *v18 = v15;
            v18[1] = v11 - v15;
            *(void *)(p_internal->_singleRange._range.location + 16) += v11 - v15;
            if (v11 < 0x40) {
              goto LABEL_11;
            }
            break;
          }
        }

        while (v16 && v11 <= 0x3F);
        *(void *)(p_internal->_singleRange._range.location + 8) = v6;
      }
    }
  }

  else
  {
    self->super._indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&self->super._indexSetFlags & 0xFFFFFFFC | 1);
    self->super._internal._singleRange._range.length = 0LL;
  }

- (void)addIndexesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = range.location + range.length;
  if (range.length && (v6 & 0x8000000000000000LL) != 0)
  {
    v30 = _NSMethodExceptionProem((objc_class *)self, a2);
    v35.NSUInteger location = location;
    v35.NSUInteger length = length;
    v31 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v30, NSStringFromRange(v35)), 0 reason userInfo];
    objc_exception_throw(v31);
    -[NSIndexSet _indexOfRangeBeforeOrContainingIndex:](v32, v33, v34);
    return;
  }

  if (range.length)
  {
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      if (v6 <= 0x40)
      {
        self->super._internal._singleRange._range.location |= 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(range.length) << SLOBYTE(range.location);
        return;
      }

      -[NSMutableIndexSet _convertToUsingRanges](self, "_convertToUsingRanges");
    }

    unint64_t v7 = -[NSIndexSet _indexOfRangeBeforeOrContainingIndex:](self, "_indexOfRangeBeforeOrContainingIndex:", location);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0LL;
    }
    else {
      unint64_t v8 = v7;
    }
    p_internal = &self->super._internal;
    p_NSUInteger length = &self->super._internal._singleRange._range.length;
    unint64_t v11 = (uint64_t *)MEMORY[0x189616658];
    uint64_t v12 = *MEMORY[0x189616658];
    unint64_t v13 = v12 ^ (unint64_t)self;
    uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v13 & 7) == 0) {
      uint64_t v14 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t v15 = v14 & (v13 >> 3);
    for (uint64_t i = v8; ; ++i)
    {
      unint64_t v17 = v15;
      if (((unint64_t)self & 0x8000000000000000LL) == 0)
      {
        $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
        v19 = &self->super._internal;
        if ((*(_BYTE *)&indexSetFlags & 2) == 0)
        {
          v19 = ($BA656A43A73A71AF6C4B982E4240B787 *)(&self->super._internal._singleBitfield + 1);
          if ((*(_BYTE *)&indexSetFlags & 1) == 0) {
            v19 = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location + 8);
          }
        }

        unint64_t v17 = v19->_singleRange._range.location;
      }

      if (v17)
      {
        if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0) {
          unint64_t v17 = 1LL;
        }
        else {
          unint64_t v17 = *(void *)(p_internal->_singleRange._range.location + 8);
        }
      }

      if (v8 >= v17) {
        break;
      }
      v20 = &self->super._internal;
      if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0) {
        v20 = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
      }
      v21 = &v20[i];
      NSUInteger v22 = v21->_singleRange._range.location;
      NSUInteger v23 = v6 - v21->_singleRange._range.location;
      if (v6 < v21->_singleRange._range.location)
      {
        -[NSMutableIndexSet _insertRange:inArrayAtIndex:](self, "_insertRange:inArrayAtIndex:", location, length, v8);
        return;
      }

      NSUInteger v24 = v21->_singleRange._range.length + v22;
      if (location < v22)
      {
        NSUInteger v22 = location;
        if (v6 <= v24) {
          NSUInteger v23 = v24 - location;
        }
        else {
          NSUInteger v23 = length;
        }
        if (v6 <= v24) {
          NSUInteger length = v24 - location;
        }
LABEL_40:
        -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:]( self,  "_replaceRangeInArrayAtIndex:withRange:",  v8,  v22,  v23);
        break;
      }

      if (v6 <= v24) {
        return;
      }
      if (v24 >= location) {
        goto LABEL_40;
      }
      ++v8;
    }

    if (((unint64_t)self & 0x8000000000000000LL) != 0)
    {
      uint64_t v25 = *v11;
      unint64_t v26 = v25 ^ (unint64_t)self;
      uint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v26 & 7) == 0) {
        uint64_t v27 = 0xFFFFFFFFFFFFFLL;
      }
      uint64_t v28 = v27 & (v26 >> 3);
      if (!v28) {
        goto LABEL_58;
      }
    }

    else
    {
      $A8859644891BA8F5A580113D622AC538 v29 = self->super._indexSetFlags;
      if ((*(_BYTE *)&v29 & 2) != 0)
      {
        uint64_t v28 = p_internal->_singleRange._range.location;
      }

      else if ((*(_BYTE *)&v29 & 1) != 0)
      {
        uint64_t v28 = *p_length;
        if (!*p_length) {
          goto LABEL_58;
        }
      }

      else
      {
        uint64_t v28 = *(void *)(p_internal->_singleRange._range.location + 8);
        if (!v28) {
          goto LABEL_58;
        }
      }
    }

    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0) {
      uint64_t v28 = 1LL;
    }
    else {
      uint64_t v28 = *(void *)(p_internal->_singleRange._range.location + 8);
    }
LABEL_58:
    if (v28 == v8) {
      -[NSMutableIndexSet _addRangeToArray:](self, "_addRangeToArray:", location, length);
    }
    -[NSMutableIndexSet _mergeOverlappingRangesStartingAtIndex:](self, "_mergeOverlappingRangesStartingAtIndex:", v8);
  }

- (void)_addRangeToArray:(_NSRange)a3
{
}

- (void)_insertRange:(_NSRange)a3 inArrayAtIndex:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      NSUInteger v11 = self->super._internal._singleRange._range.location;
      if (!v11) {
        goto LABEL_18;
      }
    }

    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      NSUInteger v11 = self->super._internal._singleRange._range.length;
      if (!v11) {
        goto LABEL_18;
      }
    }

    else
    {
      NSUInteger v11 = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!v11) {
        goto LABEL_18;
      }
    }

    goto LABEL_15;
  }

  uint64_t v8 = *MEMORY[0x189616658];
  unint64_t v9 = v8 ^ (unint64_t)self;
  uint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v9 & 7) == 0) {
    uint64_t v10 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger v11 = v10 & (v9 >> 3);
  if (v11)
  {
LABEL_15:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0) {
      NSUInteger v11 = 1LL;
    }
    else {
      NSUInteger v11 = *(void *)(self->super._internal._singleRange._range.location + 8);
    }
  }

- (Class)classForCoder
{
  return (Class)&OBJC_CLASS___NSMutableIndexSet;
}

- (void)_ensureRangeCapacity:(unint64_t)a3
{
  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 1) != 0) {
    unint64_t v5 = 1LL;
  }
  else {
    unint64_t v5 = *(void *)self->super._internal._singleRange._range.location;
  }
  if (v5 < a3)
  {
    if (a3 == 1)
    {
      self->super._$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags | 1);
    }

    else
    {
      unint64_t v6 = 2 * v5;
      if (v6 <= a3) {
        unint64_t v6 = a3;
      }
      if (a3 >= 4) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v7 = 4LL;
      }
      if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
        if (((unint64_t)self & 0x8000000000000000LL) != 0)
        {
          uint64_t v17 = *MEMORY[0x189616658];
          unint64_t v18 = v17 ^ (unint64_t)self;
          uint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
          if ((~(_BYTE)v18 & 7) == 0) {
            uint64_t v19 = 0xFFFFFFFFFFFFFLL;
          }
          Class v20 = (Class)(v19 & (v18 >> 3));
          NSUInteger location = (NSUInteger)v20;
        }

        else
        {
          uint64_t v22 = 2LL;
          if ((*(_BYTE *)&indexSetFlags & 2) == 0) {
            uint64_t v22 = 3LL;
          }
          Class v20 = (&self->super.super.isa)[v22];
          if ((*(_BYTE *)&indexSetFlags & 2) != 0) {
            NSUInteger location = self->super._internal._singleRange._range.location;
          }
          else {
            NSUInteger location = self->super._internal._singleRange._range.length;
          }
        }

        BOOL v23 = v20 != 0LL;
        if (location) {
          NSUInteger length = self->super._internal._singleRange._range.length;
        }
        else {
          NSUInteger length = 0LL;
        }
        $BA656A43A73A71AF6C4B982E4240B787 internal = self->super._internal;
        self->super._$A8859644891BA8F5A580113D622AC538 indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(*(_DWORD *)&indexSetFlags & 0xFFFFFFFE);
        unint64_t v25 = malloc(16 * v7 + 64);
        self->super._internal._singleRange._range.NSUInteger location = (NSUInteger)v25;
        atomic_store(0LL, v25 + 7);
        *unint64_t v25 = v7;
        v25[1] = v23;
        unint64_t v26 = (v7 - v23) >> 1;
        if (v7 < 5) {
          unint64_t v26 = 0LL;
        }
        v25[2] = length;
        v25[3] = v26;
        *($BA656A43A73A71AF6C4B982E4240B787 *)&v25[2 * v26 + 8] = internal;
      }

      else
      {
        uint64_t v8 = *(void *)(self->super._internal._singleRange._range.location + 24);
        unint64_t v9 = (void *)__CFSafelyReallocate();
        self->super._internal._singleRange._range.NSUInteger location = (NSUInteger)v9;
        *unint64_t v9 = v7;
        NSUInteger v10 = self->super._internal._singleRange._range.location;
        unint64_t v11 = *(void *)(v10 + 8);
        BOOL v13 = v7 >= v11;
        unint64_t v12 = v7 - v11;
        BOOL v13 = v13 && v7 >= 5;
        unint64_t v14 = v12 >> 1;
        if (!v13) {
          unint64_t v14 = 0LL;
        }
        *(void *)(v10 + 24) = v14;
        NSUInteger v15 = self->super._internal._singleRange._range.location;
        uint64_t v16 = *(void *)(v15 + 24);
        if (v8 != v16) {
          memmove((void *)(v15 + 64 + 16 * v16), (const void *)(v15 + 64 + 16 * v8), 16LL * *(void *)(v15 + 8));
        }
      }
    }
  }

- (void)_removeRangeInArrayAtIndex:(unint64_t)a3
{
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.location;
      if (!location) {
        goto LABEL_18;
      }
    }

    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.length;
      if (!location) {
        goto LABEL_18;
      }
    }

    else
    {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!location) {
        goto LABEL_18;
      }
    }

    goto LABEL_15;
  }

  uint64_t v4 = *MEMORY[0x189616658];
  unint64_t v5 = v4 ^ (unint64_t)self;
  uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  if ((~(_BYTE)v5 & 7) == 0) {
    uint64_t v6 = 0xFFFFFFFFFFFFFLL;
  }
  NSUInteger location = v6 & (v5 >> 3);
  if (location)
  {
LABEL_15:
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0) {
      NSUInteger location = 1LL;
    }
    else {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
    }
  }

- (void)_replaceRangeInArrayAtIndex:(unint64_t)a3 withRange:(_NSRange)a4
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = *MEMORY[0x189616658];
    unint64_t v5 = v4 ^ (unint64_t)self;
    uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0) {
      uint64_t v6 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger location = v6 & (v5 >> 3);
    if (!location)
    {
LABEL_17:
      if (a4.length) {
        goto LABEL_18;
      }
LABEL_25:
      -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", a3, a4.location);
      return;
    }
  }

  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.location;
      if (!location) {
        goto LABEL_17;
      }
    }

    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
      NSUInteger location = self->super._internal._singleRange._range.length;
      if (!location) {
        goto LABEL_17;
      }
    }

    else
    {
      NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
      if (!location) {
        goto LABEL_17;
      }
    }
  }

  if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
  {
    NSUInteger location = *(void *)(self->super._internal._singleRange._range.location + 8);
    goto LABEL_17;
  }

  NSUInteger location = 1LL;
  if (!a4.length) {
    goto LABEL_25;
  }
LABEL_18:
  if (location < a3)
  {
    unint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Index %ld out of range bounds [0...%ld]",  a4.location,  a3,  location);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v13 userInfo:0]);
    -[NSMutableIndexSet addIndexes:](v14, v15, v16);
  }

  else
  {
    p_$BA656A43A73A71AF6C4B982E4240B787 internal = &self->super._internal;
    uint64_t v10 = &self->super._internal;
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0) {
      uint64_t v10 = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
    }
    p_range = &v10[a3]._singleRange._range;
    NSUInteger length = p_range->length;
    _NSRange *p_range = a4;
    if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0)
    {
      atomic_store(0LL, (unint64_t *)(p_internal->_singleRange._range.location + 56));
      *(void *)(p_internal->_singleRange._range.location + 16) -= length;
      *(void *)(p_internal->_singleRange._range.location + 16) += a4.length;
    }
  }

- (void)addIndexes:(NSIndexSet *)indexSet
{
  v22[5] = *MEMORY[0x1895F89C0];
  if (!indexSet || indexSet == (NSIndexSet *)self) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v5 = *MEMORY[0x189616658];
    unint64_t v6 = v5 ^ (unint64_t)self;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    if ((v7 & (v6 >> 3)) == 0) {
      goto LABEL_31;
    }
    goto LABEL_15;
  }

  $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
  if ((*(_BYTE *)&indexSetFlags & 2) != 0)
  {
LABEL_31:
    -[NSMutableIndexSet removeAllIndexes](self, "removeAllIndexes");
    -[NSIndexSet _setContentToContentFromIndexSet:](self, "_setContentToContentFromIndexSet:", indexSet);
    return;
  }

  if ((*(_BYTE *)&indexSetFlags & 1) != 0)
  {
    goto LABEL_31;
  }

uint64_t __32__NSMutableIndexSet_addIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
}

- (void)addIndexes:(const unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      uint64_t v12 = 0LL;
      unint64_t v13 = a4;
      do
      {
        unint64_t v14 = a3[v13 - 1];
        if (v14 > 0x3F)
        {
          if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_3;
          }
        }

        else
        {
          v12 |= 1LL << v14;
        }

        --v13;
      }

      while (v13);
      self->super._internal._singleRange._range.location |= v12;
    }

    else
    {
LABEL_3:
      id v5 = _NSGroupIndexesIntoSimpleRanges((uint64_t *)a3, a4);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v17;
        do
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v17 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) rangeValue];
            -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v10, v11);
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
        }

        while (v7);
      }
    }
  }

- (void)addIndexesWithBitfield:(unint64_t)a3
{
  if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
  {
    self->super._internal._singleRange._range.location |= a3;
  }

  else
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
LABEL_3:
    if (v6) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0LL;
    }
    uint64_t v8 = v7 - 1;
    while (((-1LL << v6) & a3) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1LL << v6) & a3));
      unint64_t v10 = (-1LL << v9) & ~a3;
      unint64_t v6 = __clz(__rbit64(v10));
      if (v5 == ++v8)
      {
        ++v5;
        -[NSMutableIndexSet addIndexesInRange:](self, "addIndexesInRange:", v9, v6 - v9);
        if (v6 < 0x40) {
          goto LABEL_3;
        }
        return;
      }

      if (!v10 || v6 > 0x3F) {
        return;
      }
    }
  }

- (void)removeIndexes:(NSIndexSet *)indexSet
{
  v23[5] = *MEMORY[0x1895F89C0];
  if (!indexSet) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v5 = *MEMORY[0x189616658];
    unint64_t v6 = v5 ^ (unint64_t)self;
    uint64_t v7 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v6 & 7) == 0) {
      uint64_t v7 = 0xFFFFFFFFFFFFFLL;
    }
    if ((v7 & (v6 >> 3)) == 0) {
      return;
    }
  }

  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
    }

    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
    }

    else if (!*(void *)(self->super._internal._singleRange._range.location + 8))
    {
      return;
    }
  }

  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0
    || *(void *)(self->super._internal._singleRange._range.location + 8))
  {
    if (indexSet == (NSIndexSet *)self)
    {
      -[NSIndexSet removeAllIndexes](indexSet, "removeAllIndexes");
      return;
    }

    unint64_t v9 = (__objc2_class *)objc_opt_class();
    if (&OBJC_CLASS___NSIndexSet == v9
      || &OBJC_CLASS____NSConstantIndexSet == v9
      || &OBJC_CLASS___NSMutableIndexSet == v9)
    {
      if (((unint64_t)indexSet & 0x8000000000000000LL) != 0)
      {
        uint64_t v12 = *MEMORY[0x189616658];
        unint64_t v13 = v12 ^ (unint64_t)indexSet;
        uint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        if ((~(_BYTE)v13 & 7) == 0) {
          uint64_t v14 = 0xFFFFFFFFFFFFFLL;
        }
        NSUInteger location = v14 & (v13 >> 3);
      }

      else
      {
        if ((*(_BYTE *)&indexSet->_indexSetFlags & 2) == 0)
        {
          v23[0] = MEMORY[0x1895F87A8];
          v23[1] = 3221225472LL;
          v23[2] = __35__NSMutableIndexSet_removeIndexes___block_invoke;
          v23[3] = &unk_189C9DAC0;
          v23[4] = self;
          -[NSIndexSet enumerateRangesUsingBlock:](indexSet, "enumerateRangesUsingBlock:", v23);
          return;
        }

        NSUInteger location = indexSet->_internal._singleRange._range.location;
      }

      NSUInteger v16 = ~location;
      if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
      {
        self->super._internal._singleRange._range.location &= v16;
      }

      else
      {
        uint64_t v17 = 0LL;
        unint64_t v18 = 0LL;
LABEL_38:
        if (v18) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = 0LL;
        }
        uint64_t v20 = v19 - 1;
        while (((-1LL << v18) & location) != 0)
        {
          unint64_t v21 = __clz(__rbit64((-1LL << v18) & location));
          unint64_t v22 = (-1LL << v21) & v16;
          unint64_t v18 = __clz(__rbit64(v22));
          if (v17 == ++v20)
          {
            ++v17;
            -[NSMutableIndexSet removeIndexesInRange:](self, "removeIndexesInRange:", v21, v18 - v21);
            if (v18 <= 0x3F) {
              goto LABEL_38;
            }
            return;
          }

          if (!v22 || v18 > 0x3F) {
            return;
          }
        }
      }
    }

    else
    {
      NSUInteger v10 = -[NSIndexSet firstIndex](indexSet, "firstIndex");
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        for (NSUInteger i = v10;
              i != 0x7FFFFFFFFFFFFFFFLL;
              NSUInteger i = -[NSIndexSet indexGreaterThanIndex:](indexSet, "indexGreaterThanIndex:", i))
        {
          -[NSMutableIndexSet removeIndex:](self, "removeIndex:", i);
        }
      }
    }
  }

uint64_t __35__NSMutableIndexSet_removeIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
}

- (void)removeIndexesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ((a3 & 2) != 0) {
    unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v6 = a3;
  }
  __NSIndexSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v6, 0LL, 0x7FFFFFFFFFFFFFFELL);
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  int v9 = 0;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke;
  v8[3] = &unk_189C9DAE8;
  v8[5] = a4;
  v8[6] = &v9;
  v8[4] = v7;
  __NSIndexSetEnumerate((uint64_t)self, v6, 0LL, 0x7FFFFFFFFFFFFFFELL, (uint64_t)v8);
  -[NSMutableIndexSet removeIndexes:](self, "removeIndexes:", v7);
}

void __58__NSMutableIndexSet_removeIndexesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    [*(id *)(a1 + 32) addIndex:a2];
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 48));
  }

- (void)removeIndexesInRange:(_NSRange)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v9 = a4 & 0xF7FFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v9 = a4;
  }
  uint64_t v10 = v9 | 0x800000000000000LL;
  __NSIndexSetParameterCheckIterate( (objc_class *)self,  a2,  (uint64_t)a5,  v9 | 0x800000000000000LL,  a3.location,  a3.length);
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  int v13 = 0;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke;
  v12[3] = &unk_189C9DAE8;
  v12[5] = a5;
  v12[6] = &v13;
  v12[4] = v11;
  __NSIndexSetEnumerate((uint64_t)self, v10, location, length, (uint64_t)v12);
  -[NSMutableIndexSet removeIndexes:](self, "removeIndexes:", v11);
}

void __62__NSMutableIndexSet_removeIndexesInRange_options_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 48));
    [*(id *)(a1 + 32) addIndex:a2];
    os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 48));
  }

- (void)removeIndexesPassingTest:(id)a3
{
}

- (void)_mergeOverlappingRangesStartingAtIndex:(unint64_t)a3
{
  p_$BA656A43A73A71AF6C4B982E4240B787 internal = &self->super._internal;
  unint64_t v6 = (unint64_t)self & 0xC000000000000007LL;
  uint64_t v7 = (uint64_t *)MEMORY[0x189616658];
LABEL_2:
  if (((unint64_t)self & 0x8000000000000000LL) == 0)
  {
    while (1)
    {
      $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
      if ((*(_BYTE *)&indexSetFlags & 2) != 0)
      {
      }

      else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
      }

      else if (!*(void *)(p_internal->_singleRange._range.location + 8))
      {
        return;
      }

- (void)removeIndexesInRange:(NSRange)range
{
  if (range.length)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    if ((*(_BYTE *)&self->super._indexSetFlags & 2) != 0)
    {
      if (range.location <= 0x3F)
      {
        NSUInteger v7 = range.location + range.length;
        if (range.location + range.length >= 0x40) {
          NSUInteger v7 = 64LL;
        }
        if (v7 == range.location) {
          unint64_t v8 = -1LL;
        }
        else {
          unint64_t v8 = ~(0xFFFFFFFFFFFFFFFFLL >> (LOBYTE(range.location) - v7) << SLOBYTE(range.location));
        }
        self->super._internal._singleRange._range.location &= v8;
      }
    }

    else
    {
      if (!range.location)
      {
        unint64_t v6 = 0LL;
LABEL_15:
        NSUInteger v9 = location + length;
        p_$BA656A43A73A71AF6C4B982E4240B787 internal = &self->super._internal;
        while (1)
        {
          if (((unint64_t)self & 0x8000000000000000LL) != 0)
          {
            uint64_t v11 = *MEMORY[0x189616658];
            unint64_t v12 = v11 ^ (unint64_t)self;
            if ((~(_BYTE)v12 & 7) != 0) {
              uint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v13 = 0xFFFFFFFFFFFFFLL;
            }
            NSUInteger v14 = v13 & (v12 >> 3);
            if (!v14) {
              goto LABEL_34;
            }
          }

          else
          {
            $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
            if ((*(_BYTE *)&indexSetFlags & 2) != 0)
            {
              NSUInteger v14 = p_internal->_singleRange._range.location;
            }

            else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
            {
              NSUInteger v14 = self->super._internal._singleRange._range.length;
              if (!v14) {
                goto LABEL_34;
              }
            }

            else
            {
              NSUInteger v14 = *(void *)(p_internal->_singleRange._range.location + 8);
              if (!v14) {
                goto LABEL_34;
              }
            }
          }

          if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0) {
            NSUInteger v14 = 1LL;
          }
          else {
            NSUInteger v14 = *(void *)(p_internal->_singleRange._range.location + 8);
          }
LABEL_34:
          if (v6 >= v14) {
            return;
          }
          NSUInteger v16 = &self->super._internal;
          if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0) {
            NSUInteger v16 = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
          }
                                                      + 16LL
          unint64_t v17 = &v16[v6];
          NSUInteger v18 = v17->_singleRange._range.location;
          if (v9 < v17->_singleRange._range.location) {
            return;
          }
          NSUInteger v19 = v17->_singleRange._range.length + v18;
          if (location > v18)
          {
            if (v19 > v9)
            {
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:]( self,  "_replaceRangeInArrayAtIndex:withRange:",  v6,  v9,  v19 - v9);
              -[NSMutableIndexSet _insertRange:inArrayAtIndex:]( self,  "_insertRange:inArrayAtIndex:",  v18,  location - v18,  v6);
              return;
            }

            if (location < v19) {
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:]( self,  "_replaceRangeInArrayAtIndex:withRange:",  v6,  v18,  location - v18);
            }
            ++v6;
          }

          else
          {
            if (v19 > v9)
            {
              -[NSMutableIndexSet _replaceRangeInArrayAtIndex:withRange:]( self,  "_replaceRangeInArrayAtIndex:withRange:",  v6,  v9,  v19 - v9);
              return;
            }

            -[NSMutableIndexSet _removeRangeInArrayAtIndex:](self, "_removeRangeInArrayAtIndex:", v6);
          }
        }
      }

      unint64_t v6 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:]( self,  "_indexOfRangeAfterOrContainingIndex:",  range.location);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_15;
      }
    }
  }

- (void)removeAllIndexes
{
  int indexSetFlags = (int)self->super._indexSetFlags;
  if ((indexSetFlags & 1) == 0)
  {
    free(self->super._internal._multipleRanges._data);
    int indexSetFlags = *(_DWORD *)&self->super._indexSetFlags | 1;
  }

  self->super._int indexSetFlags = ($A8859644891BA8F5A580113D622AC538)(indexSetFlags | 2);
  self->super._internal._singleRange._range.NSUInteger location = 0LL;
}

- (void)_incrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  if (!a3) {
    return;
  }
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v7 = *MEMORY[0x189616658];
    unint64_t v8 = v7 ^ (unint64_t)self;
    uint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v8 & 7) == 0) {
      uint64_t v9 = 0xFFFFFFFFFFFFFLL;
    }
    if ((v9 & (v8 >> 3)) == 0) {
      goto LABEL_23;
    }
  }

  else
  {
    $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
    if ((*(_BYTE *)&indexSetFlags & 2) != 0)
    {
    }

    else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
    {
    }

    else if (!*(void *)(self->super._internal._singleRange._range.location + 8))
    {
      goto LABEL_23;
    }
  }

  if ((*(_BYTE *)&self->super._indexSetFlags & 1) != 0)
  {
    if (a4 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v14 = 0LL;
      p_$BA656A43A73A71AF6C4B982E4240B787 internal = &self->super._internal;
LABEL_22:
      if (a3 + p_internal[v14]._singleRange._range.location + p_internal[v14]._singleRange._range.length - 1 >= 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v28 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Incrementing by %ld would push last index beyond maximum index value of NSNotFound - 1", _NSMethodExceptionProem((objc_class *)self, a2), a3), 0 reason userInfo];
        objc_exception_throw(v28);
        -[NSMutableIndexSet _removeAndDecrementBy:startingAtIndex:](v29, v30, v31, v32);
        return;
      }
    }
  }

  else if (a4 <= 0x7FFFFFFFFFFFFFFELL)
  {
    NSUInteger location = self->super._internal._singleRange._range.location;
    uint64_t v12 = *(void *)(location + 8);
    if (v12)
    {
      p_$BA656A43A73A71AF6C4B982E4240B787 internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(location + 16LL * *(void *)(location + 24) + 64);
      uint64_t v14 = v12 - 1;
      goto LABEL_22;
    }
  }

- (void)_removeAndDecrementBy:(unint64_t)a3 startingAtIndex:(unint64_t)a4
{
  if (a3)
  {
    unint64_t v7 = -[NSIndexSet _indexOfRangeAfterOrContainingIndex:](self, "_indexOfRangeAfterOrContainingIndex:", a4);
    NSUInteger v8 = v7;
    unint64_t v9 = v7;
    if (v7)
    {
      if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
        return;
      }
      p_$BA656A43A73A71AF6C4B982E4240B787 internal = &self->super._internal;
      if ((*(_BYTE *)&self->super._indexSetFlags & 1) == 0) {
        p_$BA656A43A73A71AF6C4B982E4240B787 internal = ($BA656A43A73A71AF6C4B982E4240B787 *)(p_internal->_singleRange._range.location
      }
                                                         + 16LL
      p_NSUInteger location = &p_internal[v7]._singleRange._range.location;
      unint64_t v13 = *p_location;
      unint64_t v12 = p_location[1];
      BOOL v15 = a4 >= v13;
      unint64_t v14 = a4 - v13;
      BOOL v15 = !v15 || v14 >= v12;
      uint64_t v16 = v15;
      unint64_t v9 = v7 - v16;
    }

    unint64_t v34 = v9;
    unint64_t v17 = a3 + a4 - 1;
    NSUInteger v18 = &self->super._internal;
    NSUInteger v19 = (uint64_t *)MEMORY[0x189616658];
    while (((unint64_t)self & 0x8000000000000000LL) == 0)
    {
      $A8859644891BA8F5A580113D622AC538 indexSetFlags = self->super._indexSetFlags;
      if ((*(_BYTE *)&indexSetFlags & 2) != 0)
      {
        NSUInteger location = v18->_singleRange._range.location;
        if (v18->_singleRange._range.location) {
          goto LABEL_30;
        }
      }

      else if ((*(_BYTE *)&indexSetFlags & 1) != 0)
      {
        NSUInteger location = self->super._internal._singleRange._range.length;
        if (location) {
          goto LABEL_30;
        }
      }

      else
      {
        NSUInteger location = *(void *)(v18->_singleRange._range.location + 8);
        if (location) {
          goto LABEL_30;
        }
      }

- (void)shiftIndexesStartingAtIndex:(NSUInteger)index by:(NSInteger)delta
{
  if (delta && -[NSIndexSet count](self, "count"))
  {
    if (delta < 1) {
      -[NSMutableIndexSet _removeAndDecrementBy:startingAtIndex:](self, "_removeAndDecrementBy:startingAtIndex:");
    }
    else {
      -[NSMutableIndexSet _incrementBy:startingAtIndex:](self, "_incrementBy:startingAtIndex:", delta, index);
    }
  }

@end