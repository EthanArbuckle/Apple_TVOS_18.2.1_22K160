@interface NSUserDefaults
- (BOOL)allowContactsOnly;
- (BOOL)silenceUnknownCallersEnabled;
- (BOOL)silenceUnknownFaceTimeCallersEnabled;
- (int64_t)maxJunkLevel;
@end

@implementation NSUserDefaults

- (BOOL)silenceUnknownCallersEnabled
{
  v2 = self;
  char v3 = sub_1001C7598();

  return v3 & 1;
}

- (BOOL)silenceUnknownFaceTimeCallersEnabled
{
  v2 = self;
  char v3 = sub_1001C76B0();

  return v3 & 1;
}

- (int64_t)maxJunkLevel
{
  v2 = self;
  id v3 = sub_1001C773C();

  return (int64_t)v3;
}

- (BOOL)allowContactsOnly
{
  v2 = self;
  char v3 = sub_1001C7598();

  return v3 & 1;
}

@end