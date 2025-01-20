@interface BRLTTable
- (id)localeIdentifier;
@end

@implementation BRLTTable

- (id)localeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable language](self, "language"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](&OBJC_CLASS___NSLocale, "localeWithLocaleIdentifier:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localeIdentifier]);

  return v4;
}

@end