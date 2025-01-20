@interface PBProfileStoreSnapshotUpdate
- (BOOL)isEqual:(id)a3;
- (PBProfileStoreSnapshotUpdate)initWithCurrentSnapshot:(id)a3 previousSnapshot:(id)a4 difference:(id)a5;
- (UPProfileStoreSnapshot)currentSnapshot;
- (UPProfileStoreSnapshot)previousSnapshot;
- (UPProfileStoreSnapshotDifference)difference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation PBProfileStoreSnapshotUpdate

- (PBProfileStoreSnapshotUpdate)initWithCurrentSnapshot:(id)a3 previousSnapshot:(id)a4 difference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  Class v13 = NSClassFromString(@"UPProfileStoreSnapshot");
  if (!v12)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002931A4();
    }
LABEL_27:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x10020961CLL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileStoreSnapshotClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002931A4();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100209680LL);
  }

  id v14 = v10;
  Class v15 = NSClassFromString(@"UPProfileStoreSnapshot");
  if (!v14)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293254();
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x1002096E4LL);
  }

  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileStoreSnapshotClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293254();
    }
    _bs_set_crash_log_message([v24 UTF8String]);
    __break(0);
    JUMPOUT(0x100209748LL);
  }

  id v16 = v11;
  Class v17 = NSClassFromString(@"UPProfileStoreSnapshotDifference");
  if (!v16)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293304();
    }
    _bs_set_crash_log_message([v25 UTF8String]);
    __break(0);
    JUMPOUT(0x1002097ACLL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UPProfileStoreSnapshotDifferenceClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100293304();
    }
    goto LABEL_27;
  }

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PBProfileStoreSnapshotUpdate;
  v18 = -[PBProfileStoreSnapshotUpdate init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_currentSnapshot, a3);
    objc_storeStrong((id *)&v19->_previousSnapshot, a4);
    objc_storeStrong((id *)&v19->_difference, a5);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendObject:self->_currentSnapshot];
  id v5 = [v3 appendObject:self->_previousSnapshot];
  id v6 = [v3 appendObject:self->_difference];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBProfileStoreSnapshotUpdate *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }

  else
  {
    id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBProfileStoreSnapshotUpdate));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    currentSnapshot = self->_currentSnapshot;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100209A24;
    v21[3] = &unk_1003D2130;
    v8 = v4;
    v22 = v8;
    id v9 = [v6 appendObject:currentSnapshot counterpart:v21];
    previousSnapshot = self->_previousSnapshot;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100209A40;
    v19[3] = &unk_1003D2130;
    id v11 = v8;
    v20 = v11;
    id v12 = [v6 appendObject:previousSnapshot counterpart:v19];
    difference = self->_difference;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100209A5C;
    v17[3] = &unk_1003D2130;
    v18 = v11;
    id v14 = [v6 appendObject:difference counterpart:v17];
    unsigned __int8 v15 = [v6 isEqual];
  }

  return v15;
}

- (id)description
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotUpdate succinctDescription]( self,  "succinctDescription"));
}

- (id)debugDescription
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotUpdate descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UPProfileStoreSnapshot profiles](self->_currentSnapshot, "profiles"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  [v3 appendArraySection:v5 withName:0 skipIfEmpty:0 objectTransformer:&stru_1003DD118];

  return v3;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBProfileStoreSnapshotUpdate succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100209C48;
  v8[3] = &unk_1003CFEB8;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v9 = v5;
  id v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBProfileStoreSnapshotUpdate descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (UPProfileStoreSnapshot)previousSnapshot
{
  return self->_previousSnapshot;
}

- (UPProfileStoreSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (UPProfileStoreSnapshotDifference)difference
{
  return self->_difference;
}

- (void).cxx_destruct
{
}

@end