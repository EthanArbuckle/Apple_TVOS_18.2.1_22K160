@interface MCMManagedUserPathRegistry
- (MCMManagedPath)containermanagerUserCaches;
- (MCMManagedPath)containermanagerUserDeathrow;
- (MCMManagedPath)containermanagerUserDeleteOperations;
- (MCMManagedPath)containermanagerUserLibrary;
- (MCMManagedPath)containermanagerUserPendingUpdates;
- (MCMManagedPath)containermanagerUserReplaceOperations;
- (MCMManagedPath)userCaches;
- (MCMManagedPath)userHome;
- (MCMManagedPath)userLibrary;
- (MCMManagedUserPathRegistry)initWithUserIdentity:(id)a3 daemonUser:(id)a4;
- (MCMUserIdentity)userIdentity;
- (void)_initPathPropertiesWithUserIdentity:(id)a3;
@end

@implementation MCMManagedUserPathRegistry

- (MCMManagedUserPathRegistry)initWithUserIdentity:(id)a3 daemonUser:(id)a4
{
  v18[5] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMManagedUserPathRegistry;
  v8 = -[MCMManagedPathRegistry initWithDaemonUser:privileged:](&v16, sel_initWithDaemonUser_privileged_, a4, 0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userIdentity, a3);
    -[MCMManagedUserPathRegistry _initPathPropertiesWithUserIdentity:](v9, "_initPathPropertiesWithUserIdentity:", v7);
    v18[0] = v9->_userHome;
    v18[1] = v9->_userLibrary;
    v18[2] = v9->_userCaches;
    v18[3] = v9->_containermanagerUserCaches;
    v18[4] = v9->_containermanagerUserDeathrow;
    [MEMORY[0x189603F18] arrayWithObjects:v18 count:5];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMManagedPathRegistry _addPaths:](v9, "_addPaths:", v10);

    if (v9->_containermanagerUserLibrary)
    {
      containermanagerUserPendingUpdates = v9->_containermanagerUserPendingUpdates;
      if (containermanagerUserPendingUpdates)
      {
        containermanagerUserReplaceOperations = v9->_containermanagerUserReplaceOperations;
        if (containermanagerUserReplaceOperations)
        {
          containermanagerUserDeleteOperations = v9->_containermanagerUserDeleteOperations;
          if (containermanagerUserDeleteOperations)
          {
            v17[0] = v9->_containermanagerUserLibrary;
            v17[1] = containermanagerUserPendingUpdates;
            v17[2] = containermanagerUserReplaceOperations;
            v17[3] = containermanagerUserDeleteOperations;
            [MEMORY[0x189603F18] arrayWithObjects:v17 count:4];
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[MCMManagedPathRegistry _addPaths:](v9, "_addPaths:", v14);
          }
        }
      }
    }
  }

  return v9;
}

- (void)_initPathPropertiesWithUserIdentity:(id)a3
{
  id v4 = a3;
  [v4 homeDirectoryURL];
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  [v4 posixUser];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]( objc_alloc(&OBJC_CLASS___MCMManagedPath),  "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:",  v30,  0LL,  0LL,  493LL,  0xFFFFFFFFLL,  v5,  0LL);
  userHome = self->_userHome;
  self->_userHome = v6;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_userHome,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Library",  2LL,  2LL,  493LL,  0xFFFFFFFFLL,  v5);
  v8 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  userLibrary = self->_userLibrary;
  self->_userLibrary = v8;

  else {
    uint64_t v10 = 0LL;
  }
  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_userLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Caches",  v10,  2LL,  493LL,  0xFFFFFFFFLL,  v5);
  v11 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  userCaches = self->_userCaches;
  self->_userCaches = v11;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_userCaches,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"com.apple.containermanagerd",  3LL,  1LL,  493LL,  4LL,  v5);
  v13 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerUserCaches = self->_containermanagerUserCaches;
  self->_containermanagerUserCaches = v13;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerUserCaches,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Dead",  7LL,  1LL,  493LL,  4LL,  v5);
  v15 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerUserDeathrow = self->_containermanagerUserDeathrow;
  self->_containermanagerUserDeathrow = v15;

  containermanagerUserLibrary = self->_containermanagerUserLibrary;
  self->_containermanagerUserLibrary = 0LL;

  containermanagerUserPendingUpdates = self->_containermanagerUserPendingUpdates;
  self->_containermanagerUserPendingUpdates = 0LL;

  containermanagerUserReplaceOperations = self->_containermanagerUserReplaceOperations;
  self->_containermanagerUserReplaceOperations = 0LL;

  containermanagerUserDeleteOperations = self->_containermanagerUserDeleteOperations;
  self->_containermanagerUserDeleteOperations = 0LL;

  char v21 = [v4 isDataSeparated];
  if ((v21 & 1) == 0)
  {
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_userLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"MobileContainerManager",  7LL,  1LL,  493LL,  4LL,  v5);
    v22 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v23 = self->_containermanagerUserLibrary;
    self->_containermanagerUserLibrary = v22;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerUserLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"PendingUpdates",  7LL,  1LL,  493LL,  4LL,  v5);
    v24 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v25 = self->_containermanagerUserPendingUpdates;
    self->_containermanagerUserPendingUpdates = v24;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerUserLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Replace",  7LL,  1LL,  493LL,  4LL,  v5);
    v26 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v27 = self->_containermanagerUserReplaceOperations;
    self->_containermanagerUserReplaceOperations = v26;

    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:]( self->_containermanagerUserLibrary,  "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:",  @"Delete",  7LL,  1LL,  493LL,  4LL,  v5);
    v28 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v29 = self->_containermanagerUserDeleteOperations;
    self->_containermanagerUserDeleteOperations = v28;
  }
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMManagedPath)userHome
{
  return self->_userHome;
}

- (MCMManagedPath)userLibrary
{
  return self->_userLibrary;
}

- (MCMManagedPath)userCaches
{
  return self->_userCaches;
}

- (MCMManagedPath)containermanagerUserCaches
{
  return self->_containermanagerUserCaches;
}

- (MCMManagedPath)containermanagerUserDeathrow
{
  return self->_containermanagerUserDeathrow;
}

- (MCMManagedPath)containermanagerUserLibrary
{
  return self->_containermanagerUserLibrary;
}

- (MCMManagedPath)containermanagerUserPendingUpdates
{
  return self->_containermanagerUserPendingUpdates;
}

- (MCMManagedPath)containermanagerUserReplaceOperations
{
  return self->_containermanagerUserReplaceOperations;
}

- (MCMManagedPath)containermanagerUserDeleteOperations
{
  return self->_containermanagerUserDeleteOperations;
}

- (void).cxx_destruct
{
}

@end