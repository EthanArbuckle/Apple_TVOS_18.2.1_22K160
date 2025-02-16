@interface MRDGroupSessionAssertionManager
- (BOOL)isAsserting;
- (MRDGroupSessionAssertionManager)init;
- (NSString)debugDescription;
- (id)createAssertionWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation MRDGroupSessionAssertionManager

- (NSString)debugDescription
{
  v2 = (os_unfair_lock_s *)&(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock))[2];
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_100295704(&v7);
  os_unfair_lock_unlock(v2);

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isAsserting
{
  v2 = (os_unfair_lock_s *)&(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionAssertionManager_lock))[2];
  v3 = self;
  os_unfair_lock_lock(v2);
  sub_1002956A0(&v5);
  os_unfair_lock_unlock(v2);
  LOBYTE(v2) = v5;

  return (char)v2;
}

- (id)createAssertionWithReason:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = (void *)sub_100293308(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (MRDGroupSessionAssertionManager)init
{
  return (MRDGroupSessionAssertionManager *)sub_100294468();
}

- (void).cxx_destruct
{
}

- (void)collectDiagnostic:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = a3;
    unint64_t v6 = -[MRDGroupSessionAssertionManager debugDescription](v4, "debugDescription");
    [v5 setGroupSessionAssertionManagerState:v6];
  }

  else
  {
    __break(1u);
  }

@end