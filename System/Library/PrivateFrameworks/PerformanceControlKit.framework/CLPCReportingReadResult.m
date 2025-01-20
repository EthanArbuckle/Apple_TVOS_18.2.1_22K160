@interface CLPCReportingReadResult
- (CLPCReportingReadResult)init;
- (id).cxx_construct;
- (id)debugDescription;
- (id)rowsForSchemaID:(unint64_t)a3 error:(id *)a4;
- (unint64_t)hasRowsForSchemaID:(unint64_t)a3 error:(id *)a4;
- (void)enumerate:(id)a3;
- (void)setStatRows:(unsigned int)a3 forIndex:;
@end

@implementation CLPCReportingReadResult

- (CLPCReportingReadResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLPCReportingReadResult;
  v2 = -[CLPCReportingReadResult init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    id v6 = 0LL;
    std::array<CLPCReportingRows * {__strong},8ul>::fill[abi:ne180100]((uint64_t)&v2->rows_by_schema, &v6);

    v4 = v3;
  }

  return v3;
}

- (void)setStatRows:(unsigned int)a3 forIndex:
{
  id v6 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 8LL * a3 + 8), a2);
  }
}

- (unint64_t)hasRowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  if (a3 >= 8)
  {
    return 0LL;
  }

  else if (self->rows_by_schema.__elems_[a3])
  {
    return 2LL;
  }

  else
  {
    return 1LL;
  }

- (id)rowsForSchemaID:(unint64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (a3 >= 8)
  {
    objc_super v7 = 0LL;
  }

  else
  {
    id v6 = self->rows_by_schema.__elems_[a3];
    objc_super v7 = v6;
    if (!v6
      || (-[CLPCReportingRows rows](v6, "rows"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          !v9))
    {
      if (a4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"There are no rows for schema ID %lu.", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = *MEMORY[0x189607490];
        v14[0] = v10;
        [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        [MEMORY[0x189607870] errorWithDomain:@"CLPCErrorDomain" code:-536870206 userInfo:v11];
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v7;
}

- (void)enumerate:(id)a3
{
  v10 = (uint64_t (**)(id, void, void *))a3;
  uint64_t v4 = 0LL;
  p_rows_by_schema = &self->rows_by_schema;
  while (1)
  {
    id v6 = p_rows_by_schema->__elems_[v4];
    objc_super v7 = v6;
    if (v6)
    {
      v8 = -[CLPCReportingRows rows](v6, "rows");
      uint64_t v9 = [v8 count];

      if (v9)
      {
        if ((v10[2](v10, v4, v7) & 1) == 0) {
          break;
        }
      }
    }

    if (++v4 == 8) {
      goto LABEL_8;
    }
  }

LABEL_8:
}

- (id)debugDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __43__CLPCReportingReadResult_debugDescription__block_invoke;
  v7[3] = &unk_18A2C40C0;
  id v4 = v3;
  id v8 = v4;
  -[CLPCReportingReadResult enumerate:](self, "enumerate:", v7);
  [v4 description];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __43__CLPCReportingReadResult_debugDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x189603FA8];
  [v5 schema];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 columns];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  objc_msgSend(v5, "schema", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 columns];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = -[CLPCReportingSchemaColumn dictionaryRepresentation](*(id *)(*((void *)&v21 + 1) + 8 * v14));
        [v9 addObject:v15];

        ++v14;
      }

      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v12);
  }

  v16 = *(void **)(a1 + 32);
  v25[0] = @"SchemaID";
  [MEMORY[0x189607968] numberWithUnsignedInteger:a2];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = v9;
  v25[1] = @"Columns";
  v25[2] = @"Rows";
  [v5 rows];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 addObject:v19];

  return 1LL;
}

- (void).cxx_destruct
{
  uint64_t v3 = 8LL;
  do

  while (v3 * 8);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end