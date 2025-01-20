@interface CSDCallController
- (CSDCallContainer)callContainer;
- (CSDCallController)init;
- (CSDCallController)initWithDataSources:(id)a3 queue:(id)a4;
- (CSDCallStateController)callStateController;
- (id)callChanged;
- (void)registerCall:(id)a3;
- (void)setCallChanged:(id)a3;
- (void)setCallStateController:(id)a3;
@end

@implementation CSDCallController

- (CSDCallStateController)callStateController
{
  return (CSDCallStateController *)(id)sub_1001FAFFC();
}

- (void)setCallStateController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001FB054(a3);
}

- (id)callChanged
{
  uint64_t v2 = sub_1001FB104();
  if (!v2) {
    return 0LL;
  }
  v6[4] = v2;
  uint64_t v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_1001FAF78;
  v6[3] = &unk_1003E09A8;
  v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setCallChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003E0990, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    v4 = sub_1001FBB44;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001FB1C8((uint64_t)v4, v5);
}

- (CSDCallContainer)callContainer
{
  uint64_t v2 = self;
  sub_1001FB218();
  v4 = v3;

  return (CSDCallContainer *)v4;
}

- (CSDCallController)initWithDataSources:(id)a3 queue:(id)a4
{
  uint64_t v6 = sub_1001B4B94(0LL, &qword_100448E58, off_1003D5D78);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  return (CSDCallController *)sub_1001FB510(v7, a4);
}

- (void)registerCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001FB6E0(v4);
}

- (CSDCallController)init
{
}

- (void).cxx_destruct
{
}

@end