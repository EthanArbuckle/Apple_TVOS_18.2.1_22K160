@interface PCCRequest
- (NSDictionary)options;
- (NSString)event;
- (NSString)jid;
- (NSString)type;
- (PCCRequest)initWithMessage:(id)a3 options:(id)a4;
- (id)callback;
- (id)description;
- (void)setCallback:(id)a3;
@end

@implementation PCCRequest

- (PCCRequest)initWithMessage:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PCCRequest;
  v8 = -[PCCRequest init](&v21, sel_init);
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"jobId"];
    jid = v8->_jid;
    v8->_jid = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"messageType"];
    type = v8->_type;
    v8->_type = (NSString *)v11;

    if (-[NSString isEqualToString:](v8->_type, "isEqualToString:", @"initiateLogTransfer"))
    {
      [v6 objectForKeyedSubscript:@"logFile"];
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = @"xfer-file";
      }

      else
      {
        [v6 objectForKeyedSubscript:@"allFiles"];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v16 = [v15 BOOLValue];

        v14 = @"xfer-group";
        if (v16) {
          v14 = @"xfer-all";
        }
      }

      v17 = v8->_type;
      v8->_type = &v14->isa;

      uint64_t v18 = [v6 objectForKeyedSubscript:@"jobEvent"];
      event = v8->_event;
      v8->_event = (NSString *)v18;
    }

    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ %@", self->_jid, self->_type];
}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (id)callback
{
  return objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCallback:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end