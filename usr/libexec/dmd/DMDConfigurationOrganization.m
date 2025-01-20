@interface DMDConfigurationOrganization
+ (id)fetchRequestMatchingConfigurationOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestMatchingConfigurationOrganizationsOfType:(id)a3;
- (void)didSave;
@end

@implementation DMDConfigurationOrganization

+ (id)fetchRequestMatchingConfigurationOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"identifier",  v4));

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestMatchingConfigurationOrganizationsOfType:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"type",  v4));

  [v5 setPredicate:v6];
  return v5;
}

- (void)didSave
{
  if ((-[DMDConfigurationOrganization isInserted](self, "isInserted") & 1) != 0
    || -[DMDConfigurationOrganization isDeleted](self, "isDeleted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 postNotificationName:@"DMDConfigurationOrganizationsDidChangeNotification" object:0];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMDConfigurationOrganization;
  -[DMDConfigurationOrganization didSave](&v4, "didSave");
}

@end