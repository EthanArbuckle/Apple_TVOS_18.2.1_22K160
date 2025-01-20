@interface NSString(NSStringSASerializable)
+ (const)classDictionaryKey;
+ (const)newInstanceWithoutReferencesFromSerializedBuffer:()NSStringSASerializable bufferLength:;
- (uint64_t)addSelfToBuffer:()NSStringSASerializable bufferLength:withCompletedSerializationDictionary:;
- (uint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:()NSStringSASerializable;
@end

@implementation NSString(NSStringSASerializable)

+ (const)classDictionaryKey
{
  return @"NSStringPASeriablizable";
}

- (uint64_t)addSelfToBuffer:()NSStringSASerializable bufferLength:withCompletedSerializationDictionary:
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (!a3) {
    goto LABEL_11;
  }
  v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  *(void *)a3 = 4277001901LL;
  [a1 dataUsingEncoding:4 allowLossyConversion:1];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    *(void *)(a3 + 8) = 1LL;
    *(_BYTE *)(a3 + 16) = 0;
    goto LABEL_7;
  }

  if ([v10 length] + 1 > (unint64_t)(a4 - 16))
  {
    int v14 = *__error();
    _sa_logt();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = a4 - 17;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = [a1 UTF8String];
      __int16 v27 = 2048;
      uint64_t v28 = v16;
      __int16 v29 = 2048;
      uint64_t v30 = [v11 length];
      _os_log_error_impl( &dword_186C92000,  v15,  OS_LOG_TYPE_ERROR,  "%s claimed it was %lu UTF8 characters, but ended up being %lu",  buf,  0x20u);
    }

    *__error() = v14;
    char v17 = [a1 UTF8String];
    [v11 length];
    _SASetCrashLogMessage( 768,  "%s claimed it was %lu UTF8 characters, but ended up being %lu",  v18,  v19,  v20,  v21,  v22,  v23,  v17);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Invalid args",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  id v12 = v11;
  memmove((void *)(a3 + 16), (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  *(_BYTE *)(a3 + 16 + [v12 length]) = 0;
  *(void *)(a3 + 8) = [v12 length] + 1;
LABEL_7:

  return 1LL;
}

- (void)addSelfToSerializationDictionary:()NSStringSASerializable
{
  v4 = (void *)NSString;
  id v5 = a3;
  [v4 classDictionaryKey];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);
}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return [a1 lengthOfBytesUsingEncoding:4] + 17;
}

+ (const)newInstanceWithoutReferencesFromSerializedBuffer:()NSStringSASerializable bufferLength:
{
  if (!a3)
  {
    id v5 = @"Invalid buffer";
LABEL_12:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v5,  0LL);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
    return +[NSUUID(NSUUIDSASerializable) classDictionaryKey]();
  }

  if (*a3 != 4277001901LL)
  {
    id v5 = @"Bad SANSString magic";
    goto LABEL_12;
  }

  uint64_t v3 = a3[1];
  if (!v3)
  {
    id v5 = @"0-length SANSString";
    goto LABEL_12;
  }

  if (*((_BYTE *)a3 + v3 + 15))
  {
    id v5 = @"Non-nul terminated SANSString";
    goto LABEL_12;
  }

  SANSStringForCString(a3 + 2);
  result = (const __CFString *)objc_claimAutoreleasedReturnValue();
  if (!result)
  {
    id v5 = @"Got a nil string";
    goto LABEL_12;
  }

  return result;
}

@end