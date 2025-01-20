@interface SBDPlaybackPositionTransaction
- (ML3MusicLibrary)musicLibrary;
- (NSMutableSet)ubiquitousIdentifiersToSync;
- (NSString)description;
- (NSString)lastSyncedDomainVersion;
- (unint64_t)lastSyncedEntityRevision;
- (unint64_t)transactionEntityRevision;
- (void)setLastSyncedDomainVersion:(id)a3;
- (void)setLastSyncedEntityRevision:(unint64_t)a3;
- (void)setMusicLibrary:(id)a3;
- (void)setTransactionEntityRevision:(unint64_t)a3;
- (void)setUbiquitousIdentifiersToSync:(id)a3;
@end

@implementation SBDPlaybackPositionTransaction

- (NSString)description
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[SBDPlaybackPositionTransaction lastSyncedDomainVersion](self, "lastSyncedDomainVersion"));
  v4 = (void *)v3;
  v5 = @"<NO VERSION>";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SBDPlaybackPositionTransaction;
  v7 = -[SBDPlaybackPositionTransaction description](&v11, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: lastSyncedDomainVersion = %@, entityRevisions.lastSynced = %llu, entityRevisions.currentSyncTransaction = %llu"),  v8,  v6,  self->_lastSyncedEntityRevision,  self->_transactionEntityRevision));

  return (NSString *)v9;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (void)setMusicLibrary:(id)a3
{
}

- (unint64_t)lastSyncedEntityRevision
{
  return self->_lastSyncedEntityRevision;
}

- (void)setLastSyncedEntityRevision:(unint64_t)a3
{
  self->_lastSyncedEntityRevision = a3;
}

- (unint64_t)transactionEntityRevision
{
  return self->_transactionEntityRevision;
}

- (void)setTransactionEntityRevision:(unint64_t)a3
{
  self->_transactionEntityRevision = a3;
}

- (NSString)lastSyncedDomainVersion
{
  return self->_lastSyncedDomainVersion;
}

- (void)setLastSyncedDomainVersion:(id)a3
{
}

- (NSMutableSet)ubiquitousIdentifiersToSync
{
  return self->_ubiquitousIdentifiersToSync;
}

- (void)setUbiquitousIdentifiersToSync:(id)a3
{
}

- (void).cxx_destruct
{
}

@end