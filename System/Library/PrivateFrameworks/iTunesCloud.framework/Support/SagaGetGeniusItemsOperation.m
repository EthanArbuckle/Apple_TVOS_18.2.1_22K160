@interface SagaGetGeniusItemsOperation
- (NSArray)itemIDs;
- (SagaGetGeniusItemsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 seedID:(unint64_t)a5 numberOfItems:(unsigned int)a6;
- (SagaGetGeniusItemsOperation)initWithSeedID:(unint64_t)a3 clientIdentity:(id)a4 numberOfItems:(unsigned int)a5;
- (void)main;
@end

@implementation SagaGetGeniusItemsOperation

- (SagaGetGeniusItemsOperation)initWithSeedID:(unint64_t)a3 clientIdentity:(id)a4 numberOfItems:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  v10 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v9);
  v11 = -[SagaGetGeniusItemsOperation initWithConfiguration:clientIdentity:seedID:numberOfItems:]( self,  "initWithConfiguration:clientIdentity:seedID:numberOfItems:",  v10,  v8,  a3,  v5);

  return v11;
}

- (SagaGetGeniusItemsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 seedID:(unint64_t)a5 numberOfItems:(unsigned int)a6
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaGetGeniusItemsOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v9,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result)
  {
    result->super._status = a5;
    LODWORD(result->super._error) = a6;
  }

  return result;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaGetGeniusItemsOperation - (seed_id = %llu)",  self->super._status));
  id v5 = [[MSVXPCTransaction alloc] initWithName:v4];
  [v5 beginTransaction];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v6 setClientIdentity:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICGetGeniusItemsRequest requestWithDatabaseID:seedID:numberOfItems:]( ICGetGeniusItemsRequest,  "requestWithDatabaseID:seedID:numberOfItems:",  [v8 databaseID],  LODWORD(self->super._status),  LODWORD(self->super._error)));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007F358;
  v14[3] = &unk_1001A6E30;
  v14[4] = self;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
  v10 = v15;
  [v8 sendRequest:v9 withResponseHandler:v14];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v12 = MSVTCCIdentityForCurrentProcess();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v11 setClientIdentity:v13];

  [v5 endTransaction];
  objc_autoreleasePoolPop(v3);
}

- (NSArray)itemIDs
{
  return (NSArray *)self->_seedID;
}

- (void).cxx_destruct
{
}

@end