@interface NIConfiguration
+ (BOOL)supportsSecureCoding;
+ (NIConfiguration)new;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsCameraAssistanceInClientProcess;
- (BOOL)_internalIsExtendedDistanceMeasurementEnabled;
- (BOOL)_internalOsTransactionRequired;
- (BOOL)supportsCameraAssistance;
- (NIConfiguration)init;
- (NIConfiguration)initWithCoder:(id)a3;
- (NIConfiguration)initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionInternal;
- (id)initInternal;
- (unint64_t)enabledGestures;
- (unint64_t)suspensionPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabledGestures:(unint64_t)a3;
- (void)setSupportsCameraAssistance:(BOOL)a3;
- (void)setSuspensionPolicy:(unint64_t)a3;
@end

@implementation NIConfiguration

- (NIConfiguration)init
{
}

+ (NIConfiguration)new
{
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIConfiguration;
  id result = -[NIConfiguration init](&v3, "init");
  if (result)
  {
    *((int64x2_t *)result + 1) = vdupq_n_s64(3uLL);
    *((_BYTE *)result + 8) = 0;
  }

  return result;
}

- (NIConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 364, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NIConfiguration;
  v6 = -[NIConfiguration init](&v9, "init");
  if (v6)
  {
    v6->_suspensionPolicy = (unint64_t)[v5 suspensionPolicy];
    v6->_enabledGestures = (unint64_t)[v5 enabledGestures];
    v6->_supportsCameraAssistance = [v5 supportsCameraAssistance];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _[v4 initWithConfiguration:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_suspensionPolicy forKey:@"suspensionPolicy"];
  [v4 encodeInteger:self->_enabledGestures forKey:@"enabledGestures"];
  [v4 encodeBool:self->_supportsCameraAssistance forKey:@"supportsCameraAssistance"];
}

- (NIConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v6 = (NIConfiguration *)objc_msgSend(objc_alloc((Class)objc_opt_class(self, v5)), "initInternal");

  if (v6)
  {
    v7 = operator new(0x18uLL);
    *(_OWORD *)v7 = xmmword_100424900;
    v7[2] = 1LL;
    v8 = operator new(0x10uLL);
    _OWORD *v8 = xmmword_1004248F0;
    unint64_t v9 = (unint64_t)[v4 decodeIntegerForKey:@"suspensionPolicy"];
    unint64_t v10 = (unint64_t)[v4 decodeIntegerForKey:@"enabledGestures"];
    unsigned __int8 v11 = [v4 decodeBoolForKey:@"supportsCameraAssistance"];
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    v6->_suspensionPolicy = 0LL;
    v6->_enabledGestures = 0LL;
    v6->_supportsCameraAssistance = v11;
    do
    {
      uint64_t v14 = v7[v12];
      if ((v14 & v9) != 0)
      {
        v13 |= v14;
        v6->_suspensionPolicy = v13;
      }

      ++v12;
    }

    while (v12 != 3);
    uint64_t v15 = 0LL;
    unint64_t v16 = 0LL;
    do
    {
      uint64_t v17 = *(void *)((char *)v8 + v15);
      if ((v17 & v10) != 0)
      {
        v16 |= v17;
        v6->_enabledGestures = v16;
      }

      v15 += 8LL;
    }

    while (v15 != 16);
    v18 = v6;
    operator delete(v8);
    operator delete(v7);
  }

  return v6;
}

- (id)descriptionInternal
{
  return 0LL;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return 0;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return 1;
}

- (BOOL)_internalOsTransactionRequired
{
  return 1;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return 0;
}

- (BOOL)supportsCameraAssistance
{
  return self->_supportsCameraAssistance;
}

- (void)setSupportsCameraAssistance:(BOOL)a3
{
  self->_supportsCameraAssistance = a3;
}

- (unint64_t)suspensionPolicy
{
  return self->_suspensionPolicy;
}

- (void)setSuspensionPolicy:(unint64_t)a3
{
  self->_suspensionPolicy = a3;
}

- (unint64_t)enabledGestures
{
  return self->_enabledGestures;
}

- (void)setEnabledGestures:(unint64_t)a3
{
  self->_enabledGestures = a3;
}

@end