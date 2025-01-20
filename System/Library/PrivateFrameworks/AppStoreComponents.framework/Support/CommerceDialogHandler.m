@interface CommerceDialogHandler
- (_TtC19appstorecomponentsd21CommerceDialogHandler)init;
- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4;
- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4;
@end

@implementation CommerceDialogHandler

- (_TtC19appstorecomponentsd21CommerceDialogHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v2 = -[CommerceDialogHandler init](&v7, "init");
  v3 = (void *)objc_opt_self(&OBJC_CLASS___ASDNotificationCenter);
  v4 = v2;
  id v5 = [v3 defaultCenter];
  [v5 setDialogObserver:v4];

  return v4;
}

- (void)handleAuthenticateRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_1001227C0, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = objc_allocWithZone(&OBJC_CLASS___AMSAuthenticateTask);
  id v9 = a3;
  v10 = self;
  id v11 = [v8 initWithRequest:v9];
  id v12 = [v11 performAuthentication];
  v15[4] = sub_10008314C;
  uint64_t v16 = v7;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256LL;
  v15[2] = sub_100082DF4;
  v15[3] = &unk_1001227D8;
  v13 = _Block_copy(v15);
  uint64_t v14 = v16;
  swift_retain(v7);
  swift_release(v14);
  [v12 addFinishBlock:v13];
  _Block_release(v13);

  swift_release(v7);
}

- (void)handleDialogRequest:(id)a3 resultHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100122770, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = objc_allocWithZone(&OBJC_CLASS___AMSSystemAlertDialogTask);
  id v9 = a3;
  v10 = self;
  id v11 = [v8 initWithRequest:v9];
  id v12 = [v11 present];
  v15[4] = sub_10008311C;
  uint64_t v16 = v7;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256LL;
  v15[2] = sub_100082DF4;
  v15[3] = &unk_100122788;
  v13 = _Block_copy(v15);
  uint64_t v14 = v16;
  swift_retain(v7);
  swift_release(v14);
  [v12 addFinishBlock:v13];
  _Block_release(v13);

  swift_release(v7);
}

@end