@interface IDSDXPCFirewall
- (IDSDXPCFirewall)initWithService:(id)a3 queue:(id)a4 connection:(id)a5;
- (IMDispatchTimer)processMessageTimer;
- (NSSet)impactedServices;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (id)_firewallStore;
- (unsigned)category;
- (void)addEntries:(id)a3 withCompletion:(id)a4;
- (void)currentDonatedEntries:(id)a3;
- (void)currentEntries:(id)a3;
- (void)impactedServicesForService:(id)a3 withCompletion:(id)a4;
- (void)populateMergeIDForEntries:(id)a3 withCompletion:(id)a4;
- (void)processStoredRemoteIncomingMessagesForCategoryFired;
- (void)recentlyBlockedEntries:(id)a3;
- (void)removeAllDonatedEntries:(id)a3;
- (void)removeAllEntries:(id)a3;
- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4;
- (void)removeEntries:(id)a3 withCompletion:(id)a4;
- (void)replaceEntries:(id)a3 replaceAll:(BOOL)a4 withCompletion:(id)a5;
- (void)scheduleProcessStoredRemoteIncomingMessages;
- (void)setCategory:(unsigned int)a3;
- (void)setImpactedServices:(id)a3;
- (void)setProcessMessageTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IDSDXPCFirewall

- (IDSDXPCFirewall)initWithService:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v11 hasEntitlement:kIDSFirewallEntitlement] & 1) == 0)
  {
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      v25 = "Missing IDS Firewall entitlement -- failing creation of IDSDXPCFirewall collaborator {connection: %@}";
      v26 = v24;
      uint32_t v27 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }

- (id)_firewallStore
{
  return +[IDSFirewallStore sharedInstance](&OBJC_CLASS___IDSFirewallStore, "sharedInstance");
}

- (void)impactedServicesForService:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  id v9 = (void (**)(id, NSSet *, void))a4;
  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v23 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 71, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v24 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 72, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

LABEL_3:
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Fetching impacted services for service {%@}",  buf,  0xCu);
  }

  objc_storeStrong((id *)&self->_service, a3);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceWithName:v8]);

  if (v12)
  {
    self->_category = [v12 controlCategory];
    v13 = objc_alloc(&OBJC_CLASS___NSSet);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 serviceNameToControlCategoryMap]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_category));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:v16]);
    v18 = -[NSSet initWithArray:](v13, "initWithArray:", v17);
    impactedServices = self->_impactedServices;
    self->_impactedServices = v18;

    v9[2](v9, self->_impactedServices, 0LL);
  }

  else
  {
    uint64_t v20 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v26 = @"Invalid service name. Could not fetch service properties.";
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v20,  1LL,  v21));

    ((void (**)(id, NSSet *, void *))v9)[2](v9, 0LL, v22);
  }
}

- (void)addEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 91, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = category;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Update to category %u addEntries %@",  buf,  0x12u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100121EA0;
  v14[3] = &unk_1008F9638;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  -[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]( self,  "populateMergeIDForEntries:withCompletion:",  v12,  v14);
}

- (void)removeEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 109, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100122128;
  v12[3] = &unk_1008F9638;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  -[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]( self,  "populateMergeIDForEntries:withCompletion:",  v10,  v12);
}

- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 124, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001223A4;
  v12[3] = &unk_1008F9638;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  -[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]( self,  "populateMergeIDForEntries:withCompletion:",  v10,  v12);
}

- (void)replaceEntries:(id)a3 replaceAll:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v21 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 139, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      unsigned int category = self->_category;
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = category;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Update to category %u replaceAllEntries %@",  buf,  0x12u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
    unsigned __int8 v15 = [v14 removeAllEntriesWithCategory:self->_category];
  }

  else
  {
    if (v12)
    {
      unsigned int v16 = self->_category;
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = v16;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Update to category %u replaceEntries %@",  buf,  0x12u);
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
    unsigned __int8 v15 = [v14 removeEntriesWithCategory:self->_category isDonated:1];
  }

  unsigned __int8 v17 = v15;

  if ((v17 & 1) != 0)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1001227D4;
    v22[3] = &unk_1008F9638;
    v22[4] = self;
    id v23 = v9;
    id v24 = v10;
    -[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]( self,  "populateMergeIDForEntries:withCompletion:",  v23,  v22);
  }

  else
  {
    uint64_t v18 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v26 = @"Failed to remove entries from allow list.";
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v18,  4LL,  v19));

    (*((void (**)(id, void *))v10 + 2))(v10, v20);
  }
}

- (void)currentDonatedEntries:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 170, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching all entries for category %u", buf, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getDonatedAllowedEntriesForCategory:self->_category]);

  if (v9)
  {
    v5[2](v5, v9, 0LL);
  }

  else
  {
    uint64_t v10 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    unsigned __int8 v15 = @"Failed to fetch donated entries from allow list";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  4LL,  v11));

    ((void (**)(id, void *, void *))v5)[2](v5, 0LL, v12);
  }
}

- (void)currentEntries:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 184, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching all entries for category %u", buf, 8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getAllAllowedEntriesForCategory:self->_category]);

  if (v9)
  {
    v5[2](v5, v9, 0LL);
  }

  else
  {
    uint64_t v10 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    unsigned __int8 v15 = @"Failed to fetch entries from allow list";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  4LL,  v11));

    ((void (**)(id, void *, void *))v5)[2](v5, 0LL, v12);
  }
}

- (void)removeAllDonatedEntries:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 198, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Update to category %u removeAllDonatedEntries",  buf,  8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
  unsigned __int8 v9 = [v8 removeEntriesWithCategory:self->_category isDonated:1];

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    unsigned __int8 v15 = @"Failed to remove all donated entries from allow list.";
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  4LL,  v12));
  }

  v5[2](v5, v10);
}

- (void)removeAllEntries:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 211, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Update to category %u removeAllEntries",  buf,  8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
  unsigned __int8 v9 = [v8 removeAllEntriesWithCategory:self->_category];

  if ((v9 & 1) != 0)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    unsigned __int8 v15 = @"Failed to remove all entries from allow list.";
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  4LL,  v12));
  }

  v5[2](v5, v10);
}

- (void)recentlyBlockedEntries:(id)a3
{
  v5 = (void (**)(id, void *, void *))a3;
  if (!v5)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 224, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    unsigned int v17 = service;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Fetching recently blocked handles for service {%@}",  buf,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCFirewall _firewallStore](self, "_firewallStore"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 blockedEntriesForCategory:self->_category]);

  if (v9)
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    unsigned __int8 v15 = @"Failed to get recently blocked entries";
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v11,  4LL,  v12));
  }

  v5[2](v5, v9, v10);
}

- (void)scheduleProcessStoredRemoteIncomingMessages
{
  processMessageTimer = self->_processMessageTimer;
  if (processMessageTimer)
  {
    -[IMDispatchTimer invalidate](processMessageTimer, "invalidate");
    v4 = self->_processMessageTimer;
    self->_processMessageTimer = 0LL;
  }

  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109376;
    unsigned int v15 = category;
    __int16 v16 = 2048;
    uint64_t v17 = 1LL;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Scheduling a process message timer for category %u in: %llu",  buf,  0x12u);
  }

  id v7 = objc_alloc(&OBJC_CLASS___IMDispatchTimer);
  uint64_t v9 = im_primary_queue(v7, v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001233DC;
  v13[3] = &unk_1008F8088;
  v13[4] = self;
  uint64_t v11 = -[IMDispatchTimer initWithQueue:interval:repeats:handlerBlock:]( v7,  "initWithQueue:interval:repeats:handlerBlock:",  v10,  1LL,  0LL,  v13);
  BOOL v12 = self->_processMessageTimer;
  self->_processMessageTimer = v11;
}

- (void)processStoredRemoteIncomingMessagesForCategoryFired
{
  processMessageTimer = self->_processMessageTimer;
  self->_processMessageTimer = 0LL;

  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v12 = category;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Process message timer fired for category %u",  buf,  8u);
  }

  uint64_t v8 = im_primary_queue(v6, v7);
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001234EC;
  block[3] = &unk_1008F6010;
  block[4] = self;
  dispatch_async(v9, block);
}

- (void)populateMergeIDForEntries:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v74 objects:v89 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v75;
    do
    {
      unsigned int v12 = 0LL;
      do
      {
        if (*(void *)v75 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v74 + 1) + 8LL * (void)v12);
        NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mergeID]);
        if (v14) {
          goto LABEL_7;
        }
        uint64_t v15 = objc_claimAutoreleasedReturnValue([v13 uri]);
        if (v15)
        {
          __int16 v16 = (void *)v15;
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 uri]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 prefixedURI]);

          if (v18)
          {
            NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue([v13 uri]);
            -[NSMutableArray addObject:](v65, "addObject:", v14);
LABEL_7:
          }
        }

        unsigned int v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v19 = [v8 countByEnumeratingWithState:&v74 objects:v89 count:16];
      id v10 = v19;
    }

    while (v19);
  }

  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v82 = category;
    *(_WORD *)&v82[4] = 2112;
    *(void *)&v82[6] = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Update to category %u populateMergeIDForEntries %@",  buf,  0x12u);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDAccountController sharedInstance](&OBJC_CLASS___IDSDAccountController, "sharedInstance"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDServiceController sharedInstance](&OBJC_CLASS___IDSDServiceController, "sharedInstance"));
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 serviceWithIdentifier:self->_service]);
  NSErrorUserInfoKey v25 = (void *)objc_claimAutoreleasedReturnValue([v22 registeredAccountsOnService:v24]);

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:]( &OBJC_CLASS___IDSQueryUtilities,  "accountToQueryFrom:fromURI:destinationURIs:allowLocalAccount:",  v25,  0LL,  &__NSArray0__struct,  0LL));
  uint32_t v27 = v26;
  if (v26)
  {
    v62 = v25;
    v63 = (void (**)(void, void))v7;
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v26 primaryRegistration]);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 registrationCert]);

    id v30 = (void *)objc_claimAutoreleasedReturnValue( +[IDSQueryUtilities prefixedAliasStringToQueryFrom:withPreferredFromURI:]( &OBJC_CLASS___IDSQueryUtilities,  "prefixedAliasStringToQueryFrom:withPreferredFromURI:",  v27,  0LL));
    id v31 = self;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[IDSURI URIWithPrefixedURI:withServiceLoggingHint:]( &OBJC_CLASS___IDSURI,  "URIWithPrefixedURI:withServiceLoggingHint:",  v30,  self->_service));

    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    v35 = v32;
    if (v32 && v29)
    {
      v59 = (void *)v29;
      v60 = v27;
      if (v34)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v82 = v65;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Checking cache first to populate mergeIDs for handles {%@}",  buf,  0xCu);
      }

      __int128 v72 = 0u;
      __int128 v73 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id v61 = v8;
      id obj = v8;
      id v36 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v71;
        do
        {
          for (i = 0LL; i != v37; i = (char *)i + 1)
          {
            if (*(void *)v71 != v38) {
              objc_enumerationMutation(obj);
            }
            v40 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)i);
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
            v42 = (void *)objc_claimAutoreleasedReturnValue([v40 uri]);
            v43 = (void *)objc_claimAutoreleasedReturnValue( [v41 senderCorrelationIdentifierForURI:v42 fromURI:v32 service:v31->_service]);

            if (v43)
            {
              [v40 setMergeID:v43];
              v44 = (void *)objc_claimAutoreleasedReturnValue([v40 uri]);
              -[NSMutableArray removeObject:](v65, "removeObject:", v44);
            }
          }

          id v37 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
        }

        while (v37);
      }

      if (-[NSMutableArray count](v65, "count"))
      {
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v82 = v65;
          _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Still need to query handles {%@}",  buf,  0xCu);
        }

        v46 = (void *)objc_claimAutoreleasedReturnValue(+[IDSPeerIDManager sharedInstance](&OBJC_CLASS___IDSPeerIDManager, "sharedInstance"));
        service = v31->_service;
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472LL;
        v66[2] = sub_100123D18;
        v66[3] = &unk_1008FB048;
        v67 = v65;
        id v68 = obj;
        id v7 = v63;
        v69 = v63;
        LOBYTE(v58) = 0;
        v48 = v59;
        [v46 startQueryForURIs:v67 fromIdentity:v59 fromURI:v35 fromService:service forSending:0 forRefresh:1 isForced:v58 reason:@"FirewallPopulate" completionBlock:v66];

        id v8 = v61;
        NSErrorUserInfoKey v25 = v62;
        uint32_t v27 = v60;
      }

      else
      {
        id v7 = v63;
        v63[2](v63, 0LL);

        id v8 = v61;
        NSErrorUserInfoKey v25 = v62;
        v48 = v59;
        uint32_t v27 = v60;
      }
    }

    else
    {
      if (v34)
      {
        v53 = @"NO";
        v54 = self->_service;
        *(void *)v82 = "-[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]";
        *(_DWORD *)buf = 136315906;
        if (v29) {
          v53 = @"YES";
        }
        *(_WORD *)&v82[8] = 2112;
        *(void *)&v82[10] = v54;
        __int16 v83 = 2112;
        v84 = v32;
        __int16 v85 = 2112;
        v86 = v53;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s: No registered account found for service %@. localURI {%@} cert {%@}",  buf,  0x2Au);
      }

      uint64_t v55 = IDSFirewallErrorDomain;
      NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
      v80 = @"Failed to query for merge id due to nil local uri or cert";
      v48 = (void *)v29;
      v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v80,  &v79,  1LL));
      v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v55,  6LL,  v56));

      id v7 = v63;
      ((void (**)(void, void *))v63)[2](v63, v57);
    }
  }

  else
  {
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog IDSFirewall](&OBJC_CLASS___IDSFoundationLog, "IDSFirewall"));
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = self->_service;
      *(_DWORD *)buf = 136315394;
      *(void *)v82 = "-[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]";
      *(_WORD *)&v82[8] = 2112;
      *(void *)&v82[10] = v50;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "%s: No account found for service %@.",  buf,  0x16u);
    }

    uint64_t v51 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
    v88 = @"Failed to query for merge id as there was no account found";
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v88,  &v87,  1LL));
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v51,  6LL,  v52));

    (*((void (**)(id, void *))v7 + 2))(v7, v48);
  }
}

- (unsigned)category
{
  return self->_category;
}

- (void)setCategory:(unsigned int)a3
{
  self->_unsigned int category = a3;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSSet)impactedServices
{
  return self->_impactedServices;
}

- (void)setImpactedServices:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IMDispatchTimer)processMessageTimer
{
  return self->_processMessageTimer;
}

- (void)setProcessMessageTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end