@interface _DASGroupManagedObject
- (void)willSave;
@end

@implementation _DASGroupManagedObject

- (void)willSave
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_DASGroupManagedObject activities](self, "activities"));
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[_DASGroupManagedObject managedObjectContext](self, "managedObjectContext"));
    [v5 deleteObject:self];
  }

@end