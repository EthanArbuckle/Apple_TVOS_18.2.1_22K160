@interface RPPairingChallenge
- (BOOL)lastAttemptIncorrect;
- (NSNumber)throttledBy;
- (RPPairingChallenge)init;
- (void)answerWithPIN:(id)a3;
- (void)cancel;
@end

@implementation RPPairingChallenge

- (BOOL)lastAttemptIncorrect
{
  return sub_188432BDC() & 1;
}

- (NSNumber)throttledBy
{
  v2 = self;
  v3 = (void *)sub_188432C20();

  return (NSNumber *)v3;
}

- (void)answerWithPIN:(id)a3
{
  uint64_t v4 = sub_1884CA064();
  uint64_t v6 = v5;
  v7 = self;
  sub_188432C54(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)cancel
{
  v2 = self;
  sub_188432CEC();
}

- (RPPairingChallenge)init
{
}

- (void).cxx_destruct
{
}

@end