@interface NSString
+ (id)skan_versionStringFromSKAdNetworkVersion:(int64_t)a3;
- (int64_t)skan_version;
@end

@implementation NSString

- (int64_t)skan_version
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:options:range:]( self,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"[.,]",  @".",  1024LL,  0LL,  -[NSString length](self, "length")));
  if (qword_1002BAF98[0] != -1) {
    dispatch_once(qword_1002BAF98, &stru_10026FF20);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002BAF90 objectForKeyedSubscript:v2]);
  v4 = v3;
  if (v3) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

+ (id)skan_versionStringFromSKAdNetworkVersion:(int64_t)a3
{
  v3 = @"2.2";
  v4 = @"3.0";
  id v5 = @"4.0";
  if (a3 != 400) {
    id v5 = 0LL;
  }
  if (a3 != 300) {
    v4 = v5;
  }
  if (a3 != 202) {
    v3 = v4;
  }
  v6 = @"2.1";
  if (a3 != 201) {
    v6 = 0LL;
  }
  if (a3 == 200) {
    v6 = @"2.0";
  }
  if (a3 == 100) {
    v6 = @"1.0";
  }
  if (a3 <= 201) {
    return (id)v6;
  }
  else {
    return (id)v3;
  }
}

@end