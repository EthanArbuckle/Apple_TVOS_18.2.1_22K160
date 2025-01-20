@interface RMManagementSourceMetadata
+ (id)fetchRequestWithManagementSource:(id)a3;
+ (id)fetchRequestWithManagementSource:(id)a3 key:(id)a4;
- (id)reportDetails;
@end

@implementation RMManagementSourceMetadata

+ (id)fetchRequestWithManagementSource:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@)",  @"managementSource",  v4));

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchRequestWithManagementSource:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"(%K == %@) && (%K == %@)",  @"managementSource",  v7,  @"key",  v6));

  [v8 setPredicate:v9];
  return v8;
}

- (id)reportDetails
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSourceMetadata key](self, "key"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"key");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSourceMetadata value](self, "value"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"value");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMManagementSourceMetadata managementSource](self, "managementSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"managementSource");

  id v8 = -[NSMutableDictionary copy](v3, "copy");
  return v8;
}

@end