@interface CSDDuetDonater
- (CSDDuetDonater)init;
- (CSDDuetDonater)initWithQueue:(id)a3;
- (void)dealloc;
- (void)reportingController:(id)a3 addedActivatedLink:(id)a4;
- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5;
@end

@implementation CSDDuetDonater

- (CSDDuetDonater)initWithQueue:(id)a3
{
  return (CSDDuetDonater *)sub_1001F8988(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_1001F8B3C();
}

- (void).cxx_destruct
{
}

- (void)reportingController:(id)a3 addedActivatedLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001F8C04();
}

- (void)reportingController:(id)a3 statusChangedForCall:(id)a4 totalCallCount:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1001F8D4C();
}

- (CSDDuetDonater)init
{
}

@end