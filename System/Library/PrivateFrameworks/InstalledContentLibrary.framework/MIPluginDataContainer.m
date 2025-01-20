@interface MIPluginDataContainer
+ (id)pluginDataContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (NSString)parentBundleID;
- (void)setParentBundleID:(id)a3;
@end

@implementation MIPluginDataContainer

+ (id)pluginDataContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a3;
  [(id)objc_opt_class() containerWithIdentifier:v12 forPersona:v11 ofContentClass:4 createIfNeeded:v9 created:a6 error:a7];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)parentBundleID
{
  parentBundleID = self->_parentBundleID;
  if (parentBundleID) {
    return parentBundleID;
  }
  id v11 = 0LL;
  v4 = -[MIContainer infoValueForKey:error:]( self,  "infoValueForKey:error:",  @"com.apple.MobileInstallation.ParentBundleID",  &v11);
  id v5 = v11;
  objc_opt_class();
  id v6 = v4;
  v7 = 0LL;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v7 = (NSString *)v6;
  }

  if (v7)
  {
    v8 = self->_parentBundleID;
    self->_parentBundleID = v7;

    parentBundleID = self->_parentBundleID;
    return parentBundleID;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v10 = -[MIContainer identifier](self, "identifier");
    MOLogWrite();
  }

  return (NSString *)0LL;
}

- (void)setParentBundleID:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  BOOL v5 = -[MIContainer setInfoValue:forKey:error:]( self,  "setInfoValue:forKey:error:",  v4,  @"com.apple.MobileInstallation.ParentBundleID",  &v10);
  id v6 = v10;
  if (v5)
  {
    v7 = (NSString *)v4;
    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = v7;
  }

  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIContainer identifier](self, "identifier");
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = 0LL;
  }
}

- (void).cxx_destruct
{
}

@end