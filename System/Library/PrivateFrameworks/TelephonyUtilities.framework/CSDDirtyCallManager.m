@interface CSDDirtyCallManager
- (CSDDirtyCallManager)init;
- (id)callChanged;
- (void)add:(id)a3;
- (void)setCallChanged:(id)a3;
@end

@implementation CSDDirtyCallManager

- (id)callChanged
{
  uint64_t v2 = sub_1001F0ED4();
  if (!v2) {
    return 0LL;
  }
  v6[4] = v2;
  uint64_t v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_1001FAF78;
  v6[3] = &unk_1003E0390;
  v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setCallChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E0378, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001F1A7C;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001F0F98((uint64_t)v4, v5);
}

- (void)add:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001F10C0(v4);
}

- (CSDDirtyCallManager)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDDirtyCallManager_dirtyCallsArray));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDDirtyCallManager_dirtyCallsSet));
}

@end