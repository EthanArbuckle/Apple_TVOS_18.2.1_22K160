@interface CSAttSiriRequestContext
+ (BOOL)supportsSecureCoding;
- (CSAttSiriRequestContext)initWithCoder:(id)a3;
- (CSAttSiriRequestContext)initWithRequestSource:(unint64_t)a3;
- (id)description;
- (unint64_t)reqSrc;
- (void)encodeWithCoder:(id)a3;
- (void)setReqSrc:(unint64_t)a3;
@end

@implementation CSAttSiriRequestContext

- (CSAttSiriRequestContext)initWithRequestSource:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAttSiriRequestContext;
  result = -[CSAttSiriRequestContext init](&v5, "init");
  if (result) {
    result->_reqSrc = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CSAttSiriRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CSAttSiriRequestContext;
  objc_super v5 = -[CSAttSiriRequestContext init](&v7, "init");
  if (v5) {
    v5->_reqSrc = (unint64_t)[v4 decodeIntegerForKey:@"CSAttSiriRequestSourceKey"];
  }

  return v5;
}

- (id)description
{
  unint64_t v2 = self->_reqSrc - 1;
  if (v2 > 2) {
    return @"SiriFollowupforIdleAndQuiet";
  }
  else {
    return *(&off_10022A028 + v2);
  }
}

- (unint64_t)reqSrc
{
  return self->_reqSrc;
}

- (void)setReqSrc:(unint64_t)a3
{
  self->_reqSrc = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end