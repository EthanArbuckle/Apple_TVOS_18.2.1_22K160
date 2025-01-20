@interface GKProcessExiter
+ (void)cleanExitWith:(id)a3;
- (GKProcessExiter)init;
@end

@implementation GKProcessExiter

+ (void)cleanExitWith:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_10017B204(v3, v4);
}

- (GKProcessExiter)init
{
  return (GKProcessExiter *)sub_100148850();
}

@end