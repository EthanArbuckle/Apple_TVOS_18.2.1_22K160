@interface PDPassCloudStoreContainerContent
- (NSArray)cloudPassCatalogs;
- (NSArray)cloudPasses;
- (NSArray)cloudRecordIDs;
- (NSError)errorEncounered;
- (PDPassCloudStoreContainerContent)init;
- (id)description;
- (int64_t)typeOfSyncPerformed;
- (void)appendCatalog:(id)a3;
- (void)appendPass:(id)a3;
- (void)appendPassID:(id)a3;
- (void)noteEnounteredError:(id)a3;
- (void)noteTypeOfSyncPerformed:(int64_t)a3;
@end

@implementation PDPassCloudStoreContainerContent

- (PDPassCloudStoreContainerContent)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDPassCloudStoreContainerContent;
  v2 = -[PDPassCloudStoreContainerContent init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cloudPasses = v2->_cloudPasses;
    v2->_cloudPasses = v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cloudPassCatalogs = v2->_cloudPassCatalogs;
    v2->_cloudPassCatalogs = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    cloudRecordIDs = v2->_cloudRecordIDs;
    v2->_cloudRecordIDs = v7;
  }

  return v2;
}

- (void)appendPass:(id)a3
{
}

- (void)appendPassID:(id)a3
{
  cloudRecordIDs = self->_cloudRecordIDs;
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 uniqueID]);
  -[NSMutableArray addObject:](cloudRecordIDs, "addObject:", v4);
}

- (void)appendCatalog:(id)a3
{
}

- (void)noteEnounteredError:(id)a3
{
}

- (void)noteTypeOfSyncPerformed:(int64_t)a3
{
  self->_syncType = a3;
}

- (NSArray)cloudPasses
{
  return (NSArray *)-[NSMutableArray copy](self->_cloudPasses, "copy");
}

- (NSArray)cloudPassCatalogs
{
  return (NSArray *)-[NSMutableArray copy](self->_cloudPassCatalogs, "copy");
}

- (NSArray)cloudRecordIDs
{
  return (NSArray *)-[NSMutableArray copy](self->_cloudRecordIDs, "copy");
}

- (NSError)errorEncounered
{
  return self->_error;
}

- (int64_t)typeOfSyncPerformed
{
  return self->_syncType;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainerContent cloudPasses](self, "cloudPasses"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainerContent cloudPassCatalogs](self, "cloudPassCatalogs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainerContent cloudRecordIDs](self, "cloudRecordIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDPassCloudStoreContainerContent errorEncounered](self, "errorEncounered"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"cloudPasses: %@\ncloudPassCatalogs: %@\nrecordIDs: %@\nerror: %@",  v3,  v4,  v5,  v6));

  return v7;
}

- (void).cxx_destruct
{
}

@end