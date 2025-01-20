@interface NSData(NSData)
+ (BOOL)_base64DecodingAlwaysSucceedsForOptions:()NSData;
+ (_NSClrDat)_newZeroingDataWithBytes:()NSData length:;
+ (_NSClrDat)_newZeroingDataWithBytesNoCopy:()NSData length:deallocator:;
+ (__objc2_class)allocWithZone:()NSData;
+ (id)_alloc;
+ (id)data;
+ (id)dataWithBytes:()NSData length:;
+ (id)dataWithBytesNoCopy:()NSData length:;
+ (id)dataWithBytesNoCopy:()NSData length:freeWhenDone:;
+ (id)dataWithContentsOfFile:()NSData;
+ (id)dataWithContentsOfFile:()NSData options:error:;
+ (id)dataWithContentsOfMappedFile:()NSData;
+ (id)dataWithContentsOfURL:()NSData;
+ (id)dataWithContentsOfURL:()NSData options:error:;
+ (id)dataWithContentsOfURL:()NSData options:maxLength:error:;
+ (id)dataWithData:()NSData;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
- (BOOL)_canReplaceWithDispatchDataForXPCCoder;
- (NSString)_base64EncodingAsString:()NSData withOptions:;
- (dispatch_data_t)replacementObjectForCoder:()NSData;
- (id)_asciiDescription;
- (id)debugDescription;
- (id)description;
- (id)initWithCoder:()NSData;
- (id)subdataWithRange:()NSData;
- (uint64_t)_allowsDirectEncoding;
- (uint64_t)_copyWillRetain;
- (uint64_t)_createDispatchData;
- (uint64_t)_decodeBase64EncodedCharacterBuffer:()NSData length:options:buffer:bufferLength:state:;
- (uint64_t)_initWithBase64EncodedObject:()NSData options:;
- (uint64_t)_isCompact;
- (uint64_t)_isDispatchData;
- (uint64_t)_providesConcreteBacking;
- (uint64_t)base64EncodedDataWithOptions:()NSData;
- (uint64_t)base64EncodedStringWithOptions:()NSData;
- (uint64_t)base64Encoding;
- (uint64_t)classForCoder;
- (uint64_t)copyWithZone:()NSData;
- (uint64_t)encodeWithCoder:()NSData;
- (uint64_t)enumerateByteRangesUsingBlock:()NSData;
- (uint64_t)hash;
- (uint64_t)initWithBase64EncodedData:()NSData options:;
- (uint64_t)initWithBase64EncodedString:()NSData options:;
- (uint64_t)initWithBase64Encoding:()NSData;
- (uint64_t)initWithBytes:()NSData length:;
- (uint64_t)initWithBytes:()NSData length:copy:freeWhenDone:bytesAreVM:;
- (uint64_t)initWithBytesNoCopy:()NSData length:;
- (uint64_t)initWithBytesNoCopy:()NSData length:deallocator:;
- (uint64_t)initWithBytesNoCopy:()NSData length:freeWhenDone:;
- (uint64_t)initWithContentsOfFile:()NSData;
- (uint64_t)initWithContentsOfFile:()NSData error:;
- (uint64_t)initWithContentsOfFile:()NSData options:error:;
- (uint64_t)initWithContentsOfFile:()NSData options:maxLength:error:;
- (uint64_t)initWithContentsOfMappedFile:()NSData;
- (uint64_t)initWithContentsOfMappedFile:()NSData error:;
- (uint64_t)initWithContentsOfURL:()NSData;
- (uint64_t)initWithContentsOfURL:()NSData options:error:;
- (uint64_t)initWithContentsOfURL:()NSData options:maxLength:error:;
- (uint64_t)initWithData:()NSData;
- (uint64_t)isEqual:()NSData;
- (uint64_t)isEqualToData:()NSData;
- (uint64_t)mutableCopyWithZone:()NSData;
- (uint64_t)rangeOfData:()NSData options:range:;
- (uint64_t)writeToFile:()NSData atomically:;
- (uint64_t)writeToFile:()NSData atomically:error:;
- (uint64_t)writeToFile:()NSData options:error:;
- (uint64_t)writeToURL:()NSData atomically:;
- (uint64_t)writeToURL:()NSData options:error:;
- (void)bytes;
- (void)getBytes:()NSData;
- (void)getBytes:()NSData length:;
- (void)getBytes:()NSData range:;
- (void)initWithBytes:()NSData length:copy:deallocator:;
- (void)length;
@end

@implementation NSData(NSData)

+ (id)dataWithBytesNoCopy:()NSData length:freeWhenDone:
{
  return (id)[objc_allocWithZone(a1) initWithBytesNoCopy:a3 length:a4 freeWhenDone:a5];
}

+ (__objc2_class)allocWithZone:()NSData
{
  if ((objc_class *)MEMORY[0x189603F48] == a1) {
    return &___placeholderData;
  }
  else {
    return (__objc2_class **)NSAllocateObject(a1, 0LL, a3);
  }
}

- (uint64_t)initWithBytesNoCopy:()NSData length:freeWhenDone:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 freeWhenDone:a5 bytesAreVM:0];
}

- (uint64_t)initWithBytes:()NSData length:copy:freeWhenDone:bytesAreVM:
{
  v7 = &__block_literal_global_6;
  if (a7) {
    v7 = &__block_literal_global_1;
  }
  if (a6) {
    v8 = v7;
  }
  else {
    v8 = 0LL;
  }
  return [a1 initWithBytes:a3 length:a4 copy:a5 deallocator:v8];
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    return (id)[a1 debugDescription];
  }
  unint64_t v2 = [a1 length];
  v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (void *)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:512];
  objc_msgSend(v4, "appendFormat:", @"{length = %lu, bytes = 0x", v2);
  if (v2 < 0x19)
  {
    for (; v2; --v2)
    {
      unsigned int v8 = *v3++;
      unsigned int v7 = v8;
      if (v8 >= 0xA0) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      bytes[0] = v9 + (v7 >> 4);
      unsigned int v10 = v7 & 0xF;
      if (v10 >= 0xA) {
        char v11 = 87;
      }
      else {
        char v11 = 48;
      }
      bytes[1] = v11 + v10;
      CFStringRef v12 = CFStringCreateWithBytes(0LL, bytes, 2LL, 0x600u, 0);
      [v4 appendString:v12];
      CFRelease(v12);
    }
  }

  else
  {
    unint64_t v5 = -4LL;
    do
    {
      v5 += 4LL;
      append4Bytes(v4, &v3[v5]);
    }

    while (v5 < 0xC);
    [v4 appendString:@"... "];
    unint64_t v6 = v2 - 8;
    do
    {
      append4Bytes(v4, &v3[v6]);
      v6 += 4LL;
    }

    while (v6 < v2);
  }

  [v4 appendString:@"}"];
  return v4;
}

+ (id)_alloc
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___NSData_0;
  return objc_msgSendSuper2(&v2, sel_allocWithZone_, 0);
}

- (uint64_t)copyWithZone:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  return objc_msgSend( objc_allocWithZone(MEMORY[0x189603F48]),  "initWithBytes:length:copy:freeWhenDone:bytesAreVM:",  objc_msgSend(a1, "bytes"),  objc_msgSend(a1, "length"),  1,  0,  0);
}

- (void)length
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v2, *MEMORY[0x189604A10]);
  }
  unint64_t v5 = NSClassFromString((NSString *)@"NSData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (void)bytes
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v2, *MEMORY[0x189604A10]);
  }
  unint64_t v5 = NSClassFromString((NSString *)@"NSData");
  NSRequestConcreteImplementation(a1, a2, v5);
}

- (id)debugDescription
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  unint64_t v3 = [a1 length];
  v4 = (unsigned __int8 *)[a1 bytes];
  unint64_t v5 = v3 << ((v3 & 0x8000000000000000LL) == 0LL);
  unint64_t v6 = v3 >> 2;
  BOOL v8 = __CFADD__(v5, v3 >> 2) || (v3 & 0x8000000000000000LL) != 0LL;
  if (v8) {
    unint64_t v6 = 0LL;
  }
  unint64_t v9 = v6 + v5;
  int v10 = v9 > 0xFFFFFFFFFFFFFFEFLL || v8;
  unint64_t v11 = v9 + 16;
  if (v10) {
    unint64_t v12 = -1LL;
  }
  else {
    unint64_t v12 = v11;
  }
  v13 = (void *)[objc_allocWithZone((Class)NSMutableString) initWithCapacity:v12];
  objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, @"<");
  if (v3 < 5)
  {
    unint64_t v14 = 2LL;
    if (v3)
    {
LABEL_23:
      unint64_t v16 = v14 - 2;
      v14 += 2 * v3;
      while (1)
      {
        v16 += 2LL;
        if (v16 > v12 - 2) {
          break;
        }
        --v3;
        unsigned int v18 = *v4++;
        unsigned int v17 = v18;
        if (v18 >= 0xA0) {
          char v19 = 87;
        }
        else {
          char v19 = 48;
        }
        bytes[0] = v19 + (v17 >> 4);
        unsigned int v20 = v17 & 0xF;
        if (v20 >= 0xA) {
          char v21 = 87;
        }
        else {
          char v21 = 48;
        }
        bytes[1] = v21 + v20;
        CFStringRef v22 = CFStringCreateWithBytes(0LL, bytes, 2LL, 0x600u, 0);
        [v13 appendString:v22];
        CFRelease(v22);
        if (!v3) {
          goto LABEL_32;
        }
      }
    }

    else
    {
LABEL_32:
      if (v14 < v12) {
        objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length"), 0, @">");
      }
    }

    return v13;
  }

  else
  {
    unint64_t v14 = 9 * ((v3 - 5) >> 2) + 11;
    unint64_t v15 = -7LL;
    while (1)
    {
      v15 += 9LL;
      if (v15 > v12 - 9) {
        return v13;
      }
      v3 -= 4LL;
      append4Bytes(v13, v4);
      v4 += 4;
      if (v3 <= 4) {
        goto LABEL_23;
      }
    }
  }

- (id)_asciiDescription
{
  uint64_t v2 = [a1 length];
  unint64_t v3 = (void *)objc_opt_new();
  uint64_t v4 = [a1 bytes];
  if (v2)
  {
    unint64_t v5 = (unsigned __int8 *)v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = 69LL;
    do
    {
      int v9 = *v5++;
      LODWORD(v8) = v9;
      else {
        uint64_t v8 = 32LL;
      }
      objc_msgSend(v3, "appendFormat:", @"%c", v8);
      if (!(v7 + 70 * (v6 / 0x46))) {
        [v3 appendString:@"\n"];
      }
      ++v6;
      --v7;
      --v2;
    }

    while (v2);
  }

  return v3;
}

- (uint64_t)hash
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  [a1 length];
  [a1 bytes];
  return CFHashBytes();
}

- (uint64_t)isEqual:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  if (a3 == a1) {
    return 1LL;
  }
  if (!a3) {
    return 0LL;
  }
  uint64_t result = _NSIsNSData();
  if ((_DWORD)result) {
    return [a1 isEqualToData:a3];
  }
  return result;
}

- (uint64_t)_copyWillRetain
{
  return 0LL;
}

- (uint64_t)mutableCopyWithZone:()NSData
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  uint64_t v3 = [a1 length];
  uint64_t v4 = [objc_alloc(MEMORY[0x189603FB8]) initWithCapacity:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __38__NSData_NSData__mutableCopyWithZone___block_invoke;
    v7[3] = &unk_189C99E28;
    v7[4] = v4;
    [a1 enumerateByteRangesUsingBlock:v7];
  }

  return v5;
}

- (uint64_t)encodeWithCoder:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    return [a3 encodeDataObject:a1];
  }
  if (object_getClass(a3) == (Class)&OBJC_CLASS___NSKeyedArchiver) {
    return [a3 _encodePropertyList:a1 forKey:@"NS.data"];
  }
  return objc_msgSend( a3,  "encodeBytes:length:forKey:",  objc_msgSend(a1, "bytes"),  objc_msgSend(a1, "length"),  @"NS.bytes");
}

- (id)initWithCoder:()NSData
{
  v13[5] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    return (id)[a3 decodeDataObject];
  }

  if ((objc_opt_isKindOfClass() & 1) != 0
    && [a3 containsValueForKey:@"NS.xpcdata"])
  {
    uint64_t v5 = (void *)[a3 decodeXPCObjectOfType:MEMORY[0x1895F9240] forKey:@"NS.xpcdata"];
    if (v5)
    {
      unint64_t v6 = v5;
      xpc_retain(v5);
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      size_t length = xpc_data_get_length(v6);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __32__NSData_NSData__initWithCoder___block_invoke;
      v13[3] = &unk_189C99E50;
      v13[4] = v6;
      return (id)[a1 initWithBytes:bytes_ptr length:length copy:0 deallocator:v13];
    }

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1LL;
}

- (BOOL)_canReplaceWithDispatchDataForXPCCoder
{
  return ([a1 _isDispatchData] & 1) == 0 && (unint64_t)objc_msgSend(a1, "length") > 0xFFF5;
}

- (dispatch_data_t)replacementObjectForCoder:()NSData
{
  NSUInteger v2 = [a1 length];
  uint64_t v3 = NSAllocateMemoryPages(v2);
  [a1 getBytes:v3 length:v2];
  return dispatch_data_create(v3, v2, 0LL, (dispatch_block_t)*MEMORY[0x1895F8AA0]);
}

- (uint64_t)_allowsDirectEncoding
{
  return [a1 _canReplaceWithDispatchDataForXPCCoder] ^ 1;
}

- (void)getBytes:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  uint64_t v6 = [a1 bytes];
  size_t v7 = [a1 length];
  if (v7 < 0x80000)
  {
LABEL_7:
    if (!v7) {
      return;
    }
    goto LABEL_8;
  }

  uint64_t v8 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (v6 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v9 = v7 & -*v8;
      NSCopyMemoryPages((const void *)v6, (void *)a3, v9);
      v6 += v9;
      a3 += v9;
      v7 -= v9;
      goto LABEL_7;
    }
  }

- (void)getBytes:()NSData length:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A10]);
  }
  unint64_t v8 = [a1 length];
  if (v8 < a4) {
    a4 = v8;
  }
  uint64_t v9 = [a1 bytes];
  uint64_t v10 = (char *)v9;
  if (a4 < 0x80000)
  {
LABEL_9:
    if (!a4) {
      return;
    }
    goto LABEL_10;
  }

  uint64_t v11 = (void *)MEMORY[0x1895FD590];
  if (((*MEMORY[0x1895FD590] - 1LL) & (v9 | a3)) == 0)
  {
    malloc_default_zone();
    if (!malloc_zone_claimed_address())
    {
      NSUInteger v12 = a4 & -*v11;
      NSCopyMemoryPages(v10, (void *)a3, v12);
      v10 += v12;
      a3 += v12;
      a4 -= v12;
      goto LABEL_9;
    }
  }

- (uint64_t)enumerateByteRangesUsingBlock:()NSData
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, char *))(a3 + 16))( a3,  [a1 bytes],  0,  objc_msgSend(a1, "length"),  &v7);
}

- (void)getBytes:()NSData range:
{
  NSUInteger v6 = a5;
  if (*MEMORY[0x189604A70])
  {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A10]);
    if (!v6) {
      return;
    }
  }

  else if (!a5)
  {
    return;
  }

  unint64_t v11 = -[objc_class length](a1, "length");
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (__CFADD__(v6, a4))
    {
      unsigned int v17 = _NSMethodExceptionProem(a1, a2);
      v23.location = a4;
      v23.size_t length = v6;
      char v19 = v17;
      unsigned int v20 = NSStringFromRange(v23);
      v13 = @"%@: range %@ causes integer overflow";
      goto LABEL_20;
    }

    if (a4 + v6 > v11)
    {
      NSUInteger v12 = _NSMethodExceptionProem(a1, a2);
      v22.location = a4;
      v22.size_t length = v6;
      unsigned int v20 = NSStringFromRange(v22);
      unint64_t v21 = v11;
      char v19 = v12;
      v13 = @"%@: range %@ exceeds data length %lu";
LABEL_20:
      unsigned int v18 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v19, v20, v21);
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v18 userInfo:0]);
      -[NSData(NSData) _isDispatchData]();
      return;
    }
  }

  else
  {
    if (v11 <= a4)
    {
      unsigned int v20 = (NSString *)a4;
      unint64_t v21 = v11;
      char v19 = _NSMethodExceptionProem(a1, a2);
      v13 = @"%@: location %lu exceeds data length %lu";
      goto LABEL_20;
    }

    if (v6 >= v11 - a4) {
      NSUInteger v6 = v11 - a4;
    }
  }

  NSUInteger v14 = -[objc_class bytes](a1, "bytes") + a4;
  if (v6 >= 0x80000)
  {
    unint64_t v15 = (void *)MEMORY[0x1895FD590];
    if (((*MEMORY[0x1895FD590] - 1LL) & (v14 | a3)) != 0) {
      goto LABEL_15;
    }
    malloc_default_zone();
    NSUInteger v16 = v6 & -*v15;
    NSCopyMemoryPages((const void *)v14, (void *)a3, v16);
    v14 += v16;
    a3 += v16;
    v6 -= v16;
  }

  if (v6) {
LABEL_15:
  }
    memmove((void *)a3, (const void *)v14, v6);
}

- (uint64_t)_isDispatchData
{
  return 0LL;
}

- (uint64_t)_isCompact
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  uint64_t v6 = 0LL;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 1;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __28__NSData_NSData___isCompact__block_invoke;
  v5[3] = &unk_189C99E78;
  v5[4] = a1;
  v5[5] = &v6;
  [a1 enumerateByteRangesUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)isEqualToData:()NSData
{
  uint64_t v5 = a1;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70])
  {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
    if (!a3) {
      return 0LL;
    }
  }

  else if (!a3)
  {
    return 0LL;
  }

  if (a3 == v5) {
    return 1LL;
  }
  size_t v6 = [v5 length];
  if (v6 != [a3 length]) {
    return 0LL;
  }
  BOOL v7 = 1LL;
  if (v6)
  {
    uint64_t v22 = 0LL;
    NSRange v23 = &v22;
    uint64_t v24 = 0x2020000000LL;
    char v25 = 1;
    else {
      uint64_t v8 = 0LL;
    }
    if ([a3 _isCompact])
    {
      char v9 = (const void *)[a3 bytes];
      uint64_t v10 = v9;
      BOOL v11 = v8 != 0LL;
      BOOL v12 = v9 != 0LL;
      if (v8 && v9)
      {
        BOOL v7 = memcmp(v8, v9, v6) == 0;
        *((_BYTE *)v23 + 24) = v7;
LABEL_22:
        _Block_object_dispose(&v22, 8);
        return v7;
      }
    }

    else
    {
      BOOL v12 = 0;
      uint64_t v10 = 0LL;
      BOOL v11 = v8 != 0LL;
    }

    if (v11 || v12)
    {
      if (v11) {
        uint64_t v5 = a3;
      }
      v20[1] = MEMORY[0x1895F87A8];
      v20[2] = 3221225472LL;
      v20[3] = __32__NSData_NSData__isEqualToData___block_invoke;
      v20[4] = &unk_189C99EA0;
      v21[1] = v8;
      v21[2] = v10;
      v13 = v21;
    }

    else
    {
      uint64_t v15 = MEMORY[0x1895F87A8];
      uint64_t v16 = 3221225472LL;
      unsigned int v17 = __32__NSData_NSData__isEqualToData___block_invoke_2;
      unsigned int v18 = &unk_189C99E78;
      char v19 = a3;
      v13 = v20;
    }

    void *v13 = &v22;
    objc_msgSend(v5, "enumerateByteRangesUsingBlock:", v15, v16, v17, v18, v19);
    BOOL v7 = *((_BYTE *)v23 + 24) != 0;
    goto LABEL_22;
  }

  return v7;
}

- (id)subdataWithRange:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A10]);
  }
  unint64_t v9 = -[objc_class length](a1, "length");
  if (!a4) {
    return (id)[MEMORY[0x189603F48] data];
  }
  if (__CFADD__(a4, a3))
  {
    NSUInteger v14 = _NSMethodExceptionProem(a1, a2);
    v19.location = a3;
    v19.size_t length = a4;
    uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v14,  NSStringFromRange(v19),  v18);
LABEL_22:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:v15 userInfo:0]);
    return (id)-[NSData(NSData) writeToFile:options:error:]();
  }

  if (a3 + a4 > v9)
  {
    unint64_t v16 = v9;
    unsigned int v17 = _NSMethodExceptionProem(a1, a2);
    v20.location = a3;
    v20.size_t length = a4;
    uint64_t v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ exceeds data length %lu",  v17,  NSStringFromRange(v20),  v16);
    goto LABEL_22;
  }

  if (a3 || a4 != v9)
  {
    if (a4 >= 0x40
      && ((__objc2_class *)objc_opt_class() != &OBJC_CLASS___NSConcreteData
       || -[objc_class _copyWillRetain](a1, "_copyWillRetain"))
      && ((__objc2_class *)objc_opt_class() == &OBJC_CLASS___NSConcreteData
       || (uint64_t v12 = objc_opt_class(), v12 == objc_opt_class())
       || (uint64_t v13 = objc_opt_class(), v13 == objc_opt_class())
       || a4 >> 15))
    {
      uint64_t v10 = (void *)objc_msgSend( objc_allocWithZone((Class)NSSubrangeData),  "initWithData:range:",  a1,  a3,  a4);
    }

    else
    {
      uint64_t v10 = (void *)objc_msgSend( objc_allocWithZone(MEMORY[0x189603F48]),  "initWithBytes:length:",  -[objc_class bytes](a1, "bytes") + a3,  a4);
    }
  }

  else
  {
    uint64_t v10 = (void *)-[objc_class copyWithZone:](a1, "copyWithZone:", 0LL);
  }

  return v10;
}

- (uint64_t)writeToFile:()NSData options:error:
{
  if (!*MEMORY[0x189604A70])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil file argument",  _NSMethodExceptionProem(a1, a2));
LABEL_10:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v12 userInfo:0]);
    return -[NSData(NSData) writeToURL:options:error:]();
  }

  ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A10]);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  if ((~(_BYTE)a4 & 3) == 0)
  {
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic",  _NSMethodExceptionProem(a1, a2));
    goto LABEL_10;
  }

  else {
    return [MEMORY[0x189603F48] _writeDataToPath:a3 data:a1 options:a4 reportProgress:1 error:a5];
  }
}

- (uint64_t)writeToURL:()NSData options:error:
{
  if (*MEMORY[0x189604A70])
  {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A10]);
    if (a3) {
      goto LABEL_3;
    }
LABEL_14:
    NSUInteger v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil URL argument",  _NSMethodExceptionProem(a1, a2));
    goto LABEL_16;
  }

  if (!a3) {
    goto LABEL_14;
  }
LABEL_3:
  if ((~(_DWORD)a4 & 3LL) != 0)
  {
    if ([a3 isFileURL])
    {
      uint64_t v11 = [a3 _securePath];
      if (v11) {
        return -[objc_class writeToFile:options:error:](a1, "writeToFile:options:error:", v11, a4, a5);
      }
      if (!a5) {
        return 0LL;
      }
      uint64_t v13 = 4LL;
    }

    else
    {
      if (!a5) {
        return 0LL;
      }
      uint64_t v13 = 518LL;
    }

    *a5 = _NSErrorWithFilePath(v13, (uint64_t)a3);
    return 0LL;
  }

  NSUInteger v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: NSDataWritingWithoutOverwriting is not supported with NSDataWritingAtomic",  _NSMethodExceptionProem(a1, a2));
LABEL_16:
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v14 userInfo:0]);
  return -[NSData(NSData) writeToFile:atomically:error:]();
}

- (uint64_t)writeToFile:()NSData atomically:error:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A10]);
  }
  return [a1 writeToFile:a3 options:a4 error:a5];
}

- (uint64_t)writeToFile:()NSData atomically:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A10]);
  }
  else {
    return [MEMORY[0x189603F48] _writeDataToPath:a3 data:a1 options:a4 reportProgress:1 error:0];
  }
}

- (uint64_t)writeToURL:()NSData atomically:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A10]);
  }
  else {
    return 0LL;
  }
}

+ (id)data
{
  return (id)[objc_allocWithZone(a1) initWithBytes:0 length:0];
}

+ (id)dataWithBytes:()NSData length:
{
  return (id)[objc_allocWithZone(a1) initWithBytes:a3 length:a4];
}

+ (id)dataWithBytesNoCopy:()NSData length:
{
  return (id)[objc_allocWithZone(a1) initWithBytesNoCopy:a3 length:a4];
}

+ (id)dataWithContentsOfFile:()NSData
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfFile:a3];
}

+ (id)dataWithContentsOfURL:()NSData
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3];
}

+ (id)dataWithContentsOfMappedFile:()NSData
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfMappedFile:a3];
}

+ (id)dataWithContentsOfFile:()NSData options:error:
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfFile:a3 options:a4 error:a5];
}

+ (id)dataWithContentsOfURL:()NSData options:error:
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3 options:a4 error:a5];
}

+ (id)dataWithContentsOfURL:()NSData options:maxLength:error:
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3 options:a4 maxLength:a5 error:a6];
}

+ (id)dataWithData:()NSData
{
  if (a3)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x189603FB8];
    if ((Class)MEMORY[0x189603F48] == a1 && _CFExecutableLinkedOnOrAfter())
    {
      size_t v6 = (void *)[a3 copyWithZone:0];
      return v6;
    }

    if (v5 == a1)
    {
      size_t v6 = (void *)[a3 mutableCopyWithZone:0];
      return v6;
    }
  }

  size_t v6 = (void *)objc_msgSend( objc_allocWithZone(a1),  "initWithBytes:length:",  objc_msgSend(a3, "bytes"),  objc_msgSend(a3, "length"));
  return v6;
}

- (uint64_t)initWithBytes:()NSData length:
{
  return [a1 initWithBytes:a3 length:a4 copy:1 freeWhenDone:0 bytesAreVM:0];
}

- (uint64_t)initWithBytesNoCopy:()NSData length:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 freeWhenDone:1 bytesAreVM:0];
}

- (uint64_t)initWithBytesNoCopy:()NSData length:deallocator:
{
  return [a1 initWithBytes:a3 length:a4 copy:0 deallocator:a5];
}

- (void)initWithBytes:()NSData length:copy:deallocator:
{
}

- (uint64_t)initWithContentsOfFile:()NSData
{
  v10[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = pathifiedNSURL(a3, 0LL);
  if (v5
    && (LOBYTE(v7) = 1,
        ([MEMORY[0x189603F48] _readBytesFromPath:v5 maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v10 length:&v9 didMap:&v8 options:0 reportProgress:v7 error:0] & 1) != 0))
  {
    if (v8) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  a1,  @"NSData.m",  918LL,  @"Data should not have been mapped");
    }
    return [a1 initWithBytes:v10[0] length:v9 copy:0 freeWhenDone:1 bytesAreVM:0];
  }

  else
  {

    return 0LL;
  }

- (uint64_t)initWithContentsOfFile:()NSData options:maxLength:error:
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    unint64_t v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil file argument",  _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v16 userInfo:0]);
  }

  char v18 = 0;
  uint64_t v10 = pathifiedNSURL(a3, a6);
  if (v10
    && ((uint64_t v11 = v10, a5 >= 0x7FFFFFFFFFFFFFFFLL) ? (v12 = 0x7FFFFFFFFFFFFFFFLL) : (v12 = a5),
        LOBYTE(v17) = 1,
        ([MEMORY[0x189603F48] _readBytesFromPath:v10 maxLength:v12 bytes:v20 length:&v19 didMap:&v18 options:a4 reportProgress:v17 error:a6] & 1) != 0))
  {
    if (v18) {
      uint64_t v13 = &__block_literal_global_2;
    }
    else {
      uint64_t v13 = &__block_literal_global_6;
    }
    uint64_t result = -[objc_class initWithBytes:length:copy:deallocator:]( a1,  "initWithBytes:length:copy:deallocator:",  v20[0],  v19,  0LL,  v13);
    if (a6)
    {
      if (!result)
      {
        uint64_t v15 = _NSErrorWithFilePath(256LL, v11);
        uint64_t result = 0LL;
        *a6 = v15;
      }
    }
  }

  else
  {

    return 0LL;
  }

  return result;
}

- (uint64_t)initWithContentsOfURL:()NSData options:maxLength:error:
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil URL argument",  _NSMethodExceptionProem(a1, a2));

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v17 userInfo:0]);
  }

  if ([a3 isFileURL])
  {
    uint64_t v11 = [a3 _securePath];
    if (v11) {
      return (uint64_t)-[objc_class initWithContentsOfFile:options:maxLength:error:]( a1,  "initWithContentsOfFile:options:maxLength:error:",  v11,  a4,  a5,  a6);
    }

    if (!a6) {
      return 0LL;
    }
    unint64_t v16 = _NSErrorWithFilePath(4LL, (uint64_t)a3);
    uint64_t v15 = 0LL;
    goto LABEL_17;
  }

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189601EE8]) initWithURL:a3 cachePolicy:1 timeoutInterval:60.0];
  v18[0] = 0LL;
  uint64_t v14 = [MEMORY[0x189601EC0] sendSynchronousRequest:v13 returningResponse:v18 error:0];

  if (!v18[0] || !v14)
  {
    if (!v14) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v15 = -[objc_class initWithData:](a1, "initWithData:", v14);
    if (!a6) {
      return v15;
    }
    goto LABEL_13;
  }

  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(MEMORY[0x189601EA0], "isErrorStatusCode:", objc_msgSend(v18[0], "statusCode")) & 1) == 0)
  {
    goto LABEL_12;
  }

- (uint64_t)initWithContentsOfFile:()NSData options:error:
{
  return [a1 initWithContentsOfFile:a3 options:a4 maxLength:-1 error:a5];
}

- (uint64_t)initWithContentsOfURL:()NSData options:error:
{
  return [a1 initWithContentsOfURL:a3 options:a4 maxLength:-1 error:a5];
}

- (uint64_t)initWithContentsOfURL:()NSData
{
  v9[1] = *(id *)MEMORY[0x1895F89C0];
  if ([a3 isFileURL])
  {
    uint64_t v5 = [a3 _securePath];
    if (v5) {
      return [a1 initWithContentsOfFile:v5];
    }
    goto LABEL_9;
  }

  if (!a3) {
    return 0LL;
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189601EE8]) initWithURL:a3 cachePolicy:1 timeoutInterval:60.0];
  v9[0] = 0LL;
  uint64_t v8 = [MEMORY[0x189601EC0] sendSynchronousRequest:v7 returningResponse:v9 error:0];

  if (v9[0] && v8)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x189601EA0], "isErrorStatusCode:", objc_msgSend(v9[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_9;
    }
  }

  else if (!v8)
  {
LABEL_9:

    return 0LL;
  }

  return [a1 initWithData:v8];
}

- (uint64_t)initWithContentsOfMappedFile:()NSData
{
  v9[1] = *MEMORY[0x1895F89C0];
  char v7 = 0;
  LOBYTE(v6) = 1;
  if ([MEMORY[0x189603F48] _readBytesFromPath:a3 maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v9 length:&v8 didMap:&v7 options:8 reportProgress:v6 error:0])
  {
    if (v7) {
      uint64_t v4 = &__block_literal_global_2;
    }
    else {
      uint64_t v4 = &__block_literal_global_6;
    }
    return [a1 initWithBytes:v9[0] length:v8 copy:0 deallocator:v4];
  }

  else
  {

    return 0LL;
  }

- (uint64_t)initWithContentsOfMappedFile:()NSData error:
{
  return [a1 initWithContentsOfFile:a3 options:1 error:a4];
}

- (uint64_t)initWithContentsOfFile:()NSData error:
{
  return [a1 initWithContentsOfFile:a3 options:0 error:a4];
}

- (uint64_t)initWithData:()NSData
{
  uint64_t v5 = [a3 length];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [a3 bytes];
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 1LL;
  }

  else
  {
    uint64_t v8 = a1;
    uint64_t v7 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

  return [v8 initWithBytes:v7 length:v9 copy:v10 freeWhenDone:0 bytesAreVM:0];
}

+ (_NSClrDat)_newZeroingDataWithBytes:()NSData length:
{
  return -[NSConcreteData initWithBytes:length:copy:deallocator:]( objc_alloc(&OBJC_CLASS____NSClrDat),  "initWithBytes:length:copy:deallocator:",  a3,  a4,  1LL,  0LL);
}

+ (_NSClrDat)_newZeroingDataWithBytesNoCopy:()NSData length:deallocator:
{
  return -[NSConcreteData initWithBytes:length:copy:deallocator:]( objc_alloc(&OBJC_CLASS____NSClrDat),  "initWithBytes:length:copy:deallocator:",  a3,  a4,  0LL,  a5);
}

- (uint64_t)rangeOfData:()NSData options:range:
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (!*MEMORY[0x189604A70])
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_16:
    unint64_t v21 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil data argument",  _NSMethodExceptionProem(a1, a2));
    uint64_t v22 = (void *)MEMORY[0x189603F70];
    NSRange v23 = (void *)MEMORY[0x189603A60];
LABEL_22:
    objc_exception_throw((id)[v22 exceptionWithName:*v23 reason:v21 userInfo:0]);
    return -[NSData(NSData) _createDispatchData]();
  }

  ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v6, *MEMORY[0x189604A10]);
  if (!a3) {
    goto LABEL_16;
  }
LABEL_3:
  unint64_t v13 = -[objc_class length](a1, "length");
  if (__CFADD__(a6, a5))
  {
    uint64_t v24 = _NSMethodExceptionProem(a1, a2);
    v30.location = a5;
    v30.size_t length = a6;
    char v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ causes integer overflow",  v24,  NSStringFromRange(v30));
LABEL_21:
    unint64_t v21 = v25;
    uint64_t v22 = (void *)MEMORY[0x189603F70];
    NSRange v23 = (void *)MEMORY[0x189603B40];
    goto LABEL_22;
  }

  if (a5 + a6 > v13)
  {
    unint64_t v26 = v13;
    v27 = _NSMethodExceptionProem(a1, a2);
    v28 = v27;
    if (a6)
    {
      v31.location = a5;
      v31.size_t length = a6;
      char v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: range %@ exceeds data length %lu",  v28,  NSStringFromRange(v31),  v26);
    }

    else
    {
      char v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: location %lu exceeds data length %lu",  v27,  a5,  v26);
    }

    goto LABEL_21;
  }

  uint64_t v14 = -[objc_class _isCompact](a1, "_isCompact");
  if ((_DWORD)v14)
  {
    uint64_t result = _CFDataFindBytes();
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  else
  {
    MEMORY[0x1895F8858](v14);
    uint64_t v17 = (char *)v29 - v16;
    char v18 = (char *)v29 - v16;
    if (a6 >= 0x101) {
      char v18 = (char *)malloc(a6);
    }
    -[objc_class getBytes:range:](a1, "getBytes:range:", v18, a5, a6);
    uint64_t v19 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSConcreteData),  "initWithBytesNoCopy:length:freeWhenDone:",  v18,  a6,  v18 != v17);
    uint64_t v20 = -[NSData rangeOfData:options:range:](v19, "rangeOfData:options:range:", a3, a4, 0LL, a6);

    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      return v20 + a5;
    }
  }

  return result;
}

- (uint64_t)_createDispatchData
{
  return _NSDataCreateDispatchDataFromData(a1, 1);
}

- (uint64_t)_decodeBase64EncodedCharacterBuffer:()NSData length:options:buffer:bufferLength:state:
{
  if (a8)
  {
    BOOL v8 = *(_BYTE *)a8 != 0;
    BOOL v9 = *(_BYTE *)(a8 + 1) != 0;
    unint64_t v11 = *(void *)(a8 + 8);
    uint64_t v10 = *(void *)(a8 + 16);
    unint64_t v12 = *(void *)(a8 + 24);
    int v13 = *(_DWORD *)(a8 + 32);
  }

  else
  {
    int v13 = 0;
    unint64_t v12 = 0LL;
    uint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    BOOL v9 = 0;
    BOOL v8 = 0;
  }

  unint64_t v14 = 0LL;
  BOOL v15 = a4 == 0;
  if (a4 && !v9)
  {
    unint64_t v14 = 0LL;
    unint64_t v16 = a4 - 1;
    int v17 = 2;
    while (1)
    {
      if (*(char *)(a3 + v14) < 0 || (int v18 = _decodeCharacter_DataDecodeTable[*(unsigned __int8 *)(a3 + v14)], v18 < 0))
      {
        if ((a5 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_14;
      }

      if (*(_BYTE *)(a3 + v14) == 61)
      {
        if ((a5 & 0x10000000) != 0 && !v10) {
          goto LABEL_14;
        }
        ++v12;
      }

      else if ((a5 & 1) == 0 && v12)
      {
LABEL_60:
        char v25 = 0;
        goto LABEL_61;
      }

      int v13 = v18 + (v13 << 6);
      if (++v10 == 4) {
        break;
      }
LABEL_14:
      ++v14;
      ++v17;
      if (v14 == a4)
      {
        BOOL v9 = 0;
        BOOL v15 = 1;
        unint64_t v14 = a4;
        goto LABEL_42;
      }
    }

    int v19 = 1;
    if (a7 < 3 || a7 - 3 < v11 || v12 == 3)
    {
      char v25 = 0;
      unint64_t v24 = v11;
      uint64_t v10 = 4LL;
      goto LABEL_62;
    }

    BOOL v20 = v14 == v16;
    if (v14 != v16 && v12)
    {
      unint64_t v21 = (int)v14 + 1;
      if (v21 < a4)
      {
        int v22 = v17;
        while (1)
        {
          uint64_t v23 = *(unsigned __int8 *)(a3 + v21);
          if (v23 != 61
            && ((a5 & 1) == 0 || (v23 & 0x80) == 0 && (_decodeCharacter_DataDecodeTable[v23] & 0x80000000) == 0))
          {
            break;
          }

          unint64_t v21 = v22++;
          if (v21 >= a4) {
            goto LABEL_31;
          }
        }

        BOOL v20 = 0;
        unint64_t v24 = v11 + 1;
        *(_BYTE *)(a6 + v11) = BYTE2(v13);
LABEL_36:
        *(_BYTE *)(a6 + v24) = BYTE1(v13);
        unint64_t v24 = v11 + 2;
        if (!v20)
        {
LABEL_38:
          *(_BYTE *)(a6 + v24++) = v13;
LABEL_39:
          uint64_t v10 = 0LL;
          if ((a5 & 1) == 0 && v12)
          {
            uint64_t v10 = 0LL;
            char v25 = 1;
            int v19 = 1;
            if (v8) {
              goto LABEL_62;
            }
            goto LABEL_44;
          }

          unint64_t v11 = v24;
          unint64_t v12 = 0LL;
          goto LABEL_14;
        }

+ (BOOL)_base64DecodingAlwaysSucceedsForOptions:()NSData
{
  return a3 == 1 && _CFAppVersionCheck() != 0;
}

- (uint64_t)_initWithBase64EncodedObject:()NSData options:
{
  uint64_t v33 = a4;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  unint64_t v7 = [a3 length];
  if (!v7) {
    return (uint64_t)-[objc_class initWithBytes:length:](a1, "initWithBytes:length:", 0LL, 0LL);
  }
  unint64_t v8 = v7;
  size_t v9 = 3 * (v7 >> 2);
  uint64_t v10 = malloc_default_zone();
  unint64_t v11 = malloc_zone_malloc(v10, v9);
  if (!v11)
  {
    unsigned int v29 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unable to allocate memory for length (%lu)",  _NSMethodExceptionProem(a1, a2),  v9);

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:v29 userInfo:0]);
    char v31 = v30;
    _Block_object_dispose(&v35, 8);
    _Unwind_Resume(v31);
  }

  unint64_t v12 = v11;
  uint64_t v35 = 0LL;
  v36 = &v35;
  uint64_t v37 = 0x4810000000LL;
  v38 = &unk_183A8509D;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v41 = 0LL;
  uint64_t v13 = _NSIsNSString();
  if ((_DWORD)v13)
  {
    uint64_t v14 = 0LL;
    do
    {
      if (v8 == v14) {
        break;
      }
      if (v8 - v14 >= 0x400) {
        uint64_t v15 = 1024LL;
      }
      else {
        uint64_t v15 = v8 - v14;
      }
      MEMORY[0x1895F8858](v13);
      int v17 = (unsigned __int16 *)((char *)&v32 - v16);
      *(void *)&double v19 = MEMORY[0x1895F8858](v18).n128_u64[0];
      unint64_t v21 = (char *)&v32 - v20;
      objc_msgSend(a3, "getCharacters:range:", v17, v14, v15, v19);
      if (v15)
      {
        int v22 = v21;
        uint64_t v23 = v15;
        do
        {
          unsigned int v25 = *v17++;
          char v24 = v25;
          if (v25 >= 0x80) {
            char v24 = 0;
          }
          *v22++ = v24;
          --v23;
        }

        while (v23);
      }

      uint64_t v13 = -[objc_class _decodeBase64EncodedCharacterBuffer:length:options:buffer:bufferLength:state:]( a1,  "_decodeBase64EncodedCharacterBuffer:length:options:buffer:bufferLength:state:",  v21,  v15,  v33,  v12,  v9,  v36 + 4);
      v14 += v15;
    }

    while ((v13 & 1) != 0);
  }

  else
  {
    v34[0] = MEMORY[0x1895F87A8];
    v34[1] = 3221225472LL;
    v34[2] = __55__NSData_NSData___initWithBase64EncodedObject_options___block_invoke;
    v34[3] = &unk_189C99F00;
    v34[6] = v33;
    v34[7] = v12;
    v34[8] = v9;
    v34[4] = a1;
    v34[5] = &v35;
    [a3 enumerateByteRangesUsingBlock:v34];
  }

  v27 = v36;
  if (*((_BYTE *)v36 + 32) || v36[6])
  {
    if (![(id)objc_opt_class() _base64DecodingAlwaysSucceedsForOptions:v33])
    {

      free(v12);
      uint64_t v28 = 0LL;
      goto LABEL_24;
    }

    v27 = v36;
  }

  uint64_t v28 = -[objc_class initWithBytes:length:copy:freeWhenDone:bytesAreVM:]( a1,  "initWithBytes:length:copy:freeWhenDone:bytesAreVM:",  v12,  v27[5],  0LL,  1LL,  0LL);
LABEL_24:
  _Block_object_dispose(&v35, 8);
  return v28;
}

- (NSString)_base64EncodingAsString:()NSData withOptions:
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!-[objc_class length](a1, "length"))
  {
    if (a3) {
      return +[NSString string](&OBJC_CLASS___NSString, "string");
    }
    else {
      return (NSString *)[MEMORY[0x189603F48] data];
    }
  }

  unint64_t v8 = -[objc_class length](a1, "length");
  size_t v9 = 4 * (v8 / 3) + 4LL * (v8 != 3 * (v8 / 3));
  if (v9 < v8)
  {
LABEL_15:
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: data is too large to encode",  _NSMethodExceptionProem(a1, a2));
    uint64_t v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = (void *)MEMORY[0x189603B40];
    goto LABEL_29;
  }

  if ((a4 & 3) == 1LL)
  {
    unint64_t v10 = 64LL;
  }

  else
  {
    if ((a4 & 3) != 2LL)
    {
      unint64_t v10 = 0LL;
      unint64_t v12 = a4 & 0x30;
      goto LABEL_17;
    }

    unint64_t v10 = 76LL;
  }

  if ((a4 & 0x30) != 0) {
    unint64_t v12 = a4 & 0x30;
  }
  else {
    unint64_t v12 = 48LL;
  }
  uint64_t v13 = (v12 >> 4) & 1;
  if (v12 > 0x1F) {
    ++v13;
  }
  v9 += ((__PAIR128__(v9 / v10, v9 % v10) - 1) >> 64) * v13;
  if (v9 < v8) {
    goto LABEL_15;
  }
LABEL_17:
  int v17 = malloc(v9);
  if (!v17)
  {
    uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: unable to allocate memory for length (%lu)",  _NSMethodExceptionProem(a1, a2),  v9);
    uint64_t v15 = (void *)MEMORY[0x189603F70];
    uint64_t v16 = (void *)MEMORY[0x189603B38];
LABEL_29:
    objc_exception_throw((id)[v15 exceptionWithName:*v16 reason:v14 userInfo:0]);
    unsigned int v29 = v28;
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Unwind_Resume(v29);
  }

  uint64_t v18 = v17;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  v31[3] = v10;
  v30[0] = MEMORY[0x1895F87A8];
  v30[1] = 3221225472LL;
  v30[2] = __54__NSData_NSData___base64EncodingAsString_withOptions___block_invoke;
  v30[3] = &unk_189C99F28;
  v30[4] = &v40;
  v30[5] = v31;
  v30[8] = v10;
  v30[9] = v12;
  v30[10] = v17;
  v30[6] = &v36;
  v30[7] = &v32;
  -[objc_class enumerateByteRangesUsingBlock:](a1, "enumerateByteRangesUsingBlock:", v30);
  unint64_t v19 = v41[3] % 3uLL;
  if (v19 == 1)
  {
    char v22 = _base64EncodingAsString_withOptions__DataEncodeTable[16 * (v33[3] & 3)];
    unint64_t v21 = v37 + 3;
    uint64_t v23 = v37[3];
    v37[3] = v23 + 1;
    v18[v23] = v22;
    char v20 = 61;
    goto LABEL_22;
  }

  if (v19 == 2)
  {
    char v20 = _base64EncodingAsString_withOptions__DataEncodeTable[4 * (v33[3] & 0xF)];
    unint64_t v21 = v37 + 3;
LABEL_22:
    uint64_t v24 = (*v21)++;
    v18[v24] = v20;
    uint64_t v25 = (*v21)++;
    v18[v25] = 61;
  }

  if (a3) {
    unint64_t v26 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v18,  v9,  1LL,  1LL);
  }
  else {
    unint64_t v26 = (NSString *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v18 length:v9 copy:0 freeWhenDone:1 bytesAreVM:0];
  }
  v27 = v26;
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  return v27;
}

- (uint64_t)initWithBase64EncodedString:()NSData options:
{
  if (a3) {
    return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
  }
  uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil string argument",  _NSMethodExceptionProem(a1, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
  return -[NSData(NSData) base64EncodedStringWithOptions:]();
}

- (uint64_t)base64EncodedStringWithOptions:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  return [a1 _base64EncodingAsString:1 withOptions:a3];
}

- (uint64_t)initWithBase64EncodedData:()NSData options:
{
  if (a3) {
    return -[objc_class _initWithBase64EncodedObject:options:](a1, "_initWithBase64EncodedObject:options:");
  }
  uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil data argument",  _NSMethodExceptionProem(a1, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
  return -[NSData(NSData) base64EncodedDataWithOptions:]();
}

- (uint64_t)base64EncodedDataWithOptions:()NSData
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A10]);
  }
  return [a1 _base64EncodingAsString:0 withOptions:a3];
}

- (uint64_t)initWithBase64Encoding:()NSData
{
  if (a3) {
    return -[objc_class _initWithBase64EncodedObject:options:]( a1,  "_initWithBase64EncodedObject:options:",  a3,  268435457LL);
  }
  uint64_t v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil string argument",  _NSMethodExceptionProem(a1, a2));

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v5 userInfo:0]);
  return -[NSData(NSData) base64Encoding]();
}

- (uint64_t)base64Encoding
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A10]);
  }
  return [a1 _base64EncodingAsString:1 withOptions:0];
}

- (uint64_t)_providesConcreteBacking
{
  return 0LL;
}

@end