@interface LSBundleRecord
- (BOOL)sk_allowExternalLink;
- (BOOL)sk_allowExternalPurchase;
- (BOOL)sk_getTaskAllowed;
- (BOOL)sk_isAlmond;
- (NSURL)lib_receiptURL;
- (NSURL)sk_advertisingAttributionReportURL;
- (id)_lib_receiptName;
@end

@implementation LSBundleRecord

- (NSURL)lib_receiptURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleRecord dataContainerURL](self, "dataContainerURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"StoreKit" isDirectory:1]);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LSBundleRecord _lib_receiptName](self, "_lib_receiptName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v5 isDirectory:0]);
  }

  else
  {
    if (qword_10032EDF8 != -1) {
      dispatch_once(&qword_10032EDF8, &stru_1002E9D30);
    }
    v7 = (void *)qword_10032EDB0;
    if (os_log_type_enabled((os_log_t)qword_10032EDB0, OS_LOG_TYPE_ERROR)) {
      sub_100263468(v7, self);
    }
    v6 = 0LL;
  }

  return (NSURL *)v6;
}

- (id)_lib_receiptName
{
  else {
    return @"receipt";
  }
}

- (NSURL)sk_advertisingAttributionReportURL
{
  uint64_t v3 = sub_10007B1FC((uint64_t *)&unk_10032A1C0);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v6 = self;
  sub_1000D16E4();

  uint64_t v7 = type metadata accessor for URL(0LL);
  v9 = 0LL;
  if (sub_10007D824((uint64_t)v5, 1LL, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8LL))(v5, v7);
  }

  return (NSURL *)v9;
}

- (BOOL)sk_allowExternalLink
{
  v2 = self;
  char v3 = sub_1000D1E0C(4u);

  return v3 & 1;
}

- (BOOL)sk_allowExternalPurchase
{
  v2 = self;
  char v3 = sub_1000D1E0C(5u);

  return v3 & 1;
}

- (BOOL)sk_getTaskAllowed
{
  v2 = self;
  char v3 = sub_1000D4A38();

  return v3 & 1;
}

- (BOOL)sk_isAlmond
{
  return 0;
}

@end