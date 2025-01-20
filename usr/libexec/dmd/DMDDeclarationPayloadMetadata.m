@interface DMDDeclarationPayloadMetadata
+ (id)declarationsWithDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6;
+ (id)fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4 serverHash:(id)a5;
+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4;
+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4;
+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4;
+ (id)fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:(id)a3;
+ (id)fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:(id)a3;
- (NSString)uniqueIdentifier;
- (id)descriptiveProperties;
- (void)applyPayloadDictionary:(id)a3;
- (void)setStateDictionary:(id)a3;
@end

@implementation DMDDeclarationPayloadMetadata

- (NSString)uniqueIdentifier
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata serverHash](self, "serverHash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v3, v4));

  return (NSString *)v5;
}

- (void)applyPayloadDictionary:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:DMFDeclarationPayloadServerHashKey]);
  -[DMDDeclarationPayloadMetadata setServerHash:](self, "setServerHash:", v4);
}

- (id)descriptiveProperties
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DMDDeclarationPayloadMetadata;
  id v2 = -[DMDPayloadMetadata descriptiveProperties](&v7, "descriptiveProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v8[0] = @"serverHash";
  v8[1] = @"failed";
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 arrayByAddingObjectsFromArray:v4]);

  return v5;
}

- (void)setStateDictionary:(id)a3
{
  id v4 = [a3 mutableCopy];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeclarationPayloadMetadata serverHash](self, "serverHash"));
  [v4 setObject:v5 forKeyedSubscript:DMFDeclarationStateServerHashKey];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDDeclarationPayloadMetadata;
  -[DMDPayloadMetadata setStateDictionary:](&v6, "setStateDictionary:", v4);
}

+ (id)declarationsWithDictionaries:(id)a3 organizationIdentifier:(id)a4 context:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    id obj = v13;
    while (2)
    {
      v17 = 0LL;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[DMDPayloadMetadata metadataWithPayloadDictionary:organizationIdentifier:context:error:]( &OBJC_CLASS___DMDDeclarationPayloadMetadata,  "metadataWithPayloadDictionary:organizationIdentifier:context:error:",  *(void *)(*((void *)&v29 + 1) + 8LL * (void)v17),  v10,  v11,  a6));
        v19 = v18;
        if (!v18) {
          goto LABEL_13;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v20));

        if (v21)
        {
          if (a6)
          {
            uint64_t v33 = DMFConfigurationPayloadIdentifierErrorKey;
            v24 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
            v34 = v24;
            v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
            uint64_t v26 = DMFErrorWithCodeAndUserInfo(4001LL, v25);
            *a6 = (id)objc_claimAutoreleasedReturnValue(v26);
          }

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 matchingPredicate:(id)a4
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
  id v10 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  [v10 setPredicate:v11];

  return v10;
}

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3
{
  return [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:a3 matchingPredicate:0];
}

+ (id)fetchRequestForDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier IN %@",  a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:v6 matchingPredicate:v7]);

  return v8;
}

+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  id v10 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:v4 matchingPredicate:v7]);

  return v8;
}

+ (id)fetchRequestForActiveDeclarationsFromOrganizationWithIdentifier:(id)a3 withIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier IN %@",  a4));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  v13[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v9));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:v6 matchingPredicate:v10]);

  return v11;
}

+ (id)fetchRequestForActiveDeclarationFromOrganizationWithIdentifier:(id)a3 withIdentifier:(id)a4 serverHash:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"identifier",  v9,  v11));

  v18[1] = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"serverHash",  v8));

  v18[2] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 3LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v14));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v10 matchingPredicate:v15]);

  return v16;
}

+ (id)fetchRequestForFailedDeclarationsFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanTrue));
  v11[0] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"failed",  &__kCFBooleanTrue));
  v11[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:v4 matchingPredicate:v8]);

  return v9;
}

+ (id)fetchRequestForDeclarationsPendingDeleteFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"available",  &__kCFBooleanFalse));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"installed",  &__kCFBooleanFalse,  v5));
  v12[1] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"pendingStatusUpdate",  &__kCFBooleanFalse));
  v12[2] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 3LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 fetchRequestForDeclarationsFromOrganizationWithIdentifier:v4 matchingPredicate:v9]);

  return v10;
}

@end