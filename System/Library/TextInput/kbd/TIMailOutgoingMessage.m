@interface TIMailOutgoingMessage
- (NSDate)dateSent;
- (NSDictionary)searchResult;
- (NSString)body;
- (NSString)recipient;
- (void)setSearchResult:(id)a3;
@end

@implementation TIMailOutgoingMessage

- (NSDate)dateSent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailOutgoingMessage searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:MSResultsKeyDateSent]);

  return (NSDate *)v3;
}

- (NSString)recipient
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailOutgoingMessage searchResult](self, "searchResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:MSResultsKeyRecipientTo]);

  if ([v4 count] == (id)1
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailOutgoingMessage searchResult](self, "searchResult")),
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:MSResultsKeyRecipientCc]),
        id v7 = [v6 count],
        v6,
        v5,
        !v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  }

  else
  {
    v8 = 0LL;
  }

  return (NSString *)v8;
}

- (NSString)body
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TIMailOutgoingMessage searchResult](self, "searchResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:_MSResultsKeyPredictiveModelSummary]);

  return (NSString *)v3;
}

- (NSDictionary)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end