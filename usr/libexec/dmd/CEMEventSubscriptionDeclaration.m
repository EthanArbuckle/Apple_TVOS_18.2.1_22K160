@interface CEMEventSubscriptionDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_replaceRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMEventSubscriptionDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new(&OBJC_CLASS___DMDInstallEventSubscriptionRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);

  -[DMDInstallEventSubscriptionRequest setOrganizationIdentifier:](v6, "setOrganizationIdentifier:", v7);
  -[DMDInstallEventSubscriptionRequest setSubscriptionDeclaration:](v6, "setSubscriptionDeclaration:", self);
  return v6;
}

- (id)dmf_replaceRequestWithContext:(id)a3 error:(id *)a4
{
  return 0LL;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new(&OBJC_CLASS___DMDRemoveEventSubscriptionRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 organizationIdentifier]);

  -[DMDRemoveEventSubscriptionRequest setOrganizationIdentifier:](v6, "setOrganizationIdentifier:", v7);
  -[DMDRemoveEventSubscriptionRequest setSubscriptionDeclaration:](v6, "setSubscriptionDeclaration:", self);
  return v6;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0LL;
}

@end