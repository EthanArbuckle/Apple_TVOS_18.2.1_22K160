@interface NSManagedObjectContext
- (BOOL)deleteAllUPPMetadata;
- (id)uppMetadataForMetadataIdentifier:(id)a3;
- (id)uppMetadataForMetadataIdentifiers:(id)a3;
@end

@implementation NSManagedObjectContext

- (id)uppMetadataForMetadataIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = -[NSFetchRequest initWithEntityName:]( objc_alloc(&OBJC_CLASS___NSFetchRequest),  "initWithEntityName:",  @"MTUPPMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"metadataIdentifier",  v4));

    -[NSFetchRequest setPredicate:](v5, "setPredicate:", v6);
    -[NSFetchRequest setReturnsObjectsAsFaults:](v5, "setReturnsObjectsAsFaults:", 0LL);
    -[NSFetchRequest setFetchLimit:](v5, "setFetchLimit:", 1LL);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSManagedObjectContext executeFetchRequest:](self, "executeFetchRequest:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)uppMetadataForMetadataIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K IN %@",  @"metadataIdentifier",  v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSManagedObjectContext objectsInEntity:predicate:sortDescriptors:]( self,  "objectsInEntity:predicate:sortDescriptors:",  @"MTUPPMetadata",  v5,  0LL));
  }

  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (BOOL)deleteAllUPPMetadata
{
  id v6 = 0LL;
  id v2 =  +[MTUPPMetadata deleteAllContentInCtx:error:]( &OBJC_CLASS___MTUPPMetadata,  "deleteAllContentInCtx:error:",  self,  &v6);
  id v3 = v6;
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](&OBJC_CLASS___IMLogger, "sharedLogger"));
    [v4 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Models/Misc/MTUPPMetadata+Library.m", 102, @"Error deleting UPPMetadata: %@", v3 lineNumber format];
  }

  return v3 == 0LL;
}

@end