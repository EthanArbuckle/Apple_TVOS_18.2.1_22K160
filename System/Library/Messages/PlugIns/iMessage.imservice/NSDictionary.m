@interface NSDictionary
- (id)_copyiMessageDictionaryForLogging;
@end

@implementation NSDictionary

- (id)_copyiMessageDictionaryForLogging
{
  id v2 = -[NSDictionary mutableCopy](self, "mutableCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"IDSIncomingMessageDecryptedData"]);
  id v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"IDSIncomingMessageDecryptedData"]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<data of length %lu>",  [v5 length]));

    [v2 setObject:v6 forKey:@"IDSIncomingMessageDecryptedData"];
  }

  return v2;
}

@end