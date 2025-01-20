@interface WCAFetchSQLiteRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)columnNames;
- (NSDictionary)parameters;
- (NSString)tableName;
- (WCAFetchSQLiteRequest)initWithCoder:(id)a3;
- (id)description;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setColumnNames:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setParameters:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation WCAFetchSQLiteRequest

- (id)description
{
  v3 = (void *)MEMORY[0x189607940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ : %p ", v5, self];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 appendFormat:@"parameters: %@", self->_parameters];
  [v6 appendFormat:@"tableName: %@", self->_tableName];
  [v6 appendFormat:@"columnNames: %@", self->_columnNames];
  objc_msgSend(v6, "appendFormat:", @"limit: %ld", self->_limit);
  [v6 appendString:@">"];
  return v6;
}

- (void)setParameters:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (v4)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v12 = 0u;
    v6 = -[NSDictionary allValues](v4, "allValues", 0LL, 0LL);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!--v8)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }
  }

  parameters = self->_parameters;
  self->_parameters = v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteRequest;
  id v4 = a3;
  -[WCAFetchRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameters, @"_parameters", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_tableName forKey:@"_tableName"];
  [v4 encodeObject:self->_columnNames forKey:@"_columnNames"];
  [v4 encodeInteger:self->_limit forKey:@"_limit"];
}

- (WCAFetchSQLiteRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteRequest;
  objc_super v5 = -[WCAFetchRequest initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_tableName"];
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v12;

    __int128 v14 = (void *)MEMORY[0x189604010];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_columnNames"];
    columnNames = v5->_columnNames;
    v5->_columnNames = (NSArray *)v17;

    v5->_limit = [v4 decodeIntegerForKey:@"_limit"];
  }

  return v5;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
}

@end