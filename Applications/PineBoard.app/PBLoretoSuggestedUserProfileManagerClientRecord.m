@interface PBLoretoSuggestedUserProfileManagerClientRecord
- (BOOL)isEntitled;
- (NSString)bundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (PBLoretoSuggestedUserProfileManagerClientRecord)initWithProcessHandle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
@end

@implementation PBLoretoSuggestedUserProfileManagerClientRecord

- (PBLoretoSuggestedUserProfileManagerClientRecord)initWithProcessHandle:(id)a3
{
  id v5 = a3;
  Class v6 = NSClassFromString(@"BSProcessHandle");
  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276DC8(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x1000700D0LL);
  }

  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BSProcessHandleClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276DC8(a2);
    }
    goto LABEL_11;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerClientRecord;
  v7 = -[PBLoretoSuggestedUserProfileManagerClientRecord init](&v13, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 bundleIdentifier]);
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_pid = [v5 pid];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v5 auditToken]);
    v7->_entitled = [v10 hasEntitlement:@"com.apple.appletv.pbs.user-profiles"];
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v3 appendString:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v4 = [v3 appendUnsignedInteger:self->_pid withName:@"pid"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder",  a3));
  id v5 = [v4 appendBool:self->_entitled withName:@"entitled"];
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (void).cxx_destruct
{
}

@end