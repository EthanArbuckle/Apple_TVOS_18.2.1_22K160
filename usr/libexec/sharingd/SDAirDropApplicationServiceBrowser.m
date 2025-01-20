@interface SDAirDropApplicationServiceBrowser
- (_TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser)init;
@end

@implementation SDAirDropApplicationServiceBrowser

- (_TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser)init
{
  result = (_TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropApplicationServiceBrowser",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_browserQueue));
  sub_100195658((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_delegate);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_browser));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_parameters));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_sessionLogger));
  swift_release(*(void *)&self->browserQueue[OBJC_IVAR____TtC16DaemoniOSLibrary34SDAirDropApplicationServiceBrowser_endpointsUpdateHandler]);
}

@end