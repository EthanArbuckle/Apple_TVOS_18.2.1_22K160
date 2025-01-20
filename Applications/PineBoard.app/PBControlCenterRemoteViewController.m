@interface PBControlCenterRemoteViewController
- (void)dismissWithResult:(id)a3;
@end

@implementation PBControlCenterRemoteViewController

- (void)dismissWithResult:(id)a3
{
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_1001E195C;
  v11 = &unk_1003D63D8;
  id v4 = a3;
  id v12 = v4;
  v13 = self;
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSimpleRemoteViewController delegate](self, "delegate", v8, v9, v10, v11));
  v7 = v6;
  if (v4 && v6) {
    [v6 viewService:self handleDismissWithResult:v4 completion:v5];
  }
  else {
    ((void (*)(void ***, uint64_t))v5[2])(v5, 1LL);
  }
}

@end