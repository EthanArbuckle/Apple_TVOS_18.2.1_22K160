@interface MSCMSAppleExpirationTimeAttribute
- (MSCMSAppleExpirationTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4;
- (MSCMSAppleExpirationTimeAttribute)initWithExpirationTime:(id)a3;
- (MSOID)attributeType;
- (NSDate)expirationTime;
- (id)encodeAttributeWithError:(id *)a3;
@end

@implementation MSCMSAppleExpirationTimeAttribute

- (MSOID)attributeType
{
  return +[MSOID OIDWithString:error:]( &OBJC_CLASS___MSOID,  "OIDWithString:error:",  @"1.2.840.113635.100.9.3",  0LL);
}

- (MSCMSAppleExpirationTimeAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 attributeType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isEqualToString:@"1.2.840.113635.100.9.3"];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      v14 = MSErrorCMSDomain[0];
      id v16 = *a4;
      v17 = @"Not an Expiration Time attribute according to AttributeType";
      uint64_t v15 = -26275LL;
      goto LABEL_10;
    }

- (MSCMSAppleExpirationTimeAttribute)initWithExpirationTime:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSCMSAppleExpirationTimeAttribute;
  id v6 = -[MSCMSAppleExpirationTimeAttribute init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_expirationTime, a3);
  }

  return v7;
}

- (id)encodeAttributeWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:1546300800.0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDate compare:](self->_expirationTime, "compare:", v5) == NSOrderedAscending
    || -[NSDate compare:](self->_expirationTime, "compare:", v6) == NSOrderedDescending)
  {
    __int16 v17 = 3864;
    [MEMORY[0x189603FB8] dataWithBytes:&v17 length:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    generalizedTimeStringFromDate(self->_expirationTime);
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    __int16 v16 = 3351;
    [MEMORY[0x189603FB8] dataWithBytes:&v16 length:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UTCStringFromDate(self->_expirationTime);
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_super v9 = v8;
  [v8 dataUsingEncoding:4];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 appendData:v10];

  v11 = objc_alloc(&OBJC_CLASS___MSCMSAttribute);
  v12 = +[MSOID OIDWithString:error:](&OBJC_CLASS___MSOID, "OIDWithString:error:", @"1.2.840.113635.100.9.3", a3);
  [MEMORY[0x189603F18] arrayWithObject:v7];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MSCMSAttribute initWithAttributeType:values:](v11, "initWithAttributeType:values:", v12, v13);

  return v14;
}

- (NSDate)expirationTime
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end