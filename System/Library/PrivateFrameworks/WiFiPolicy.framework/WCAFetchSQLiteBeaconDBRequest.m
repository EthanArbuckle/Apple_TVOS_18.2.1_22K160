@interface WCAFetchSQLiteBeaconDBRequest
- (WCAFetchSQLiteBeaconDBRequest)init;
@end

@implementation WCAFetchSQLiteBeaconDBRequest

- (WCAFetchSQLiteBeaconDBRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___WCAFetchSQLiteBeaconDBRequest;
  v2 = -[WCAFetchSQLiteBeaconDBRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WCAFetchSQLiteRequest setTableName:](v2, "setTableName:", @"prof_clean");
    -[WCAFetchSQLiteRequest setColumnNames:](v3, "setColumnNames:", &unk_18A1B59A8);
    -[WCAFetchSQLiteRequest setLimit:](v3, "setLimit:", 1LL);
  }

  return v3;
}

@end