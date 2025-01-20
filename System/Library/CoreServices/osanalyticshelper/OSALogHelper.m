@interface OSALogHelper
+ (BOOL)createForSubmissionWithXPCRequest:(id)a3 forReply:(id)a4;
+ (void)instantiate;
@end

@implementation OSALogHelper

+ (void)instantiate
{
  if (qword_100026270 != -1) {
    dispatch_once(&qword_100026270, &stru_1000210B0);
  }
}

+ (BOOL)createForSubmissionWithXPCRequest:(id)a3 forReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v8 = (dispatch_queue_s *)qword_100026278;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000100B0;
  v12[3] = &unk_100021128;
  id v13 = v7;
  id v14 = v6;
  v15 = &v17;
  id v16 = a1;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);
  LOBYTE(v6) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)v6;
}

@end