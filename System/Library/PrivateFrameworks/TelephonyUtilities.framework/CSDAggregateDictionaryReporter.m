@interface CSDAggregateDictionaryReporter
- (CSDAggregateDictionaryReporter)init;
- (id)block;
- (void)reportingController:(id)a3 relayMessageReceived:(id)a4 fromPairedDevice:(BOOL)a5;
- (void)setBlock:(id)a3;
@end

@implementation CSDAggregateDictionaryReporter

- (CSDAggregateDictionaryReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSDAggregateDictionaryReporter;
  v2 = -[CSDAggregateDictionaryReporter init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    id block = v2->_block;
    v2->_id block = &stru_1003D7A58;
  }

  return v3;
}

- (void)reportingController:(id)a3 relayMessageReceived:(id)a4 fromPairedDevice:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (v5)
  {
    id v22 = v7;
    [v7 messageSendTime];
    id v7 = v22;
    if (v8 != 0.0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v9 timeIntervalSince1970];
      double v11 = v10;

      [v22 messageSendTime];
      double v13 = v12;
      uint64_t v14 = TUBundleIdentifierCallServicesDaemon;
      v15 = (void *)objc_claimAutoreleasedReturnValue([v22 typeString]);
      [v22 messageSendTime];
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"%@.%@.%f",  v14,  v15,  v16));

      v18 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueProxyIdentifier]);
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v22 uniqueProxyIdentifier]);
        [v17 appendFormat:@".%@", v19];
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CSDAggregateDictionaryReporter block](self, "block"));

      if (v20)
      {
        v21 = (void (**)(void, void, double))objc_claimAutoreleasedReturnValue(-[CSDAggregateDictionaryReporter block](self, "block"));
        ((void (**)(void, void *, double))v21)[2](v21, v17, v11 - v13);
      }

      id v7 = v22;
    }
  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end