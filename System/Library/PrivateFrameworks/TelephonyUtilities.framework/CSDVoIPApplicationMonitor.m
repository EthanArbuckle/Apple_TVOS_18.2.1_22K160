@interface CSDVoIPApplicationMonitor
- (BKSApplicationStateMonitor)applicationStateMonitor;
- (BOOL)isRunningForegroundForVoIPApplication:(id)a3;
- (CSDVoIPApplicationMonitor)init;
- (NSMutableDictionary)bundleIdentifierToApplicationState;
- (id)applicationStateForBundleIdentifier:(id)a3;
- (id)fetchApplicationStateForBundleIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)addVoIPApplication:(id)a3;
- (void)dealloc;
- (void)removeVoIPApplication:(id)a3;
- (void)setApplicationState:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation CSDVoIPApplicationMonitor

- (CSDVoIPApplicationMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSDVoIPApplicationMonitor;
  v2 = -[CSDVoIPApplicationMonitor init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    bundleIdentifierToApplicationState = v3->_bundleIdentifierToApplicationState;
    v3->_bundleIdentifierToApplicationState = v4;

    v6 = -[BKSApplicationStateMonitor initWithBundleIDs:states:]( objc_alloc(&OBJC_CLASS___BKSApplicationStateMonitor),  "initWithBundleIDs:states:",  &__NSArray0__struct,  0LL);
    applicationStateMonitor = v3->_applicationStateMonitor;
    v3->_applicationStateMonitor = v6;

    objc_initWeak(&location, v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100137424;
    v9[3] = &unk_1003DAE60;
    objc_copyWeak(&v10, &location);
    -[BKSApplicationStateMonitor setHandler:](v3->_applicationStateMonitor, "setHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSDVoIPApplicationMonitor;
  -[CSDVoIPApplicationMonitor dealloc](&v3, "dealloc");
}

- (BOOL)isRunningForegroundForVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if ([v5 length])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor applicationStateForBundleIdentifier:]( self,  "applicationStateForBundleIdentifier:",  v5));
    unsigned int v7 = [v6 unsignedIntValue];

    BOOL v8 = v7 == 8;
  }

  else
  {
    id v9 = sub_1001704C4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not obtain bundle identifier from VoIP application %@",  (uint8_t *)&v12,  0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)addVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if ([v5 length])
  {
    p_accessorLock = &self->_accessorLock;
    os_unfair_lock_lock(&self->_accessorLock);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

    if (!v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 arrayByAddingObject:v5]);

      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMonitor applicationStateMonitor](self, "applicationStateMonitor"));
      [v12 updateInterestedBundleIDs:v11 states:BKSApplicationStateAll];

      id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor fetchApplicationStateForBundleIdentifier:]( self,  "fetchApplicationStateForBundleIdentifier:",  v5));
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
      [v14 setObject:v13 forKeyedSubscript:v5];
    }

    os_unfair_lock_unlock(p_accessorLock);
  }

  else
  {
    id v15 = sub_1001704C4();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not obtain bundle identifier from VoIP application %@",  (uint8_t *)&v17,  0xCu);
    }
  }
}

- (void)removeVoIPApplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  if ([v5 length])
  {
    p_accessorLock = &self->_accessorLock;
    os_unfair_lock_lock(&self->_accessorLock);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v5]);

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
      [v9 setObject:0 forKeyedSubscript:v5];

      id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);

      if ([v11 count]) {
        uint64_t v12 = BKSApplicationStateAll;
      }
      else {
        uint64_t v12 = 0LL;
      }
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMonitor applicationStateMonitor](self, "applicationStateMonitor"));
      [v13 updateInterestedBundleIDs:v11 states:v12];
    }

    else
    {
      id v14 = sub_1001704C4();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[WARN] Could not obtain bundle identifier from VoIP application %@",  (uint8_t *)&v16,  0xCu);
      }
    }

    os_unfair_lock_unlock(p_accessorLock);
  }
}

- (id)applicationStateForBundleIdentifier:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    id v10 = v7;
  }
  else {
    id v10 = 0LL;
  }
  os_unfair_lock_unlock(p_accessorLock);

  return v10;
}

- (void)setApplicationState:(id)a3 forBundleIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v6]);

  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0) {
    id v12 = v9;
  }
  else {
    id v12 = 0LL;
  }
  if ((TUNumbersAreEqualOrNil(v12, v14) & 1) == 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
    [v13 setObject:v14 forKeyedSubscript:v6];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (id)fetchApplicationStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSDVoIPApplicationMonitor bundleIdentifierToApplicationState]( self,  "bundleIdentifierToApplicationState"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObject:v4]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMonitor applicationStateMonitor](self, "applicationStateMonitor"));
  [v8 updateInterestedBundleIDs:v7 states:BKSApplicationStateAll];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDVoIPApplicationMonitor applicationStateMonitor](self, "applicationStateMonitor"));
  id v10 = [v9 applicationStateForApplication:v4];

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10));
  return v11;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableDictionary)bundleIdentifierToApplicationState
{
  return self->_bundleIdentifierToApplicationState;
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void).cxx_destruct
{
}

@end