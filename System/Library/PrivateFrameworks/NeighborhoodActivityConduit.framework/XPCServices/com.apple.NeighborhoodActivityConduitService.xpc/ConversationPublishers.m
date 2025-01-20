@interface ConversationPublishers
- (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers)init;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationsChangedForConversationManager:(id)a3;
@end

@implementation ConversationPublishers

- (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers)init
{
  return (_TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers *)sub_10009B1C8();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationJoinedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationLeftSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_activeConversationsSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_joinedConversationSubject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_NeighborhoodActivityConduitService22ConversationPublishers_conversationManager));
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10009B518(v4);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10009D308(v9, v10);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10009D750(v7);
}

@end