@interface CSDSuperboxProviderDelegate
- (_TtC13callservicesd27CSDSuperboxProviderDelegate)init;
- (_TtC13callservicesd27CSDSuperboxProviderDelegate)initWithCallSource:(id)a3;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
@end

@implementation CSDSuperboxProviderDelegate

- (_TtC13callservicesd27CSDSuperboxProviderDelegate)initWithCallSource:(id)a3
{
  return (_TtC13callservicesd27CSDSuperboxProviderDelegate *)sub_10027EF64(a3);
}

- (_TtC13callservicesd27CSDSuperboxProviderDelegate)init
{
}

- (void).cxx_destruct
{
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10027FB24((uint64_t)v8, v7);
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1002804C8((uint64_t)v8, v7);
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100280674((int)v8, v7);
}

@end