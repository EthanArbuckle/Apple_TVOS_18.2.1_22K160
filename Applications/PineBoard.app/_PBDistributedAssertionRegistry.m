@interface _PBDistributedAssertionRegistry
+ (id)_sharedInstance;
- (NSMutableDictionary)assertions;
- (NSSet)allowedDomains;
- (NSString)description;
- (_PBDistributedAssertionRegistry)init;
- (_PBDistributedAssertionRegistry)initWithAllowedDomains:(id)a3;
- (id)_assertionForDomain:(id)a3;
- (id)assertionProviderForDomain:(id)a3;
@end

@implementation _PBDistributedAssertionRegistry

- (_PBDistributedAssertionRegistry)initWithAllowedDomains:(id)a3
{
  id v4 = a3;
  Class v5 = NSClassFromString(@"NSArray");
  if (!v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002735E8();
    }
LABEL_11:
    _bs_set_crash_log_message([v13 UTF8String]);
    __break(0);
    JUMPOUT(0x10003B4DCLL);
  }

  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSArrayClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002735E8();
    }
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBDistributedAssertionRegistry;
  v6 = -[_PBDistributedAssertionRegistry init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    lock_assertions = v7->_lock_assertions;
    v7->_lock_assertions = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));
    allowedDomains = v7->_allowedDomains;
    v7->_allowedDomains = (NSSet *)v10;
  }

  return v7;
}

- (_PBDistributedAssertionRegistry)init
{
  v6[0] = PBSAssertionDomainControlCenterFullScreenOverlay;
  v6[1] = PBSAssertionDomainSuppressHeadphoneBulletin;
  v6[2] = PBSAssertionDomainSuppressNowPlayingBulletin;
  v6[3] = PBSAssertionDomainSuppressVPNBulletin;
  v6[4] = PBSAssertionDomainSuppressVolumeHUD;
  v6[5] = @"PineBoardTests";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 6LL));
  id v4 = -[_PBDistributedAssertionRegistry initWithAllowedDomains:](self, "initWithAllowedDomains:", v3);

  return v4;
}

- (id)assertionProviderForDomain:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[_PBDistributedAssertionRegistry _assertionForDomain:]( self,  "_assertionForDomain:",  a3));
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_lock_assertions, "allValues"));
  os_unfair_lock_unlock(p_lock);
  Class v5 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  [v5 appendArraySection:v4 withName:0 skipIfEmpty:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 build]);

  return (NSString *)v6;
}

+ (id)_sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003B73C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470100 != -1) {
    dispatch_once(&qword_100470100, block);
  }
  return (id)qword_1004700F8;
}

- (id)_assertionForDomain:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  Class v5 = (PBDistributedAssertion *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_assertions, "objectForKey:", v4));
  if (!v5)
  {
    if (-[NSSet containsObject:](self->_allowedDomains, "containsObject:", v4))
    {
      Class v5 = -[PBDistributedAssertion initWithDomain:]( objc_alloc(&OBJC_CLASS___PBDistributedAssertion),  "initWithDomain:",  v4);
      -[NSMutableDictionary setObject:forKey:](self->_lock_assertions, "setObject:forKey:", v5, v4);
    }

    else
    {
      Class v5 = 0LL;
    }
  }

  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (NSMutableDictionary)assertions
{
  return self->_lock_assertions;
}

- (NSSet)allowedDomains
{
  return self->_allowedDomains;
}

- (void).cxx_destruct
{
}

@end