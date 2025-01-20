@interface GKTurnBasedMultiplayerCompletedBulletin
- (id)aggregateDictionaryKey;
- (id)bulletinMessage;
@end

@implementation GKTurnBasedMultiplayerCompletedBulletin

- (id)bulletinMessage
{
  return +[GCFLocalizedStrings KETTLE_TURN_BASED_GAME_OVER_NOTIFICATION_MESSAGE_FORMAT]( &OBJC_CLASS____TtC20GameCenterFoundation19GCFLocalizedStrings,  "KETTLE_TURN_BASED_GAME_OVER_NOTIFICATION_MESSAGE_FORMAT");
}

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountTurnBasedCompleted;
}

@end