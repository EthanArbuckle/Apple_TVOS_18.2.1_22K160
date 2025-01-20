@interface PBLocalSynchronousWindowSceneProvider
- (NSString)description;
- (PBLocalSynchronousWindowSceneProvider)init;
- (PBLocalSynchronousWindowSceneProvider)initWithSceneClientProvider:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)windowSceneForFBScene:(id)a3;
@end

@implementation PBLocalSynchronousWindowSceneProvider

- (PBLocalSynchronousWindowSceneProvider)initWithSceneClientProvider:(id)a3
{
  id v6 = a3;
  Class v7 = NSClassFromString(@"FBLocalSynchronousSceneClientProvider");
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293CF4(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
    JUMPOUT(0x1002110FCLL);
  }

  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:FBLocalSynchronousSceneClientProviderClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293CF4(a2);
    }
    goto LABEL_11;
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBLocalSynchronousWindowSceneProvider;
  v8 = -[PBLocalSynchronousWindowSceneProvider init](&v12, "init");
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_sceneClientProvider, a3);
  }

  return v9;
}

- (PBLocalSynchronousWindowSceneProvider)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBLocalSynchronousSceneClientProvider sharedInstance]( &OBJC_CLASS___FBLocalSynchronousSceneClientProvider,  "sharedInstance"));
  v4 = -[PBLocalSynchronousWindowSceneProvider initWithSceneClientProvider:](self, "initWithSceneClientProvider:", v3);

  return v4;
}

- (id)windowSceneForFBScene:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[FBLocalSynchronousSceneClientProvider fbsSceneForScene:]( self->_sceneClientProvider,  "fbsSceneForScene:",  a3));
  if (v3) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindowScene _sceneForFBSScene:](&OBJC_CLASS___UIWindowScene, "_sceneForFBSScene:", v3));
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLocalSynchronousWindowSceneProvider descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBLocalSynchronousWindowSceneProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_sceneClientProvider withName:@"sceneClientProvider"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBLocalSynchronousWindowSceneProvider descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBLocalSynchronousWindowSceneProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end