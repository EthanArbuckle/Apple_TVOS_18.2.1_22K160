@interface PBModifyPersonaApplicationIdentifiersOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSSet)applicationIdentifiers;
- (NSString)personaUniqueString;
- (PBModifyPersonaApplicationIdentifiersOperation)initWithPersonaManager:(id)a3 personaUniqueString:(id)a4 applicationIdentifiers:(id)a5;
- (PBModifyPersonaApplicationIdentifiersOperation)initWithPersonaUniqueString:(id)a3 applicationIdentifiers:(id)a4;
- (UMUserPersonaManagement)personaManager;
- (id)modifyPersonaApplicationIdentifiersCompletionHandler;
- (void)setModifyPersonaApplicationIdentifiersCompletionHandler:(id)a3;
- (void)start;
@end

@implementation PBModifyPersonaApplicationIdentifiersOperation

- (PBModifyPersonaApplicationIdentifiersOperation)initWithPersonaManager:(id)a3 personaUniqueString:(id)a4 applicationIdentifiers:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"personaManager != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100275FF8(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x10006A7C0LL);
  }

  if (!v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"personaUniqueString != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002760B4(a2);
    }
    goto LABEL_11;
  }

  v13 = v12;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBModifyPersonaApplicationIdentifiersOperation;
  id v14 = -[PBModifyPersonaApplicationIdentifiersOperation init](&v22, "init");
  v15 = (PBModifyPersonaApplicationIdentifiersOperation *)v14;
  if (v14)
  {
    objc_storeStrong((id *)v14 + 2, a3);
    id v16 = [v11 copy];
    v17 = *(void **)&v15->_executing;
    *(void *)&v15->_executing = v16;

    v18 = (UMUserPersonaManagement *)[v13 copy];
    personaManager = v15->_personaManager;
    v15->_personaManager = v18;
  }

  return v15;
}

- (PBModifyPersonaApplicationIdentifiersOperation)initWithPersonaUniqueString:(id)a3 applicationIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v9 = -[PBModifyPersonaApplicationIdentifiersOperation initWithPersonaManager:personaUniqueString:applicationIdentifiers:]( self,  "initWithPersonaManager:personaUniqueString:applicationIdentifiers:",  v8,  v7,  v6);

  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (char)v2->super._private;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE1(v2->super._private);
  objc_sync_exit(v2);

  return v3;
}

- (void)start
{
  v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->super._private)) {
    goto LABEL_4;
  }
  if (-[PBModifyPersonaApplicationIdentifiersOperation isCancelled](v2, "isCancelled"))
  {
    -[PBModifyPersonaApplicationIdentifiersOperation willChangeValueForKey:]( v2,  "willChangeValueForKey:",  @"finished");
    BYTE1(v2->super._private) = 1;
    -[PBModifyPersonaApplicationIdentifiersOperation didChangeValueForKey:]( v2,  "didChangeValueForKey:",  @"finished");
LABEL_4:
    objc_sync_exit(v2);

    return;
  }

  -[PBModifyPersonaApplicationIdentifiersOperation willChangeValueForKey:]( v2,  "willChangeValueForKey:",  @"executing");
  LOBYTE(v2->super._private) = 1;
  -[PBModifyPersonaApplicationIdentifiersOperation didChangeValueForKey:]( v2,  "didChangeValueForKey:",  @"executing");
  objc_sync_exit(v2);

  id v3 = sub_100084518();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)&v2->_executing;
    personaManager = v2->_personaManager;
    *(_DWORD *)buf = 141558530;
    uint64_t v15 = 1752392040LL;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    v19 = personaManager;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Updating persona application identifiers. {personaUniqueString=%{mask.hash}@, applicationIdentifiers=%@}",  buf,  0x20u);
  }

  objc_initWeak((id *)buf, v2);
  id v7 = *(void **)&v2->super._private1;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[UMUserPersonaManagement allObjects](v2->_personaManager, "allObjects"));
  v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  uint64_t v11 = *(void *)&v2->_executing;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10006AB90;
  v12[3] = &unk_1003D2058;
  objc_copyWeak(&v13, (id *)buf);
  v12[4] = v2;
  [v7 setBundlesIdentifiers:v10 forUniquePersonaWithIDString:v11 completionHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)setModifyPersonaApplicationIdentifiersCompletionHandler:(id)a3
{
  v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  id v6 = (NSString *)objc_retainBlock(v5);

  personaUniqueString = v4->_personaUniqueString;
  v4->_personaUniqueString = v6;

  objc_sync_exit(v4);
}

- (UMUserPersonaManagement)personaManager
{
  return *(UMUserPersonaManagement **)&self->super._private1;
}

- (NSString)personaUniqueString
{
  return *(NSString **)&self->_executing;
}

- (NSSet)applicationIdentifiers
{
  return (NSSet *)self->_personaManager;
}

- (id)modifyPersonaApplicationIdentifiersCompletionHandler
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
}

@end