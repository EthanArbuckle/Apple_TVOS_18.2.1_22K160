@interface SHMediaLibraryContext
- (NSError)error;
- (NSString)startCondition;
- (SHMediaLibraryContext)initWithSnapshot:(id)a3 startCondition:(id)a4;
- (SHMediaLibrarySnapshot)snapshot;
- (SHMediaLibrarySyncDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SHMediaLibraryContext

- (SHMediaLibraryContext)initWithSnapshot:(id)a3 startCondition:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHMediaLibraryContext;
  v9 = -[SHMediaLibraryContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshot, a3);
    objc_storeStrong((id *)&v10->_startCondition, a4);
  }

  return v10;
}

- (SHMediaLibrarySyncDelegate)delegate
{
  return (SHMediaLibrarySyncDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SHMediaLibrarySnapshot)snapshot
{
  return self->_snapshot;
}

- (NSString)startCondition
{
  return self->_startCondition;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end