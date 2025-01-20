@interface RestoreAppInstall
+ (id)defaultProperties;
- (id)description;
@end

@implementation RestoreAppInstall

+ (id)defaultProperties
{
  v3[0] = @"account_id";
  v3[1] = @"alt_dsid";
  v3[2] = @"apple_id";
  v3[3] = @"approved";
  v3[4] = @"arcade";
  v3[5] = @"bootstrapped";
  v3[6] = @"bundle_id";
  v3[7] = @"coordinator_id";
  v3[8] = @"coordinator_intent";
  v3[9] = @"device_based_vpp";
  v3[10] = @"downloader_id";
  v3[11] = @"external_id";
  v3[12] = @"evid";
  v3[13] = @"failure_error";
  v3[14] = @"item_id";
  v3[15] = @"log_code";
  v3[16] = @"metrics_install_type";
  v3[17] = @"order_index";
  v3[18] = @"phase";
  v3[19] = @"priority";
  v3[20] = @"restore_retry_count";
  v3[21] = @"restore_type";
  v3[22] = @"restore_state";
  v3[23] = @"store_metadata";
  v3[24] = @"storefront";
  v3[25] = @"supress_dialogs";
  v3[26] = @"vid";
  v3[27] = @"ROWID";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  28LL));
}

- (id)description
{
  id v3 = sub_100323D88(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_100323DD0(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = sub_1002D7968(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1002D79A4(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_1002D78EC(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ bundleID: %@ itemID: %@ evid: %@ storefront: %@ account: %@ }",  v4,  v6,  v8,  v10,  v12));

  return v13;
}

@end