@interface _HMDDeviceHandle
+ (BOOL)isValidDestination:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSUUID)identifierNamespace;
- (BOOL)isGlobal;
- (BOOL)isLocal;
- (HMDAccountHandle)accountHandle;
- (NSString)destination;
- (NSUUID)identifier;
- (_HMDDeviceHandle)init;
- (_HMDDeviceHandle)initWithCoder:(id)a3;
- (_HMDDeviceHandle)initWithDestination:(id)a3;
- (_HMDDeviceHandle)initWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HMDDeviceHandle

- (_HMDDeviceHandle)init
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is unavailable",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (_HMDDeviceHandle *)-[_HMDDeviceHandle destination](v6, v7);
}

- (NSString)destination
{
  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v3));
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v4,  0LL));

  objc_exception_throw(v5);
  return (NSString *)-[_HMDDeviceHandle initWithDestination:](v6, v7, v8);
}

- (_HMDDeviceHandle)initWithDestination:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue(v5);
  v6 = (_HMDDeviceHandle *)_HMFPreconditionFailureWithFormat(@"%@ is unavailable");
  return -[_HMDDeviceHandle initWithIdentifier:](v6, v7, v8);
}

- (_HMDDeviceHandle)initWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS____HMDDeviceHandle;
    id v5 = -[_HMDDeviceHandle init](&v16, "init");
    if (v5)
    {
      v6 = (NSUUID *)[v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = v6;
    }

    id v8 = v5;
    v9 = v8;
  }

  else
  {
    v10 = objc_autoreleasePoolPush();
    id v8 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier(v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@Missing required parameter 'identifier'",  buf,  0xCu);
    }

    objc_autoreleasePoolPop(v10);
    v9 = 0LL;
  }

  return v9;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isGlobal
{
  return 0;
}

- (HMDAccountHandle)accountHandle
{
  return 0LL;
}

- (_HMDDeviceHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), @"HM.identifier");
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = -[_HMDDeviceHandle initWithIdentifier:](self, "initWithIdentifier:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[_HMDDeviceHandle identifier](self, "identifier"));
  [v4 encodeObject:v5 forKey:@"HM.identifier"];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (BOOL)isValidDestination:(id)a3
{
  id v4 = a3;
  id v5 = NSStringFromSelector(a2);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  SEL v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"You must override %@ in a subclass",  v6));
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));

  objc_exception_throw(v8);
  return +[_HMDDeviceHandle identifierNamespace](v9, v10);
}

+ (NSUUID)identifierNamespace
{
  if (qword_100032C58 != -1) {
    dispatch_once(&qword_100032C58, &stru_100028810);
  }
  return (NSUUID *)(id)qword_100032C50;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end