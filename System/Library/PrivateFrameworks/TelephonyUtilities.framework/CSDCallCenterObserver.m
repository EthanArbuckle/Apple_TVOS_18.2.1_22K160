@interface CSDCallCenterObserver
- (CSDCallCenterObserver)init;
- (CSDCallCenterObserverDelegate)delegate;
- (CSDCallContainer)callContainer;
- (id)activeConversationForCall:(id)a3;
- (id)callChanged;
- (unint64_t)triggers;
- (void)handleSharePlayTrigger:(id)a3;
- (void)handleTrigger:(id)a3;
- (void)setCallChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTriggers:(unint64_t)a3;
@end

@implementation CSDCallCenterObserver

- (id)activeConversationForCall:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001C785C((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (CSDCallCenterObserverDelegate)delegate
{
  return (CSDCallCenterObserverDelegate *)(id)sub_1001C7928();
}

- (void)setDelegate:(id)a3
{
  v5 = self;
  sub_1001C7984((uint64_t)a3);
}

- (unint64_t)triggers
{
  return sub_1001C79D8();
}

- (void)setTriggers:(unint64_t)a3
{
  id v4 = self;
  sub_1001C7A28(a3);
}

- (id)callChanged
{
  uint64_t v2 = sub_1001C7DDC();
  if (!v2) {
    return 0LL;
  }
  v6[4] = v2;
  uint64_t v7 = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256LL;
  v6[2] = sub_10025A054;
  v6[3] = &unk_1003DF2D0;
  id v4 = _Block_copy(v6);
  swift_release(v7);
  return v4;
}

- (void)setCallChanged:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject(&unk_1003DF2B8, 24LL, 7LL);
    *(void *)(v5 + 16) = v4;
    id v4 = sub_1001C9538;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  v6 = self;
  sub_1001C7EA0((uint64_t)v4, v5);
}

- (CSDCallContainer)callContainer
{
  uint64_t v2 = self;
  sub_1001C7EF0();
  id v4 = v3;

  return (CSDCallContainer *)v4;
}

- (CSDCallCenterObserver)init
{
  return (CSDCallCenterObserver *)sub_1001C7FBC();
}

- (void)handleTrigger:(id)a3
{
}

- (void)handleSharePlayTrigger:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1001C954C((uint64_t)self + OBJC_IVAR___CSDCallCenterObserver_delegate);
  sub_1001B5D3C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDCallCenterObserver_callChanged),  *(void *)&self->callContainerClosure[OBJC_IVAR___CSDCallCenterObserver_callChanged]);
}

@end