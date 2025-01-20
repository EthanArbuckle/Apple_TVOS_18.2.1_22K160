@interface RPCompanionLinkClient
- (void)cad_registerEventID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6;
- (void)cad_registerRequestID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6;
@end

@implementation RPCompanionLinkClient

- (void)cad_registerRequestID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000ED08;
  v10[3] = &unk_100030C78;
  BOOL v12 = a5;
  id v11 = a6;
  id v9 = v11;
  -[RPCompanionLinkClient registerRequestID:options:handler:](self, "registerRequestID:options:handler:", a3, a4, v10);
}

- (void)cad_registerEventID:(id)a3 options:(id)a4 requireOwnerDevice:(BOOL)a5 handler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000EF04;
  v10[3] = &unk_100030CA0;
  BOOL v12 = a5;
  id v11 = a6;
  id v9 = v11;
  -[RPCompanionLinkClient registerEventID:options:handler:](self, "registerEventID:options:handler:", a3, a4, v10);
}

@end