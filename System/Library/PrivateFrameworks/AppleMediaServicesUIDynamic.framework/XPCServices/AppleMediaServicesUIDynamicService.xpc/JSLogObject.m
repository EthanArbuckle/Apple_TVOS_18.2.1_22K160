@interface JSLogObject
- (_TtC34AppleMediaServicesUIDynamicService11JSLogObject)init;
- (void)debug:(id)a3;
- (void)default:(id)a3;
- (void)error:(id)a3;
- (void)fault:(id)a3;
- (void)info:(id)a3;
@end

@implementation JSLogObject

- (void)debug:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000189D0((uint64_t)v4);
}

- (void)default:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018A30((uint64_t)v4);
}

- (void)error:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018A90((uint64_t)v4);
}

- (void)fault:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018AF0((uint64_t)v4);
}

- (void)info:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018B50((uint64_t)v4);
}

- (_TtC34AppleMediaServicesUIDynamicService11JSLogObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService11JSLogObject *)sub_100018DB8();
}

@end