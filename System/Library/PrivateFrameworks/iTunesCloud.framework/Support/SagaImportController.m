@interface SagaImportController
- (BOOL)includesBookmarkable;
- (BOOL)processDAAPFileAtURL:(id)a3;
- (BOOL)shouldRestart;
- (NSDictionary)cloudIDToLyricsTokenMap;
- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap;
- (NSString)currentPaginationToken;
- (SagaImportController)init;
- (unsigned)currentItemCount;
- (unsigned)processedItemCount;
- (unsigned)totalItemCount;
@end

@implementation SagaImportController

- (SagaImportController)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SagaImportController;
  v2 = -[SagaImportController init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    mutableCloudIDToLyricsTokenMap = v2->_mutableCloudIDToLyricsTokenMap;
    v2->_mutableCloudIDToLyricsTokenMap = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (NSDictionary)cloudIDToLyricsTokenMap
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_mutableCloudIDToLyricsTokenMap, "copy");
}

- (BOOL)processDAAPFileAtURL:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", a3));
  id v5 = [[DKDAAPParser alloc] initWithStream:v4];
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___SagaImportControllerParserDelegate);
  -[SagaImportControllerParserDelegate setMutableCloudIDToLyricsTokenMap:]( v6,  "setMutableCloudIDToLyricsTokenMap:",  self->_mutableCloudIDToLyricsTokenMap);
  [v5 setDelegate:v6];
  [v5 parse];
  self->_shouldRestart = -[SagaImportControllerParserDelegate shouldRestart](v6, "shouldRestart");
  self->_totalItemCount = -[SagaImportControllerParserDelegate totalItemCount](v6, "totalItemCount");
  unsigned int v7 = -[SagaImportControllerParserDelegate currentItemCount](v6, "currentItemCount");
  unsigned int v8 = self->_processedItemCount + v7;
  self->_currentItemCount = v7;
  self->_processedItemCount = v8;
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[SagaImportControllerParserDelegate currentPaginationToken](v6, "currentPaginationToken"));
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = v9;

  self->_includesBookmarkable = -[SagaImportControllerParserDelegate includesBookmarkable](v6, "includesBookmarkable");
  return 1;
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (unsigned)totalItemCount
{
  return self->_totalItemCount;
}

- (unsigned)currentItemCount
{
  return self->_currentItemCount;
}

- (unsigned)processedItemCount
{
  return self->_processedItemCount;
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (BOOL)includesBookmarkable
{
  return self->_includesBookmarkable;
}

- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap
{
  return self->_mutableCloudIDToLyricsTokenMap;
}

- (void).cxx_destruct
{
}

@end