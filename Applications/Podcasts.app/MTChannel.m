@interface MTChannel
- (void)setSubscriptionActive:(BOOL)a3;
@end

@implementation MTChannel

- (void)setSubscriptionActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MTChannel subscriptionActive](self, "subscriptionActive") != a3)
  {
    uint64_t v5 = kChannelSubscriptionActive;
    -[MTChannel willChangeValueForKey:](self, "willChangeValueForKey:", kChannelSubscriptionActive);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    -[MTChannel setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

    -[MTChannel didChangeValueForKey:](self, "didChangeValueForKey:", v5);
  }

@end