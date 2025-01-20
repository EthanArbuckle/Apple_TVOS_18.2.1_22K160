@interface CSDConversationLocalParticipantBlobTracker
- (CSDConversationLocalParticipantBlobTracker)init;
- (CSDConversationLocalParticipantBlobTracker)initWithConversation:(id)a3 idsGroupSession:(id)a4 queue:(id)a5;
- (void)handleConversationStateUpdated;
- (void)invalidateLocalParticipantBlobWantsDeliveryOverPush:(BOOL)a3;
@end

@implementation CSDConversationLocalParticipantBlobTracker

- (CSDConversationLocalParticipantBlobTracker)initWithConversation:(id)a3 idsGroupSession:(id)a4 queue:(id)a5
{
  return (CSDConversationLocalParticipantBlobTracker *)sub_10020F5BC( (uint64_t)a3,  a4,  (uint64_t)a5);
}

- (void)handleConversationStateUpdated
{
  v2 = self;
  sub_10020F6E0();
}

- (void)invalidateLocalParticipantBlobWantsDeliveryOverPush:(BOOL)a3
{
  v4 = self;
  sub_10020F994(a3);
}

- (CSDConversationLocalParticipantBlobTracker)init
{
}

- (void).cxx_destruct
{
}

@end