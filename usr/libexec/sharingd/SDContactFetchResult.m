@interface SDContactFetchResult
- (NSArray)events;
- (NSData)currentHistoryToken;
- (void)setCurrentHistoryToken:(id)a3;
- (void)setEvents:(id)a3;
@end

@implementation SDContactFetchResult

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setEvents:(id)a3
{
}

- (NSData)currentHistoryToken
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end