@interface MIDataContainer
+ (id)dataContainerForExecutableBundle:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 temporary:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8;
- (int)contentProtectionClass;
- (void)setContentProtectionClass:(int)a3;
@end

@implementation MIDataContainer

+ (id)dataContainerForExecutableBundle:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 temporary:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = [v13 dataContainerContentClass];
  if (v15)
  {
    uint64_t v17 = v15;
    if (v10)
    {
      if (a7) {
        *a7 = 1;
      }
      v18 = (void *)objc_opt_class();
      [v13 identifier];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 tempContainerWithIdentifier:v19 forPersona:v14 ofContentClass:v17 error:a8];
    }

    else
    {
      v23 = (void *)objc_opt_class();
      [v13 identifier];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v23 containerWithIdentifier:v19 forPersona:v14 ofContentClass:v17 createIfNeeded:v11 created:a7 error:a8];
    }

    v22 = (void *)v20;
  }

  else
  {
    _CreateAndLogError( (uint64_t)"+[MIDataContainer dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:]",  39LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Can't get data container for bundle %@",  v16,  (uint64_t)v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = v21;
    if (a8)
    {
      id v19 = v21;
      v22 = 0LL;
      *a8 = v19;
    }

    else
    {
      v22 = 0LL;
    }
  }

  return v22;
}

- (int)contentProtectionClass
{
  int result = self->_contentProtectionClass;
  if (!result)
  {
    uint64_t v7 = 0LL;
    v4 = -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileInstallation.ContentProtectionClass",  &v7);
    objc_opt_class();
    id v5 = v4;
    id v6 = 0LL;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }

    if (v6)
    {
      self->_contentProtectionClass = [v6 intValue];

      return self->_contentProtectionClass;
    }

    else
    {
      return 3;
    }
  }

  return result;
}

- (void)setContentProtectionClass:(int)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = 0LL;
  BOOL v6 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  v5,  @"com.apple.MobileInstallation.ContentProtectionClass",  &v9);
  id v7 = v9;

  if (v6)
  {
    self->_contentProtectionClass = a3;
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v8 = -[MIContainer identifier](self, "identifier");
    MOLogWrite();
  }
}

@end