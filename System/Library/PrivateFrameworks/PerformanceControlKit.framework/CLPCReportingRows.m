@interface CLPCReportingRows
- (CLPCReportingRows)init;
- (CLPCReportingSchema)schema;
- (NSArray)rows;
- (void)setRows:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation CLPCReportingRows

- (CLPCReportingRows)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLPCReportingRows;
  v2 = -[CLPCReportingRows init](&v9, sel_init);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    schema = v2->_schema;
    v2->_schema = (CLPCReportingSchema *)v3;

    uint64_t v5 = [MEMORY[0x189603F18] array];
    rows = v2->_rows;
    v2->_rows = (NSArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (CLPCReportingSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
}

@end