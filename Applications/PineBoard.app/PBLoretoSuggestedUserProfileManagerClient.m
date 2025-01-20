@interface PBLoretoSuggestedUserProfileManagerClient
- (NSString)debugDescription;
- (NSString)description;
- (PBLoretoSuggestedUserProfileManagerClient)initWithRecord:(id)a3 suggestedUserProfileManager:(id)a4;
- (PBLoretoSuggestedUserProfileManagerClientRecord)record;
- (PBSSuggestedUserProfileManagerClientInterface)delegate;
- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)clearSnapshot;
- (void)dealloc;
- (void)invalidate;
- (void)loretoSuggestedUserProfileManagerDidUpdate:(id)a3;
- (void)refreshSuggestedUserProfiles;
- (void)setDelegate:(id)a3;
- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4;
@end

@implementation PBLoretoSuggestedUserProfileManagerClient

- (PBLoretoSuggestedUserProfileManagerClient)initWithRecord:(id)a3 suggestedUserProfileManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  Class v9 = NSClassFromString(@"PBLoretoSuggestedUserProfileManagerClientRecord");
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002834D0();
    }
LABEL_23:
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x10011CABCLL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBLoretoSuggestedUserProfileManagerClientRecordClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002834D0();
    }
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x10011CB20LL);
  }

  if (([v8 isEntitled] & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[record isEntitled]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283630();
    }
    _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
    JUMPOUT(0x10011CB84LL);
  }

  id v10 = v7;
  Class v11 = NSClassFromString(@"PBLoretoSuggestedUserProfileManager");
  if (!v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283580();
    }
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x10011CBE8LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBLoretoSuggestedUserProfileManagerClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283580();
    }
    goto LABEL_23;
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerClient;
  v12 = -[PBLoretoSuggestedUserProfileManagerClient init](&v20, "init");
  if (v12)
  {
    v13 = (PBLoretoSuggestedUserProfileManagerClientRecord *)[v8 copy];
    record = v12->_record;
    v12->_record = v13;

    objc_storeStrong((id *)&v12->_manager, a4);
    -[PBLoretoSuggestedUserProfileManager addObserver:](v12->_manager, "addObserver:", v12);
  }

  return v12;
}

- (void)dealloc
{
  if (self->_manager)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_manager == nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002836E0();
    }
    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
  }

  else
  {
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS___PBLoretoSuggestedUserProfileManagerClient;
    -[PBLoretoSuggestedUserProfileManagerClient dealloc](&v3, "dealloc");
  }

- (void)invalidate
{
  manager = self->_manager;
  self->_manager = 0LL;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClient succinctDescription]( self,  "succinctDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClient descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClient succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClientRecord succinctDescription]( self->_record,  "succinctDescription"));
  id v5 = [v3 appendObject:v4 withName:@"record"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClient descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManagerClient succinctDescriptionBuilder]( self,  "succinctDescriptionBuilder",  a3));
  id v5 = [v4 appendObject:self->_record withName:@"record"];
  return v4;
}

- (PBSSuggestedUserProfileSnapshot)suggestedUserProfileSnapshot
{
  id v3 = sub_10011CF54();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Received suggested user profiles snapshot request. {client=%@}",  (uint8_t *)&v6,  0xCu);
  }

  return (PBSSuggestedUserProfileSnapshot *)(id)objc_claimAutoreleasedReturnValue( -[PBLoretoSuggestedUserProfileManager suggestedUserProfileSnapshot]( self->_manager,  "suggestedUserProfileSnapshot"));
}

- (void)refreshSuggestedUserProfiles
{
  id v3 = sub_10011CF54();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Received refresh suggested user profiles request. {client=%@}",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)updateSuppressedForSuggestedUserWithIdentifier:(id)a3 suppressed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10011CF54();
  Class v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    Class v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Received update suppressed state request. {client=%@, identifier=%@, suppressed=%@}",  (uint8_t *)&v10,  0x20u);
  }

  -[PBLoretoSuggestedUserProfileManager updateSuppressedForSuggestedUserWithIdentifier:suppressed:]( self->_manager,  "updateSuppressedForSuggestedUserWithIdentifier:suppressed:",  v6,  v7);
}

- (void)clearSnapshot
{
  id v3 = sub_10011CF54();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Received clear snapshot request. {client=%@}",  (uint8_t *)&v5,  0xCu);
  }
}

- (void)loretoSuggestedUserProfileManagerDidUpdate:(id)a3
{
  id v4 = sub_10011CF54();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100283790((uint64_t)self, v5);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBLoretoSuggestedUserProfileManagerClient delegate](self, "delegate"));
  [v6 suggestedUserProfileManagerDidUpdate];
}

- (PBSSuggestedUserProfileManagerClientInterface)delegate
{
  return (PBSSuggestedUserProfileManagerClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBLoretoSuggestedUserProfileManagerClientRecord)record
{
  return self->_record;
}

- (void).cxx_destruct
{
}

@end