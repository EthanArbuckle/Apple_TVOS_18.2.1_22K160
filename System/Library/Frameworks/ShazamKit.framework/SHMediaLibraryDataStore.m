@interface SHMediaLibraryDataStore
- (BOOL)commitChangesWithError:(id *)a3;
- (NSFetchedResultsController)groupsFetchedResultsController;
- (NSFetchedResultsController)tracksFetchedResultsController;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentContainer)persistentContainer;
- (SHMediaLibraryDataStore)initWithStoreType:(int64_t)a3;
- (SHMediaLibraryDataStoreDelegate)delegate;
- (id)createMetadataWithData:(id)a3 track:(id)a4 group:(id)a5 context:(id)a6;
- (id)fetchAllUploadableGroupsMissingLibrarySyncMetadata;
- (id)fetchAllUploadableTracksMissingLibrarySyncMetadata;
- (id)fetchLibraryGroupsWithParameters:(id)a3;
- (id)fetchLibraryTracksWithParameters:(id)a3;
- (id)fetchManagedObjectForRequest:(id)a3 withPredicate:(id)a4 context:(id)a5;
- (id)libraryItemFromManagedObject:(id)a3;
- (id)persistentContainerForStoreType:(int64_t)a3 error:(id *)a4;
- (id)updateReportForLibraryGroups:(id)a3;
- (id)updateReportForLibraryTrack:(id)a3;
- (int64_t)libraryChangeTypeForFetchedResultsChangeType:(unint64_t)a3;
- (void)associateTrack:(id)a3 toGroupWithIdentifier:(id)a4 context:(id)a5;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)deleteAllItems;
- (void)deleteAllItemsWithFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSyncMetadataItems;
- (void)deleteItemsByIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchLibraryItemsWithParameters:(id)a3 completionHandler:(id)a4;
- (void)initializeGroupsFetchedResultsControllerWithContext:(id)a3;
- (void)initializeTracksFetchedResultsControllerWithContext:(id)a3;
- (void)persistLibraryGroups:(id)a3 completionHandler:(id)a4;
- (void)persistUpdatedTracks:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setGroupsFetchedResultsController:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setTracksFetchedResultsController:(id)a3;
- (void)updateManagedTrack:(id)a3 withUpdatedTrack:(id)a4;
@end

@implementation SHMediaLibraryDataStore

- (SHMediaLibraryDataStore)initWithStoreType:(int64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___SHMediaLibraryDataStore;
  v4 = -[SHMediaLibraryDataStore init](&v24, "init");
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  id v23 = 0LL;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore persistentContainerForStoreType:error:]( v4,  "persistentContainerForStoreType:error:",  a3,  &v23));
  id v7 = v23;
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = (NSPersistentContainer *)v6;

  if (!v7)
  {
    v13 = -[NSPersistentContainer newBackgroundContext](v5->_persistentContainer, "newBackgroundContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy]( &OBJC_CLASS___NSMergePolicy,  "mergeByPropertyStoreTrumpMergePolicy"));
    -[NSManagedObjectContext setMergePolicy:](v13, "setMergePolicy:", v14);

    v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHMediaLibraryDataStore, v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ context", v18));
    -[NSManagedObjectContext setName:](v13, "setName:", v19);

    managedObjectContext = v5->_managedObjectContext;
    v5->_managedObjectContext = v13;
    v21 = v13;

    -[SHMediaLibraryDataStore initializeTracksFetchedResultsControllerWithContext:]( v5,  "initializeTracksFetchedResultsControllerWithContext:",  v21);
    -[SHMediaLibraryDataStore initializeGroupsFetchedResultsControllerWithContext:]( v5,  "initializeGroupsFetchedResultsControllerWithContext:",  v21);

LABEL_7:
    v12 = v5;
    goto LABEL_8;
  }

  uint64_t v10 = sh_log_object(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to load persistent container %@",  buf,  0xCu);
  }

  v12 = 0LL;
LABEL_8:

  return v12;
}

- (id)persistentContainerForStoreType:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = NSSQLiteStoreType;
  if (!a3)
  {
    id v7 = NSInMemoryStoreType;

    uint64_t v6 = v7;
  }

  v8 = objc_alloc(&OBJC_CLASS___NSManagedObjectModel);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryPersistentConfiguration managedObjectModelURL]( &OBJC_CLASS___SHMediaLibraryPersistentConfiguration,  "managedObjectModelURL"));
  uint64_t v10 = -[NSManagedObjectModel initWithContentsOfURL:](v8, "initWithContentsOfURL:", v9);

  v11 = -[NSPersistentContainer initWithName:managedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentContainer),  "initWithName:managedObjectModel:",  @"ShazamLibrary",  v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[SHMediaLibraryPersistentConfiguration persistentStoreDescriptionForStoreType:]( &OBJC_CLASS___SHMediaLibraryPersistentConfiguration,  "persistentStoreDescriptionForStoreType:",  v6));
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v11, "setPersistentStoreDescriptions:", v13);

  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_10001775C;
  v20 = sub_10001776C;
  id v21 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100017774;
  v15[3] = &unk_10006D200;
  v15[4] = &v16;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:]( v11,  "loadPersistentStoresWithCompletionHandler:",  v15);
  if (a4) {
    *a4 = (id) v17[5];
  }
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (void)fetchLibraryItemsWithParameters:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void *, void *, void))a4;
  if ([v9 filterOptions]) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchLibraryTracksWithParameters:]( self,  "fetchLibraryTracksWithParameters:",  v9));
  }
  else {
    id v7 = 0LL;
  }
  if (([v9 filterOptions] & 2) != 0) {
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchLibraryGroupsWithParameters:]( self,  "fetchLibraryGroupsWithParameters:",  v9));
  }
  else {
    v8 = 0LL;
  }
  v6[2](v6, v7, v8, 0LL);
}

- (id)fetchLibraryTracksWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10001775C;
  v19 = sub_10001776C;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore tracksFetchedResultsController](self, "tracksFetchedResultsController"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100017980;
  v11[3] = &unk_10006D228;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  v14 = &v15;
  [v6 performBlockAndWait:v11];

  id v9 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (id)fetchAllUploadableTracksMissingLibrarySyncMetadata
{
  v3 = NSStringFromSelector("date");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ != nil", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v5));

  id v7 = NSStringFromSelector("metadata");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ == nil", v8));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v9));

  v28[0] = v6;
  v28[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SHTrackMO fetchRequest](&OBJC_CLASS___SHTrackMO, "fetchRequest"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v14,  v12,  v13));

  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10001775C;
  id v26 = sub_10001776C;
  id v27 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v15 count]));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100017E80;
  v19[3] = &unk_10006D250;
  id v16 = v15;
  id v20 = v16;
  id v21 = &v22;
  [v13 performBlockAndWait:v19];
  id v17 = [(id)v23[5] copy];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (id)fetchAllUploadableGroupsMissingLibrarySyncMetadata
{
  v3 = NSStringFromSelector("metadata");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ == nil", v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v5));

  uint64_t v24 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v10,  v8,  v9));

  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = sub_10001775C;
  uint64_t v22 = sub_10001776C;
  id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v11 count]));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000181D8;
  v15[3] = &unk_10006D250;
  id v12 = v11;
  id v16 = v12;
  id v17 = &v18;
  [v9 performBlockAndWait:v15];
  id v13 = [(id)v19[5] copy];

  _Block_object_dispose(&v18, 8);
  return v13;
}

- (id)fetchLibraryGroupsWithParameters:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_10001775C;
  v19 = sub_10001776C;
  id v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore groupsFetchedResultsController](self, "groupsFetchedResultsController"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100018438;
  v11[3] = &unk_10006D228;
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  v14 = &v15;
  [v6 performBlockAndWait:v11];

  id v9 = [(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)persistUpdatedTracks:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100018678;
  v11[3] = &unk_10006D278;
  void v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (id)updateReportForLibraryTrack:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryUpdateReport);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v7 = NSStringFromSelector("identifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@distinctUnionOfObjects.%@",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKeyPath:v9]);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"syncID",  v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[SHTrackMO fetchRequest](&OBJC_CLASS___SHTrackMO, "fetchRequest"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v12,  v11,  v6));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100018D70;
  v20[3] = &unk_10006CE00;
  id v21 = v4;
  id v22 = v13;
  id v14 = v5;
  id v23 = v14;
  id v15 = v13;
  id v16 = v4;
  [v6 performBlockAndWait:v20];
  uint64_t v17 = v23;
  uint64_t v18 = v14;

  return v18;
}

- (void)persistLibraryGroups:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100019080;
  v11[3] = &unk_10006D278;
  void v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [v9 performBlockAndWait:v11];
}

- (id)updateReportForLibraryGroups:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryUpdateReport);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v7 = NSStringFromSelector("identifier");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@distinctUnionOfObjects.%@",  v8));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 valueForKeyPath:v9]);

  v11 = NSStringFromSelector("syncID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  v12,  v10));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v14,  v13,  v6));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000197D4;
  v22[3] = &unk_10006CE00;
  id v23 = v4;
  id v24 = v15;
  id v16 = v5;
  v25 = v16;
  id v17 = v15;
  id v18 = v4;
  [v6 performBlockAndWait:v22];
  v19 = v25;
  id v20 = v16;

  return v20;
}

- (void)deleteItemsByIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v9 = NSStringFromSelector("syncID");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  v10,  v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v11,  v19,  v8));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[SHTrackMO fetchRequest](&OBJC_CLASS___SHTrackMO, "fetchRequest"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v13,  v19,  v8));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100019BAC;
  v20[3] = &unk_10006D278;
  id v21 = v12;
  id v22 = v8;
  id v23 = v14;
  id v24 = v6;
  id v15 = v6;
  id v16 = v14;
  id v17 = v8;
  id v18 = v12;
  [v17 performBlockAndWait:v20];
}

- (void)deleteAllItemsWithFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore persistentContainer](self, "persistentContainer"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 persistentStoreDescriptions]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 type]);
  LODWORD(v10) = [v12 isEqualToString:NSInMemoryStoreType];

  if ((_DWORD)v10)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100019FD4;
    v30[3] = &unk_10006D2F0;
    id v31 = (id)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v6,  0LL,  v8));
    id v32 = v8;
    id v33 = v7;
    id v13 = v31;
    [v32 performBlockAndWait:v30];
  }

  else
  {
    id v14 = -[NSBatchDeleteRequest initWithFetchRequest:]( objc_alloc(&OBJC_CLASS___NSBatchDeleteRequest),  "initWithFetchRequest:",  v6);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore persistentContainer](self, "persistentContainer"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 persistentStoreCoordinator]);

    uint64_t v24 = 0LL;
    v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = sub_10001775C;
    v28 = sub_10001776C;
    id v29 = 0LL;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001A0D4;
    v19[3] = &unk_10006D318;
    id v17 = v16;
    id v20 = v17;
    id v18 = v14;
    id v21 = v18;
    id v22 = v8;
    id v23 = &v24;
    [v22 performBlockAndWait:v19];
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v25[5]);

    _Block_object_dispose(&v24, 8);
  }
}

- (void)deleteAllItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  -[SHMediaLibraryDataStore deleteAllItemsWithFetchRequest:completionHandler:]( self,  "deleteAllItemsWithFetchRequest:completionHandler:",  v3,  &stru_10006D358);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SHTrackMO fetchRequest](&OBJC_CLASS___SHTrackMO, "fetchRequest"));
  -[SHMediaLibraryDataStore deleteAllItemsWithFetchRequest:completionHandler:]( self,  "deleteAllItemsWithFetchRequest:completionHandler:",  v4,  &stru_10006D378);

  -[SHMediaLibraryDataStore reset](self, "reset");
}

- (void)deleteAllSyncMetadataItems
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SHMetadataMO fetchRequest](&OBJC_CLASS___SHMetadataMO, "fetchRequest"));
  -[SHMediaLibraryDataStore deleteAllItemsWithFetchRequest:completionHandler:]( self,  "deleteAllItemsWithFetchRequest:completionHandler:",  v3,  &stru_10006D398);

  -[SHMediaLibraryDataStore reset](self, "reset");
}

- (BOOL)commitChangesWithError:(id *)a3
{
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10001775C;
  v25 = sub_10001776C;
  id v26 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_10001A5CC;
  id v13 = &unk_10006D3C0;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v14 = v4;
  id v15 = &v17;
  id v16 = &v21;
  [v4 performBlockAndWait:&v10];
  int v5 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    uint64_t v6 = v22[5];
    if (v6)
    {
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
      uint64_t v28 = v6;
      id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL,  v10,  v11,  v12,  v13));
    }

    else
    {
      id v7 = 0LL;
    }

    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  SHErrorDomain,  400LL,  v7,  v10,  v11,  v12,  v13));

    int v5 = *((unsigned __int8 *)v18 + 24);
  }

  BOOL v8 = v5 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v8;
}

- (void)reset
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001A6BC;
  v3[3] = &unk_10006CBD8;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v2 = v4;
  [v2 performBlockAndWait:v3];
}

- (id)fetchManagedObjectForRequest:(id)a3 withPredicate:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setPredicate:v8];
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_10001775C;
  id v32 = sub_10001776C;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = sub_10001775C;
  id v26 = sub_10001776C;
  id v27 = 0LL;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001A8C0;
  v17[3] = &unk_10006D3E8;
  char v20 = &v22;
  id v10 = v9;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  uint64_t v21 = &v28;
  id v12 = [v10 performBlockAndWait:v17];
  if (v29[5])
  {
    uint64_t v13 = sh_log_object(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to fetch request %{public}@", buf, 0xCu);
    }
  }

  id v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

- (id)createMetadataWithData:(id)a3 track:(id)a4 group:(id)a5 context:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v14 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHMetadataMO, v13);
  id v15 = NSStringFromClass(v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v16,  v9));

  [v17 setData:v12];
  [v17 setTrack:v11];

  [v17 setGroup:v10];
  return v17;
}

- (void)associateTrack:(id)a3 toGroupWithIdentifier:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector("syncID");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K == %@",  v12,  v9));

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SHGroupMO fetchRequest](&OBJC_CLASS___SHGroupMO, "fetchRequest"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( -[SHMediaLibraryDataStore fetchManagedObjectForRequest:withPredicate:context:]( self,  "fetchManagedObjectForRequest:withPredicate:context:",  v14,  v13,  v10));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  if (v16)
  {
    [v8 setGroup:v16];
  }

  else
  {
    uint64_t v18 = sh_log_object(v17);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Persisting a Track with an associated Group ID, but there is no group saved locally. Will fallback to creation.",  buf,  2u);
    }

    uint64_t v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___SHGroupMO, v20);
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:]( &OBJC_CLASS___NSEntityDescription,  "insertNewObjectForEntityForName:inManagedObjectContext:",  v23,  v10));

    [v24 setSyncID:v9];
    [v8 setGroup:v24];
  }
}

- (void)updateManagedTrack:(id)a3 withUpdatedTrack:(id)a4
{
  id v55 = a3;
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  [v55 setSyncID:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
  [v55 setDate:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
    [v9 coordinate];
    objc_msgSend(v55, "setLatitude:");
  }

  else
  {
    [v55 setLatitude:kCLLocationCoordinate2DInvalid.latitude];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 location]);
    [v11 coordinate];
    [v55 setLongitude:v12];
  }

  else
  {
    [v55 setLongitude:kCLLocationCoordinate2DInvalid.longitude];
  }

  if ([v5 shazamCount]) {
    objc_msgSend(v55, "setShazamCount:", objc_msgSend(v5, "shazamCount"));
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 shazamKey]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 shazamKey]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 validatedKey]);
    [v55 setShazamKey:v15];
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 recognitionIdentifier]);

  if (v16)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 recognitionIdentifier]);
    [v55 setRecognitionID:v17];
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);

  if (v18)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
    [v55 setTitle:v19];
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 subtitle]);

  if (v20)
  {
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v5 subtitle]);
    [v55 setSubtitle:v21];
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 providerIdentifier]);

  if (v22)
  {
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v5 providerIdentifier]);
    [v55 setProviderID:v23];
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v5 providerName]);

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 providerName]);
    [v55 setProviderName:v25];
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 artworkURL]);

  if (v26)
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 artworkURL]);
    [v55 setArtworkURL:v27];
  }

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v5 shazamURL]);

  if (v28)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 shazamURL]);
    [v55 setShazamURL:v29];
  }

  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v5 albumName]);

  if (v30)
  {
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v5 albumName]);
    [v55 setAlbumName:v31];
  }

  id v32 = (void *)objc_claimAutoreleasedReturnValue([v5 appleMusicID]);

  if (v32)
  {
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v5 appleMusicID]);
    [v55 setAppleMusicID:v33];
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue([v5 appleMusicURL]);

  if (v34)
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v5 appleMusicURL]);
    [v55 setAppleMusicURL:v35];
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue([v5 genres]);

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v5 genres]);
    [v55 setGenres:v37];
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue([v5 isrc]);

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue([v5 isrc]);
    [v55 setIsrc:v39];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue([v5 rawSongResponse]);

  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue([v5 rawSongResponse]);
    [v55 setRawSongResponse:v41];
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDate]);

  if (v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue([v5 releaseDate]);
    [v55 setReleaseDate:v43];
  }

  v44 = (void *)objc_claimAutoreleasedReturnValue([v5 videoURL]);

  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue([v5 videoURL]);
    [v55 setVideoURL:v45];
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue([v5 lastUpdatedDate]);

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue([v5 lastUpdatedDate]);
    [v55 setModifiedDate:v47];
  }

  v48 = NSStringFromSelector("name");
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@distinctUnionOfObjects.%@",  v49));

  v51 = (void *)objc_claimAutoreleasedReturnValue([v5 labels]);
  v52 = (void *)objc_claimAutoreleasedReturnValue([v51 valueForKeyPath:v50]);
  v53 = (void *)objc_claimAutoreleasedReturnValue([v52 allObjects]);

  id v54 = [v53 copy];
  [v55 setLabels:v54];
}

- (void)initializeTracksFetchedResultsControllerWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001B1D8;
  v4[3] = &unk_10006CE28;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)initializeGroupsFetchedResultsControllerWithContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001B374;
  v4[3] = &unk_10006CE28;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 != 3)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore libraryItemFromManagedObject:](self, "libraryItemFromManagedObject:", v11));
    if (!v14)
    {
      uint64_t v17 = sh_log_object(0LL);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = (void *)objc_opt_class(v11, v19);
        id v21 = v20;
        int v26 = 138412546;
        id v27 = v20;
        __int16 v28 = 2112;
        id v29 = (id)objc_opt_class(0LL, v22);
        id v23 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Failed to convert %@ to %@",  (uint8_t *)&v26,  0x16u);
      }

      goto LABEL_13;
    }

    id v15 = v13;
    if (a6 != 1)
    {
      if (a6 != 4 && a6 != 2)
      {
        id v16 = 0LL;
        goto LABEL_12;
      }

      id v15 = v12;
    }

    id v16 = v15;
LABEL_12:
    uint64_t v24 = -[SHMediaLibraryChange initWithLibraryItem:changeType:indexPath:]( objc_alloc(&OBJC_CLASS___SHMediaLibraryChange),  "initWithLibraryItem:changeType:indexPath:",  v14,  -[SHMediaLibraryDataStore libraryChangeTypeForFetchedResultsChangeType:]( self,  "libraryChangeTypeForFetchedResultsChangeType:",  a6),  v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore delegate](self, "delegate"));
    [v25 libraryDataStore:self didUpdateWithChange:v24];

LABEL_13:
  }
}

- (id)libraryItemFromManagedObject:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10001775C;
  uint64_t v17 = sub_10001776C;
  id v18 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001B780;
  v9[3] = &unk_10006D228;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryDataStore managedObjectContext](self, "managedObjectContext"));
  id v10 = v5;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [v5 performBlockAndWait:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)libraryChangeTypeForFetchedResultsChangeType:(unint64_t)a3
{
  if (a3 == 2) {
    return 3LL;
  }
  else {
    return 1LL;
  }
}

- (SHMediaLibraryDataStoreDelegate)delegate
{
  return (SHMediaLibraryDataStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
}

- (NSFetchedResultsController)tracksFetchedResultsController
{
  return self->_tracksFetchedResultsController;
}

- (void)setTracksFetchedResultsController:(id)a3
{
}

- (NSFetchedResultsController)groupsFetchedResultsController
{
  return self->_groupsFetchedResultsController;
}

- (void)setGroupsFetchedResultsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end