@interface FilterTier
- (NSMutableDictionary)childTiers;
- (SRDownsampleEntry)downsampleEntry;
- (id)entryForQuery:(id)a3;
- (id)keyForChildren:(id)a3;
- (id)newChildInstance;
- (void)setCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4 forQuery:(id)a5;
- (void)setChildTiers:(id)a3;
- (void)setDownsampleEntry:(id)a3;
@end

@implementation FilterTier

- (id)entryForQuery:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier keyForChildren:](self, "keyForChildren:", v4));
  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers")),
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]),
        v6,
        !v7)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue([v7 entryForQuery:v4]), v7, !v8))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier downsampleEntry](self, "downsampleEntry"));
  }

  return v8;
}

- (id)keyForChildren:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[FilterTier keyForChildren:]", "SRSubsystemCategoryNameFilter.m", 121, "false");
}

- (id)newChildInstance
{
}

- (void)setCap:(unint64_t)a3 downsampleRatio:(unint64_t)a4 forQuery:(id)a5
{
  id v12 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier keyForChildren:](self, "keyForChildren:"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers"));
    v10 = (SRDownsampleEntry *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v8]);

    if (!v10)
    {
      v10 = -[FilterTier newChildInstance](self, "newChildInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FilterTier childTiers](self, "childTiers"));
      [v11 setObject:v10 forKeyedSubscript:v8];
    }

    -[SRDownsampleEntry setCap:downsampleRatio:forQuery:](v10, "setCap:downsampleRatio:forQuery:", a3, a4, v12);
  }

  else
  {
    v10 = -[SRDownsampleEntry initWithCap:downsampleRatio:]( objc_alloc(&OBJC_CLASS___SRDownsampleEntry),  "initWithCap:downsampleRatio:",  a3,  a4);
    -[FilterTier setDownsampleEntry:](self, "setDownsampleEntry:", v10);
  }
}

- (NSMutableDictionary)childTiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setChildTiers:(id)a3
{
}

- (SRDownsampleEntry)downsampleEntry
{
  return (SRDownsampleEntry *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setDownsampleEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end