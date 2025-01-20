@interface DMDConfigurationPayloadMetadata
+ (id)fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:(id)a3 payloadIdentifiers:(id)a4;
+ (id)fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:(id)a3;
@end

@implementation DMDConfigurationPayloadMetadata

+ (id)fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v4));

  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  [v5 setPredicate:v9];

  return v5;
}

+ (id)fetchRequestForAvailableConfigurationsFromOrganizationWithIdentifier:(id)a3 payloadIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue,  v9));
  v15[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier IN %@",  v6));

  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v12));
  [v8 setPredicate:v13];

  return v8;
}

+ (id)fetchRequestForConfigurationsPendingInstallFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v4));

  v13[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse));
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"failed",  &__kCFBooleanFalse));
  v13[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SUBQUERY(incomingPayloadMetadataReferences, $ref, ($ref.available == YES) && ($ref.predicatePayloadMetadata.%K.BOOLValue == YES)).@count > 0",  DMFDeclarationStatePredicateLastEvaluationValueKey));
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));
  [v5 setPredicate:v11];

  return v5;
}

+ (id)fetchRequestForConfigurationsPendingRemoveFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v4));

  v13[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanTrue));
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"failed",  &__kCFBooleanFalse));
  v13[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SUBQUERY(incomingPayloadMetadataReferences, $ref, ($ref.type BEGINSWITH[c] 'com.apple.activation') && ($ref.predicatePayloadMetadata.%K.BOOLValue == YES)).@count == 0",  DMFDeclarationStatePredicateLastEvaluationValueKey));
  v13[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 4LL));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v10));
  [v5 setPredicate:v11];

  return v5;
}

+ (id)fetchRequestForConfigurationsPendingInactiveFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v4));

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue,  v6));
  v14[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse));
  v14[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != %@",  @"status",  DMFDeclarationStatusInactive));
  v14[3] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SUBQUERY(incomingPayloadMetadataReferences, $ref, $ref.available == YES).@count = 0"));
  v14[4] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 5LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v11));
  [v5 setPredicate:v12];

  return v5;
}

@end