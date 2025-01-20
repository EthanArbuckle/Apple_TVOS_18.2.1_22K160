@interface PurchaseHistoryUpdateDAAPRequestEncoder
- (id)dataForRequestWithError:(id *)a3;
- (unint64_t)contentType;
@end

@implementation PurchaseHistoryUpdateDAAPRequestEncoder

- (id)dataForRequestWithError:(id *)a3
{
  revision = self->_revision;
  if (revision) {
    id v4 = (id)-[NSNumber intValue](revision, "intValue", a3);
  }
  else {
    id v4 = 0LL;
  }
  id v5 = sub_10031E760((uint64_t)&OBJC_CLASS___PurchaseHistoryDAAPEncoding);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(%@)", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"revision-number=%u&query=%@",  v4,  v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 dataUsingEncoding:4]);

  return v9;
}

- (unint64_t)contentType
{
  return 1LL;
}

- (void).cxx_destruct
{
}

@end