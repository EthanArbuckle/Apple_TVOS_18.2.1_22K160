@interface AMSBag
+ (id)pb_bag;
@end

@implementation AMSBag

+ (id)pb_bag
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([a1 bagForProfile:@"PineBoard" profileVersion:@"1"]);
  [v2 setDefaultValue:&off_1003FD6F8 forKey:@"atv-headboard-refresh-interval-seconds"];
  [v2 setDefaultValue:&off_1003FD710 forKey:@"atv-whatsnew-refresh-interval-in-seconds"];
  return v2;
}

@end