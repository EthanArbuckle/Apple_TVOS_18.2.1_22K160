@interface _PFResultASCIIString
+ (unint64_t)bufferOffset;
+ (void)initialize;
- (BOOL)_isCString;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (const)UTF8String;
- (unint64_t)cStringLength;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCString:(char *)a3;
- (void)getCharacters:(unsigned __int16 *)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _PFResultASCIIString

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (objc_class *)objc_opt_class();
    _PFResultASCIIString_Offset = (class_getInstanceSize(v2) + 7) & 0xFFFFFFFFFFFFFFF8LL;
  }

+ (unint64_t)bufferOffset
{
  return _PFResultASCIIString_Offset;
}

- (const)UTF8String
{
  return (char *)self + _PFResultASCIIString_Offset;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[_PFResultASCIIString UTF8String](self, "UTF8String")[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3
{
  uint64_t length = self->_length;
  v5 = -[_PFResultASCIIString UTF8String](self, "UTF8String");
  if ((_DWORD)length)
  {
    do
    {
      unsigned __int16 v6 = *v5++;
      *a3++ = v6;
      --length;
    }

    while (length);
  }

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v7 = a4.location + a4.length;
  v8 = -[_PFResultASCIIString UTF8String](self, "UTF8String");
  if (location < v7)
  {
    v9 = &v8[location];
    do
    {
      unsigned __int16 v10 = *v9++;
      *a3++ = v10;
      --length;
    }

    while (length);
  }

- (BOOL)_isCString
{
  return 1;
}

- (void)getCString:(char *)a3
{
}

- (unint64_t)cStringLength
{
  return self->_length;
}

- (unint64_t)hash
{
  return CFStringHashCString();
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }

  else
  {
    int v5 = [a3 isNSString];
    if (v5) {
      LOBYTE(v5) = _compareUnknownStrings(self, (__CFString *)a3);
    }
  }

  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3) {
    return _compareUnknownStrings(self, (__CFString *)a3);
  }
  return 0;
}

@end