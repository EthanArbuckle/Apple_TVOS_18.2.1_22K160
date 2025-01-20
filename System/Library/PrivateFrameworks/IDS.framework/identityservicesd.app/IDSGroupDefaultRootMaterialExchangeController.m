@interface IDSGroupDefaultRootMaterialExchangeController
- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider;
- (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController)initWithConfig:(id)a3 session:(id)a4 serviceID:(id)a5 pushHandler:(id)a6;
@end

@implementation IDSGroupDefaultRootMaterialExchangeController

- (IDSGroupQUICMaterialExchangeProvider)quicMaterialExchangeProvider
{
  return (IDSGroupQUICMaterialExchangeProvider *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController_quicMaterialExchangeProvider),  a2);
}

- (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController)initWithConfig:(id)a3 session:(id)a4 serviceID:(id)a5 pushHandler:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  swift_unknownObjectRetain(a6, v14);
  return (_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController *)sub_1004CAA94( (uint64_t)v12,  (uint64_t)v13,  v9,  v11,  (uint64_t)a6);
}

- (void).cxx_destruct
{
}

@end