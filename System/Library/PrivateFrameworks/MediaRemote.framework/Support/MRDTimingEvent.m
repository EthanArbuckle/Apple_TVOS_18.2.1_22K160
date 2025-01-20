@interface MRDTimingEvent
- (BOOL)end;
- (BOOL)endWithError:(id)a3;
- (BOOL)start;
- (MRDTimingEvent)init;
- (NSError)error;
- (NSNumber)duration;
- (void)setError:(id)a3;
@end

@implementation MRDTimingEvent

- (NSError)error
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MRDTimingEvent_error);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDTimingEvent_error, v6, 0LL, 0LL);
  uint64_t v3 = *v2;
  if (!v3) {
    return (NSError *)0LL;
  }
  swift_errorRetain(v3);
  v4 = (void *)_convertErrorToNSError(_:)(v3);
  swift_errorRelease(v3);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDTimingEvent_error);
  swift_beginAccess((char *)self + OBJC_IVAR___MRDTimingEvent_error, v7, 1LL, 0LL);
  id v5 = *v4;
  id *v4 = a3;
  id v6 = a3;
  swift_errorRelease(v5);
}

- (NSNumber)duration
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB0);
  uint64_t v3 = self;
  v2();
  if ((v4 & 1) != 0) {
    v5.super.super.isa = 0LL;
  }
  else {
    v5.super.super.isa = Double._bridgeToObjectiveC()().super.super.isa;
  }

  return (NSNumber *)v5.super.super.isa;
}

- (BOOL)start
{
  v2 = self;
  BOOL v3 = sub_100202F2C();

  return v3;
}

- (BOOL)endWithError:(id)a3
{
  char v4 = self;
  id v5 = a3;
  LOBYTE(a3) = sub_1002030A4(a3);

  return a3 & 1;
}

- (BOOL)end
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xC8);
  BOOL v3 = self;
  LOBYTE(v2) = v2(0LL);

  return v2 & 1;
}

- (MRDTimingEvent)init
{
  BOOL v3 = (char *)self + OBJC_IVAR___MRDTimingEvent_startDate;
  uint64_t v4 = type metadata accessor for Date(0LL);
  id v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL);
  v5(v3, 1LL, 1LL, v4);
  v5((char *)self + OBJC_IVAR___MRDTimingEvent_endDate, 1LL, 1LL, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDTimingEvent_error) = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TimingEvent(0LL);
  return -[MRDTimingEvent init](&v7, "init");
}

- (void).cxx_destruct
{
}

@end