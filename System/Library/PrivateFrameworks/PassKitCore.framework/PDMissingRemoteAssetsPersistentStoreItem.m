@interface PDMissingRemoteAssetsPersistentStoreItem
- (NSString)uniqueID;
- (id)description;
- (unint64_t)downloadRetriesCount;
- (void)setDownloadRetriesCount:(unint64_t)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation PDMissingRemoteAssetsPersistentStoreItem

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDMissingRemoteAssetsPersistentStoreItem uniqueID](self, "uniqueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p> uniqueID:%@ downloadRetriesCount:%lu",  v3,  self,  v4,  -[PDMissingRemoteAssetsPersistentStoreItem downloadRetriesCount](self, "downloadRetriesCount")));

  return v5;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (unint64_t)downloadRetriesCount
{
  return self->_downloadRetriesCount;
}

- (void)setDownloadRetriesCount:(unint64_t)a3
{
  self->_downloadRetriesCount = a3;
}

- (void).cxx_destruct
{
}

@end