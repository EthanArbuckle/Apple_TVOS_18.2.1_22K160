@interface __NSPlaceholderURLQueryItem
- (__NSPlaceholderURLQueryItem)init;
- (__NSPlaceholderURLQueryItem)initWithName:(id)a3 value:(id)a4;
- (unint64_t)retainCount;
@end

@implementation __NSPlaceholderURLQueryItem

- (__NSPlaceholderURLQueryItem)init
{
  return (__NSPlaceholderURLQueryItem *)+[NSURLQueryItem _queryItem](&OBJC_CLASS___NSURLQueryItem, "_queryItem");
}

- (__NSPlaceholderURLQueryItem)initWithName:(id)a3 value:(id)a4
{
  else {
    id v6 = 0LL;
  }
  return (__NSPlaceholderURLQueryItem *) +[NSURLQueryItem _queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "_queryItemWithName:value:",  a3,  v6);
}

- (unint64_t)retainCount
{
  return -1LL;
}

@end