@interface GTProcessService
+ (BOOL)supportsSecureCoding;
- (GTProcessInfo)processInfo;
- (GTProcessService)initWithCoder:(id)a3;
- (GTProcessService)initWithService:(id)a3 processInfo:(id)a4;
- (GTServiceProperties)serviceProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setServiceProperties:(id)a3;
@end

@implementation GTProcessService

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessService)initWithService:(id)a3 processInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___GTProcessService;
  v9 = -[GTProcessService init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProperties, a3);
    objc_storeStrong((id *)&v10->_processInfo, a4);
  }

  return v10;
}

- (GTProcessService)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GTProcessService;
  v5 = -[GTProcessService init](&v13, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(GTServiceProperties) forKey:@"serviceProperties"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    serviceProperties = v5->_serviceProperties;
    v5->_serviceProperties = (GTServiceProperties *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(GTProcessInfo) forKey:@"processInfo"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    processInfo = v5->_processInfo;
    v5->_processInfo = (GTProcessInfo *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceProperties = self->_serviceProperties;
  id v5 = a3;
  [v5 encodeObject:serviceProperties forKey:@"serviceProperties"];
  [v5 encodeObject:self->_processInfo forKey:@"processInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___GTProcessService);
  -[GTProcessService setServiceProperties:](v4, "setServiceProperties:", self->_serviceProperties);
  -[GTProcessService setProcessInfo:](v4, "setProcessInfo:", self->_processInfo);
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: serviceProperties=%@ processInfo=%@>",  objc_opt_class(self),  self->_serviceProperties,  self->_processInfo);
}

- (GTServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(id)a3
{
}

- (GTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end