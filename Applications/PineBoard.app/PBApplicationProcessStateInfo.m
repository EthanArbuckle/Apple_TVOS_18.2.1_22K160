@interface PBApplicationProcessStateInfo
- (BOOL)isApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForegroundVisible;
- (BOOL)isTerminated;
- (BOOL)isViewService;
- (NSString)bundleIdentifier;
- (PBApplicationProcessStateInfo)initWithBundleIdentifier:(id)a3 pid:(int)a4 application:(BOOL)a5 foregroundVisible:(BOOL)a6 terminated:(BOOL)a7 viewService:(BOOL)a8;
- (PBApplicationProcessStateInfo)initWithBundleIdentifier:(id)a3 processHandle:(id)a4 processState:(id)a5;
- (PBApplicationProcessStateInfo)initWithProcessHandle:(id)a3;
- (id)description;
- (int)pid;
- (unint64_t)hash;
@end

@implementation PBApplicationProcessStateInfo

- (PBApplicationProcessStateInfo)initWithBundleIdentifier:(id)a3 pid:(int)a4 application:(BOOL)a5 foregroundVisible:(BOOL)a6 terminated:(BOOL)a7 viewService:(BOOL)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBApplicationProcessStateInfo;
  v16 = -[PBApplicationProcessStateInfo init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_bundleIdentifier, a3);
    v17->_pid = a4;
    v17->_application = a5;
    v17->_foregroundVisible = a6;
    v17->_terminated = a7;
    v17->_viewService = a8;
  }

  return v17;
}

- (PBApplicationProcessStateInfo)initWithBundleIdentifier:(id)a3 processHandle:(id)a4 processState:(id)a5
{
  id v31 = a3;
  id v7 = a4;
  id v30 = a5;
  unsigned int v28 = [v7 isApplication];
  unsigned int v8 = [v7 pid];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSEndowmentTree endowmentTreeForNamespace:]( &OBJC_CLASS___RBSEndowmentTree,  "endowmentTreeForNamespace:",  FBSSceneVisibilityEndowmentNamespace));
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 rootLinks]);
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
        unsigned int v17 = [v16 sourcePid];
        if (v17 == getpid()) {
          -[NSMutableSet addObject:](v10, "addObject:", v16);
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v13);
  }

  if (-[NSMutableSet count](v10, "count"))
  {
    v18 = v30;
    while (1)
    {
      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](v10, "anyObject"));
      -[NSMutableSet removeObject:](v10, "removeObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 childrenLinks:v19]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 allObjects]);
      -[NSMutableSet addObjectsFromArray:](v10, "addObjectsFromArray:", v21);

      if (!-[NSMutableSet count](v10, "count"))
      {
        uint64_t v22 = 0LL;
        if (v30) {
          goto LABEL_17;
        }
        goto LABEL_19;
      }
    }

    uint64_t v22 = 1LL;
    if (v30) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }

  uint64_t v22 = 0LL;
  v18 = v30;
  if (!v30)
  {
LABEL_19:
    BOOL v23 = 1LL;
    goto LABEL_20;
  }

- (PBApplicationProcessStateInfo)initWithProcessHandle:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessIdentifier identifierWithPid:]( RBSProcessIdentifier,  "identifierWithPid:",  [v4 pid]));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v5,  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentState]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundle]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  }
  id v12 = v11;

  id v13 = -[PBApplicationProcessStateInfo initWithBundleIdentifier:processHandle:processState:]( self,  "initWithBundleIdentifier:processHandle:processState:",  v12,  v6,  v7);
  return v13;
}

- (id)description
{
  id v3 = [[BSDescriptionBuilder alloc] initWithObject:self];
  [v3 appendString:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v4 = [v3 appendInteger:self->_pid withName:@"pid"];
  id v5 = [v3 appendBool:self->_application withName:@"isApplication"];
  id v6 = [v3 appendBool:self->_foregroundVisible withName:@"isForegroundVisible"];
  id v7 = [v3 appendBool:self->_terminated withName:@"isTerminated"];
  id v8 = [v3 appendBool:self->_viewService withName:@"isViewService"];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v9;
}

- (unint64_t)hash
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendString:self->_bundleIdentifier];
  id v5 = [v3 appendInteger:self->_pid];
  id v6 = [v3 appendBool:self->_application];
  id v7 = [v3 appendBool:self->_foregroundVisible];
  id v8 = [v3 appendBool:self->_terminated];
  id v9 = [v3 appendBool:self->_viewService];
  id v10 = [v3 hash];

  return (unint64_t)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBApplicationProcessStateInfo));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  bundleIdentifier = self->_bundleIdentifier;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001D184C;
  v39[3] = &unk_1003D2B30;
  id v8 = v4;
  id v40 = v8;
  id v9 = [v6 appendObject:bundleIdentifier counterpart:v39];
  uint64_t pid = self->_pid;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1001D186C;
  v37[3] = &unk_1003D4148;
  id v11 = v8;
  id v38 = v11;
  id v12 = [v6 appendInteger:pid counterpart:v37];
  BOOL application = self->_application;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001D1888;
  v35[3] = &unk_1003D2B58;
  id v14 = v11;
  id v36 = v14;
  id v15 = [v6 appendBool:application counterpart:v35];
  BOOL foregroundVisible = self->_foregroundVisible;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1001D18A0;
  v33[3] = &unk_1003D2B58;
  id v17 = v14;
  id v34 = v17;
  id v18 = [v6 appendBool:foregroundVisible counterpart:v33];
  BOOL terminated = self->_terminated;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001D18B8;
  v31[3] = &unk_1003D2B58;
  id v20 = v17;
  id v32 = v20;
  id v21 = [v6 appendBool:terminated counterpart:v31];
  uint64_t viewService = self->_viewService;
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472LL;
  unsigned int v28 = sub_1001D18D0;
  v29 = &unk_1003D2B58;
  id v30 = v20;
  id v23 = v20;
  id v24 = [v6 appendBool:viewService counterpart:&v26];
  LOBYTE(viewService) = objc_msgSend(v6, "isEqual", v26, v27, v28, v29);

  return viewService;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isApplication
{
  return self->_application;
}

- (BOOL)isForegroundVisible
{
  return self->_foregroundVisible;
}

- (BOOL)isTerminated
{
  return self->_terminated;
}

- (BOOL)isViewService
{
  return self->_viewService;
}

- (void).cxx_destruct
{
}

@end