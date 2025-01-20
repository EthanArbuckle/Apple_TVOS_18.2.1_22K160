@interface OSLogEntry
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)composedMessage;
- (OSLogEntry)initWithCoder:(id)a3;
- (OSLogEntry)initWithDate:(id)a3 composedMessage:(id)a4;
- (OSLogEntry)initWithEventProxy:(id)a3;
- (OSLogEntryStoreCategory)storeCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntry

- (OSLogEntry)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogEntry;
  v5 = -[OSLogEntry init](&v12, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 composedMessage];
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    uint64_t v8 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = 0LL;
    v10 = v5;
  }

  return v5;
}

- (OSLogEntry)initWithDate:(id)a3 composedMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___OSLogEntry;
  v9 = -[OSLogEntry init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_composedMessage, a4);
    objc_storeStrong((id *)&v10->_date, a3);
    v10->_storeCategory = 0LL;
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  -[OSLogEntry composedMessage](self, "composedMessage");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 encodeObject:v4 forKey:@"composedMessage"];
  v5 = -[OSLogEntry date](self, "date");
  [v6 encodeObject:v5 forKey:@"date"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[OSLogEntry storeCategory](self, "storeCategory"), @"storeCategory");
}

- (OSLogEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___OSLogEntry;
  v5 = -[OSLogEntry init](&v12, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedMessage"];
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = [v4 decodeIntegerForKey:@"storeCategory"];
    v10 = v5;
  }

  return v5;
}

- (NSString)composedMessage
{
  return self->_composedMessage;
}

- (NSDate)date
{
  return self->_date;
}

- (OSLogEntryStoreCategory)storeCategory
{
  return self->_storeCategory;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end