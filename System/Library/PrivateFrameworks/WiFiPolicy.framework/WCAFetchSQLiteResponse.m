@interface WCAFetchSQLiteResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)records;
- (WCAFetchSQLiteResponse)initWithCoder:(id)a3;
- (WCAFetchSQLiteResponse)initWithRecords:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation WCAFetchSQLiteResponse

- (WCAFetchSQLiteResponse)initWithRecords:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteResponse;
  id v3 = a3;
  v4 = -[WCAFetchSQLiteResponse init](&v6, sel_init);
  -[WCAFetchSQLiteResponse setRecords:](v4, "setRecords:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 appendFormat:@"records: %@", self->_records];
  [v6 appendString:@">"];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteResponse;
  id v4 = a3;
  -[WCAFetchResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_records, @"_records", v5.receiver, v5.super_class);
}

- (WCAFetchSQLiteResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteResponse;
  objc_super v5 = -[WCAFetchResponse initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_records"];
    records = v5->_records;
    v5->_records = (NSArray *)v11;
  }

  return v5;
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (void).cxx_destruct
{
}

@end