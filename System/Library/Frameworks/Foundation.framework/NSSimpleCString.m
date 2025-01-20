@interface NSSimpleCString
+ (NSSimpleCString)allocWithZone:(_NSZone *)a3;
- (BOOL)canBeConvertedToEncoding:(unint64_t)a3;
- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)hasSuffix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (NSSimpleCString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4;
- (const)_fastCStringContents:(BOOL)a3;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringByAppendingString:(id)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5;
- (unint64_t)cStringLength;
- (unint64_t)fastestEncoding;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSSimpleCString

+ (NSSimpleCString)allocWithZone:(_NSZone *)a3
{
  return (NSSimpleCString *)NSAllocateObject((Class)a1, 0LL, a3);
}

- (NSSimpleCString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4
{
  self->bytes = a3;
  self->numBytes = a4;
  return self;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->numBytes > a3) {
    return *(_WORD *)(_NSCStringCharToUnicharTable + 2LL * self->bytes[a3]);
  }
  v4 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Index %lu out of bounds; string length %lu",
                   _NSMethodExceptionProem((objc_class *)self, a2),
                   a3,
                   self->numBytes),
                 0LL);
  objc_exception_throw(v4);
  -[NSSimpleCString getCharacters:range:](v5, v6, v7, v8);
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (a4.location + a4.length > self->numBytes)
  {
    v7 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     a4.location,
                     a4.length,
                     self->numBytes),
                   0LL);
    objc_exception_throw(v7);
    -[NSSimpleCString length](v8, v9);
  }

  else if (a4.length)
  {
    uint64_t v4 = _NSCStringCharToUnicharTable;
    v5 = &self->bytes[a4.location];
    do
    {
      unsigned int v6 = *v5++;
      *a3++ = *(_WORD *)(v4 + 2LL * v6);
      --a4.length;
    }

    while (a4.length);
  }

- (unint64_t)length
{
  return self->numBytes;
}

- (unint64_t)cStringLength
{
  return self->numBytes;
}

- (unint64_t)fastestEncoding
{
  return _NSCStringEncoding;
}

- (unint64_t)smallestEncoding
{
  return _NSCStringEncoding;
}

- (BOOL)canBeConvertedToEncoding:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (_NSCStringEncoding == a3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
  return -[NSString canBeConvertedToEncoding:](&v4, sel_canBeConvertedToEncoding_);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (NSShouldRetainWithZone(self, a3)) {
    return self;
  }
  uint64_t v5 = +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a3);
  return -[NSString initWithBytes:length:encoding:]( v5,  "initWithBytes:length:encoding:",  self->bytes,  self->numBytes,  _NSCStringEncoding);
}

- (const)_fastCStringContents:(BOOL)a3
{
  if (a3) {
    return 0LL;
  }
  else {
    return self->bytes;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    if (!a3) {
      goto LABEL_8;
    }
    int v5 = _NSIsNSString();
    if (!v5) {
      return v5;
    }
    uint64_t v6 = [a3 _fastCStringContents:0];
    if (!v6)
    {
      LOBYTE(v5) = isEqualCStringToString((unsigned __int8 *)self->bytes, self->numBytes, a3);
      return v5;
    }

    v7 = (const void *)v6;
    uint64_t numBytes = self->numBytes;
    if ([a3 length] != numBytes)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }

    LOBYTE(v5) = memcmp(self->bytes, v7, self->numBytes) == 0;
  }

  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    uint64_t numBytes = self->numBytes;
    if ([a3 length] == numBytes) {
      return memcmp(self->bytes, v6, self->numBytes) == 0;
    }
    return 0;
  }

  return isEqualCStringToString((unsigned __int8 *)self->bytes, self->numBytes, a3);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 0LL;
  }
  if (!a3) {
    return 1LL;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v10 = (unsigned __int8 *)[a3 _fastCStringContents:0];
  if (v10) {
    return NSCompareCString((unsigned __int8 *)&self->bytes[location], v10, length, [a3 length], a4);
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
  return -[NSString compare:options:range:](&v12, sel_compare_options_range_, a3, a4, location, length);
}

- (BOOL)hasPrefix:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    unint64_t v7 = [a3 length];
    if (v7) {
      LOBYTE(v7) = v7 <= self->numBytes && memcmp(self->bytes, v6, v7) == 0;
    }
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
    LOBYTE(v7) = -[NSString hasPrefix:](&v9, sel_hasPrefix_, a3);
  }

  return v7;
}

- (BOOL)hasSuffix:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 _fastCStringContents:0];
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    unint64_t v7 = [a3 length];
    if (v7)
    {
      unint64_t numBytes = self->numBytes;
      LOBYTE(v7) = v7 <= numBytes && memcmp(&self->bytes[numBytes - v7], v6, v7) == 0;
    }
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
    LOBYTE(v7) = -[NSString hasSuffix:](&v10, sel_hasSuffix_, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return CFStringHashCString();
}

- (BOOL)getBytes:(void *)a3 maxLength:(unint64_t)a4 usedLength:(unint64_t *)a5 encoding:(unint64_t)a6 options:(unint64_t)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (_NSCStringEncoding == a6)
  {
    if (a8.length >= a4) {
      size_t length = a4;
    }
    else {
      size_t length = a8.length;
    }
    if (a3 && length) {
      memmove(a3, &self->bytes[a8.location], length);
    }
    if (a5) {
      *a5 = length;
    }
    if (a9)
    {
      a9->NSUInteger location = length + a8.location;
      a9->size_t length = a8.length - length;
    }

    return 1;
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
    return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:]( &v12,  sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_,  a3,  a4,  a5,  a8.location,  a8.length,  a9);
  }

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger numBytes = self->numBytes;
  if (a3.location > numBytes || a3.location + a3.length > numBytes)
  {
    objc_super v10 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a3.location,
                      a3.length,
                      self->numBytes),
                    0LL);
    objc_exception_throw(v10);
    return -[NSSimpleCString stringByAppendingString:](v11, v12, v13);
  }

  else if (a3.length)
  {
    if (a3.location || a3.length != numBytes)
    {
      objc_super v9 = +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a4);
      return -[NSString initWithBytes:length:encoding:]( v9,  "initWithBytes:length:encoding:",  &self->bytes[location],  length,  _NSCStringEncoding);
    }

    else
    {
      return self;
    }
  }

  else
  {
    return &stru_189CA6A28;
  }

- (id)stringByAppendingString:(id)a3
{
  uint64_t v5 = [a3 length];
  uint64_t v6 = v5;
  if (!self->numBytes)
  {
    if (!v5) {
      return &stru_189CA6A28;
    }
    v15 = a3;
    goto LABEL_14;
  }

  if (!v5)
  {
    v15 = self;
LABEL_14:
    v14 = (NSString *)[v15 copyWithZone:0];
    return v14;
  }

  uint64_t v7 = [a3 _fastCStringContents:0];
  id result = (id)-[NSSimpleCString zone](self, "zone");
  id v9 = result;
  size_t v10 = v6 + self->numBytes;
  if (v7)
  {
    if (v10)
    {
      if (!result) {
        id result = malloc_default_zone();
      }
      id result = malloc_zone_malloc((malloc_zone_t *)result, v10);
      if (result)
      {
        uint64_t v11 = (char *)result;
        size_t numBytes = self->numBytes;
        if ((int)numBytes >= 1)
        {
          memmove(result, self->bytes, numBytes);
          LODWORD(numBytes) = self->numBytes;
        }

        objc_msgSend( a3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  &v11[(int)numBytes],  v6,  0,  _NSCStringEncoding,  0,  0,  v6,  0);
        id v13 = +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", v9);
        v14 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( v13,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v11,  v6 + self->numBytes,  _NSCStringEncoding,  1LL);
        return v14;
      }
    }

    goto LABEL_22;
  }

  if (v10)
  {
    size_t v16 = 2 * v10;
    if (!result) {
      id result = malloc_default_zone();
    }
    id result = malloc_zone_malloc((malloc_zone_t *)result, v16);
    if (result)
    {
      v17 = (char *)result;
      -[NSSimpleCString getCharacters:range:](self, "getCharacters:range:", result, 0LL, self->numBytes);
      objc_msgSend(a3, "getCharacters:range:", &v17[2 * self->numBytes], 0, v6);
      v14 = -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", v9),  "initWithCharactersNoCopy:length:freeWhenDone:",  v17,  v6 + self->numBytes,  1LL);
      return v14;
    }
  }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  bytes = self->bytes;
  if (bytes) {
    free(bytes);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSimpleCString;
  -[NSSimpleCString dealloc](&v4, sel_dealloc);
}

@end