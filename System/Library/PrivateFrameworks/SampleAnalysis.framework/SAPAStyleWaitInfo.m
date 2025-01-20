@interface SAPAStyleWaitInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (id)_initWithSerializedWaitInfo:(id *)a3;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAPAStyleWaitInfo

+ (id)classDictionaryKey
{
  return @"PASampleWaitInfo";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleWaitInfo",  0LL);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
  -[SAPAStyleWaitInfo addSelfToSerializationDictionary:](v7, v8, v9);
  return result;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Encoding failure",  @"Trying to encode SAPAStyleWaitInfo",  0LL);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
  -[SAPAStyleWaitInfo sizeInBytesForSerializedVersion](v5, v6);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
  return (unint64_t)-[SAPAStyleWaitInfo _initWithSerializedWaitInfo:](v3, v4, v5);
}

- (id)_initWithSerializedWaitInfo:(id *)a3
{
  if (a3 && a3->var0 == 233811181)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___SAPAStyleWaitInfo;
    SEL v4 = -[SAPAStyleWaitInfo init](&v13, sel_init);
    if (v4)
    {
      uint64_t v5 = +[SAWaitInfo stateWithPAStyleSerializedWaitInfo:]((uint64_t)&OBJC_CLASS___SAWaitInfo, (uint64_t)a3);
      waitInfo = v4->_waitInfo;
      v4->_waitInfo = (SAWaitInfo *)v5;
    }

    return v4;
  }

  else
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Tried to initialize with bad waitinfo",  0LL);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
    return +[SAPAStyleWaitInfo newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:](v9, v10, v11, v12);
  }

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Passed in NULL buffer",  0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
    JUMPOUT(0x186CF2C44LL);
  }

  return -[SAPAStyleWaitInfo _initWithSerializedWaitInfo:]( objc_alloc(&OBJC_CLASS___SAPAStyleWaitInfo),  "_initWithSerializedWaitInfo:",  a3);
}

- (void).cxx_destruct
{
}

@end