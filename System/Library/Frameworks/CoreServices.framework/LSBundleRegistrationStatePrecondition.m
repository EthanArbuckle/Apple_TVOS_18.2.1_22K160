@interface LSBundleRegistrationStatePrecondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isMet;
- (LSBundleRegistrationStatePrecondition)initWithCoder:(id)a3;
- (id)description;
- (id)initForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSBundleRegistrationStatePrecondition

- (id)initForBundleWithIdentifier:(id)a3 placeholderInstalled:(id)a4 fullApplicationInstalled:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LSBundleRegistrationStatePrecondition;
  v11 = -[LSBundleRegistrationStatePrecondition init](&v15, sel_init);
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleID = v11->_bundleID;
    v11->_bundleID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_placeholderInstalled, a4);
    objc_storeStrong((id *)&v11->_fullAppInstalled, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v4 encodeObject:self->_placeholderInstalled forKey:@"placeholderInstalled"];
  [v4 encodeObject:self->_fullAppInstalled forKey:@"fullAppInstalled"];
}

- (LSBundleRegistrationStatePrecondition)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderInstalled"];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullAppInstalled"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[LSBundleRegistrationStatePrecondition initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:]( self,  "initForBundleWithIdentifier:placeholderInstalled:fullApplicationInstalled:",  v5,  v6,  v7);

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<LSBundleRegistrationStatePrecondition: %@ placeholder: %@ fullApp: %@>", self->_bundleID, self->_placeholderInstalled, self->_fullAppInstalled];
}

- (BOOL)isMet
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v20 = 0LL;
  char v21 = 0;
  id v22 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v3 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v4 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v3,  0LL);

  if (!v4)
  {
    _LSDefaultLog();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v16 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v16, 0LL);

      if (v17) {
        id v18 = 0LL;
      }
      else {
        id v18 = v22;
      }
      *(_DWORD *)buf = 138412290;
      id v24 = v18;
      _os_log_error_impl(&dword_183E58000, v12, OS_LOG_TYPE_ERROR, "Cannot reach database! %@", buf, 0xCu);
    }

    goto LABEL_8;
  }

  bundleID = self->_bundleID;
  memset(v26, 0, sizeof(v26));
  int v6 = _LSBundleFindWithInfo(v4, 0LL, bundleID, 0, v26, 2, 1024, 0LL, 0LL);
  v7 = self->_bundleID;
  memset(v25, 0, sizeof(v25));
  int v8 = _LSBundleFindWithInfo(v4, 0LL, v7, 0, v25, 2, 0, 0LL, 0LL);
  placeholderInstalled = self->_placeholderInstalled;
  if (placeholderInstalled && (v6 != 0) == -[NSNumber BOOLValue](placeholderInstalled, "BOOLValue"))
  {
LABEL_8:
    LOBYTE(v11) = 0;
    goto LABEL_10;
  }

  fullAppInstalled = self->_fullAppInstalled;
  if (fullAppInstalled) {
    unsigned int v11 = (v8 != 0) ^ -[NSNumber BOOLValue](fullAppInstalled, "BOOLValue");
  }
  else {
    LOBYTE(v11) = 1;
  }
LABEL_10:
  if (CurrentContext && v21) {
    _LSContextDestroy(CurrentContext);
  }
  id v13 = v20;
  CurrentContext = 0LL;
  id v20 = 0LL;

  char v21 = 0;
  id v14 = v22;
  id v22 = 0LL;

  return v11;
}

- (void).cxx_destruct
{
}

@end