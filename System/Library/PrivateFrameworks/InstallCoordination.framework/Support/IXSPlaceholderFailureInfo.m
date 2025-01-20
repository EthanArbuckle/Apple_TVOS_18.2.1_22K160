@interface IXSPlaceholderFailureInfo
+ (BOOL)supportsSecureCoding;
- (IXSPlaceholderFailureInfo)initWithCoder:(id)a3;
- (NSError)underlyingError;
- (int64_t)reason;
- (unint64_t)client;
- (unint64_t)installType;
- (void)encodeWithCoder:(id)a3;
- (void)setClient:(unint64_t)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setUnderlyingError:(id)a3;
@end

@implementation IXSPlaceholderFailureInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPlaceholderFailureInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IXSPlaceholderFailureInfo;
  v5 = -[IXSPlaceholderFailureInfo init](&v16, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installType"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_installType = (unint64_t)[v7 unsignedLongLongValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"reason"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_reason = (int64_t)[v9 unsignedLongLongValue];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"underlyingError"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    underlyingError = v5->_underlyingError;
    v5->_underlyingError = (NSError *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"client"];
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v5->_client = (unint64_t)[v14 unsignedLongLongValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSPlaceholderFailureInfo installType](self, "installType")));
  [v4 encodeObject:v5 forKey:@"installType"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[IXSPlaceholderFailureInfo reason](self, "reason")));
  [v4 encodeObject:v6 forKey:@"reason"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholderFailureInfo underlyingError](self, "underlyingError"));
  [v4 encodeObject:v7 forKey:@"underlyingError"];

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSPlaceholderFailureInfo client](self, "client")));
  [v4 encodeObject:v8 forKey:@"client"];
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setClient:(unint64_t)a3
{
  self->_client = a3;
}

- (void).cxx_destruct
{
}

@end