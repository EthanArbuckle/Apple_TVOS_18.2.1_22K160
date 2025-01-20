@interface ParsecSubscriptionManager
- (_TtC7parsecd25ParsecSubscriptionManager)init;
- (void)bagChangeNotificationWithNotification:(id)a3;
- (void)dealloc;
@end

@implementation ParsecSubscriptionManager

- (void)dealloc
{
  v2 = self;
  sub_10000B0BC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7parsecd25ParsecSubscriptionManager_storefrontIdentifierProvider));
}

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B1A4(v4);
}

- (_TtC7parsecd25ParsecSubscriptionManager)init
{
}

@end