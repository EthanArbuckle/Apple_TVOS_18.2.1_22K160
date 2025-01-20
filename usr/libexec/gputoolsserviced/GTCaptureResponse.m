@interface GTCaptureResponse
+ (BOOL)supportsSecureCoding;
- (GTCaptureResponse)init;
- (GTCaptureResponse)initWithCoder:(id)a3;
- (GTDataVersion)version;
- (NSData)data;
- (NSError)error;
- (unint64_t)requestID;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setRequestID:(unint64_t)a3;
- (void)setVersion:(GTDataVersion)a3;
@end

@implementation GTCaptureResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTCaptureResponse;
  v2 = -[GTCaptureResponse init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_version.var0.version = 1;
    v4 = v2;
  }

  return v3;
}

- (GTCaptureResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTCaptureResponse;
  v5 = -[GTCaptureResponse init](&v14, "init");
  if (v5)
  {
    v5->_version.value = (unint64_t)[v4 decodeInt64ForKey:@"version"];
    v5->_requestID = (unint64_t)[v4 decodeInt64ForKey:@"requestID"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSData) forKey:@"data"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    data = v5->_data;
    v5->_data = (NSData *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"error"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    error = v5->_error;
    v5->_error = (NSError *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GTDataVersion version = self->_version;
  id v5 = a3;
  [v5 encodeInt64:version.value forKey:@"version"];
  [v5 encodeInt64:self->_requestID forKey:@"requestID"];
  [v5 encodeObject:self->_data forKey:@"data"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (GTDataVersion)version
{
  return (GTDataVersion)self->_version.value;
}

- (void)setVersion:(GTDataVersion)a3
{
  self->_GTDataVersion version = a3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end