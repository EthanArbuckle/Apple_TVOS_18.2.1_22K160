@interface MTSubscriptionSyncProcessorConfig
+ (id)configWithSupportsMetrics:(BOOL)a3;
- (BOOL)supportsMetrics;
- (void)setSupportsMetrics:(BOOL)a3;
@end

@implementation MTSubscriptionSyncProcessorConfig

+ (id)configWithSupportsMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(&OBJC_CLASS___MTSubscriptionSyncProcessorConfig);
  -[MTSubscriptionSyncProcessorConfig setSupportsMetrics:](v4, "setSupportsMetrics:", v3);
  return v4;
}

- (BOOL)supportsMetrics
{
  return self->_supportsMetrics;
}

- (void)setSupportsMetrics:(BOOL)a3
{
  self->_supportsMetrics = a3;
}

@end