@interface PDCloudStoreRecordsResponse
- (NSDictionary)deletedRecordsByDatabaseIdentifier;
- (PKCloudRecordArray)cloudStoreRecords;
- (PKCloudRecordArray)conflictingCloudStoreRecords;
- (id)deletedRecordsForAllDatabaseIdentifiers;
- (void)setCloudStoreRecords:(id)a3;
- (void)setConflictingCloudStoreRecords:(id)a3;
- (void)setDeletedRecordsByDatabaseIdentifier:(id)a3;
@end

@implementation PDCloudStoreRecordsResponse

- (id)deletedRecordsForAllDatabaseIdentifiers
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  deletedRecordsByDatabaseIdentifier = self->_deletedRecordsByDatabaseIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002980AC;
  v8[3] = &unk_10063A468;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:]( deletedRecordsByDatabaseIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  v8);
  id v6 = -[NSMutableArray copy](v5, "copy");

  return v6;
}

- (PKCloudRecordArray)cloudStoreRecords
{
  return self->_cloudStoreRecords;
}

- (void)setCloudStoreRecords:(id)a3
{
}

- (PKCloudRecordArray)conflictingCloudStoreRecords
{
  return self->_conflictingCloudStoreRecords;
}

- (void)setConflictingCloudStoreRecords:(id)a3
{
}

- (NSDictionary)deletedRecordsByDatabaseIdentifier
{
  return self->_deletedRecordsByDatabaseIdentifier;
}

- (void)setDeletedRecordsByDatabaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end