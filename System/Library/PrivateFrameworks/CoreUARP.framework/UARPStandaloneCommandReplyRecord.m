@interface UARPStandaloneCommandReplyRecord
+ (BOOL)supportsSecureCoding;
- (NSString)modelNumber;
- (UARPStandaloneCommandReplyRecord)initWithCoder:(id)a3;
- (UARPStandaloneCommandReplyRecord)initWithModelNumber:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getResponseURLs;
- (void)addResponseURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPStandaloneCommandReplyRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPStandaloneCommandReplyRecord)initWithModelNumber:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___UARPStandaloneCommandReplyRecord;
  v5 = -[UARPStandaloneCommandReplyRecord init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v8;
  }

  return v5;
}

- (void)addResponseURL:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](v4->_solicitedURLResponses, "addObject:", v5);
  objc_sync_exit(v4);
}

- (id)getResponseURLs
{
  v2 = self;
  objc_sync_enter(v2);
  [MEMORY[0x189603F18] arrayWithArray:v2->_solicitedURLResponses];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (UARPStandaloneCommandReplyRecord)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPStandaloneCommandReplyRecord;
  id v5 = -[UARPStandaloneCommandReplyRecord init](&v14, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelNumber"];
    modelNumber = v5->_modelNumber;
    v5->_modelNumber = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x189604010];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v15 count:2];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWithArray:v9];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"responseURLs"];
    solicitedURLResponses = v5->_solicitedURLResponses;
    v5->_solicitedURLResponses = (NSMutableArray *)v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modelNumber = self->_modelNumber;
  id v5 = a3;
  [v5 encodeObject:modelNumber forKey:@"modelNumber"];
  [v5 encodeObject:self->_solicitedURLResponses forKey:@"responseURLs"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___UARPStandaloneCommandReplyRecord);
  uint64_t v5 = -[NSString copy](self->_modelNumber, "copy");
  modelNumber = v4->_modelNumber;
  v4->_modelNumber = (NSString *)v5;

  uint64_t v7 = -[NSMutableArray copy](self->_solicitedURLResponses, "copy");
  solicitedURLResponses = v4->_solicitedURLResponses;
  v4->_solicitedURLResponses = (NSMutableArray *)v7;

  return v4;
}

- (id)description
{
  v3 = (void *)NSString;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@: modelNumber=%@ solicitedResponses=%@>", v5, self->_modelNumber, self->_solicitedURLResponses];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end