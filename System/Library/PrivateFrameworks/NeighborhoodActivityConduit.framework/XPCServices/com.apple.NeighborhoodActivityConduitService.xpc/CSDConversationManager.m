@interface CSDConversationManager
- (_TtC44com_apple_NeighborhoodActivityConduitService22CSDConversationManager)init;
@end

@implementation CSDConversationManager

- (_TtC44com_apple_NeighborhoodActivityConduitService22CSDConversationManager)init
{
  uint64_t v3 = OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22CSDConversationManager_queue;
  sub_10000F4A4();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)static OS_dispatch_queue.main.getter();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CSDConversationManager();
  return -[CSDConversationManager init](&v6, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22CSDConversationManager_queue));
}

@end