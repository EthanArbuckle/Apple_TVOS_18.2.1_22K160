@interface _NSPlaceholderIndexSet
- (_NSPlaceholderIndexSet)init;
- (_NSPlaceholderIndexSet)initWithBitfield:(unint64_t)a3;
- (_NSPlaceholderIndexSet)initWithCoder:(id)a3;
- (_NSPlaceholderIndexSet)initWithIndex:(unint64_t)a3;
- (_NSPlaceholderIndexSet)initWithIndexSet:(id)a3;
- (_NSPlaceholderIndexSet)initWithIndexesInRange:(_NSRange)a3;
- (unint64_t)retainCount;
@end

@implementation _NSPlaceholderIndexSet

- (unint64_t)retainCount
{
  return -1LL;
}

- (_NSPlaceholderIndexSet)init
{
  if (_NSTaggedIndexSetAllowed != 1) {
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:", 0LL, 0LL);
  }
  result = (_NSPlaceholderIndexSet *)0x8580000000000007LL;
  unint64_t v3 = *MEMORY[0x189616658] ^ 0x8580000000000007LL;
  if ((~v3 & 0xC000000000000007LL) != 0) {
    return (_NSPlaceholderIndexSet *)(v3 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v3 & 7)));
  }
  return result;
}

- (_NSPlaceholderIndexSet)initWithIndex:(unint64_t)a3
{
  if (a3 > 0x3F) {
    return -[_NSPlaceholderIndexSet initWithIndexesInRange:](self, "initWithIndexesInRange:");
  }
  else {
    return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", 1LL << a3);
  }
}

- (_NSPlaceholderIndexSet)initWithIndexesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = a3.location + a3.length;
  if (a3.length && (v5 & 0x8000000000000000LL) != 0)
  {
    v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13.NSUInteger location = location;
    v13.NSUInteger length = length;
    v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Range %@ exceeds maximum index value of NSNotFound - 1", v8, NSStringFromRange(v13)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[_NSPlaceholderIndexSet initWithBitfield:](v10, v11, v12);
  }

  else if (a3.length && (a3.location > 0x3F || v5 > 0x40 || v5 < a3.location))
  {
    objc_opt_self();
    if (length == 1 && location < 0xA) {
      return (_NSPlaceholderIndexSet *)(&_NSConstantIndexSets + 4 * location);
    }
    else {
      return (_NSPlaceholderIndexSet *)objc_msgSend( +[NSIndexSet _alloc](NSIndexSet, "_alloc"),  "initWithIndexesInRange:",  location,  length);
    }
  }

  else
  {
    if (a3.length) {
      unint64_t v6 = 0xFFFFFFFFFFFFFFFFLL >> -LOBYTE(a3.length) << SLOBYTE(a3.location);
    }
    else {
      unint64_t v6 = 0LL;
    }
    return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", v6);
  }

- (_NSPlaceholderIndexSet)initWithBitfield:(unint64_t)a3
{
  if (_NSTaggedIndexSetAllowed != 1 || a3 && (__clz(a3) ^ 0x3C) > 0x33) {
    return (_NSPlaceholderIndexSet *)objc_msgSend( +[NSIndexSet _alloc](NSIndexSet, "_alloc"),  "initWithBitfield:",  a3);
  }
  result = (_NSPlaceholderIndexSet *)((8 * (a3 & 0xFFFFFFFFFFFFFLL)) | 0x8580000000000007LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (_NSPlaceholderIndexSet *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (_NSPlaceholderIndexSet)initWithIndexSet:(id)a3
{
  unint64_t v3 = (_NSPlaceholderIndexSet *)a3;
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 count];
  if (_NSTaggedIndexSetAllowed == 1 && v5 == 0)
  {
    unint64_t v3 = (_NSPlaceholderIndexSet *)0x8580000000000007LL;
    unint64_t v9 = *MEMORY[0x189616658] ^ 0x8580000000000007LL;
    if ((~v9 & 0xC000000000000007LL) != 0) {
      return (_NSPlaceholderIndexSet *)(v9 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v9 & 7)));
    }
    return v3;
  }

  uint64_t v7 = v5;
  if (v5 == 1) {
    return -[_NSPlaceholderIndexSet initWithIndex:](self, "initWithIndex:", -[NSIndexSet firstIndex](v3, "firstIndex"));
  }
  v10 = (__objc2_class *)objc_opt_class();
  if ((&OBJC_CLASS___NSIndexSet == v10
     || &OBJC_CLASS____NSConstantIndexSet == v10
     || &OBJC_CLASS___NSMutableIndexSet == v10)
    && -[NSIndexSet getBitfield:](v3, "getBitfield:", v13))
  {
    return -[_NSPlaceholderIndexSet initWithBitfield:](self, "initWithBitfield:", v13[0]);
  }

  unint64_t v12 = (__objc2_class *)objc_opt_class();
  if (v12 == &OBJC_CLASS____NSConstantIndexSet || v7)
  {
    if (v3 && v12 == &OBJC_CLASS____NSConstantIndexSet) {
      return v3;
    }
    return (_NSPlaceholderIndexSet *)objc_msgSend( +[NSIndexSet _alloc](NSIndexSet, "_alloc"),  "initWithIndexSet:",  v3);
  }

  objc_opt_self();
  return (_NSPlaceholderIndexSet *)&_NSEmptyIndexSet_struct;
}

- (_NSPlaceholderIndexSet)initWithCoder:(id)a3
{
  return (_NSPlaceholderIndexSet *)objc_msgSend( +[NSIndexSet _alloc](NSIndexSet, "_alloc"),  "initWithCoder:",  a3);
}

@end