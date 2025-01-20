@interface SAPAStyleFanSpeed
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleFanSpeed

+ (id)classDictionaryKey
{
  return @"PASerializedFanSpeed";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleFanSpeed",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleFanSpeed addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleFanSpeed",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleFanSpeed sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleFanSpeed newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    id v9 = @"NULL serializedFanSpeed";
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v9,  0LL);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
    JUMPOUT(0x186CF441CLL);
  }

  if (*(void *)a3 != 4205488804LL)
  {
    id v9 = @"Bad PAFanSpeed magic";
    goto LABEL_6;
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleFanSpeed);
  uint64_t v6 = +[SAFanSpeed fanSpeedWithPAStyleSerializedFanSpeed:]((uint64_t)&OBJC_CLASS___SAFanSpeed, (uint64_t)a3);
  fanSpeed = v5->_fanSpeed;
  v5->_fanSpeed = (SAFanSpeed *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end