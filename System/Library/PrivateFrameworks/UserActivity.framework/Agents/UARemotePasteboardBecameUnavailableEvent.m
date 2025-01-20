@interface UARemotePasteboardBecameUnavailableEvent
- (id)eventName;
- (id)eventPayload;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
@end

@implementation UARemotePasteboardBecameUnavailableEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.Unavailable";
}

- (id)eventPayload
{
  v7 = @"reason";
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[UARemotePasteboardBecameUnavailableEvent reason](self, "reason")));
  v3 = (void *)v2;
  v4 = @"-";
  if (v2) {
    v4 = (const __CFString *)v2;
  }
  v8 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end