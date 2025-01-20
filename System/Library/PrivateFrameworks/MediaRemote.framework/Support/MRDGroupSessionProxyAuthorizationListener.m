@interface MRDGroupSessionProxyAuthorizationListener
- (MRDGroupSessionProxyAuthorizationListener)init;
- (MRDGroupSessionProxyAuthorizationListener)initWithDelegate:(id)a3;
- (MRDGroupSessionProxyAuthorizationListenerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MRDGroupSessionProxyAuthorizationListener

- (MRDGroupSessionProxyAuthorizationListenerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_delegate, v4, 0LL, 0LL);
  return (MRDGroupSessionProxyAuthorizationListenerDelegate *)(id)swift_unknownObjectWeakLoadStrong(v2);
}

- (void)setDelegate:(id)a3
{
  v4 = (char *)self + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_delegate;
  swift_beginAccess((char *)self + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_delegate, v5, 1LL, 0LL);
  swift_unknownObjectWeakAssign(v4, a3);
}

- (MRDGroupSessionProxyAuthorizationListener)initWithDelegate:(id)a3
{
  return (MRDGroupSessionProxyAuthorizationListener *)sub_1001F12F8((uint64_t)a3, v4);
}

- (MRDGroupSessionProxyAuthorizationListener)init
{
  result = (MRDGroupSessionProxyAuthorizationListener *)_swift_stdlib_reportUnimplementedInitializer( "mediaremoted.GroupSessionProxyAuthorizationListener",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener____lazy_storage___messageQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener____lazy_storage___serialQueue));

  swift_bridgeObjectRelease();
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_lock));
}

@end