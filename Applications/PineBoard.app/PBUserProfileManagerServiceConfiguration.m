@interface PBUserProfileManagerServiceConfiguration
- (BOOL)isMigratingProfiles;
- (OS_dispatch_queue)queue;
- (PBSUserProfileManagerInterface)service;
- (PBUserProfileManagerServiceConfiguration)initWithService:(id)a3 queue:(id)a4;
- (void)setMigratingProfiles:(BOOL)a3;
@end

@implementation PBUserProfileManagerServiceConfiguration

- (PBUserProfileManagerServiceConfiguration)initWithService:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBUserProfileManagerServiceConfiguration;
  v9 = -[PBUserProfileManagerServiceConfiguration init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_service, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
  }

  return v10;
}

- (PBSUserProfileManagerInterface)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isMigratingProfiles
{
  return self->_migratingProfiles;
}

- (void)setMigratingProfiles:(BOOL)a3
{
  self->_migratingProfiles = a3;
}

- (void).cxx_destruct
{
}

@end