@interface UNMutableNotificationContent
- (NSArray)activeParticipantHandles;
- (NSArray)remoteParticipantHandles;
- (NSString)notificationProviderIdentifier;
- (void)setActiveParticipantHandles:(id)a3;
- (void)setNotificationProviderIdentifier:(id)a3;
- (void)setRemoteParticipantHandles:(id)a3;
@end

@implementation UNMutableNotificationContent

- (NSArray)remoteParticipantHandles
{
  return (NSArray *)sub_1001DC194( self,  (uint64_t)a2,  (uint64_t)&selRef_remoteParticipantHandles,  (void (*)(uint64_t))sub_1001DC440);
}

- (void)setRemoteParticipantHandles:(id)a3
{
}

- (NSArray)activeParticipantHandles
{
  return (NSArray *)sub_1001DC194( self,  (uint64_t)a2,  (uint64_t)&selRef_activeParticipantHandles,  (void (*)(uint64_t))sub_1001DC440);
}

- (void)setActiveParticipantHandles:(id)a3
{
}

- (NSString)notificationProviderIdentifier
{
  return (NSString *)sub_1001DC604(self, (uint64_t)a2, sub_1001DC65C);
}

- (void)setNotificationProviderIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v6 = v5;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = 0LL;
  }

  v7 = self;
  sub_1001DC740(v4, v6);
}

@end