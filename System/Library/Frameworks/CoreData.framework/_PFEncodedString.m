@interface _PFEncodedString
- (BOOL)_isCString;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (_PFEncodedString)init;
- (_PFEncodedString)retain;
- (const)UTF8String;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cStringLength;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)retainCount;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCString:(char *)a3;
- (void)getCharacters:(unsigned __int16 *)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)release;
@end

@implementation _PFEncodedString

- (_PFEncodedString)init
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"You're doing it wrong" reason:@"Skanky class can only be used skankily." userInfo:0]);
  return -[_PFEncodedString retain](v2, v3);
}

- (_PFEncodedString)retain
{
  id v3 = self->_sourceData;
  return self;
}

- (void)release
{
}

- (unint64_t)retainCount
{
  return [self->_sourceData retainCount];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( objc_alloc(NSString),  "initWithUTF8String:",  -[_PFEncodedString UTF8String](self, "UTF8String"));
}

- (id)copy
{
  return (id)objc_msgSend( objc_alloc(NSString),  "initWithUTF8String:",  -[_PFEncodedString UTF8String](self, "UTF8String"));
}

- (BOOL)_isDeallocating
{
  return [self->_sourceData _isDeallocating];
}

- (BOOL)_tryRetain
{
  return [self->_sourceData _tryRetain];
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[_PFEncodedString UTF8String](self, "UTF8String")[a3];
}

- (void)getCharacters:(unsigned __int16 *)a3
{
  uint64_t length = self->_length;
  v5 = -[_PFEncodedString UTF8String](self, "UTF8String");
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
  v8 = -[_PFEncodedString UTF8String](self, "UTF8String");
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

- (const)UTF8String
{
  return (const char *)&self[1];
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