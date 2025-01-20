@interface JSAccountObject
- (JSValue)appStore;
- (JSValue)appStoreLocal;
- (JSValue)current;
- (JSValue)currentLocal;
- (JSValue)iCloud;
- (JSValue)iTunesStore;
- (JSValue)iTunesStoreLocal;
- (_TtC34AppleMediaServicesUIDynamicService15JSAccountObject)init;
- (id)privacyAcknowledgementState:(id)a3 :(id)a4;
@end

@implementation JSAccountObject

- (JSValue)current
{
  v2 = self;
  sub_10000FF88();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)currentLocal
{
  v2 = self;
  sub_10000FFE8();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)appStore
{
  v2 = self;
  sub_1000100AC();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iTunesStore
{
  v2 = self;
  sub_1000100E8();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iCloud
{
  v2 = self;
  sub_100010148();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)appStoreLocal
{
  v2 = self;
  sub_100010184();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iTunesStoreLocal
{
  v2 = self;
  sub_100010218();
  v4 = v3;

  return (JSValue *)v4;
}

- (id)privacyAcknowledgementState:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100010294((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (_TtC34AppleMediaServicesUIDynamicService15JSAccountObject)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_dynamicAccountsStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34AppleMediaServicesUIDynamicService15JSAccountObject_clientInfo));
}

@end