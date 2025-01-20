@interface AppInstall
+ (id)defaultProperties;
- (BOOL)isRestore;
@end

@implementation AppInstall

- (BOOL)isRestore
{
  return ((unint64_t)sub_1001E2698(self, (uint64_t)@"restore_type") & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (id)defaultProperties
{
  v3[0] = @"approved";
  v3[1] = @"arcade";
  v3[2] = @"automatic_type";
  v3[3] = @"bootstrapped";
  v3[4] = @"bundle_id";
  v3[5] = @"client_id";
  v3[6] = @"external_id";
  v3[7] = @"item_id";
  v3[8] = @"last_start_date";
  v3[9] = @"log_code";
  v3[10] = @"optimal_download_start";
  v3[11] = @"order_index";
  v3[12] = @"priority";
  v3[13] = @"policy";
  v3[14] = @"restore_type";
  v3[15] = @"software_platform";
  v3[16] = @"source_type";
  v3[17] = @"supress_dialogs";
  v3[18] = @"update_type";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  19LL));
}

- (void).cxx_destruct
{
}

@end