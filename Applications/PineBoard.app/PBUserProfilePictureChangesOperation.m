@interface PBUserProfilePictureChangesOperation
- (NSDictionary)cacheTagBySource;
- (NSDictionary)responseBySource;
- (NSSet)sources;
- (NSUUID)context;
- (PBUserProfilePictureChangesOperation)initWithSources:(id)a3 cacheTagBySource:(id)a4 profilePictureStore:(id)a5 context:(id)a6;
- (void)_executionDidBegin;
- (void)_startNextProfilePictureRequest;
- (void)_startProfilePictureRequestWithSource:(id)a3;
- (void)setResponseBySource:(id)a3;
@end

@implementation PBUserProfilePictureChangesOperation

- (PBUserProfilePictureChangesOperation)initWithSources:(id)a3 cacheTagBySource:(id)a4 profilePictureStore:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  Class v15 = NSClassFromString(@"NSSet");
  if (!v14)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002860C8();
    }
LABEL_35:
    _bs_set_crash_log_message([v34 UTF8String]);
    __break(0);
    JUMPOUT(0x100145280LL);
  }

  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002860C8();
    }
    _bs_set_crash_log_message([v35 UTF8String]);
    __break(0);
    JUMPOUT(0x1001452E4LL);
  }

  id v16 = v11;
  Class v17 = NSClassFromString(@"NSDictionary");
  if (!v16)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100286178();
    }
    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x100145348LL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100286178();
    }
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x1001453ACLL);
  }

  id v18 = v12;
  Class v19 = NSClassFromString(@"UPProfilePictureStore");
  if (!v18)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100286228();
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x100145410LL);
  }

  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfilePictureStoreClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100286228();
    }
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x100145474LL);
  }

  id v20 = v13;
  Class v21 = NSClassFromString(@"NSUUID");
  if (!v20)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002862D8();
    }
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x1001454D8LL);
  }

  if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002862D8();
    }
    goto LABEL_35;
  }

  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___PBUserProfilePictureChangesOperation;
  v22 = -[PBUserProfilePictureChangesOperation init](&v41, "init");
  if (v22)
  {
    v23 = (NSSet *)[v14 copy];
    sources = v22->_sources;
    v22->_sources = v23;

    v25 = (NSDictionary *)[v16 copy];
    cacheTagBySource = v22->_cacheTagBySource;
    v22->_cacheTagBySource = v25;

    objc_storeStrong((id *)&v22->_profilePictureStore, a5);
    v27 = (NSUUID *)[v20 copy];
    context = v22->_context;
    v22->_context = v27;

    v29 = (NSMutableSet *)-[NSSet mutableCopy](v22->_sources, "mutableCopy");
    remainingSources = v22->_remainingSources;
    v22->_remainingSources = v29;

    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableResponseBySource = v22->_mutableResponseBySource;
    v22->_mutableResponseBySource = v31;
  }

  return v22;
}

- (void)_executionDidBegin
{
}

- (void)_startNextProfilePictureRequest
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_remainingSources, "anyObject"));
  if (v3)
  {
    -[NSMutableSet removeObject:](self->_remainingSources, "removeObject:", v3);
    -[PBUserProfilePictureChangesOperation _startProfilePictureRequestWithSource:]( self,  "_startProfilePictureRequestWithSource:",  v3);
  }

  else
  {
    id v4 = -[NSMutableDictionary copy](self->_mutableResponseBySource, "copy");
    -[PBUserProfilePictureChangesOperation setResponseBySource:](self, "setResponseBySource:", v4);

    -[PBUserProfilePictureChangesOperation _finishExecutionIfPossible](self, "_finishExecutionIfPossible");
  }
}

- (void)_startProfilePictureRequestWithSource:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 profilePictureRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_cacheTagBySource, "objectForKey:", v4));
  [v5 setCacheTag:v6];

  objc_initWeak(&location, self);
  profilePictureStore = self->_profilePictureStore;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001456FC;
  v9[3] = &unk_1003D9120;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  -[UPProfilePictureStore fetchProfilePictureForRequest:completion:]( profilePictureStore,  "fetchProfilePictureForRequest:completion:",  v5,  v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSSet)sources
{
  return self->_sources;
}

- (NSDictionary)cacheTagBySource
{
  return self->_cacheTagBySource;
}

- (NSUUID)context
{
  return self->_context;
}

- (NSDictionary)responseBySource
{
  return self->_responseBySource;
}

- (void)setResponseBySource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end