@interface BKEventStatistic
+ (BKEventStatistic)statisticWithLabel:(id)a3;
- (BOOL)automaticResetDisabled;
- (BOOL)needsLogging;
- (NSArray)associatedStatistics;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)reset;
- (void)setAssociatedStatistics:(id)a3;
- (void)setAutomaticResetDisabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNeedsLogging:(BOOL)a3;
@end

@implementation BKEventStatistic

- (void)appendDescriptionToFormatter:(id)a3
{
  id v11 = a3;
  v4 = -[self->_associatedStatistics bs_filter:&stru_1000B7310];
  if ([v4 count])
  {
    uint64_t v6 = [BSDescriptionStream class];
    id v7 = v11;
    v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
        v9 = v8;
      }
      else {
        v9 = 0LL;
      }
    }

    else
    {
      v9 = 0LL;
    }

    id v10 = v9;

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10004D04C;
    v12[3] = &unk_1000B7338;
    id v13 = v8;
    [v10 appendCollection:v4 withName:0 itemBlock:v12];
  }
}

- (void)reset
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v3 = self->_associatedStatistics;
  [v3 countByEnumeratingWithState:v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [v8 reset];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      [v3 countByEnumeratingWithState:v8 objects:v12 count:16];
    }

    while (v5);
  }

  self->_needsLogging = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [self statisticWithLabel:self->_label];
  uint64_t v5 = [v4 autorelease];
  objc_storeStrong((id *)(v5 + 24), self->_associatedStatistics);
  *(_BYTE *)(v5 + 9) = self->_needsLogging;
  return (id)v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)associatedStatistics
{
  return self->_associatedStatistics;
}

- (void)setAssociatedStatistics:(id)a3
{
}

- (BOOL)automaticResetDisabled
{
  return self->_automaticResetDisabled;
}

- (void)setAutomaticResetDisabled:(BOOL)a3
{
  self->_automaticResetDisabled = a3;
}

- (BOOL)needsLogging
{
  return self->_needsLogging;
}

- (void)setNeedsLogging:(BOOL)a3
{
  self->_needsLogging = a3;
}

- (void).cxx_destruct
{
}

+ (BKEventStatistic)statisticWithLabel:(id)a3
{
  id v4 = a3;
  a1 *v6 = [[a1 alloc] init];
  [v6 setLabel:v4];

  return (BKEventStatistic *)v6;
}

@end