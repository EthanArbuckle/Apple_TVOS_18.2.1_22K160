@interface _DASSwapModelAbstractAggregator
- (NSArray)algorithms;
- (_DASSwapModelAbstractAggregator)initWithAlgorithms:(id)a3;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)updateScores;
@end

@implementation _DASSwapModelAbstractAggregator

- (_DASSwapModelAbstractAggregator)initWithAlgorithms:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____DASSwapModelAbstractAggregator;
  v5 = -[_DASSwapModelAbstractAggregator init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    algorithms = v5->_algorithms;
    v5->_algorithms = v6;
  }

  return v5;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  return 0LL;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  return 0.0;
}

- (void)updateScores
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = self->_algorithms;
  id v3 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "updateScores", (void)v7);
        v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = -[NSArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v7,  v11,  16LL);
    }

    while (v4);
  }
}

- (NSArray)algorithms
{
  return self->_algorithms;
}

- (void).cxx_destruct
{
}

@end