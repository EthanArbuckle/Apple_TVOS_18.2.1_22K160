@interface UNNotificationContent
- (NSArray)activeParticipantHandles;
- (NSArray)remoteParticipantHandles;
- (NSString)notificationProviderIdentifier;
@end

@implementation UNNotificationContent

- (NSArray)remoteParticipantHandles
{
  return (NSArray *)sub_1001DC194(self, (uint64_t)a2, 0x800000010036D4D0LL, (void (*)(uint64_t))sub_1001DC1EC);
}

- (NSArray)activeParticipantHandles
{
  return (NSArray *)sub_1001DC194(self, (uint64_t)a2, 0x800000010036D4F0LL, (void (*)(uint64_t))sub_1001DC1EC);
}

- (NSString)notificationProviderIdentifier
{
  return (NSString *)sub_1001DC604(self, (uint64_t)a2, sub_1001DC2F8);
}

@end