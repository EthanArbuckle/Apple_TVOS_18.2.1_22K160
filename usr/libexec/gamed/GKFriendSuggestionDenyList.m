@interface GKFriendSuggestionDenyList
+ (GKFriendSuggestionDenyList)empty;
- (GKFriendSuggestionDenyList)init;
- (GKFriendSuggestionDenyList)initWithContactIDs:(id)a3 playerIDs:(id)a4;
- (NSSet)contactIDs;
- (NSSet)playerIDs;
@end

@implementation GKFriendSuggestionDenyList

+ (GKFriendSuggestionDenyList)empty
{
  return (GKFriendSuggestionDenyList *)sub_10015B1E8();
}

- (NSSet)contactIDs
{
  return (NSSet *)sub_10015B260((uint64_t)self, (uint64_t)a2, FriendSuggestionDenyList.contactIDs.getter);
}

- (NSSet)playerIDs
{
  return (NSSet *)sub_10015B260((uint64_t)self, (uint64_t)a2, FriendSuggestionDenyList.playerIDs.getter);
}

- (GKFriendSuggestionDenyList)initWithContactIDs:(id)a3 playerIDs:(id)a4
{
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  &protocol witness table for String);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  &protocol witness table for String);
  return (GKFriendSuggestionDenyList *)sub_10015B2B4(v5, v6);
}

- (GKFriendSuggestionDenyList)init
{
}

- (void).cxx_destruct
{
}

@end