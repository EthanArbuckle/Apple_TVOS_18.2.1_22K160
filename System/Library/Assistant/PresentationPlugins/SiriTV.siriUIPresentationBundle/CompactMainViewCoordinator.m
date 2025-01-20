@interface CompactMainViewCoordinator
- (void)keyboardViewDidAppear;
- (void)siriDidTransitionFrom:(int64_t)a3 event:(int64_t)a4;
- (void)startRequestWith:(id)a3;
@end

@implementation CompactMainViewCoordinator

- (void)startRequestWith:(id)a3
{
  uint64_t v5 = v4;
  swift_retain(self);
  sub_16C28();
  swift_release(self);
  swift_bridgeObjectRelease(v5);
}

- (void)keyboardViewDidAppear
{
}

- (void)siriDidTransitionFrom:(int64_t)a3 event:(int64_t)a4
{
}

@end