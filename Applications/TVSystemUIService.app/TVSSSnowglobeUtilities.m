@interface TVSSSnowglobeUtilities
+ (void)imageFor:(NSArray *)a3 remoteMemberCount:(int64_t)a4 completionHandler:(id)a5;
- (TVSSSnowglobeUtilities)init;
@end

@implementation TVSSSnowglobeUtilities

- (TVSSSnowglobeUtilities)init
{
}

  ;
}

+ (void)imageFor:(NSArray *)a3 remoteMemberCount:(int64_t)a4 completionHandler:(id)a5
{
  v5 = a3;
  v10 = _Block_copy(a5);
  v6 = (void *)swift_allocObject(&unk_1001BC150, 48LL, 7LL);
  v6[2] = a3;
  v6[3] = a4;
  v6[4] = v10;
  v6[5] = a1;
  sub_10013BFBC((uint64_t)&unk_1002215F0, (uint64_t)v6);
}

@end