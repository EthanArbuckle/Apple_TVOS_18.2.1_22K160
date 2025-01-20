@interface JSNetwork
- (BOOL)isConnected;
- (_TtC14amsengagementd9JSNetwork)init;
- (void)dealloc;
@end

@implementation JSNetwork

- (BOOL)isConnected
{
  v2 = self;
  char v3 = sub_1000A6650();

  return v3 & 1;
}

- (_TtC14amsengagementd9JSNetwork)init
{
  return (_TtC14amsengagementd9JSNetwork *)sub_1000A678C();
}

- (void)dealloc
{
  v2 = self;
  sub_1000A6D38();
}

- (void).cxx_destruct
{
}

@end