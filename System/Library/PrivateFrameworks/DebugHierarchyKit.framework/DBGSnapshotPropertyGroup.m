@interface DBGSnapshotPropertyGroup
- (DBGSnapshot)snapshot;
- (void)setSnapshot:(id)a3;
@end

@implementation DBGSnapshotPropertyGroup

- (DBGSnapshot)snapshot
{
  return (DBGSnapshot *)objc_loadWeakRetained((id *)&self->_snapshot);
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end