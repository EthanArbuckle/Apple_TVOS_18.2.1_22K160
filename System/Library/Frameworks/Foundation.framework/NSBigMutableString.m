@interface NSBigMutableString
- (BOOL)_copyDataFrom:(id)a3 range:(_NSRange)a4;
- (BOOL)_copyStorage:(__CFStorage *)a3 encoding:(unint64_t *)a4;
- (BOOL)_getData:(id *)a3 encoding:(unint64_t *)a4;
- (BOOL)_isCString;
- (BOOL)_isMarkedAsImmutable;
- (BOOL)_setData:(id)a3 encoding:(unint64_t)a4;
- (BOOL)_setStorage:(__CFStorage *)a3 encoding:(unint64_t)a4;
- (NSBigMutableString)initWithStorage:(__CFStorage *)a3 length:(unint64_t)a4 isUnicode:(BOOL)a5;
- (NSBigMutableString)initWithString:(id)a3;
- (id)_createSubstringWithRange:(_NSRange)a3;
- (id)_newBigSubstringWithRange:(_NSRange)a3 wantsMutable:(BOOL)a4 zone:(_NSZone *)a5;
- (id)_newSmallImmutableSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_checkForInvalidMutationWithSelector:(SEL)a3;
- (void)_markAsImmutable;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSBigMutableString

- (NSBigMutableString)initWithString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSBigMutableString;
  v4 = -[NSString init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    -[NSMutableString appendString:](v4, "appendString:", a3);
  }
  return v5;
}

- (NSBigMutableString)initWithStorage:(__CFStorage *)a3 length:(unint64_t)a4 isUnicode:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSBigMutableString;
  uint64_t v8 = -[NSString init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->length = a4;
    if (v5) {
      int v10 = 3;
    }
    else {
      int v10 = 1;
    }
    v8->flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&v8->flags & 0xFFFFFFFC | v10);
    v8->contents.d.data = (NSData *)a3;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSBigMutableString;
  -[NSBigMutableString dealloc](&v3, sel_dealloc);
}

- (void)_checkForInvalidMutationWithSelector:(SEL)a3
{
  if ((*(_BYTE *)&self->flags & 0x10) != 0)
  {
    objc_super v3 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"Attempt to mutate immutable object with %s", sel_getName(a3)), 0 reason userInfo];
    objc_exception_throw(v3);
    -[NSBigMutableString _markAsImmutable](v4, v5);
  }

- (void)_markAsImmutable
{
  *(_DWORD *)&self->flags |= 0x10u;
}

- (BOOL)_isMarkedAsImmutable
{
  return (*(_BYTE *)&self->flags >> 4) & 1;
}

- (BOOL)_getData:(id *)a3 encoding:(unint64_t *)a4
{
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
    if (a3) {
      *a3 = self->contents.d.data;
    }
    if (a4)
    {
      unint64_t v5 = 10LL;
      if ((*(_DWORD *)&self->flags & 2) == 0) {
        unint64_t v5 = _NSCStringEncoding;
      }
      *a4 = v5;
    }
  }

  return (*(_BYTE *)&flags & 1) == 0;
}

- (BOOL)_copyStorage:(__CFStorage *)a3 encoding:(unint64_t *)a4
{
  if ((*(_BYTE *)&self->flags & 1) != 0)
  {
    data = self->contents.d.data;
    if (data)
    {
      if (a3) {
        *a3 = (__CFStorage *)CFStorageCreateWithSubrange();
      }
      if (a4)
      {
        unint64_t v7 = 10LL;
        if ((*(_DWORD *)&self->flags & 2) == 0) {
          unint64_t v7 = _NSCStringEncoding;
        }
        *a4 = v7;
      }

      LOBYTE(data) = 1;
    }
  }

  else
  {
    LOBYTE(data) = 0;
  }

  return (char)data;
}

- (BOOL)_setStorage:(__CFStorage *)a3 encoding:(unint64_t)a4
{
  if (a4 == 1 || a4 == 10 || _NSCStringEncoding == a4)
  {

    self->contents.d.data = 0LL;
    if (a4 == 10) {
      int v8 = 3;
    }
    else {
      int v8 = 1;
    }
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(*(_DWORD *)&self->flags & 0xFFFFFFF0 | v8);
    self->contents.d.data = (NSData *)a3;
    self->length = CFStorageGetCount();
    return 1;
  }

  else
  {
    int v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%s called with unsupported string encoding %lu", sel_getName(a2), a4), 0 reason userInfo];
    objc_exception_throw(v10);
    return -[NSBigMutableString _setData:encoding:](v11, v12, v13, v14);
  }

- (BOOL)_setData:(id)a3 encoding:(unint64_t)a4
{
  v38[1] = *MEMORY[0x1895F89C0];
  -[NSBigMutableString _checkForInvalidMutationWithSelector:](self, "_checkForInvalidMutationWithSelector:", a2);
  p_contents = &self->contents;
  data = self->contents.d.data;
  if ((*(_BYTE *)&self->flags & 1) == 0 && data == a3) {
    id v25 = a3;
  }
  else {

  }
  p_contents->d.data = 0LL;
  if (a4 != 1 && _NSCStringEncoding != a4)
  {
    CFStringEncoding v16 = CFStringConvertNSStringEncodingToEncoding(a4);
    switch(BYTE1(v16))
    {
      case 0:
        if ((v16 > 0x22 || ((1LL << v16) & 0x600000032LL) == 0) && v16 != 152) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 1:
        if (v16 == 134217984) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 2:
        if (v16 != 518) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 6:
        if (v16 == 1536) {
          goto LABEL_46;
        }
        goto LABEL_6;
      case 8:
      case 0xC:
        goto LABEL_6;
      case 0xA:
        if (v16 - 2561 > 0xF) {
          goto LABEL_46;
        }
        int v28 = 1 << (v16 - 1);
        int v29 = 32785;
        goto LABEL_45;
      case 0xB:
        if (v16 - 3059 > 0xC) {
          goto LABEL_46;
        }
        int v28 = 1 << (v16 + 13);
        int v29 = 4099;
LABEL_45:
        if ((v28 & v29) == 0) {
          goto LABEL_46;
        }
        goto LABEL_6;
      default:
        if ((v16 & 0xFF00) > 0xC00) {
          goto LABEL_6;
        }
LABEL_46:
        unint64_t v30 = [a3 length];
        v31 = (uint64_t *)[a3 bytes];
        break;
    }

    while (v30 > 7)
    {
      uint64_t v32 = *v31++;
      v30 -= 8LL;
      if ((v32 & 0x8080808080808080LL) != 0) {
        goto LABEL_6;
      }
    }

    while (v30 > 3)
    {
      int v33 = *(_DWORD *)v31;
      v31 = (uint64_t *)((char *)v31 + 4);
      v30 -= 4LL;
      if ((v33 & 0x80808080) != 0) {
        goto LABEL_6;
      }
    }

    uint64_t v34 = 0LL;
    while (v30 != v34)
    {
      int v35 = *((char *)v31 + v34++);
      if (v35 < 0) {
        goto LABEL_6;
      }
    }

    a4 = 1LL;
  }

- (BOOL)_copyDataFrom:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (*((_BYTE *)a3 + 8) & 1) != 0) {
    return 0;
  }
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;

  self->contents.d.data = 0LL;
  if ((*(_BYTE *)&flags & 1) != 0) {
    *(_DWORD *)&self->flags &= ~1u;
  }
  if (location)
  {
    $12A8D912EA621CF5C78D0B17F79410D4 v9 = self->flags;
LABEL_10:
    unint64_t v16 = *((unsigned int *)a3 + 2);
    unsigned int v17 = *((_DWORD *)a3 + 2) & 2 | *(_DWORD *)&v9 & 0xFFFFFFFD;
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v17;
    self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v17 & 0xFFFFFFF3 | *((_DWORD *)a3 + 2) & 8);
    uint64_t v18 = (v16 >> 1) & 1;
    NSUInteger v19 = location << ((v16 & 2) != 0);
    if ((*((_DWORD *)a3 + 2) & 4) != 0) {
      NSUInteger v20 = v19 + 2;
    }
    else {
      NSUInteger v20 = v19;
    }
    id v21 = (NSData *)(id)objc_msgSend(*((id *)a3 + 3), "subdataWithRange:", v20, length << v18);
    self->contents.d.data = v21;
    unint64_t v15 = -[NSData bytes](v21, "bytes");
    goto LABEL_14;
  }

  uint64_t v11 = [a3 length];
  $12A8D912EA621CF5C78D0B17F79410D4 v9 = self->flags;
  if (length != v11) {
    goto LABEL_10;
  }
  unsigned int v12 = *(_DWORD *)&v9 & 0xFFFFFFFD | (2 * ((*((_DWORD *)a3 + 2) >> 1) & 1));
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v12;
  unsigned int v13 = v12 & 0xFFFFFFF7 | (8 * ((*((_DWORD *)a3 + 2) >> 3) & 1));
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)v13;
  self->$12A8D912EA621CF5C78D0B17F79410D4 flags = ($12A8D912EA621CF5C78D0B17F79410D4)(v13 & 0xFFFFFFFB | (4 * ((*((_DWORD *)a3 + 2) >> 2) & 1)));
  int v14 = (NSData *)*((id *)a3 + 3);
  self->contents.d.data = v14;
  unint64_t v15 = (char *)(-[NSData bytes](v14, "bytes") + (((unint64_t)self->flags >> 1) & 2));
LABEL_14:
  self->contents.d.dataBytes = v15;
  self->NSUInteger length = length;
  return 1;
}

- (unint64_t)length
{
  return self->length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->length > a3)
  {
    $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      ConstValueAtIndex = (_WORD *)CFStorageGetConstValueAtIndex();
      if ((*(_BYTE *)&flags & 2) != 0)
      {
LABEL_7:
        LOWORD(v5) = *ConstValueAtIndex;
        return v5;
      }
    }

    else
    {
      if ((*(_BYTE *)&flags & 2) != 0)
      {
        unsigned int v5 = *(unsigned __int16 *)&self->contents.d.dataBytes[2 * a3];
        unsigned int v6 = bswap32(v5) >> 16;
        if ((*(_BYTE *)&flags & 8) != 0) {
          LOWORD(v5) = v6;
        }
        return v5;
      }

      ConstValueAtIndex = -[NSData bytes](self->contents.d.data, "bytes") + a3;
    }

    ConstValueAtIndex = (_WORD *)(_NSCStringCharToUnicharTable + 2LL * *(unsigned __int8 *)ConstValueAtIndex);
    goto LABEL_7;
  }

  int v8 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Index %lu out of bounds; string length %lu",
                   _NSMethodExceptionProem((objc_class *)self, a2),
                   a3,
                   self->length),
                 0LL);
  objc_exception_throw(v8);
  -[NSBigMutableString getCharacters:range:](v9, v10, v11, v12);
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  if (a4.location + a4.length > self->length)
  {
    unint64_t v15 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a4.location,
                      a4.length,
                      self->length),
                    0LL);
    objc_exception_throw(v15);
    -[NSBigMutableString replaceCharactersInRange:withString:](v16, v17, v19, v18);
  }

  else
  {
    unsigned int v6 = a3;
    $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      CFStorageGetValues();
      if ((*(_BYTE *)&self->flags & 2) == 0 && (uint64_t)(length - 1) >= 0)
      {
        uint64_t v12 = _NSCStringCharToUnicharTable;
        do
        {
          v6[length - 1] = *(_WORD *)(v12 + 2LL * *((unsigned __int8 *)v6 + length - 1));
          --length;
        }

        while (length);
      }
    }

    else
    {
      dataBytes = self->contents.d.dataBytes;
      if ((*(_BYTE *)&flags & 2) != 0)
      {
        unsigned int v13 = &dataBytes[2 * a4.location];
        if ((*(_BYTE *)&flags & 8) != 0)
        {
          if (a4.length)
          {
            do
            {
              unsigned int v14 = *(unsigned __int16 *)v13;
              v13 += 2;
              *v6++ = bswap32(v14) >> 16;
              --length;
            }

            while (length);
          }
        }

        else
        {
          memmove(a3, v13, 2 * a4.length);
        }
      }

      else if (a4.length)
      {
        $12A8D912EA621CF5C78D0B17F79410D4 v9 = &dataBytes[a4.location];
        uint64_t v10 = _NSCStringCharToUnicharTable;
        do
        {
          unsigned int v11 = *v9++;
          *v6++ = *(_WORD *)(v10 + 2LL * v11);
          --length;
        }

        while (length);
      }
    }
  }

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSBigMutableString _checkForInvalidMutationWithSelector:](self, "_checkForInvalidMutationWithSelector:", a2);
  if (!a4)
  {
    _NSRange v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    NSUInteger v20 = (void *)MEMORY[0x189603F70];
    id v21 = (void *)MEMORY[0x189603A60];
    goto LABEL_35;
  }

  uint64_t v9 = location + length;
  if (location + length > self->length)
  {
    _NSRange v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            self->length);
    NSUInteger v20 = (void *)MEMORY[0x189603F70];
    id v21 = (void *)MEMORY[0x189603B40];
LABEL_35:
    objc_exception_throw((id)[v20 exceptionWithName:*v21 reason:v19 userInfo:0]);
  }

  unint64_t v10 = [a4 length];
  unint64_t v11 = self->length;
  if ((*(_BYTE *)&self->flags & 2) != 0)
  {
    BOOL v12 = 1;
  }

  else if ([a4 _isCString])
  {
    BOOL v12 = 0;
  }

  else
  {
    uint64_t v13 = [a4 length];
    BOOL v12 = v13 != [a4 lengthOfBytesUsingEncoding:_NSCStringEncoding];
  }

  if (length != v11) {
    goto LABEL_11;
  }
  if (object_getClass(a4) != (Class)&OBJC_CLASS___NSBigMutableString)
  {
    if (![a4 length])
    {
      -[NSBigMutableString _setData:encoding:](self, "_setData:encoding:", 0LL, 1LL);
      return;
    }

- (BOOL)_isCString
{
  return (*(_BYTE *)&self->flags & 2) == 0;
}

- (id)_newSmallImmutableSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  if (!a3.length) {
    return &stru_189CA6A28;
  }
  size_t length = a3.length;
  NSUInteger location = a3.location;
  if ((*(_BYTE *)&self->flags & 2) != 0)
  {
    BOOL v12 = (malloc_zone_t *)a4;
    if (!a4) {
      BOOL v12 = malloc_default_zone();
    }
    uint64_t v13 = malloc_zone_malloc(v12, 2 * length);
    -[NSBigMutableString getCharacters:range:](self, "getCharacters:range:", v13, location, length);
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a4),  "initWithCharactersNoCopy:length:freeWhenDone:",  v13,  length,  1LL);
  }

  else
  {
    int v8 = (malloc_zone_t *)a4;
    if (!a4) {
      int v8 = malloc_default_zone();
    }
    uint64_t v9 = malloc_zone_malloc(v8, length);
    unint64_t v10 = v9;
    if ((*(_BYTE *)&self->flags & 1) != 0) {
      CFStorageGetValues();
    }
    else {
      memmove(v9, &self->contents.d.dataBytes[location], length);
    }
    unint64_t v14 = +[NSString allocWithZone:](&OBJC_CLASS___NSString, "allocWithZone:", a4);
    return -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( v14,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v10,  length,  _NSCStringEncoding,  1LL);
  }

- (id)_newBigSubstringWithRange:(_NSRange)a3 wantsMutable:(BOOL)a4 zone:(_NSZone *)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v7 = self->length;
  if (a3.location + a3.length > v7)
  {
    unint64_t v16 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      a3.location,
                      a3.length,
                      self->length),
                    0LL);
    objc_exception_throw(v16);
    return -[NSBigMutableString _newSubstringWithRange:zone:](v17, v18, v22, v19);
  }

  BOOL v9 = a4;
  $12A8D912EA621CF5C78D0B17F79410D4 flags = self->flags;
  if (!a3.location && a3.length == v7 && !a4 && (*(_BYTE *)&flags & 0x10) != 0) {
    return self;
  }
  if (!a3.length) {
    return objc_alloc_init((Class)objc_opt_class());
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if (!a4 && a3.length << ((*(_BYTE *)&flags & 2) != 0LL) < 0x201) {
      return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:]( self,  "_newSmallImmutableSubstringWithRange:zone:",  location,  length,  a5);
    }
    id v21 = self;
    unint64_t v15 = (const void *)CFStorageCreateWithSubrange();
    id v12 = (id)[objc_alloc((Class)objc_opt_class()) initWithStorage:v15 length:length isUnicode:(*(_DWORD *)&v21->flags >> 1) & 1];
    CFRelease(v15);
  }

  else
  {
    if (a3.length <= 0x10 && !a4) {
      return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:]( self,  "_newSmallImmutableSubstringWithRange:zone:",  location,  length,  a5);
    }
    NSUInteger v20 = self;
    id v12 = objc_alloc_init((Class)objc_opt_class());
    if (!objc_msgSend(v12, "_copyDataFrom:range:", v20, location, length))
    {

      if (v9)
      {
        uint64_t v13 = (malloc_zone_t *)a5;
        if (!a5) {
          uint64_t v13 = malloc_default_zone();
        }
        unint64_t v14 = malloc_zone_malloc(v13, 2 * length);
        -[NSBigMutableString getCharacters:range:](v20, "getCharacters:range:", v14, location, length);
        return -[NSString initWithCharactersNoCopy:length:freeWhenDone:]( +[NSMutableString allocWithZone:](&OBJC_CLASS___NSMutableString, "allocWithZone:", a5),  "initWithCharactersNoCopy:length:freeWhenDone:",  v14,  length,  1LL);
      }

      self = v20;
      return -[NSBigMutableString _newSmallImmutableSubstringWithRange:zone:]( self,  "_newSmallImmutableSubstringWithRange:zone:",  location,  length,  a5);
    }
  }

  if (!v9) {
    [v12 _markAsImmutable];
  }
  return v12;
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v8 = self->length;
  BOOL v9 = v8 >= a3.length;
  NSUInteger v10 = v8 - a3.length;
  if (v9 && a3.location <= v10) {
    return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:]( self,  "_newBigSubstringWithRange:wantsMutable:zone:",  location,  length,  0LL,  a4);
  }
  if (!_CFExecutableLinkedOnOrAfter())
  {
    if ((_newSubstringWithRange_zone__warnonce & 1) == 0)
    {
      _newSubstringWithRange_zone__warnonce = 1;
      uint64_t v13 = _NSMethodExceptionProem((objc_class *)self, a2);
      v22.NSUInteger location = location;
      v22.NSUInteger length = length;
      unint64_t v14 = NSStringFromRange(v22);
      NSLog( (NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v13,
        v14);
    }

    unint64_t v15 = self->length;
    if (location <= v15) {
      NSUInteger v16 = location;
    }
    else {
      NSUInteger v16 = 0LL;
    }
    BOOL v9 = v15 >= location;
    NSUInteger v17 = v15 - location;
    if (v9) {
      NSUInteger length = v17;
    }
    else {
      NSUInteger length = 0LL;
    }
    NSUInteger location = v16;
    return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:]( self,  "_newBigSubstringWithRange:wantsMutable:zone:",  location,  length,  0LL,  a4);
  }

  _NSRange v19 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                    _NSMethodExceptionProem((objc_class *)self, a2),
                    location,
                    length,
                    self->length),
                  0LL);
  objc_exception_throw(v19);
  return -[NSBigMutableString _createSubstringWithRange:](v20, v21, v23);
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  NSUInteger v6 = self->length;
  BOOL v7 = v6 >= a3.length;
  NSUInteger v8 = v6 - a3.length;
  if (v7 && a3.location <= v8)
  {
LABEL_16:
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___NSBigMutableString;
    return -[NSString _createSubstringWithRange:](&v21, sel__createSubstringWithRange_, location, length);
  }

  if (!_CFExecutableLinkedOnOrAfter())
  {
    if ((_createSubstringWithRange__warnonce & 1) == 0)
    {
      _createSubstringWithRange__warnonce = 1;
      unint64_t v11 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23.NSUInteger location = location;
      v23.NSUInteger length = length;
      id v12 = NSStringFromRange(v23);
      NSLog( (NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v11,
        v12);
    }

    unint64_t v13 = self->length;
    if (location <= v13) {
      NSUInteger v14 = location;
    }
    else {
      NSUInteger v14 = 0LL;
    }
    BOOL v7 = v13 >= location;
    NSUInteger v15 = v13 - location;
    if (v7) {
      NSUInteger length = v15;
    }
    else {
      NSUInteger length = 0LL;
    }
    NSUInteger location = v14;
    goto LABEL_16;
  }

  NSUInteger v17 = (void *)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603B40],  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                    _NSMethodExceptionProem((objc_class *)self, a2),
                    location,
                    length,
                    self->length),
                  0LL);
  objc_exception_throw(v17);
  return -[NSBigMutableString copyWithZone:](v18, v19, v20);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:]( self,  "_newBigSubstringWithRange:wantsMutable:zone:",  0LL,  self->length,  0LL,  a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSBigMutableString _newBigSubstringWithRange:wantsMutable:zone:]( self,  "_newBigSubstringWithRange:wantsMutable:zone:",  0LL,  self->length,  1LL,  a3);
}

@end