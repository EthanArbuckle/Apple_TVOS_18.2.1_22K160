@interface ModelContext
- (void)_clearChangedThisTransaction:(id)a3;
- (void)_processChangedManagedObjectIDs:(id)a3;
- (void)_undoDeletions:(id)a3;
- (void)_undoDeletionsMovedToUpdates:(id)a3;
- (void)_undoInsertions:(id)a3;
- (void)_undoManagerCheckpoint:(id)a3;
- (void)_undoUpdates:(id)a3;
- (void)autosave;
- (void)checkAutosaveConditions;
@end

@implementation ModelContext

- (void)_processChangedManagedObjectIDs:(id)a3
{
  uint64_t v3 = sub_188A7684C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188A76834();
  swift_retain();
  sub_1889F84C4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)_undoDeletions:(id)a3
{
}

- (void)_undoUpdates:(id)a3
{
}

- (void)_undoInsertions:(id)a3
{
}

- (void)_undoDeletionsMovedToUpdates:(id)a3
{
}

- (void)_clearChangedThisTransaction:(id)a3
{
  uint64_t v3 = sub_188A770E0();
  swift_retain();
  sub_1889FF324(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)_undoManagerCheckpoint:(id)a3
{
}

- (void)checkAutosaveConditions
{
}

- (void)autosave
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SwiftData12ModelContext_autosaveEnabled;
  swift_beginAccess();
  if (*v3 == 1 && self->_hasChanges[0] == 1)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SwiftData12ModelContext_autosaveDelay) = 0LL;
    swift_retain();
    sub_188A030D0();
    swift_release();
  }

@end