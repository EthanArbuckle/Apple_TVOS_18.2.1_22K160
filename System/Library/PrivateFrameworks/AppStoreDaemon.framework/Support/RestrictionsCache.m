@interface RestrictionsCache
+ (_TtC9appstored17RestrictionsCache)shared;
- (BOOL)isDiagnosticsSubmissionAllowed;
- (_TtC9appstored17RestrictionsCache)init;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation RestrictionsCache

- (_TtC9appstored17RestrictionsCache)init
{
  return (_TtC9appstored17RestrictionsCache *)sub_100017308((uint64_t)self, (uint64_t)a2);
}

+ (_TtC9appstored17RestrictionsCache)shared
{
  if (qword_100458010 != -1) {
    swift_once(&qword_100458010, sub_1000173FC);
  }
  return (_TtC9appstored17RestrictionsCache *)(id)qword_100462888;
}

- (BOOL)isDiagnosticsSubmissionAllowed
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored17RestrictionsCache_lockedCachedValues);
  v3 = self;
  swift_retain(v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_1000174F4((_BYTE *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  BOOL v4 = v6;

  swift_release(v2);
  return v4;
}

- (void).cxx_destruct
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored17RestrictionsCache_lockedCachedValues);
  id v6 = a3;
  v7 = self;
  swift_retain(v5);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 20));
  sub_100017550((_BYTE *)(v5 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 20));

  swift_release(v5);
}

@end