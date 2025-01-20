@interface JSAccountObject
- (JSValue)appStore;
- (JSValue)appStoreLocal;
- (JSValue)current;
- (JSValue)currentLocal;
- (JSValue)iCloud;
- (JSValue)iTunesStore;
- (JSValue)iTunesStoreLocal;
- (_TtC16UtilityExtension15JSAccountObject)init;
- (id)privacyAcknowledgementState:(id)a3 :(id)a4;
@end

@implementation JSAccountObject

- (JSValue)current
{
  v2 = self;
  sub_100010B48();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)currentLocal
{
  v2 = self;
  sub_100010BA8();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)appStore
{
  v2 = self;
  sub_100010C6C();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iTunesStore
{
  v2 = self;
  sub_100010CA8();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iCloud
{
  v2 = self;
  sub_100010D08();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)appStoreLocal
{
  v2 = self;
  sub_100010D44();
  v4 = v3;

  return (JSValue *)v4;
}

- (JSValue)iTunesStoreLocal
{
  v2 = self;
  sub_100010DD8();
  v4 = v3;

  return (JSValue *)v4;
}

- (id)privacyAcknowledgementState:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_100010E54((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (_TtC16UtilityExtension15JSAccountObject)init
{
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16UtilityExtension15JSAccountObject_dynamicAccountsStore));
}

@end