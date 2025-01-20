@interface CPLEngineWrapperStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isOpened;
- (CPLEngineParameters)parameters;
- (CPLEngineWrapperStatus)initWithCoder:(id)a3;
- (CPLEngineWrapperStatus)initWithParameters:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6;
- (NSError)openError;
- (unint64_t)clientCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLEngineWrapperStatus

- (CPLEngineWrapperStatus)initWithParameters:(id)a3 clientCount:(unint64_t)a4 isOpened:(BOOL)a5 openError:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CPLEngineWrapperStatus;
  v13 = -[CPLEngineWrapperStatus init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_parameters, a3);
    v14->_clientCount = a4;
    v14->_opened = a5;
    v15 = (NSError *)[v12 copy];
    openError = v14->_openError;
    v14->_openError = v15;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  parameters = self->_parameters;
  id v5 = a3;
  [v5 encodeObject:parameters forKey:@"parameters"];
  [v5 encodeInteger:self->_clientCount forKey:@"clientCount"];
  [v5 encodeBool:self->_opened forKey:@"opened"];
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[NSError cplSafeErrorForXPC](self->_openError, "cplSafeErrorForXPC"));
  [v5 encodeObject:v6 forKey:@"openError"];
}

- (CPLEngineWrapperStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(CPLEngineParameters) forKey:@"parameters"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeIntegerForKey:@"clientCount"];
    id v8 = [v4 decodeBoolForKey:@"opened"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"openError"];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    self =  -[CPLEngineWrapperStatus initWithParameters:clientCount:isOpened:openError:]( self,  "initWithParameters:clientCount:isOpened:openError:",  v6,  v7,  v8,  v10);

    id v11 = self;
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (CPLEngineParameters)parameters
{
  return self->_parameters;
}

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (BOOL)isOpened
{
  return self->_opened;
}

- (NSError)openError
{
  return self->_openError;
}

- (void).cxx_destruct
{
}

@end