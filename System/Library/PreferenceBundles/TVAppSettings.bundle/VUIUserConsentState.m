@interface VUIUserConsentState
- (NSDate)lastModifiedDate;
- (_TtC13TVAppSettings19VUIUserConsentState)init;
- (int64_t)status;
@end

@implementation VUIUserConsentState

- (int64_t)status
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_status);
}

- (NSDate)lastModifiedDate
{
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of Date?( (uint64_t)self + OBJC_IVAR____TtC13TVAppSettings19VUIUserConsentState_lastModifiedDate,  (uint64_t)v4);
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }

  return (NSDate *)isa;
}

- (_TtC13TVAppSettings19VUIUserConsentState)init
{
  result = (_TtC13TVAppSettings19VUIUserConsentState *)_swift_stdlib_reportUnimplementedInitializer( "TVAppSettings.VUIUserConsentState",  33LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end