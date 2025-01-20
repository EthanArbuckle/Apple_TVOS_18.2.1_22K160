@interface CLPCReportingSchemaColumn
- (CLPCReportingSchemaColumn)init;
- (NSNumber)valueID;
- (NSString)name;
- (id)dictionaryRepresentation;
- (unint64_t)format;
- (unint64_t)metadataType;
- (unint64_t)statID;
- (unint64_t)type;
- (void)setFormat:(unint64_t)a3;
- (void)setMetadataType:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setStatID:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setValueID:(id)a3;
@end

@implementation CLPCReportingSchemaColumn

- (CLPCReportingSchemaColumn)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLPCReportingSchemaColumn;
  v2 = -[CLPCReportingSchemaColumn init](&v7, sel_init);
  v3 = (CLPCReportingSchemaColumn *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = 0LL;

    v5 = v3;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  id v1 = a1;
  v11[6] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v10[0] = @"Format";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(a1, "format"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v2;
    v10[1] = @"Type";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v1, "type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v3;
    v10[2] = @"StatID";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v1, "statID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v4;
    v10[3] = @"MetadataType";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v1, "metadataType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v5;
    v10[4] = @"ValueID";
    [v1 valueID];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6) {
      [v1 valueID];
    }
    else {
      [MEMORY[0x189603FE8] null];
    }
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    v10[5] = @"Name";
    [v1 name];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[5] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:v10 count:6];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)statID
{
  return self->_statID;
}

- (void)setStatID:(unint64_t)a3
{
  self->_statID = a3;
}

- (unint64_t)metadataType
{
  return self->_metadataType;
}

- (void)setMetadataType:(unint64_t)a3
{
  self->_metadataType = a3;
}

- (NSNumber)valueID
{
  return self->_valueID;
}

- (void)setValueID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end