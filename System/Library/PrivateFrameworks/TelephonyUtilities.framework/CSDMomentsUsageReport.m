@interface CSDMomentsUsageReport
- (CSDMomentsUsageReport)init;
- (CSDMomentsUsageReport)initWithAvailability:(int)a3 photoRequestSuccessCount:(int64_t)a4 photoRequestFailureCount:(int64_t)a5 medianRequestDuration:(double)a6 meanRequestDuration:(double)a7;
- (NSString)description;
- (double)meanRequestDuration;
- (double)medianRequestDuration;
- (int)availability;
- (int64_t)photoRequestFailureCount;
- (int64_t)photoRequestSuccessCount;
@end

@implementation CSDMomentsUsageReport

- (int)availability
{
  return sub_1002113EC();
}

- (int64_t)photoRequestSuccessCount
{
  return sub_10021141C();
}

- (int64_t)photoRequestFailureCount
{
  return sub_10021144C();
}

- (double)medianRequestDuration
{
  return sub_10021147C();
}

- (double)meanRequestDuration
{
  return sub_1002114AC();
}

- (CSDMomentsUsageReport)initWithAvailability:(int)a3 photoRequestSuccessCount:(int64_t)a4 photoRequestFailureCount:(int64_t)a5 medianRequestDuration:(double)a6 meanRequestDuration:(double)a7
{
  return (CSDMomentsUsageReport *)sub_1002114BC(a3, a4, a5, a6, a7);
}

- (NSString)description
{
  v2 = self;
  sub_1002115D8();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CSDMomentsUsageReport)init
{
}

@end