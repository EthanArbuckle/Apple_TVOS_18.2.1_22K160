@interface CKKSWrappedAESSIVKey
+ (BOOL)supportsSecureCoding;
+ (id)zeroedKey;
- (CKKSWrappedAESSIVKey)init;
- (CKKSWrappedAESSIVKey)initWithBase64:(id)a3;
- (CKKSWrappedAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4;
- (CKKSWrappedAESSIVKey)initWithCoder:(id)a3;
- (CKKSWrappedAESSIVKey)initWithData:(id)a3;
- (id)base64WrappedKey;
- (id)wrappedData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKKSWrappedAESSIVKey

- (CKKSWrappedAESSIVKey)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSWrappedAESSIVKey;
  result = -[CKKSBaseAESSIVKey init](&v3, "init");
  if (result) {
    result->super.size = 80LL;
  }
  return result;
}

- (CKKSWrappedAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  if (a4 == 80)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___CKKSWrappedAESSIVKey;
    return -[CKKSBaseAESSIVKey initWithBytes:len:](&v10, "initWithBytes:len:", a3);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"length (%lu) was not %d",  a4,  80LL));
    id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongKeySizeException",  v5,  0LL));

    objc_exception_throw(v6);
    return -[CKKSWrappedAESSIVKey initWithBase64:](v7, v8, v9);
  }

- (CKKSWrappedAESSIVKey)initWithBase64:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CKKSWrappedAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey initWithBase64:](&v13, "initWithBase64:", v4);
  id v6 = v5;
  if (v5 && v5->super.size != 80)
  {
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"length (%lu) was not %d",  v5->super.size,  80LL));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongKeySizeException",  v8,  0LL));

    objc_exception_throw(v9);
    return -[CKKSWrappedAESSIVKey initWithData:](v10, v11, v12);
  }

  else
  {

    return v6;
  }

- (CKKSWrappedAESSIVKey)initWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length] == (id)80)
  {
    id v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___CKKSWrappedAESSIVKey;
    id v6 = -[CKKSBaseAESSIVKey initWithBytes:len:]( &v12,  "initWithBytes:len:",  [v5 bytes],  objc_msgSend(v5, "length"));

    return v6;
  }

  else
  {
    SEL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"length (%lu) was not %d",  [v4 length],  80));
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"WrongKeySizeException",  v8,  0LL));

    objc_exception_throw(v9);
    return (CKKSWrappedAESSIVKey *)-[CKKSWrappedAESSIVKey wrappedData](v10, v11);
  }

- (id)wrappedData
{
  return  -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  self->super.key,  self->super.size);
}

- (id)base64WrappedKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSWrappedAESSIVKey wrappedData](self, "wrappedData"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 base64EncodedStringWithOptions:0]);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CKKSWrappedAESSIVKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CKKSWrappedAESSIVKey;
  id v5 = -[CKKSBaseAESSIVKey init](&v10, "init");
  if (v5)
  {
    unint64_t v9 = 0LL;
    id v6 = [v4 decodeBytesForKey:@"wrappedkey" returnedLength:&v9];
    if (v6)
    {
      if (v9 >= 0x50) {
        size_t v7 = 80LL;
      }
      else {
        size_t v7 = v9;
      }
      memcpy(v5->super.key, v6, v7);
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)zeroedKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 80LL));
  objc_super v3 = -[CKKSWrappedAESSIVKey initWithData:](objc_alloc(&OBJC_CLASS___CKKSWrappedAESSIVKey), "initWithData:", v2);

  return v3;
}

@end