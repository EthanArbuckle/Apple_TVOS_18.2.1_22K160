@interface JSLogObject
- (_TtC16UtilityExtension11JSLogObject)init;
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
  sub_100019590((uint64_t)v4);
}

- (void)default:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000195F0((uint64_t)v4);
}

- (void)error:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100019650((uint64_t)v4);
}

- (void)fault:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000196B0((uint64_t)v4);
}

- (void)info:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100019710((uint64_t)v4);
}

- (_TtC16UtilityExtension11JSLogObject)init
{
  return (_TtC16UtilityExtension11JSLogObject *)sub_100019978();
}

@end