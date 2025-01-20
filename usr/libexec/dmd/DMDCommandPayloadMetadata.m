@interface DMDCommandPayloadMetadata
+ (id)commandsWithPayloadDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6;
+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4;
+ (id)fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:(id)a3;
@end

@implementation DMDCommandPayloadMetadata

+ (id)commandsWithPayloadDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v31 = a4;
  id v30 = a5;
  v10 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    uint64_t v15 = DMFCommandPayloadStatusKey;
    uint64_t v16 = DMFCommandStatusQueued;
    id obj = v11;
    while (2)
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPayloadMetadata metadataWithPayloadDictionary:organizationIdentifier:context:error:]( &OBJC_CLASS___DMDCommandPayloadMetadata,  "metadataWithPayloadDictionary:organizationIdentifier:context:error:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v17),  v31,  v30,  a6));
        v19 = v18;
        if (!v18) {
          goto LABEL_13;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v20));

        if (v21)
        {
          if (a6)
          {
            uint64_t v38 = DMFConfigurationPayloadIdentifierErrorKey;
            v25 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
            v39 = v25;
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
            uint64_t v27 = DMFErrorWithCodeAndUserInfo(4001LL, v26);
            *a6 = (id)objc_claimAutoreleasedReturnValue(v27);
          }

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v6));
    -[NSMutableArray addObject:](v8, "addObject:", v9);
  }

  if (v7) {
    -[NSMutableArray addObject:](v8, "addObject:", v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  [v10 setPredicate:v11];

  return v10;
}

+ (id)fetchRequestForCommandsFromOrganizationWithIdentifier:(id)a3
{
  return [a1 fetchRequestForCommandsFromOrganizationWithIdentifier:a3 matchingPredicate:0];
}

+ (id)fetchRequestForCommandsPendingExecutionFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse));
  v11[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8]);

  return v9;
}

+ (id)fetchRequestForCommandsPendingRemovalFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanFalse));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse));
  v11[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8]);

  return v9;
}

+ (id)fetchRequestForCommandsPendingDeleteFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanTrue));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"pendingStatusUpdate",  &__kCFBooleanFalse));
  v11[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequestForCommandsFromOrganizationWithIdentifier:v4 matchingPredicate:v8]);

  return v9;
}

@end