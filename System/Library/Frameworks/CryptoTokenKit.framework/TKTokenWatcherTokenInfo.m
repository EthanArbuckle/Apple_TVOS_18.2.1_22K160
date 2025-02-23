@interface TKTokenWatcherTokenInfo
- (NSString)driverName;
- (NSString)slotName;
- (NSString)tokenID;
- (TKTokenWatcherTokenInfo)initWithTokenInfo:(id)a3;
@end

@implementation TKTokenWatcherTokenInfo

- (TKTokenWatcherTokenInfo)initWithTokenInfo:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TKTokenWatcherTokenInfo;
  v5 = -[TKTokenWatcherTokenInfo init](&v15, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 firstObject];
    tokenID = v5->_tokenID;
    v5->_tokenID = (NSString *)v6;

    if ((unint64_t)[v4 count] >= 2)
    {
      [v4 objectAtIndexedSubscript:1];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v8 length])
      {
        uint64_t v9 = [v4 objectAtIndexedSubscript:1];
        driverName = v5->_driverName;
        v5->_driverName = (NSString *)v9;
      }

      else
      {
        driverName = v5->_driverName;
        v5->_driverName = 0LL;
      }

      if ((unint64_t)[v4 count] >= 3)
      {
        [v4 objectAtIndexedSubscript:2];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v11 length])
        {
          uint64_t v12 = [v4 objectAtIndexedSubscript:2];
          slotName = v5->_slotName;
          v5->_slotName = (NSString *)v12;
        }

        else
        {
          slotName = v5->_slotName;
          v5->_slotName = 0LL;
        }
      }
    }
  }

  return v5;
}

- (NSString)tokenID
{
  return self->_tokenID;
}

- (NSString)slotName
{
  return self->_slotName;
}

- (NSString)driverName
{
  return self->_driverName;
}

- (void).cxx_destruct
{
}

@end