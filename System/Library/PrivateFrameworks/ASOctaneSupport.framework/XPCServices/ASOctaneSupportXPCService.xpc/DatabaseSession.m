@interface DatabaseSession
- (SQLiteConnection)connection;
- (_TtC25ASOctaneSupportXPCService15DatabaseSession)init;
- (_TtC25ASOctaneSupportXPCService15DatabaseSession)initWithConnection:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation DatabaseSession

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)sub_1000BC3C0();
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000BC418((uint64_t)v4);
}

- (_TtC25ASOctaneSupportXPCService15DatabaseSession)initWithConnection:(id)a3
{
  return (_TtC25ASOctaneSupportXPCService15DatabaseSession *)sub_1000BC42C((uint64_t)a3);
}

- (_TtC25ASOctaneSupportXPCService15DatabaseSession)init
{
}

- (void).cxx_destruct
{
}

@end