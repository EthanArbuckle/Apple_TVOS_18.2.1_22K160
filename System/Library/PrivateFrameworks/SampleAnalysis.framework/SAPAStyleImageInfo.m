@interface SAPAStyleImageInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleImageInfo

+ (id)classDictionaryKey
{
  return @"PAStackshotImageInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleImageInfo",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleImageInfo addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleImageInfo",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleImageInfo sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)+[SAPAStyleImageInfo newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:]( v3,  v4,  v5,  v6);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (a3)
  {
    if (*(void *)a3 == 2271560481LL)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___SAPAStyleImageInfo);
      uint64_t v6 = +[SABinaryLoadInfo binaryLoadInfoWithoutReferencesFromPAStyleSerializedImageInfo:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  (uint64_t)a3);
      binaryLoadInfo = v5->_binaryLoadInfo;
      v5->_binaryLoadInfo = (SABinaryLoadInfo *)v6;

      return v5;
    }

    id v9 = @"Bad magic for SAPAStyleImageInfo";
  }

  else
  {
    id v9 = @"NULL buffer for SAPAStyleImageInfo";
  }

  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  v9,  0LL);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
  -[SAPAStyleImageInfo populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:]( v11,  v12,  v13,  v14,  v15,  v16);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (!v9 || !v10)
  {
    int v12 = *__error();
    _sa_logt();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_186C92000, v13, OS_LOG_TYPE_ERROR, "Invalid args", buf, 2u);
    }

    goto LABEL_13;
  }

  if (!a3)
  {
    int v12 = *__error();
    _sa_logt();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      unint64_t v14 = "WARNING: Passed NULL serializedImageInfo";
      id v15 = (uint8_t *)&v17;
LABEL_12:
      _os_log_impl(&dword_186C92000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }

- (void).cxx_destruct
{
}

@end