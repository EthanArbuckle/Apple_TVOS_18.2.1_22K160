@interface DMDPayloadMetadata
+ (BOOL)automaticallyNotifiesObserversOfLastStatusReportTimestamp;
+ (BOOL)automaticallyNotifiesObserversOfStateDictionary;
+ (id)fetchRequestForActivePayloadMetadatasFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4;
+ (id)fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4;
+ (id)fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:(id)a3;
+ (id)keyPathsForValuesAffectingStatus;
+ (id)metadataWithPayloadDictionary:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)validateProperties:(id *)a3;
- (DMDPayloadMetadata)init;
- (DMDPayloadMetadata)initWithContext:(id)a3;
- (DMDPayloadMetadata)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSString)status;
- (id)description;
- (id)descriptiveProperties;
- (void)setLastStatusReportTimestamp:(id)a3;
- (void)setNeedsRefreshStatus;
- (void)setStateDictionary:(id)a3;
- (void)willSave;
@end

@implementation DMDPayloadMetadata

+ (id)fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v6));
    -[NSMutableArray addObject:](v8, "addObject:", v9);
  }

  if (v7) {
    -[NSMutableArray addObject:](v8, "addObject:", v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  [v10 setPredicate:v11];

  return v10;
}

+ (id)fetchRequestForActivePayloadMetadatasFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"identifier",  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)fetchRequestForPayloadMetadatasPendingStatusUpdateFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"pendingStatusUpdate",  &__kCFBooleanTrue));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v4 matchingPredicate:v5]);

  return v6;
}

+ (id)metadataWithPayloadDictionary:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = DMFDeclarationPayloadTypeKey;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:DMFDeclarationPayloadTypeKey]);
  if ([v14 hasPrefix:@"com.apple.command"])
  {
    v15 = &OBJC_CLASS___DMDCommandPayloadMetadata;
  }

  else if ([v14 hasPrefix:@"com.apple.activation"])
  {
    v15 = &OBJC_CLASS___DMDActivationPayloadMetadata;
  }

  else if ([v14 hasPrefix:@"com.apple.asset"])
  {
    v15 = &OBJC_CLASS___DMDAssetPayloadMetadata;
  }

  else
  {
    id v16 = [v14 hasPrefix:@"com.apple.configuration"];
    if ((_DWORD)v16)
    {
      v15 = &OBJC_CLASS___DMDConfigurationPayloadMetadata;
    }

    else
    {
      uint64_t v17 = DMFConfigurationEngineLog(v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100065C40((uint64_t)v14, v18);
      }

      v15 = &OBJC_CLASS___DMDPayloadMetadata;
    }
  }

  v19 = (objc_class *)objc_opt_class(v15);
  if ((-[objc_class isSubclassOfClass:](v19, "isSubclassOfClass:", a1) & 1) != 0)
  {
    id v20 = objc_alloc(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class entity](v19, "entity"));
    id v22 = [v20 initWithEntity:v21 insertIntoManagedObjectContext:v12];

    if (!a1)
    {
LABEL_18:
      id v22 = v22;
      a6 = (id *)v22;
LABEL_33:

      goto LABEL_34;
    }

    [v22 setType:v14];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:DMFDeclarationPayloadIdentifierKey]);
    [v22 setIdentifier:v23];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:DMFDeclarationPayloadRequiresNetworkTetherKey]);
    objc_msgSend(v22, "setRequiresNetworkTether:", objc_msgSend(v24, "BOOLValue"));

    v25 = -[DMDPayload initWithContext:](objc_alloc(&OBJC_CLASS___DMDPayload), "initWithContext:", v12);
    [v22 setPayload:v25];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v22 payload]);
    [v26 setPayloadDictionary:v10];

    [v22 setAvailable:1];
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  v11));
    id v42 = 0LL;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v12 executeFetchRequest:v27 error:&v42]);
    id v29 = v42;

    if (v28)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v28 firstObject]);
      if (v31)
      {
        [v22 setOrganization:v31];
        objc_msgSend( v22,  "setRequiresUnlockedKeychain:",  objc_msgSend(v14, "hasPrefix:", @"com.apple.configuration.policy") ^ 1);
        uint64_t v43 = DMFDeclarationStateStatusKey;
        uint64_t v44 = DMFDeclarationStatusQueued;
        v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
        [v22 setStateDictionary:v32];

        [v22 applyPayloadDictionary:v10];
        if ([v22 validateProperties:a6])
        {

          goto LABEL_18;
        }

        [v12 deleteObject:v22];
      }

      else if (a6)
      {
        uint64_t v45 = DMFConfigurationOrganizationIdentifierErrorKey;
        id v46 = v11;
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        uint64_t v40 = DMFErrorWithCodeAndUserInfo(4002LL, v39);
        *a6 = (id)objc_claimAutoreleasedReturnValue(v40);
      }

LABEL_32:
      a6 = 0LL;
      goto LABEL_33;
    }

    uint64_t v37 = DMFConfigurationEngineLog(v30);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_100065B90((uint64_t)v11, v29, v38);
    }

    if (!a6) {
      goto LABEL_32;
    }
    id v36 = v29;
LABEL_23:
    *a6 = v36;
    goto LABEL_32;
  }

  if (a6)
  {
    v47[0] = DMFConfigurationPayloadIdentifierErrorKey;
    uint64_t v33 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:DMFDeclarationPayloadIdentifierKey]);
    id v22 = (id)v33;
    v34 = &stru_10009F768;
    if (v33) {
      v34 = (const __CFString *)v33;
    }
    v47[1] = DMFInvalidParameterErrorKey;
    v48[0] = v34;
    v48[1] = v13;
    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
    uint64_t v35 = DMFErrorWithCodeAndUserInfo(4000LL, v29);
    id v36 = (id)objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_23;
  }

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata descriptiveProperties](self, "descriptiveProperties"));
  uint64_t v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (id)descriptiveProperties
{
  v3[0] = @"type";
  v3[1] = @"identifier";
  v3[2] = @"available";
  v3[3] = @"installed";
  v3[4] = @"organization.identifier";
  v3[5] = @"requiresNetworkTether";
  v3[6] = @"requiresUnlockedKeychain";
  v3[7] = @"lastStatusReportTimestamp";
  v3[8] = @"stateChangeTimestamp";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  9LL));
}

- (NSString)status
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:DMFDeclarationStateStatusKey]);

  return (NSString *)v3;
}

+ (id)keyPathsForValuesAffectingStatus
{
  v5 = @"stateDictionary";
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

- (void)setNeedsRefreshStatus
{
}

+ (BOOL)automaticallyNotifiesObserversOfStateDictionary
{
  return 0;
}

- (void)setStateDictionary:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata primitiveValueForKey:](self, "primitiveValueForKey:", @"stateDictionary"));
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    [v5 setObject:0 forKeyedSubscript:DMFDeclarationStateTimestampKey];
  }

  else if (!v9)
  {
    goto LABEL_6;
  }

  if (([v5 isEqual:v9] & 1) == 0)
  {
    -[DMDPayloadMetadata willChangeValueForKey:](self, "willChangeValueForKey:", @"stateDictionary");
    id v6 = objc_opt_new(&OBJC_CLASS___NSDate);
    -[DMDPayloadMetadata setStateChangeTimestamp:](self, "setStateChangeTimestamp:", v6);

    -[DMDPayloadMetadata setPendingStatusUpdate:](self, "setPendingStatusUpdate:", 1LL);
    id v7 = [v9 mutableCopy];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateChangeTimestamp](self, "stateChangeTimestamp"));
    [v7 setObject:v8 forKeyedSubscript:DMFDeclarationStateTimestampKey];

    -[DMDPayloadMetadata setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, @"stateDictionary");
    -[DMDPayloadMetadata didChangeValueForKey:](self, "didChangeValueForKey:", @"stateDictionary");
  }

+ (BOOL)automaticallyNotifiesObserversOfLastStatusReportTimestamp
{
  return 0;
}

- (void)setLastStatusReportTimestamp:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata primitiveValueForKey:](self, "primitiveValueForKey:", @"lastStatusReportTimestamp"));
  if (v8 | v4 && ([(id)v4 isEqual:v8] & 1) == 0)
  {
    -[DMDPayloadMetadata willChangeValueForKey:](self, "willChangeValueForKey:", @"lastStatusReportTimestamp");
    -[DMDPayloadMetadata setPrimitiveValue:forKey:]( self,  "setPrimitiveValue:forKey:",  v8,  @"lastStatusReportTimestamp");
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata stateChangeTimestamp](self, "stateChangeTimestamp"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata lastStatusReportTimestamp](self, "lastStatusReportTimestamp"));
    id v7 = [v5 compare:v6];

    if (v7 != (id)1) {
      -[DMDPayloadMetadata setPendingStatusUpdate:](self, "setPendingStatusUpdate:", 0LL);
    }
    -[DMDPayloadMetadata didChangeValueForKey:](self, "didChangeValueForKey:", @"lastStatusReportTimestamp");
  }
}

- (void)willSave
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata changedValues](self, "changedValues"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  if ([v7 containsObject:@"stateDictionary"])
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata organization](self, "organization"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
    [v4 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v6];
  }
}

- (BOOL)validateProperties:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata identifier](self, "identifier"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata type](self, "type"));

    if (v6) {
      return 1;
    }
    if (a3)
    {
      v12[0] = DMFConfigurationPayloadIdentifierErrorKey;
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata identifier](self, "identifier"));
      v12[1] = DMFInvalidParameterErrorKey;
      v13[0] = v8;
      v13[1] = DMFDeclarationPayloadTypeKey;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
      uint64_t v11 = DMFErrorWithCodeAndUserInfo(4000LL, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue(v11);

      goto LABEL_8;
    }
  }

  else if (a3)
  {
    uint64_t v14 = DMFInvalidParameterErrorKey;
    uint64_t v15 = DMFDeclarationPayloadIdentifierKey;
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    uint64_t v9 = DMFErrorWithCodeAndUserInfo(4000LL, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue(v9);
LABEL_8:
  }

  return 0;
}

- (BOOL)validateForInsert:(id *)a3
{
  BOOL v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___DMDPayloadMetadata;
    LOBYTE(v5) = -[DMDPayloadMetadata validateForInsert:](&v7, "validateForInsert:", a3);
  }

  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  BOOL v5 = -[DMDPayloadMetadata validateProperties:](self, "validateProperties:");
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___DMDPayloadMetadata;
    LOBYTE(v5) = -[DMDPayloadMetadata validateForUpdate:](&v7, "validateForUpdate:", a3);
  }

  return v5;
}

- (BOOL)validateForDelete:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMDPayloadMetadata;
  return -[DMDPayloadMetadata validateForDelete:](&v4, "validateForDelete:", a3);
}

- (DMDPayloadMetadata)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDPayloadMetadata;
  return -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:]( &v5,  "initWithEntity:insertIntoManagedObjectContext:",  a3,  a4);
}

- (DMDPayloadMetadata)initWithContext:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v7 = objc_opt_class(self);
  unint64_t v8 = NSStringFromSelector(a2);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v6 handleFailureInMethod:a2, self, @"DMDPayloadMetadata.m", 317, @"%@ cannot call %@", v7, v9 object file lineNumber description];

  id v10 = [(id)objc_opt_class(self) entity];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:]( self,  "initWithEntity:insertIntoManagedObjectContext:",  v11,  v5);

  return v12;
}

- (DMDPayloadMetadata)init
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v5 = objc_opt_class(self);
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 handleFailureInMethod:a2, self, @"DMDPayloadMetadata.m", 322, @"%@ cannot call %@", v5, v7 object file lineNumber description];

  id v8 = [(id)objc_opt_class(self) entity];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = -[DMDPayloadMetadata initWithEntity:insertIntoManagedObjectContext:]( self,  "initWithEntity:insertIntoManagedObjectContext:",  v9,  0LL);

  return v10;
}

@end