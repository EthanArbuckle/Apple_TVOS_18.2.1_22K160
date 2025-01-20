@interface CSDRTCConnectionSetup
+ (id)eventTypeNameFrom:(int64_t)a3;
+ (id)rtcKey:(int64_t)a3;
- (CSDRTCConnectionSetup)init;
@end

@implementation CSDRTCConnectionSetup

+ (id)eventTypeNameFrom:(int64_t)a3
{
  return sub_100280B90((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_100280A54);
}

+ (id)rtcKey:(int64_t)a3
{
  return sub_100280B90((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_100280B08);
}

- (CSDRTCConnectionSetup)init
{
  return (CSDRTCConnectionSetup *)sub_10023A834();
}

@end