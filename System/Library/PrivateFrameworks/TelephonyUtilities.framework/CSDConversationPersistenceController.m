@interface CSDConversationPersistenceController
- (CSDConversationPersistenceController)init;
- (CSDConversationPersistenceController)initWithQueue:(id)a3;
- (void)enumerateActiveConversations:(id)a3;
- (void)removeAllConversations;
- (void)removeConversation:(id)a3;
- (void)updateConversation:(id)a3;
@end

@implementation CSDConversationPersistenceController

- (CSDConversationPersistenceController)initWithQueue:(id)a3
{
  return result;
}

- (void)updateConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10026BA54();
}

- (void)removeConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10026BFE4();
}

- (void)removeAllConversations
{
  v2 = self;
  sub_10026C4C4();
}

- (void)enumerateActiveConversations:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1003E4C28, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10026C8A8();

  swift_release(v5);
}

- (CSDConversationPersistenceController)init
{
}

- (void).cxx_destruct
{
}

@end