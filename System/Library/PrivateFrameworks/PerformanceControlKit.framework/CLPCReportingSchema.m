@interface CLPCReportingSchema
- (CLPCReportingSchema)init;
- (NSArray)columns;
- (unint64_t)schemaID;
- (void)finalizeColumns;
- (void)setSchemaID:(unint64_t)a3;
- (void)stageColumn:(uint64_t)a1;
@end

@implementation CLPCReportingSchema

- (CLPCReportingSchema)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLPCReportingSchema;
  v2 = -[CLPCReportingSchema init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_schemaID = 0LL;
    uint64_t v4 = [MEMORY[0x189603F18] array];
    columns = v3->_columns;
    v3->_columns = (NSArray *)v4;

    uint64_t v6 = [MEMORY[0x189603FA8] array];
    stagedColumns = v3->stagedColumns;
    v3->stagedColumns = (NSMutableArray *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)stageColumn:(uint64_t)a1
{
  id v3 = a2;
  if (a1) {
    [*(id *)(a1 + 8) addObject:v3];
  }
}

- (void)finalizeColumns
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x189603F18] arrayWithArray:*(void *)(a1 + 8)];
    id v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v2;

    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0LL;
  }

- (unint64_t)schemaID
{
  return self->_schemaID;
}

- (void)setSchemaID:(unint64_t)a3
{
  self->_schemaID = a3;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
}

@end