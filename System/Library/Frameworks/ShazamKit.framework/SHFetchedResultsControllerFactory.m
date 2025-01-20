@interface SHFetchedResultsControllerFactory
+ (id)groupFetchedResultsControllerWithContext:(id)a3;
+ (id)trackFetchedResultsControllerWithContext:(id)a3;
@end

@implementation SHFetchedResultsControllerFactory

+ (id)trackFetchedResultsControllerWithContext:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHTrackMO fetchRequest](&OBJC_CLASS___SHTrackMO, "fetchRequest"));
  v5 = NSStringFromSelector("date");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  v6,  0LL));

  v17 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  [v4 setSortDescriptors:v8];

  [v4 setReturnsObjectsAsFaults:0];
  v9 = NSStringFromSelector("metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v16[0] = v10;
  v11 = NSStringFromSelector("group");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v13, v16[0]);

  v14 = -[NSFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:]( objc_alloc(&OBJC_CLASS___NSFetchedResultsController),  "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:",  v4,  v3,  0LL,  0LL);
  return v14;
}

+ (id)groupFetchedResultsControllerWithContext:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  [v4 setSortDescriptors:&__NSArray0__struct];
  [v4 setReturnsObjectsAsFaults:0];
  v5 = NSStringFromSelector("metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v12[0] = v6;
  v7 = NSStringFromSelector("tracks");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  [v4 setRelationshipKeyPathsForPrefetching:v9];

  v10 = -[NSFetchedResultsController initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:]( objc_alloc(&OBJC_CLASS___NSFetchedResultsController),  "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:",  v4,  v3,  0LL,  0LL);
  return v10;
}

@end