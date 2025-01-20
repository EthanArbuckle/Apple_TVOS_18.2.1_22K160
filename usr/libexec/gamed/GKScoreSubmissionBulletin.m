@interface GKScoreSubmissionBulletin
+ (NSDateFormatter)timeFormatter;
+ (void)presentForScores:(id)a3;
- (GKScoreSubmissionBulletin)init;
- (GKScoreSubmissionBulletin)initWithCoder:(id)a3;
- (GKScoreSubmissionBulletin)initWithPushNotification:(id)a3;
- (GKScoreSubmissionBulletin)initWithScore:(id)a3;
@end

@implementation GKScoreSubmissionBulletin

- (GKScoreSubmissionBulletin)initWithScore:(id)a3
{
  return (GKScoreSubmissionBulletin *)sub_10012AAF4(a3);
}

+ (NSDateFormatter)timeFormatter
{
  return (NSDateFormatter *)sub_10012B170();
}

- (GKScoreSubmissionBulletin)initWithCoder:(id)a3
{
}

+ (void)presentForScores:(id)a3
{
  unint64_t v4 = sub_10012B5A0();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  sub_10012B228(v5);
  swift_bridgeObjectRelease(v5, v6);
}

- (GKScoreSubmissionBulletin)initWithPushNotification:(id)a3
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  }
  sub_10012B3F8();
}

- (GKScoreSubmissionBulletin)init
{
}

@end