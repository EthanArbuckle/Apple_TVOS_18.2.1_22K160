@interface TKTokenAuthOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)finishWithError:(NSError *)error;
- (Class)baseClassForUI;
- (NSError)authenticationError;
- (TKTokenAuthOperation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)importOperation:(id)a3;
- (void)setAuthenticationError:(id)a3;
@end

@implementation TKTokenAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenAuthOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TKTokenAuthOperation;
  v5 = -[TKTokenAuthOperation init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    NSStringFromSelector(sel_authenticationError);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    authenticationError = v5->_authenticationError;
    v5->_authenticationError = (NSError *)v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authenticationError = self->_authenticationError;
  id v4 = a3;
  NSStringFromSelector(sel_authenticationError);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:authenticationError forKey:v5];
}

- (BOOL)finishWithError:(NSError *)error
{
  return 1;
}

- (Class)baseClassForUI
{
  return 0LL;
}

- (void)importOperation:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 handleFailureInMethod:a2, self, @"TKTokenSession.m", 95, @"Attempt to import incompatible %@ into %@", v9, v11 object file lineNumber description];
    }
  }

  [v12 authenticationError];
  id v5 = (NSError *)objc_claimAutoreleasedReturnValue();
  authenticationError = self->_authenticationError;
  self->_authenticationError = v5;
}

- (NSError)authenticationError
{
  return (NSError *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAuthenticationError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end