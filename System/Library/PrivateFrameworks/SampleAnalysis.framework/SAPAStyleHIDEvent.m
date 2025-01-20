@interface SAPAStyleHIDEvent
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleHIDEvent

+ (id)classDictionaryKey
{
  return @"PASerializedHIDEvent";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleHIDEvent",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleHIDEvent addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleHIDEvent",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleHIDEvent sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleHIDEvent newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    id v9 = @"NULL serializedHIDEvent";
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v9,  0LL);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
    JUMPOUT(0x186CF458CLL);
  }

  if (*(void *)a3 != 1105100401LL)
  {
    id v9 = @"Bad SAPAStyleHIDEvent magic";
    goto LABEL_6;
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleHIDEvent);
  uint64_t v6 = +[SAHIDEvent hidEventWithoutReferencesFromPAStyleSerializedHIDEvent:]((uint64_t)&OBJC_CLASS___SAHIDEvent, (uint64_t)a3);
  hidEvent = v5->_hidEvent;
  v5->_hidEvent = (SAHIDEvent *)v6;

  return v5;
}

- (void).cxx_destruct
{
}

@end