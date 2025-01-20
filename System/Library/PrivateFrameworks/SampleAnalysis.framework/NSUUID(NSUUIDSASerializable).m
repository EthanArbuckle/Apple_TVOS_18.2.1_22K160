@interface NSUUID(NSUUIDSASerializable)
+ (NSString)newInstanceWithoutReferencesFromSerializedBuffer:()NSUUIDSASerializable bufferLength:;
+ (const)classDictionaryKey;
- (uint64_t)addSelfToBuffer:()NSUUIDSASerializable bufferLength:withCompletedSerializationDictionary:;
- (uint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:()NSUUIDSASerializable;
@end

@implementation NSUUID(NSUUIDSASerializable)

+ (const)classDictionaryKey
{
  return @"NSUUIDPASeriablizable";
}

- (uint64_t)addSelfToBuffer:()NSUUIDSASerializable bufferLength:withCompletedSerializationDictionary:
{
  id v7 = a5;
  if (a3 && (v8 = v7) != 0LL)
  {
    *a3 = 4277006349LL;
    [a1 getUUIDBytes:a3 + 1];

    return 1LL;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Invalid args",  0LL);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
    return -[NSUUID(NSUUIDSASerializable) addSelfToSerializationDictionary:]();
  }

- (void)addSelfToSerializationDictionary:()NSUUIDSASerializable
{
  v4 = (void *)MEMORY[0x189607AB8];
  id v5 = a3;
  [v4 classDictionaryKey];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v5, a1, v6);
}

- (uint64_t)sizeInBytesForSerializedVersion
{
  return 24LL;
}

+ (NSString)newInstanceWithoutReferencesFromSerializedBuffer:()NSUUIDSASerializable bufferLength:
{
  if (!a3)
  {
    v4 = @"Invalid buffer";
LABEL_8:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v4,  0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
    return -[SAModelExecution debugDescription](v6, v7);
  }

  if (*a3 != 4277006349LL)
  {
    v4 = @"Bad SANSUUID magic";
    goto LABEL_8;
  }

  uuidForBytes((uint64_t)(a3 + 1));
  result = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!result)
  {
    v4 = @"Got a nil UUID";
    goto LABEL_8;
  }

  return result;
}

@end