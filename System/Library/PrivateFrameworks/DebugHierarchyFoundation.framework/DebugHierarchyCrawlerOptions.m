@interface DebugHierarchyCrawlerOptions
- (BOOL)groupingIdentifiersAreExclusive;
- (BOOL)shouldCrawlGroupWithID:(id)a3;
- (BOOL)shouldCrawlObject:(id)a3;
- (DebugHierarchyCrawlerOptions)initWithDictionary:(id)a3;
- (NSArray)groupingIdentifiers;
- (NSArray)rootItems;
- (id)dictionaryRepresentation;
- (int64_t)groupVisibilityMask;
- (unint64_t)maximumObjectCount;
- (unint64_t)maximumObjectDepth;
- (void)setGroupVisibilityMask:(int64_t)a3;
- (void)setGroupingIdentifiers:(id)a3;
- (void)setGroupingIdentifiers:(id)a3 exclusive:(BOOL)a4;
- (void)setGroupingIdentifiersAreExclusive:(BOOL)a3;
- (void)setMaximumObjectCount:(unint64_t)a3;
- (void)setMaximumObjectDepth:(unint64_t)a3;
@end

@implementation DebugHierarchyCrawlerOptions

- (DebugHierarchyCrawlerOptions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___DebugHierarchyCrawlerOptions;
  v5 = -[DebugHierarchyCrawlerOptions init](&v19, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"rootItems"]);
    rootItems = v5->_rootItems;
    v5->_rootItems = (NSArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"groupingIdentifiers"]);
    groupingIdentifiers = v5->_groupingIdentifiers;
    v5->_groupingIdentifiers = (NSArray *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"groupingIdentifiersAreExclusive"]);
    v11 = v10;
    if (v10) {
      v5->_groupingIdentifiersAreExclusive = [v10 BOOLValue];
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"groupVisibilityMask"]);
    v13 = v12;
    if (v12) {
      v5->_groupVisibilityMask = (int64_t)[v12 unsignedIntegerValue];
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"maximumObjectDepth"]);
    v15 = v14;
    if (v14) {
      v5->_maximumObjectDepth = (unint64_t)[v14 unsignedIntegerValue];
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"maximumObjectCount"]);
    v17 = v16;
    if (v16) {
      v5->_maximumObjectCount = (unint64_t)[v16 unsignedIntegerValue];
    }
  }

  return v5;
}

- (void)setGroupingIdentifiers:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  -[DebugHierarchyCrawlerOptions setGroupingIdentifiers:](self, "setGroupingIdentifiers:", a3);
  -[DebugHierarchyCrawlerOptions setGroupingIdentifiersAreExclusive:](self, "setGroupingIdentifiersAreExclusive:", v4);
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions rootItems](self, "rootItems"));
  id v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions rootItems](self, "rootItems"));
    [v3 setObject:v6 forKeyedSubscript:@"rootItems"];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions groupingIdentifiers](self, "groupingIdentifiers"));
  id v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions groupingIdentifiers](self, "groupingIdentifiers"));
    [v3 setObject:v9 forKeyedSubscript:@"groupingIdentifiers"];
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DebugHierarchyCrawlerOptions groupingIdentifiersAreExclusive]( self,  "groupingIdentifiersAreExclusive")));
  [v3 setObject:v10 forKeyedSubscript:@"groupingIdentifiersAreExclusive"];

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  -[DebugHierarchyCrawlerOptions groupVisibilityMask](self, "groupVisibilityMask")));
  [v3 setObject:v11 forKeyedSubscript:@"groupVisibilityMask"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DebugHierarchyCrawlerOptions maximumObjectDepth](self, "maximumObjectDepth")));
  [v3 setObject:v12 forKeyedSubscript:@"maximumObjectDepth"];

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[DebugHierarchyCrawlerOptions maximumObjectCount](self, "maximumObjectCount")));
  [v3 setObject:v13 forKeyedSubscript:@"maximumObjectCount"];

  id v14 = [v3 copy];
  return v14;
}

- (BOOL)shouldCrawlGroupWithID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions groupingIdentifiers](self, "groupingIdentifiers"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions groupingIdentifiers](self, "groupingIdentifiers"));
    id v7 = [v6 count];

    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DebugHierarchyCrawlerOptions groupingIdentifiers](self, "groupingIdentifiers"));
      unsigned int v9 = [v8 containsObject:v4];

      unsigned int v10 = v9 ^ -[DebugHierarchyCrawlerOptions groupingIdentifiersAreExclusive]( self,  "groupingIdentifiersAreExclusive");
    }

    else
    {
      LOBYTE(v10) = 0;
    }
  }

  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)shouldCrawlObject:(id)a3
{
  return 1;
}

- (NSArray)rootItems
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSArray)groupingIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setGroupingIdentifiers:(id)a3
{
}

- (BOOL)groupingIdentifiersAreExclusive
{
  return self->_groupingIdentifiersAreExclusive;
}

- (void)setGroupingIdentifiersAreExclusive:(BOOL)a3
{
  self->_groupingIdentifiersAreExclusive = a3;
}

- (int64_t)groupVisibilityMask
{
  return self->_groupVisibilityMask;
}

- (void)setGroupVisibilityMask:(int64_t)a3
{
  self->_groupVisibilityMask = a3;
}

- (unint64_t)maximumObjectDepth
{
  return self->_maximumObjectDepth;
}

- (void)setMaximumObjectDepth:(unint64_t)a3
{
  self->_maximumObjectDepth = a3;
}

- (unint64_t)maximumObjectCount
{
  return self->_maximumObjectCount;
}

- (void)setMaximumObjectCount:(unint64_t)a3
{
  self->_maximumObjectCount = a3;
}

- (void).cxx_destruct
{
}

@end