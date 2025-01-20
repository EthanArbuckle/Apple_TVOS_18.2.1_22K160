@interface _DASGroupRecorder
+ (id)predicateForName:(id)a3;
+ (id)predicateForUniqueRecord:(id)a3;
- (id)createGroup:(id)a3;
- (id)createOrUpdateGroup:(id)a3 context:(id)a4;
- (id)entityName;
- (id)fetchAllGroups:(id)a3;
- (id)fetchGroupsUsingPredicate:(id)a3 context:(id)a4;
- (id)getGroupFromManagedObject:(id)a3;
- (void)copyGroup:(id)a3 toManagedObject:(id)a4;
@end

@implementation _DASGroupRecorder

- (id)entityName
{
  return @"Group";
}

+ (id)predicateForUniqueRecord:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"name == %@",  v3));

  return v4;
}

+ (id)predicateForName:(id)a3
{
  return +[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", @"name == %@", a3);
}

- (id)getGroupFromManagedObject:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
  unsigned int v5 = [v3 maxConcurrent];

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DASActivityGroup groupWithName:maxConcurrent:]( &OBJC_CLASS____DASActivityGroup,  "groupWithName:maxConcurrent:",  v4,  v5));
  return v6;
}

- (void)copyGroup:(id)a3 toManagedObject:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  [v8 setName:v6];

  id v7 = [v5 maxConcurrent];
  [v8 setMaxConcurrent:v7];
}

- (id)createGroup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v5,  v4));

  return v6;
}

- (id)createOrUpdateGroup:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[_DASGroupRecorder predicateForUniqueRecord:]( &OBJC_CLASS____DASGroupRecorder,  "predicateForUniqueRecord:",  v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    uint64_t v15 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v8 error:&v15]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);

    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder createGroup:](self, "createGroup:", v7));
    }
    -[_DASGroupRecorder copyGroup:toManagedObject:](self, "copyGroup:toManagedObject:", v6, v13);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)fetchGroupsUsingPredicate:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupRecorder entityName](self, "entityName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  v6));
  -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

  -[NSFetchRequest setPredicate:](v8, "setPredicate:", v7);
  uint64_t v13 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v8 error:&v13]);

  return v11;
}

- (id)fetchAllGroups:(id)a3
{
  return -[_DASGroupRecorder fetchGroupsUsingPredicate:context:](self, "fetchGroupsUsingPredicate:context:", 0LL, a3);
}

@end