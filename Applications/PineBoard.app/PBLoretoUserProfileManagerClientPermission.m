@interface PBLoretoUserProfileManagerClientPermission
- (BOOL)isAllowed;
- (NSSet)auxiliaryEntitlements;
- (NSString)entitlement;
- (PBLoretoUserProfileManagerClientPermission)initWithAuditToken:(id)a3 entitlement:(id)a4;
- (PBLoretoUserProfileManagerClientPermission)initWithAuditToken:(id)a3 entitlement:(id)a4 auxiliaryEntitlements:(id)a5;
- (PBLoretoUserProfileManagerClientPermission)initWithEntitlement:(id)a3 auxiliaryEntitlements:(id)a4 isAllowed:(BOOL)a5;
- (id)description;
- (void)setAllowed:(BOOL)a3;
@end

@implementation PBLoretoUserProfileManagerClientPermission

- (PBLoretoUserProfileManagerClientPermission)initWithAuditToken:(id)a3 entitlement:(id)a4 auxiliaryEntitlements:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v10 setByAddingObject:v9]);
  uint64_t v12 = (uint64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        if (objc_msgSend(v8, "hasEntitlement:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
        {
          uint64_t v12 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v12 = (uint64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

- (PBLoretoUserProfileManagerClientPermission)initWithAuditToken:(id)a3 entitlement:(id)a4
{
  id v6 = a4;
  id v7 = [a3 hasEntitlement:v6];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  id v9 = -[PBLoretoUserProfileManagerClientPermission initWithEntitlement:auxiliaryEntitlements:isAllowed:]( self,  "initWithEntitlement:auxiliaryEntitlements:isAllowed:",  v6,  v8,  v7);

  return v9;
}

- (PBLoretoUserProfileManagerClientPermission)initWithEntitlement:(id)a3 auxiliaryEntitlements:(id)a4 isAllowed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBLoretoUserProfileManagerClientPermission;
  id v10 = -[PBLoretoUserProfileManagerClientPermission init](&v16, "init");
  if (v10)
  {
    id v11 = (NSString *)[v8 copy];
    entitlement = v10->_entitlement;
    v10->_entitlement = v11;

    uint64_t v13 = (NSSet *)[v9 copy];
    auxiliaryEntitlements = v10->_auxiliaryEntitlements;
    v10->_auxiliaryEntitlements = v13;

    v10->_allowed = a5;
  }

  return v10;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendBool:self->_allowed withName:@"allowed"];
  [v3 appendString:self->_entitlement withName:@"entitlement"];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_auxiliaryEntitlements, "allObjects"));
  [v3 appendArraySection:v5 withName:@"auxiliaryEntitlements" skipIfEmpty:1];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return v6;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (NSSet)auxiliaryEntitlements
{
  return self->_auxiliaryEntitlements;
}

- (BOOL)isAllowed
{
  return self->_allowed;
}

- (void)setAllowed:(BOOL)a3
{
  self->_allowed = a3;
}

- (void).cxx_destruct
{
}

@end