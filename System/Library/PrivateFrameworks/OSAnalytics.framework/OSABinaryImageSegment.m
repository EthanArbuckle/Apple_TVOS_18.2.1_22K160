@interface OSABinaryImageSegment
- (OSABinaryImageSegment)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16];
- (OSABinaryImageSegment)initWithSymbol:(id)a3;
- (OSASymbolInfo)symbolInfo;
- (id)details;
- (id)full_details;
- (int)source;
- (unint64_t)used_index;
- (void)setSource:(int)a3;
- (void)setUsed_index:(unint64_t)a3;
@end

@implementation OSABinaryImageSegment

- (OSABinaryImageSegment)initWithSymbol:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OSABinaryImageSegment;
  v6 = -[OSABinaryImageSegment init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_symbolInfo, a3);
    v7->_source = 0;
    v7->_used_index = 0LL;
  }

  return v7;
}

- (OSABinaryImageSegment)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16]
{
  v6 = -[OSASymbolInfo initWithAddress:size:for:]( objc_alloc(&OBJC_CLASS___OSASymbolInfo),  "initWithAddress:size:for:",  a3,  a4,  a5);
  v7 = -[OSABinaryImageSegment initWithSymbol:](self, "initWithSymbol:", v6);

  return v7;
}

- (id)details
{
  v8[3] = *MEMORY[0x1895F89C0];
  v3 = -[OSASymbolInfo get_uuid](self->_symbolInfo, "get_uuid");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(NSString, "stringWithFormat:", @"%c", self->_source);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v8 count:3];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)full_details
{
  v14[4] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc(MEMORY[0x189603FC8]);
  v13[0] = @"uuid";
  v4 = -[OSASymbolInfo get_uuid](self->_symbolInfo, "get_uuid");
  v14[0] = v4;
  v13[1] = @"base";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSASymbolInfo start](self->_symbolInfo, "start"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = @"source";
  objc_msgSend(NSString, "stringWithFormat:", @"%c", self->_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  v13[3] = @"size";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", -[OSASymbolInfo size](self->_symbolInfo, "size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_super v9 = (void *)[v3 initWithDictionary:v8];
  v10 = -[OSASymbolInfo name](self->_symbolInfo, "name");
  [v9 setObject:v10 forKeyedSubscript:@"name"];

  [v9 setObject:self->_symbolInfo->legacy_arch forKeyedSubscript:@"arch"];
  v11 = -[OSASymbolInfo path](self->_symbolInfo, "path");
  [v9 setObject:v11 forKeyedSubscript:@"path"];

  return v9;
}

- (OSASymbolInfo)symbolInfo
{
  return self->_symbolInfo;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (unint64_t)used_index
{
  return self->_used_index;
}

- (void)setUsed_index:(unint64_t)a3
{
  self->_used_index = a3;
}

- (void).cxx_destruct
{
}

@end