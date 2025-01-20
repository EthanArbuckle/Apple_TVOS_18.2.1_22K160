@interface CDPeriodicOperationResult
- (CDPeriodicOperationResult)initWithVolumes:(id)a3;
- (NSArray)volumeNames;
- (NSMutableArray)mutableResults;
- (void)addResult:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation CDPeriodicOperationResult

- (CDPeriodicOperationResult)initWithVolumes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDPeriodicOperationResult;
  v6 = -[CDResult init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumeNames, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableResults = v7->_mutableResults;
    v7->_mutableResults = v8;
  }

  return v7;
}

- (void)addResult:(id)a3
{
  id v6 = a3;
  unsigned __int8 v4 = -[CDResult isFinished](self, "isFinished");
  if (v6 && (v4 & 1) == 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDPeriodicOperationResult mutableResults](self, "mutableResults"));
    [v5 addObject:v6];
  }
}

- (NSArray)volumeNames
{
  return self->_volumeNames;
}

- (NSMutableArray)mutableResults
{
  return self->_mutableResults;
}

- (void)setMutableResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end