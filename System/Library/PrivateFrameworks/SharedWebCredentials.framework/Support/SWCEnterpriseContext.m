@interface SWCEnterpriseContext
- (BOOL)isManaging;
- (NSData)state;
- (SWCEnterpriseContext)init;
- (id)isApplicationIdentifierEligibleForManagedMode:(id)a3 error:(id *)a4;
- (id)serviceSpecifiersForApplicationIdentifier:(id)a3 error:(id *)a4;
- (void)_loadEnterpriseData;
@end

@implementation SWCEnterpriseContext

- (SWCEnterpriseContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SWCEnterpriseContext;
  v2 = -[SWCEnterpriseContext init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](&OBJC_CLASS____SWCPrefs, "sharedPrefs"));
    v2->_appleInternal = [v3 isAppleInternal];

    -[SWCEnterpriseContext _loadEnterpriseData](v2, "_loadEnterpriseData");
  }

  return v2;
}

- (id)serviceSpecifiersForApplicationIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (!self->_associatedDomains)
  {
    v12 = self->_highLevelError;
    v11 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  if (!v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"SWCEnterpriseContext.mm", 93, @"Failed to get a string value from %@", v8 object file lineNumber description];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_associatedDomains, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    id v16 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:error:]( &OBJC_CLASS____SWCServiceSpecifier,  "serviceSpecifiersWithEntitlementValue:error:",  v10,  &v16));
    v12 = (NSError *)v16;
    if (v11) {
      id v13 = v11;
    }
  }

  else
  {
    v12 = 0LL;
    v11 = &__NSArray0__struct;
  }

  if (a4)
  {
LABEL_12:
    if (!v11) {
      *a4 = v12;
    }
  }

- (id)isApplicationIdentifierEligibleForManagedMode:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = (void *)_SWCDiagnosticStorage[1];
  if (v8 && self->_appleInternal)
  {
    v9 = v8;
  }

  else
  {
    v9 = self->_managedModeAppIDs;
    if (!v9)
    {
      v11 = 0LL;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
  if (!v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v13 handleFailureInMethod:a2, self, @"SWCEnterpriseContext.mm", 142, @"Failed to get a string value from %@", v7 object file lineNumber description];
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[NSSet containsObject:](v9, "containsObject:", v10)));

  if (a4)
  {
LABEL_10:
    if (!v11) {
      *a4 = self->_highLevelError;
    }
  }

- (NSData)state
{
  v3 = objc_autoreleasePoolPush();
  if (-[NSDictionary count](self->_associatedDomains, "count") || -[NSSet count](self->_managedModeAppIDs, "count"))
  {
    v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
    if (-[NSDictionary count](self->_associatedDomains, "count")) {
      -[NSMutableArray addObject:](v4, "addObject:", self->_associatedDomains);
    }
    if (-[NSSet count](self->_managedModeAppIDs, "count"))
    {
      objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_managedModeAppIDs, "allObjects"));
      -[NSMutableArray addObject:](v4, "addObject:", v5);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v4,  2LL,  0LL));
    id v7 = v6;
    if (v6)
    {
      memset(v11, 0, sizeof(v11));
      id v8 = v6;
      CC_SHA256( objc_msgSend(v8, "bytes", 0, 0, 0, 0),  (CC_LONG)objc_msgSend(v8, "length"),  (unsigned __int8 *)v11);
      v9 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v11, 32LL);
    }

    else
    {
      v9 = 0LL;
    }
  }

  else
  {
    v9 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return v9;
}

- (BOOL)isManaging
{
  return self->_managing;
}

- (void).cxx_destruct
{
}

- (void)_loadEnterpriseData
{
  v3 = objc_alloc(&OBJC_CLASS___NSError);
  v17[0] = &off_10002A4F8;
  v16[0] = @"Line";
  v16[1] = @"Function";
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]"));
  v16[2] = NSDebugDescriptionErrorKey;
  v17[1] = v4;
  v17[2] = @"This platform does not support enterprise-backed associated domains.";
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  uint64_t v6 = _SWCErrorDomain;
  id v7 = -[NSError initWithDomain:code:userInfo:](v3, "initWithDomain:code:userInfo:", _SWCErrorDomain, 5LL, v5);

  if (v7)
  {
    id v8 = v7;
    highLevelError = self->_highLevelError;
    self->_highLevelError = v8;
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___NSError);
    v14[1] = @"Function";
    v15[0] = &off_10002A510;
    v14[0] = @"Line";
    highLevelError = (NSError *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]"));
    v15[1] = highLevelError;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    v12 = -[NSError initWithDomain:code:userInfo:](v10, "initWithDomain:code:userInfo:", v6, -1LL, v11);
    id v13 = self->_highLevelError;
    self->_highLevelError = v12;
  }
}

@end