@interface PKDExternalProviders
- (PKDContainerProvider)container;
- (PKDExternalProviders)init;
- (PKDExternalProviders)initWithLaunchServicesProvider:(id)a3;
- (PKDExternalProviders)initWithUserManagementProvider:(id)a3;
- (PKDSecurityProvider)security;
- (PKDUserManagementProvider)um;
@end

@implementation PKDExternalProviders

- (PKDExternalProviders)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PKDExternalProviders;
  v2 = -[PKDExternalProviders init](&v10, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___PKDSecurityProvider);
    security = v2->_security;
    v2->_security = v3;

    v5 = objc_opt_new(&OBJC_CLASS___PKDContainerProvider);
    container = v2->_container;
    v2->_container = v5;

    v7 = objc_opt_new(&OBJC_CLASS___PKDUserManagementProvider);
    um = v2->_um;
    v2->_um = v7;
  }

  return v2;
}

- (PKDExternalProviders)initWithLaunchServicesProvider:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PKDExternalProviders;
  v3 = -[PKDExternalProviders initWithLaunchServicesProvider:](&v11, "initWithLaunchServicesProvider:", a3);
  if (v3)
  {
    v4 = objc_opt_new(&OBJC_CLASS___PKDSecurityProvider);
    security = v3->_security;
    v3->_security = v4;

    v6 = objc_opt_new(&OBJC_CLASS___PKDContainerProvider);
    container = v3->_container;
    v3->_container = v6;

    v8 = objc_opt_new(&OBJC_CLASS___PKDUserManagementProvider);
    um = v3->_um;
    v3->_um = v8;
  }

  return v3;
}

- (PKDExternalProviders)initWithUserManagementProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PKDExternalProviders;
  v6 = -[PKDExternalProviders init](&v12, "init");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___PKDSecurityProvider);
    security = v6->_security;
    v6->_security = v7;

    v9 = objc_opt_new(&OBJC_CLASS___PKDContainerProvider);
    container = v6->_container;
    v6->_container = v9;

    objc_storeStrong((id *)&v6->_um, a3);
  }

  return v6;
}

- (PKDSecurityProvider)security
{
  return self->_security;
}

- (PKDContainerProvider)container
{
  return self->_container;
}

- (PKDUserManagementProvider)um
{
  return self->_um;
}

- (void).cxx_destruct
{
}

@end