@interface ICDPlaybackPositionDatabaseContext
- (ICDPlaybackPositionDatabaseContext)initWithLibrary:(id)a3;
- (NSMutableSet)ubiquitousIdentifiersToSync;
- (NSString)lastSyncedDomainVersion;
- (unint64_t)lastSyncedEntityRevision;
- (unint64_t)transactionEntityRevision;
@end

@implementation ICDPlaybackPositionDatabaseContext

- (ICDPlaybackPositionDatabaseContext)initWithLibrary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ICDPlaybackPositionDatabaseContext;
  v5 = -[ICDPlaybackPositionDatabaseContext init](&v11, "init");
  if (v5)
  {
    v5->_transactionEntityRevision = (unint64_t)[v4 currentRevision];
    v5->_lastSyncedEntityRevision = (unint64_t)[v4 lastSyncedEntityRevision];
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 lastSyncedDomainVersion]);
    lastSyncedDomainVersion = v5->_lastSyncedDomainVersion;
    v5->_lastSyncedDomainVersion = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    ubiquitousIdentifiersToSync = v5->_ubiquitousIdentifiersToSync;
    v5->_ubiquitousIdentifiersToSync = (NSMutableSet *)v8;
  }

  return v5;
}

- (unint64_t)lastSyncedEntityRevision
{
  return self->_lastSyncedEntityRevision;
}

- (unint64_t)transactionEntityRevision
{
  return self->_transactionEntityRevision;
}

- (NSString)lastSyncedDomainVersion
{
  return self->_lastSyncedDomainVersion;
}

- (NSMutableSet)ubiquitousIdentifiersToSync
{
  return self->_ubiquitousIdentifiersToSync;
}

- (void).cxx_destruct
{
}

@end