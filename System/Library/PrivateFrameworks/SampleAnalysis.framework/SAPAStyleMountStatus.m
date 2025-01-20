@interface SAPAStyleMountStatus
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleMountStatus

+ (id)classDictionaryKey
{
  return @"PASerializedMountStatus";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleMountStatus",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleMountStatus addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleMountStatus",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleMountStatus sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleMountStatus newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (*(void *)a3 == 3735928559LL)
  {
    SEL v4 = objc_alloc_init(&OBJC_CLASS___SAPAStyleMountStatus);
    id v5 = objc_alloc_init(&OBJC_CLASS___SAMountStatus);
    mountStatus = v4->_mountStatus;
    v4->_mountStatus = v5;

    return v4;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PAMountStatus magic",  0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
    -[SAPAStyleMountStatus populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v9,  v10,  v11,  v12,  v13,  v14);
  }

  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v14 = a5;
  id v9 = a6;
  if (*(void *)a3 == 3735928559LL)
  {
    SEL v10 = v9;
    -[SAMountStatus populateReferencesUsingPAStyleSerializedMountStatus:andDeserializationDictionary:andDataBufferDictionary:]( &self->_mountStatus->super.isa,  (uint64_t)a3,  v14,  v9);
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Bad PAMountStatus magic",  0LL);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
    -[SAPAStyleMountStatus .cxx_destruct](v12, v13);
  }

- (void).cxx_destruct
{
}

@end