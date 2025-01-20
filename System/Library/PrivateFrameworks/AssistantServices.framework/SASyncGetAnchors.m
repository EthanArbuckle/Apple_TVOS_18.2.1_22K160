@interface SASyncGetAnchors
- (BOOL)ad_willHaveReply;
- (id)ad_deferredMetricsContext;
- (int64_t)ad_getNetworkActivityTracingLabel;
@end

@implementation SASyncGetAnchors

- (BOOL)ad_willHaveReply
{
  return 1;
}

- (int64_t)ad_getNetworkActivityTracingLabel
{
  return 9LL;
}

- (id)ad_deferredMetricsContext
{
  v8.receiver = self;
  v8.super_class = &OBJC_CLASS___SASyncGetAnchors;
  id v3 = -[SASyncGetAnchors ad_deferredMetricsContext](&v8, "ad_deferredMetricsContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASyncGetAnchors syncReason](self, "syncReason"));
  if (v5) {
    [v4 setObject:v5 forKey:SASyncGetAnchorsSyncReasonPListKey];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASyncGetAnchors sources](self, "sources"));
  if (v6) {
    [v4 setObject:v6 forKey:SASyncGetAnchorsSourcesPListKey];
  }

  return v4;
}

@end