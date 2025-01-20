@interface SchedulerTrampoline
- (_TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline)init;
- (void)publishImmediatelyWithCompletion:(id)a3;
- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4;
@end

@implementation SchedulerTrampoline

- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, void *))_Block_copy(a4);
  unint64_t v7 = sub_1003AED40();
  uint64_t v8 = swift_allocError(&type metadata for SchedulerTrampoline.Error, v7, 0LL, 0LL);
  id v9 = a3;
  v11 = self;
  v10 = (void *)_convertErrorToNSError(_:)(v8);
  v6[2](v6, v10);

  swift_errorRelease(v8);
  _Block_release(v6);
}

- (void)publishImmediatelyWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100955CC0, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1003AEA7C((uint64_t)sub_10009C458, v5);

  swift_release();
}

- (_TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SchedulerTrampoline();
  return -[SchedulerTrampoline init](&v3, "init");
}

@end