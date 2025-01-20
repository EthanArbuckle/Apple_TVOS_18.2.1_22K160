@interface ICCloudContentTasteUpdateResponse
+ (id)eTagValueFromContentTasteResponse:(id)a3;
- (BOOL)isCachedResponse;
- (ICCloudContentTasteUpdateResponse)initWithContentTasteResponse:(id)a3;
- (NSArray)contentTasteItems;
- (NSDate)expirationDate;
- (unint64_t)responseRevisionID;
- (void)setCachedResponse:(BOOL)a3;
- (void)setContentTasteItems:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setResponseRevisionID:(unint64_t)a3;
@end

@implementation ICCloudContentTasteUpdateResponse

- (ICCloudContentTasteUpdateResponse)initWithContentTasteResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICCloudContentTasteUpdateResponse;
  v5 = -[ICCloudContentTasteUpdateResponse init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudContentTasteUpdateResponse eTagValueFromContentTasteResponse:]( &OBJC_CLASS___ICCloudContentTasteUpdateResponse,  "eTagValueFromContentTasteResponse:",  v4));
    v5->_responseRevisionID = (unint64_t)[v6 longLongValue];
  }

  return v5;
}

- (NSArray)contentTasteItems
{
  return self->_contentTasteItems;
}

- (void)setContentTasteItems:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)responseRevisionID
{
  return self->_responseRevisionID;
}

- (void)setResponseRevisionID:(unint64_t)a3
{
  self->_responseRevisionID = a3;
}

- (BOOL)isCachedResponse
{
  return self->_cachedResponse;
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (void).cxx_destruct
{
}

+ (id)eTagValueFromContentTasteResponse:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allHeaderFields]);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"ETag"]);
    if (!v7)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([@"ETag" lowercaseString]);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v8]);
    }
  }

  else
  {
    v7 = 0LL;
  }

  if (-[__CFString length](v7, "length")) {
    v9 = v7;
  }
  else {
    v9 = @"0";
  }
  v10 = v9;

  return v10;
}

@end