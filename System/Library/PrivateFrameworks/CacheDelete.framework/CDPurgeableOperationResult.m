@interface CDPurgeableOperationResult
- (CDPurgeableOperationResult)initWithVolumes:(id)a3;
- (NSArray)volumes;
- (NSMutableArray)mutableResults;
- (unint64_t)totalPurgeableBytes;
- (void)addResult:(id)a3;
- (void)setMutableResults:(id)a3;
@end

@implementation CDPurgeableOperationResult

- (CDPurgeableOperationResult)initWithVolumes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDPurgeableOperationResult;
  v6 = -[CDResult init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_volumes, a3);
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
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDPurgeableOperationResult mutableResults](self, "mutableResults"));
    [v5 addObject:v6];
  }
}

- (NSArray)volumes
{
  return self->_volumes;
}

- (unint64_t)totalPurgeableBytes
{
  return self->_totalPurgeableBytes;
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