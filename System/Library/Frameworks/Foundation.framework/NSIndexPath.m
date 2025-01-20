@interface NSIndexPath
+ (BOOL)supportsSecureCoding;
+ (NSIndexPath)indexPathWithIndex:(NSUInteger)index;
+ (NSIndexPath)indexPathWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length;
+ (id)indexPath;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSComparisonResult)compare:(NSIndexPath *)otherObject;
- (NSIndexPath)indexPathByAddingIndex:(NSUInteger)index;
- (NSIndexPath)indexPathByRemovingLastIndex;
- (NSIndexPath)init;
- (NSIndexPath)initWithCoder:(id)a3;
- (NSIndexPath)initWithIndex:(NSUInteger)index;
- (NSIndexPath)initWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length;
- (NSUInteger)indexAtPosition:(NSUInteger)position;
- (NSUInteger)length;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getIndexes:(NSUInteger *)indexes;
- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange;
@end

@implementation NSIndexPath

+ (NSIndexPath)indexPathWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  if (&OBJC_CLASS___NSIndexPath != a1) {
    return (NSIndexPath *)(id)[objc_alloc((Class)a1) initWithIndexes:indexes length:length];
  }
  if ((_NSIndexSetTaggedPointersDisabled & 1) != 0) {
    return (NSIndexPath *)(id)[objc_alloc((Class)a1) initWithIndexes:indexes length:length];
  }
  uint64_t InlinePayload = _makeInlinePayload((unint64_t *)indexes, length);
  if (!InlinePayload) {
    return (NSIndexPath *)(id)[objc_alloc((Class)a1) initWithIndexes:indexes length:length];
  }
  result = (NSIndexPath *)((8 * InlinePayload) | 0x8000000000000004LL);
  unint64_t v9 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v9 & 0xC000000000000007LL) != 0) {
    return (NSIndexPath *)(v9 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v9 & 7)));
  }
  return result;
}

- (NSUInteger)indexAtPosition:(NSUInteger)position
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (position == 0x7FFFFFFFFFFFFFFFLL) {
    return v3;
  }
  if ((self & 0x8000000000000000LL) != 0)
  {
    uint64_t v4 = *MEMORY[0x189616658];
    if ((~self & 0xC000000000000007LL) == 0) {
      uint64_t v4 = 0LL;
    }
    NSUInteger v5 = v4 ^ self;
    uint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v5 & 7) == 0) {
      uint64_t v6 = 0xFFFFFFFFFFFFFLL;
    }
    NSUInteger v7 = v6 & (v5 >> 3);
  }

  else
  {
    NSUInteger v7 = *(void *)(self + 24);
    if ((v7 & 7) != 6)
    {
      if (*(void *)(self + 16) > position) {
        return *(void *)(*(void *)(self + 8) + 8 * position);
      }
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  if (((v7 >> 3) & 7) <= position) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (position < 4) {
    return (v7 >> (13 * position + 8)) & 0x1FFF;
  }
  __break(1u);
  return self;
}

- (NSUInteger)length
{
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v2 = *MEMORY[0x189616658];
    unint64_t v3 = v2 ^ (unint64_t)self;
    uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v3 & 7) == 0) {
      uint64_t v4 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t inlinePayload = v4 & (v3 >> 3);
    return (inlinePayload >> 3) & 7;
  }

  unint64_t inlinePayload = self->_inlinePayload;
  if ((inlinePayload & 7) == 6) {
    return (inlinePayload >> 3) & 7;
  }
  return self->_length;
}

- (unint64_t)hash
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v3 = *MEMORY[0x189616658];
    unint64_t v4 = v3 ^ (unint64_t)self;
    uint64_t v5 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v4 & 7) == 0) {
      uint64_t v5 = 0xFFFFFFFFFFFFFLL;
    }
    return v5 & (v4 >> 3);
  }

  else
  {
    unint64_t result = self->_inlinePayload;
    if ((result & 7) != 6)
    {
      NSUInteger v7 = -[NSIndexPath length](self, "length");
      if (v7 > 4
        || (uint64_t v8 = v7, Class = (__objc2_class *)object_getClass(self), Class == &OBJC_CLASS___NSIndexPath)
        || (MEMORY[0x1895F8858](Class),
            v11 = (void *)((char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)),
            -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v11, 0LL, v8),
            (unint64_t result = _makeInlinePayload(v11, v8)) == 0))
      {
        unint64_t result = -[NSIndexPath length](self, "length");
        if (result)
        {
          unint64_t v12 = result;
          unint64_t v13 = result + (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0LL) << 8);
          return v13 + (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v12 - 1) << 36);
        }
      }
    }
  }

  return result;
}

+ (void)initialize
{
  if (&OBJC_CLASS___NSIndexPath == a1)
  {
    else {
      _NSIndexSetTaggedPointersDisabled = 1;
    }
  }

+ (id)indexPath
{
  id result = (id)0x8000000000000034LL;
  unint64_t v3 = *MEMORY[0x189616658] ^ 0x8000000000000034LL;
  if ((~v3 & 0xC000000000000007LL) != 0) {
    return (id)(v3 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v3 & 7)));
  }
  return result;
}

+ (NSIndexPath)indexPathWithIndex:(NSUInteger)index
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = index;
  id result = (NSIndexPath *)((index << 11) | 0x8000000000000074LL);
  unint64_t v4 = *MEMORY[0x189616658] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007LL) != 0) {
    return (NSIndexPath *)(v4 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v4 & 7)));
  }
  return result;
}

- (NSIndexPath)init
{
  return -[NSIndexPath initWithIndexes:length:](self, "initWithIndexes:length:", 0LL, 0LL);
}

- (NSIndexPath)initWithIndex:(NSUInteger)index
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = index;
  return -[NSIndexPath initWithIndexes:length:](self, "initWithIndexes:length:", v4, 1LL);
}

- (NSIndexPath)initWithIndexes:(const NSUInteger *)indexes length:(NSUInteger)length
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NSIndexPath;
  uint64_t v6 = -[NSIndexPath init](&v14, sel_init);
  unint64_t v7 = (unint64_t)v6;
  if (length >> 30 || !v6)
  {

    return 0LL;
  }

  uint64_t InlinePayload = _makeInlinePayload((unint64_t *)indexes, length);
  if (!InlinePayload) {
    goto LABEL_9;
  }
  unint64_t v9 = InlinePayload;
  if ((__objc2_class *)objc_opt_class() != &OBJC_CLASS___NSIndexPath || (_NSIndexSetTaggedPointersDisabled & 1) != 0)
  {
    if ([(id)v7 isMemberOfClass:NSIndexPath])
    {
      *(void *)(v7 + 24) = v9;
      return (NSIndexPath *)v7;
    }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  indexes = self->_indexes;
  if (indexes)
  {
    self->_indexes = 0LL;
    free(indexes);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSIndexPath;
  -[NSIndexPath dealloc](&v4, sel_dealloc);
}

- (void)getIndexes:(NSUInteger *)indexes range:(NSRange)positionRange
{
  NSUInteger length = positionRange.length;
  NSUInteger location = positionRange.location;
  NSUInteger v9 = -[NSIndexPath length](self, "length");
  if (v9 < length || location > v9 - length)
  {
LABEL_21:
    NSUInteger v15 = v9;
    v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    v21.NSUInteger location = location;
    v21.NSUInteger length = length;
    v17 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: range %@ beyond bounds (%lu)", v16, NSStringFromRange(v21), v15), 0 reason userInfo];
    objc_exception_throw(v17);
    -[NSIndexPath getIndexes:](v18, v19, v20);
    return;
  }

  if (((unint64_t)self & 0x8000000000000000LL) != 0)
  {
    uint64_t v10 = *MEMORY[0x189616658];
    unint64_t v11 = v10 ^ (unint64_t)self;
    uint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    if ((~(_BYTE)v11 & 7) == 0) {
      uint64_t v12 = 0xFFFFFFFFFFFFFLL;
    }
    unint64_t inlinePayload = v12 & (v11 >> 3);
  }

  else
  {
    unint64_t inlinePayload = self->_inlinePayload;
    if ((inlinePayload & 7) != 6)
    {
      if (object_getClass(self) == (Class)&OBJC_CLASS___NSIndexPath)
      {
        memmove(indexes, &self->_indexes[location], 8 * length);
      }

      else
      {
        for (; length; --length)
          *indexes++ = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", location++);
      }

      return;
    }
  }

  if (length)
  {
    uint64_t v14 = 13 * location + 8;
    while (location < 4)
    {
      *indexes++ = (inlinePayload >> v14) & 0x1FFF;
      v14 += 13LL;
      ++location;
      if (!--length) {
        return;
      }
    }

    __break(1u);
    goto LABEL_21;
  }

- (void)getIndexes:(NSUInteger *)indexes
{
}

- (NSIndexPath)indexPathByRemovingLastIndex
{
  v17[1] = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSIndexPath length](self, "length");
  NSUInteger v4 = v3 - 1;
  if (v3 <= 1) {
    return +[NSIndexPath indexPathWithIndexes:length:]( &OBJC_CLASS___NSIndexPath,  "indexPathWithIndexes:length:",  0LL,  0LL);
  }
  if (v4 >> 61)
  {
    unint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    uint64_t v12 = (void *)MEMORY[0x189603F70];
    unint64_t v13 = (void *)MEMORY[0x189603A48];
    goto LABEL_12;
  }

  unint64_t v6 = v3;
  MEMORY[0x1895F8858](v3);
  uint64_t v8 = (char *)v17 - v7;
  if (v9 > 0x101)
  {
    uint64_t v8 = (char *)malloc(8 * v4);
    if (v8) {
      goto LABEL_7;
    }
    unint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** attempt to create an NSUInteger buffer of length (%lu) failed",  v4);
    uint64_t v12 = (void *)MEMORY[0x189603F70];
    unint64_t v13 = (void *)MEMORY[0x189603B38];
LABEL_12:
    objc_exception_throw((id)[v12 exceptionWithName:*v13 reason:v11 userInfo:0]);
    return -[NSIndexPath indexPathByAddingIndex:](v14, v15, v16);
  }

  bzero((char *)v17 - v7, 8 * v4);
LABEL_7:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v8, 0LL, v4);
  uint64_t v10 = +[NSIndexPath indexPathWithIndexes:length:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndexes:length:", v8, v4);
  if (v6 >= 0x102) {
    free(v8);
  }
  return v10;
}

- (NSIndexPath)indexPathByAddingIndex:(NSUInteger)index
{
  v19[1] = *MEMORY[0x1895F89C0];
  NSUInteger v5 = -[NSIndexPath length](self, "length");
  unint64_t v6 = v5 + 1;
  if ((v5 + 1) >> 61)
  {
    unint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    uint64_t v14 = (void *)MEMORY[0x189603F70];
    SEL v15 = (void *)MEMORY[0x189603A48];
    goto LABEL_13;
  }

  NSUInteger v7 = v5;
  if (v6 <= 1) {
    uint64_t v8 = 1LL;
  }
  else {
    uint64_t v8 = v5 + 1;
  }
  MEMORY[0x1895F8858](v5);
  uint64_t v10 = (char *)v19 - v9;
  if (v6 > 0x100)
  {
    uint64_t v10 = (char *)malloc(8 * v8);
    if (v10) {
      goto LABEL_8;
    }
    unint64_t v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** attempt to create an NSUInteger buffer of length (%lu) failed",  v8);
    uint64_t v14 = (void *)MEMORY[0x189603F70];
    SEL v15 = (void *)MEMORY[0x189603B38];
LABEL_13:
    objc_exception_throw((id)[v14 exceptionWithName:*v15 reason:v13 userInfo:0]);
    return (NSIndexPath *)-[NSIndexPath compare:](v16, v17, v18);
  }

  bzero((char *)v19 - v9, 8 * v8);
LABEL_8:
  -[NSIndexPath getIndexes:range:](self, "getIndexes:range:", v10, 0LL, v7);
  *(void *)&v10[8 * v7] = index;
  unint64_t v11 = +[NSIndexPath indexPathWithIndexes:length:](&OBJC_CLASS___NSIndexPath, "indexPathWithIndexes:length:", v10, v6);
  if (v6 >= 0x101) {
    free(v10);
  }
  return v11;
}

- (NSComparisonResult)compare:(NSIndexPath *)otherObject
{
  if (!otherObject) {
    return 1LL;
  }
  if (otherObject == self) {
    return 0LL;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSUInteger v5 = -[NSIndexPath length](self, "length");
    NSUInteger v6 = -[NSIndexPath length](otherObject, "length");
    NSUInteger v7 = v6;
    if (v5 >= v6) {
      NSUInteger v8 = v6;
    }
    else {
      NSUInteger v8 = v5;
    }
    if (v8)
    {
      uint64_t v9 = 0LL;
      NSComparisonResult v10 = NSOrderedDescending;
      while (1)
      {
        unint64_t v11 = -[NSIndexPath indexAtPosition:](otherObject, "indexAtPosition:", v9);
        if (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v9) < v11) {
          return -1LL;
        }
        if (-[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v9) > v11) {
          return v10;
        }
        if (v8 == ++v9) {
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:
      if (v5 >= v7) {
        NSComparisonResult v12 = NSOrderedSame;
      }
      else {
        NSComparisonResult v12 = NSOrderedAscending;
      }
      if (v5 <= v7) {
        return v12;
      }
      else {
        return 1LL;
      }
    }
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Unable to compare %@ with object of different class: %@", self, otherObject), 0 reason userInfo]);
  return (uint64_t)-[NSIndexPath isEqual:](v14, v15, v16);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v19 = v8;
  uint64_t v20 = v7;
  uint64_t v21 = v6;
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  uint64_t v25 = v9;
  uint64_t v26 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSUInteger v13 = -[NSIndexPath length](self, "length");
  if (v13 != [a3 length]) {
    return 0;
  }
  if (v13)
  {
    if (v13 != 2)
    {
      uint64_t v17 = 0LL;
      while (1)
      {
        NSUInteger v18 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v17, v19, v20, v21, v22, v23, v24, v25, v26);
        if (v18 != [a3 indexAtPosition:v17]) {
          break;
        }
        if (v13 == ++v17) {
          return 1;
        }
      }

      return 0;
    }

    NSUInteger v14 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 1LL);
    if (v14 != [a3 indexAtPosition:1]) {
      return 0;
    }
    NSUInteger v15 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0LL);
    if (v15 != [a3 indexAtPosition:0]) {
      return 0;
    }
  }

  return 1;
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  NSUInteger v3 = -[NSIndexPath length](self, "length");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSIndexPath;
  uint64_t v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@ {length = %lu, path = ",  -[NSIndexPath description](&v9, sel_description),  v3);
  if (v3)
  {
    NSUInteger v5 = 0LL;
    do
    {
      NSUInteger v6 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v5++);
      if (v5 >= v3) {
        uint64_t v7 = "";
      }
      else {
        uint64_t v7 = " - ";
      }
      -[NSMutableString appendFormat:](v4, "appendFormat:", @"%lu%s", v6, v7);
    }

    while (v3 != v5);
  }

  -[NSMutableString appendString:](v4, "appendString:", @"}");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___NSIndexPath;
    NSComparisonResult v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ cannot be serialized with a coder that does not support keyed archiving", -[NSIndexPath description](&v13, sel_description)), 0 reason userInfo];
    objc_exception_throw(v12);
  }

  NSUInteger v5 = -[NSIndexPath length](self, "length");
  [a3 encodeInteger:v5 forKey:@"NSIndexPathLength"];
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0),  @"NSIndexPathValue");
    }

    else
    {
      NSUInteger v6 = (void *)[objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:2 * v5 + 16];
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        NSUInteger v8 = -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", i);
        objc_super v9 = v14;
        if (v8 >= 0x80)
        {
          NSUInteger v10 = v8;
          do
          {
            *v9++ = v10 | 0x80;
            NSUInteger v8 = v10 >> 7;
            NSUInteger v11 = v10 >> 14;
            v10 >>= 7;
          }

          while (v11);
        }

        *objc_super v9 = v8;
        [v6 appendBytes:v14 length:v9 - v14 + 1];
      }

      [a3 encodeObject:v6 forKey:@"NSIndexPathData"];
    }
  }

- (NSIndexPath)initWithCoder:(id)a3
{
  v42[1] = *MEMORY[0x1895F89C0];
  if ([a3 allowsKeyedCoding])
  {
    if ([a3 containsValueForKey:@"NSIndexPathLength"])
    {
      unint64_t v5 = [a3 decodeIntegerForKey:@"NSIndexPathLength"];
      NSUInteger v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSIndexPathData"];
      uint64_t v7 = [v6 bytes];
      NSUInteger v8 = (unsigned __int8 *)v7;
      uint64_t v31 = v7;
      if (v5 < 2) {
        goto LABEL_11;
      }
      uint64_t v7 = objc_msgSend(a3, "requiresSecureCoding", v31);
      if (!(_DWORD)v7)
      {
LABEL_10:
        if (v5 >> 61)
        {
          v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"*** attempt to create an NSUInteger buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5);
          uint64_t v26 = (void *)MEMORY[0x189603F70];
          v29 = (uint64_t *)MEMORY[0x189603A48];
LABEL_43:
          uint64_t v27 = *v29;
          goto LABEL_44;
        }

@end