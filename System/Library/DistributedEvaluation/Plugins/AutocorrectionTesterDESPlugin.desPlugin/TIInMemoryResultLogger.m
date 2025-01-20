@interface TIInMemoryResultLogger
- (NSMutableArray)results;
- (TIInMemoryResultLogger)init;
- (void)addResult:(id)a3;
@end

@implementation TIInMemoryResultLogger

- (TIInMemoryResultLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TIInMemoryResultLogger;
  v2 = -[TIInMemoryResultLogger init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    results = v2->_results;
    v2->_results = v3;
  }

  return v2;
}

- (void)addResult:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TIInMemoryResultLogger results](self, "results"));
  [v5 addObject:v4];
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end