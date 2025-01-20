@interface PBForegroundSceneTransaction
- (BOOL)backgroundAllOtherScenes;
- (FBSSceneIdentity)sceneIdentity;
- (PBForegroundSceneTransaction)initWithSceneIdentity:(id)a3 backgroundAllOtherScenes:(BOOL)a4;
- (void)_begin;
@end

@implementation PBForegroundSceneTransaction

- (PBForegroundSceneTransaction)initWithSceneIdentity:(id)a3 backgroundAllOtherScenes:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBForegroundSceneTransaction;
  v8 = -[PBForegroundSceneTransaction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sceneIdentity, a3);
    v9->_backgroundAllOtherScenes = a4;
  }

  return v9;
}

- (void)_begin
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PBForegroundSceneTransaction;
  -[PBForegroundSceneTransaction _begin](&v13, "_begin");
  if (-[PBForegroundSceneTransaction backgroundAllOtherScenes](self, "backgroundAllOtherScenes"))
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___FBSynchronizedTransactionGroup);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10015F108;
    v11[3] = &unk_1003D3138;
    v11[4] = self;
    id v5 = v3;
    id v12 = v5;
    [v4 enumerateScenesWithBlock:v11];

    v6 = v12;
    id v7 = v5;

    v8 = v7;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBSSceneIdentity identifier](self->_sceneIdentity, "identifier"));
    id v7 = (id)objc_claimAutoreleasedReturnValue([v9 sceneWithIdentifier:v10]);

    if ([v7 isValid]) {
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[FBUpdateSceneTransaction pb_updateSceneTransactionWithScene:foreground:]( &OBJC_CLASS___FBUpdateSceneTransaction,  "pb_updateSceneTransactionWithScene:foreground:",  v7,  1LL));
    }
    else {
      v8 = 0LL;
    }
  }

  if (v8) {
    -[PBForegroundSceneTransaction addChildTransaction:](self, "addChildTransaction:", v8);
  }
}

- (FBSSceneIdentity)sceneIdentity
{
  return self->_sceneIdentity;
}

- (BOOL)backgroundAllOtherScenes
{
  return self->_backgroundAllOtherScenes;
}

- (void).cxx_destruct
{
}

@end