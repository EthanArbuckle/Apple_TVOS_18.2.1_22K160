@interface PBApplicationLaunchBreadcrumbs
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)push:(id)a3;
- (NSString)description;
- (PBApplicationLaunchBreadcrumbs)init;
- (PBApplicationLaunchBreadcrumbs)initWithPredicate:(id)a3;
- (PBApplicationLaunchBreadcrumbs)initWithPredicate:(id)a3 values:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)peek;
- (id)pop;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)count;
- (unint64_t)hash;
- (void)clear;
@end

@implementation PBApplicationLaunchBreadcrumbs

- (PBApplicationLaunchBreadcrumbs)initWithPredicate:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"predicate != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100280DA4(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v16 UTF8String]);
    __break(0);
    JUMPOUT(0x100102748LL);
  }

  v9 = v8;
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"values != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100280E50(a2);
    }
    goto LABEL_11;
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBApplicationLaunchBreadcrumbs;
  v10 = -[PBApplicationLaunchBreadcrumbs init](&v17, "init");
  if (v10)
  {
    id v11 = [v7 copy];
    id predicate = v10->_predicate;
    v10->_id predicate = v11;

    v13 = -[NSMutableOrderedSet initWithOrderedSet:copyItems:]( objc_alloc(&OBJC_CLASS___NSMutableOrderedSet),  "initWithOrderedSet:copyItems:",  v9,  1LL);
    values = v10->_values;
    v10->_values = v13;
  }

  return v10;
}

- (PBApplicationLaunchBreadcrumbs)initWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSet](&OBJC_CLASS___NSOrderedSet, "orderedSet"));
  v6 = -[PBApplicationLaunchBreadcrumbs initWithPredicate:values:](self, "initWithPredicate:values:", v4, v5);

  return v6;
}

- (PBApplicationLaunchBreadcrumbs)init
{
  return -[PBApplicationLaunchBreadcrumbs initWithPredicate:](self, "initWithPredicate:", &stru_1003D7700);
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableOrderedSet count](self->_values, "count");
}

- (BOOL)isEmpty
{
  return -[PBApplicationLaunchBreadcrumbs count](self, "count") == 0;
}

- (BOOL)push:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 fromApplication]);
    if (v7 && (*((unsigned int (**)(void))self->_predicate + 2))())
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
      -[NSMutableOrderedSet removeObject:](self->_values, "removeObject:", v8);
      -[NSMutableOrderedSet addObject:](self->_values, "addObject:", v8);

      BOOL v9 = 1;
    }

    else
    {
      BOOL v9 = 0;
    }

    return v9;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"request != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100280EFC(a2);
    }
    BOOL result = _bs_set_crash_log_message([v11 UTF8String]);
    __break(0);
  }

  return result;
}

- (id)peek
{
  return (id)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](self->_values, "lastObject"));
}

- (id)pop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet lastObject](self->_values, "lastObject"));
  -[NSMutableOrderedSet removeObject:](self->_values, "removeObject:", v3);
  return v3;
}

- (void)clear
{
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableOrderedSet hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBApplicationLaunchBreadcrumbs));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  values = self->_values;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100102AD0;
  v11[3] = &unk_1003D76C0;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v6 appendObject:values counterpart:v11];
  LOBYTE(values) = [v6 isEqual];

  return (char)values;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBApplicationLaunchBreadcrumbs descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationLaunchBreadcrumbs succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 =  objc_msgSend( v3,  "appendUnsignedInteger:withName:",  -[PBApplicationLaunchBreadcrumbs count](self, "count"),  @"count");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBApplicationLaunchBreadcrumbs descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 setActiveMultilinePrefix:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](self->_values, "array"));
  [v5 appendArraySection:v6 withName:0 skipIfEmpty:0];

  return v5;
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendCollection:self->_values withKey:@"values" skipIfEmpty:0];
  return v3;
}

- (void).cxx_destruct
{
}

@end