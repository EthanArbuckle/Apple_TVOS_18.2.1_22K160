@interface PBMediaRemoteClient
+ (id)defaultClient;
- (OS_dispatch_queue)queue;
- (PBMediaRemoteClient)initWithQueue:(id)a3;
- (void)getActivePlayersForLocalOriginWithCompletion:(id)a3;
- (void)getActivePlayersForOrigin:(void *)a3 completion:(id)a4;
- (void)getPictureInPictureStatusForPlayer:(void *)a3 completion:(id)a4;
- (void)getSupportedCommandsForPlayer:(void *)a3 completion:(id)a4;
@end

@implementation PBMediaRemoteClient

+ (id)defaultClient
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E3F7C;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470A70 != -1) {
    dispatch_once(&qword_100470A70, block);
  }
  return (id)qword_100470A68;
}

- (PBMediaRemoteClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBMediaRemoteClient;
  v6 = -[PBMediaRemoteClient init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)getSupportedCommandsForPlayer:(void *)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteClient queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4104;
  v9[3] = &unk_1003D24F8;
  id v10 = v6;
  id v8 = v6;
  MRMediaRemoteGetSupportedCommandsForPlayer(a3, v7, v9);
}

- (void)getActivePlayersForLocalOriginWithCompletion:(id)a3
{
}

- (void)getActivePlayersForOrigin:(void *)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteClient queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000E4220;
  v9[3] = &unk_1003D24F8;
  id v10 = v6;
  id v8 = v6;
  MRMediaRemoteGetActivePlayerPathsForOrigin(a3, v7, v9);
}

- (void)getPictureInPictureStatusForPlayer:(void *)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBMediaRemoteClient queue](self, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000E42F8;
  v11[3] = &unk_1003D6590;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  MRMediaRemoteGetPictureInPictureStatusForPlayer(v9, v8, v11);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end