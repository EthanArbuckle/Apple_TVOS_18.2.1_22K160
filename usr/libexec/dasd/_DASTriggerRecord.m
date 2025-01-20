@interface _DASTriggerRecord
- (id)createTrigger:(id)a3 managedObjectContext:(id)a4;
- (id)entityName;
- (id)fetchOrCreateTrigger:(id)a3 managedObjectContext:(id)a4;
- (void)copyTrigger:(id)a3 toManagedObject:(id)a4;
@end

@implementation _DASTriggerRecord

- (id)entityName
{
  return @"Trigger";
}

- (id)createTrigger:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord entityName](self, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v8,  v6));

  -[_DASTriggerRecord copyTrigger:toManagedObject:](self, "copyTrigger:toManagedObject:", v7, v9);
  return v9;
}

- (id)fetchOrCreateTrigger:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = objc_opt_new(&OBJC_CLASS___NSFetchRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASTriggerRecord entityName](self, "entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription entityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "entityForName:inManagedObjectContext:",  v9,  v7));
    -[NSFetchRequest setEntity:](v8, "setEntity:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"identifier == %@",  v6));
    -[NSFetchRequest setPredicate:](v8, "setPredicate:", v11);

    uint64_t v15 = 0LL;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 executeFetchRequest:v8 error:&v15]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lastObject]);

    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[_DASTriggerRecord createTrigger:managedObjectContext:]( self,  "createTrigger:managedObjectContext:",  v6,  v7));
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)copyTrigger:(id)a3 toManagedObject:(id)a4
{
}

@end