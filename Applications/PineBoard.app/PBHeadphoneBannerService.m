@interface PBHeadphoneBannerService
- (void)presentHeadphoneBannerWithRequest:(id)a3 completion:(id)a4;
@end

@implementation PBHeadphoneBannerService

- (void)presentHeadphoneBannerWithRequest:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100091D54;
  v7[3] = &unk_1003D0070;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, v7);
}

@end