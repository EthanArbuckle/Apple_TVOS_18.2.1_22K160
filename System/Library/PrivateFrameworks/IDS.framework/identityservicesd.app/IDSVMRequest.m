@interface IDSVMRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidVMRequestPurpose:(unint64_t)a3;
- (IDSVMRequest)initWithCoder:(id)a3;
- (IDSVMRequest)initWithDataRepresentation:(id)a3;
- (IDSVMRequest)initWithPurpose:(unint64_t)a3;
- (IDSVMRequest)initWithPurpose:(unint64_t)a3 version:(unint64_t)a4;
- (NSData)dataRepresentation;
- (unint64_t)purpose;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSVMRequest

- (IDSVMRequest)initWithPurpose:(unint64_t)a3
{
  return -[IDSVMRequest initWithPurpose:version:](self, "initWithPurpose:version:", a3, 1LL);
}

- (IDSVMRequest)initWithPurpose:(unint64_t)a3 version:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IDSVMRequest;
  result = -[IDSVMRequest init](&v7, "init");
  if (result)
  {
    result->_version = a4;
    result->_purpose = a3;
  }

  return result;
}

- (IDSVMRequest)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  id v11 = 0LL;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___IDSVMRequest, v5),  v4,  &v11);
  objc_super v7 = (IDSVMRequest *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v11;
  if (!v7)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog vm](&OBJC_CLASS___IMRGLog, "vm"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10069FC30((uint64_t)v4, (uint64_t)v8, v9);
    }
  }

  return v7;
}

- (NSData)dataRepresentation
{
  id v6 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  self,  1LL,  &v6));
  id v3 = v6;
  if (!v2)
  {
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog vm](&OBJC_CLASS___IMRGLog, "vm"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10069AF04((uint64_t)v3, v4);
    }
  }

  return (NSData *)v2;
}

- (BOOL)isValidVMRequestPurpose:(unint64_t)a3
{
  return a3 == 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSVMRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"version"];
  id v6 = [v4 decodeIntegerForKey:@"purpose"];

  if (-[IDSVMRequest isValidVMRequestPurpose:](self, "isValidVMRequestPurpose:", v6))
  {
    self = -[IDSVMRequest initWithPurpose:version:](self, "initWithPurpose:version:", v6, v5);
    objc_super v7 = self;
  }

  else
  {
    objc_super v7 = 0LL;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeInteger:self->_purpose forKey:@"purpose"];
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

@end