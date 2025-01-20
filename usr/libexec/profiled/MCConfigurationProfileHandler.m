@interface MCConfigurationProfileHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (MCConfigurationProfileHandler)initWithProfile:(id)a3;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)removeWithInstaller:(id)a3 options:(id)a4;
- (void)setAsideWithInstaller:(id)a3;
- (void)unsetAside;
@end

@implementation MCConfigurationProfileHandler

- (MCConfigurationProfileHandler)initWithProfile:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  v3 = -[MCProfileHandler initWithProfile:](&v11, "initWithProfile:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v3, "profile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 OTAProfile]);
    v7 = v6;
    if (v6)
    {
      v8 = (MCProfileServiceProfileHandler *)[v6 createHandler];
      OTAHandler = v4->_OTAHandler;
      v4->_OTAHandler = v8;
    }
  }

  return v4;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  id v18 = 0LL;
  -[MCProfileHandler installWithInstaller:options:interactionClient:outError:]( &v17,  "installWithInstaller:options:interactionClient:outError:",  v10,  v11,  v12,  &v18);
  OTAHandler = (MCProfileServiceProfileHandler *)v18;
  if (!OTAHandler)
  {
    OTAHandler = self->_OTAHandler;
    if (!OTAHandler)
    {
      BOOL v14 = 1;
      goto LABEL_8;
    }

    id v16 = 0LL;
    -[MCProfileServiceProfileHandler installWithInstaller:options:interactionClient:outError:]( OTAHandler,  "installWithInstaller:options:interactionClient:outError:",  v10,  v11,  v12,  &v16);
    OTAHandler = (MCProfileServiceProfileHandler *)v16;
  }

  BOOL v14 = OTAHandler == 0LL;
  if (a6 && OTAHandler)
  {
    OTAHandler = OTAHandler;
    BOOL v14 = 0;
    *a6 = OTAHandler;
  }

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  id v6 = a4;
  id v7 = a3;
  -[MCProfileHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:]( &v8,  "didInstallOldGlobalRestrictions:newGlobalRestrictions:",  v7,  v6);
  -[MCProfileServiceProfileHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:]( self->_OTAHandler,  "didInstallOldGlobalRestrictions:newGlobalRestrictions:",  v7,  v6,  v8.receiver,  v8.super_class);
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  -[MCProfileHandler setAsideWithInstaller:](&v6, "setAsideWithInstaller:", v4);
  OTAHandler = self->_OTAHandler;
  if (OTAHandler) {
    -[MCProfileServiceProfileHandler setAsideWithInstaller:](OTAHandler, "setAsideWithInstaller:", v4);
  }
}

- (void)unsetAside
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  -[MCProfileHandler unsetAside](&v4, "unsetAside");
  OTAHandler = self->_OTAHandler;
  if (OTAHandler) {
    -[MCProfileServiceProfileHandler unsetAside](OTAHandler, "unsetAside");
  }
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCConfigurationProfileHandler;
  -[MCProfileHandler removeWithInstaller:options:](&v9, "removeWithInstaller:options:", v6, v7);
  OTAHandler = self->_OTAHandler;
  if (OTAHandler) {
    -[MCProfileServiceProfileHandler removeWithInstaller:options:](OTAHandler, "removeWithInstaller:options:", v6, v7);
  }
}

- (void).cxx_destruct
{
}

@end