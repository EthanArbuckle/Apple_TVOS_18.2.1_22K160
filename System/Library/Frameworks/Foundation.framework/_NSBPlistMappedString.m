@interface _NSBPlistMappedString
+ (id)createStringWithOffset:(int64_t)a3 intoMappingData:(id)a4;
+ (void)initialize;
- (const)_fastCStringContents:(BOOL)a3;
- (uint64_t)isUTF16BE;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unint64_t)smallestEncoding;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getBPlistPtr:(CFIndex *)a3 bplistSize:(void *)a4 stringPtr:(_BYTE *)a5 isUTF16BE:;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _NSBPlistMappedString

+ (void)initialize
{
  if (&OBJC_CLASS____NSBPlistMappedString == a1)
  {
    else {
      enableTaggedPointerBPlistMappedStrings = 1;
    }
  }

+ (id)createStringWithOffset:(int64_t)a3 intoMappingData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ((__objc2_class *)objc_opt_class() != &OBJC_CLASS____NSBPlistMappedData) {
    return 0LL;
  }
  uint64_t v7 = [a4 mappingIndex];
  id result = 0LL;
  if (a3 <= 0xFFFFFFF && v7 != -1 && v7 <= 1023)
  {
    int v8 = *(_BYTE *)([a4 bytes] + a3) & 0xF0;
    [a4 bytes];
    [a4 _bplistObjectsRangeEnd];
    uint64_t v16 = 0LL;
    v17 = &v16;
    uint64_t v18 = 0x2020000000LL;
    uint64_t v13 = MEMORY[0x1895F87A8];
    if (v8 == 96)
    {
      v14 = ___getStringLength_block_invoke_2;
      v15 = &unk_189C9AFB8;
      char v9 = __CFBinaryPlistParseUnicode16String();
    }

    else
    {
      v14 = ___getStringLength_block_invoke;
      v15 = &unk_189C9AF90;
      char v9 = __CFBinaryPlistParseASCIIString();
    }

    if ((v9 & 1) == 0)
    {
      objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Plist data is corrupt!",  0,  v13,  3221225472,  v14,  v15,  &v16,  v16));
      __break(1u);
      return result;
    }

    unint64_t v10 = v17[3];
    _Block_object_dispose(&v16, 8);
    if (v10 >> 13) {
      return 0LL;
    }
    int64_t v11 = (v7 << 14) | (a3 << 24) | (v8 == 96) | (2 * v10);
    if ((enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      id result = objc_alloc_init(&OBJC_CLASS____NSBPlistMappedString);
      if (result) {
        *((void *)result + 1) = v11;
      }
    }

    else
    {
      id result = (id)((8 * (v11 & 0xFFFFFFFFFFFFFLL)) | 0x8700000000000007LL);
      unint64_t v12 = *MEMORY[0x189616658] ^ (unint64_t)result;
      if ((~v12 & 0xC000000000000007LL) != 0) {
        return (id)(v12 & 0xFFFFFFFFFFFFFFF8LL | *(unsigned __int8 *)(MEMORY[0x189616648] + (v12 & 7)));
      }
    }
  }

  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  -[_NSBPlistMappedString getCharacters:range:](self, "getCharacters:range:", &v4, a3, 1LL);
  return v4;
}

- (void)getBPlistPtr:(CFIndex *)a3 bplistSize:(void *)a4 stringPtr:(_BYTE *)a5 isUTF16BE:
{
  if (a1)
  {
    if ((a1 & 0x8000000000000000LL) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      unint64_t v11 = *(void *)(a1 + 8);
    }

    else
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
      unint64_t v11 = v10 & (v9 >> 3);
    }

    *a5 = v11 & 1;
    MappedStringsFile = (const __CFData *)_CFBundleGetMappedStringsFile();
    if (MappedStringsFile)
    {
      uint64_t v13 = MappedStringsFile;
      *a2 = CFDataGetBytePtr(MappedStringsFile);
      *a3 = CFDataGetLength(v13);
      *a4 = &(*a2)[(v11 >> 24) & 0xFFFFFFF];
    }

    else
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Invalid tagged pointer reference" userInfo:0]);
      -[_NSBPlistMappedString getCharacters:range:](v14, v15, v16, v17);
    }
  }

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  unsigned __int8 v23 = 0;
  -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((uint64_t)self, &v22, &v21, &v20, &v23);
  uint64_t v16 = 0LL;
  _NSRange v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v7 = v23;
  if (v23) {
    char v8 = __CFBinaryPlistParseUnicode16String();
  }
  else {
    char v8 = __CFBinaryPlistParseASCIIString();
  }
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Plist data is corrupt!" userInfo:0];
    goto LABEL_8;
  }

  if (*((_BYTE *)v13 + 24))
  {
    while (1)
    {
      uint64_t v10 = (void *)MEMORY[0x189603F70];
      v25.NSUInteger location = location;
      v25.NSUInteger length = length;
      NSUInteger length = (NSUInteger)NSStringFromRange(v25);
      NSUInteger location = v17[3];
      unint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Out of range. Requested range: %@, reported length: %ld, encoded length: %ld, isUTF16BE: %d",  length,  location,  -[_NSBPlistMappedString length](self, "length"),  v7);
      unint64_t v9 = (void *)[v10 exceptionWithName:*MEMORY[0x189603B40] reason:v11 userInfo:0];
LABEL_8:
      objc_exception_throw(v9);
      __break(1u);
    }
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

- (unint64_t)length
{
  if (self)
  {
    if (((unint64_t)self & 0x8000000000000000LL) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      unint64_t payload = self->payload;
    }

    else
    {
      uint64_t v2 = *MEMORY[0x189616658];
      unint64_t v3 = v2 ^ (unint64_t)self;
      uint64_t v4 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v3 & 7) == 0) {
        uint64_t v4 = 0xFFFFFFFFFFFFFLL;
      }
      unint64_t payload = v4 & (v3 >> 3);
    }
  }

  else
  {
    unint64_t payload = 0LL;
  }

  return (payload >> 1) & 0x1FFF;
}

- (const)_fastCStringContents:(BOOL)a3
{
  unint64_t v3 = 0LL;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  if (a3) {
    goto LABEL_5;
  }
  char v9 = 0;
  -[_NSBPlistMappedString getBPlistPtr:bplistSize:stringPtr:isUTF16BE:]((uint64_t)self, &v8, &v7, &v6, &v9);
  if (v9 || (uint64_t v5 = MEMORY[0x1895F87A8], (__CFBinaryPlistParseASCIIString() & 1) != 0))
  {
    unint64_t v3 = (const char *)v11[3];
LABEL_5:
    _Block_object_dispose(&v10, 8);
    return v3;
  }

  objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A58],  @"Plist data is corrupt!",  0,  v5,  3221225472,  __46___NSBPlistMappedString__fastCStringContents___block_invoke,  &unk_189C9AF90,  &v10));
  __break(1u);
  return result;
}

- (uint64_t)isUTF16BE
{
  if (result)
  {
    if ((result & 0x8000000000000000LL) == 0 || (enableTaggedPointerBPlistMappedStrings & 1) != 0)
    {
      uint64_t v4 = *(void *)(result + 8);
    }

    else
    {
      uint64_t v1 = *MEMORY[0x189616658];
      if ((~result & 0xC000000000000007LL) == 0) {
        uint64_t v1 = 0LL;
      }
      unint64_t v2 = v1 ^ result;
      uint64_t v3 = 0xFFFFFFFFFFFFFFFLL;
      if ((~(_BYTE)v2 & 7) == 0) {
        uint64_t v3 = 0xFFFFFFFFFFFFFLL;
      }
      uint64_t v4 = v3 & (v2 >> 3);
    }

    return v4 & 1;
  }

  return result;
}

- (unint64_t)fastestEncoding
{
  else {
    return 1LL;
  }
}

- (unint64_t)smallestEncoding
{
  else {
    return 1LL;
  }
}

@end