@interface _PBScenePresentation
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesElement:(id)a3;
- (NSString)sceneIdentifier;
- (UIScenePresenter)scenePresenter;
- (_PBScenePresentation)initWithLayoutElement:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)layoutLevel;
- (unint64_t)hash;
@end

@implementation _PBScenePresentation

- (_PBScenePresentation)initWithLayoutElement:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____PBScenePresentation;
  v5 = -[_PBScenePresentation init](&v16, "init");
  if (v5)
  {
    id v6 = sub_1001597A0(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_layoutLevel = (int64_t)[v4 layoutLevel];
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 identifier]);
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneHandle]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 scene]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 uiPresentationManager]);
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 createPresenterWithIdentifier:v7]);
    scenePresenter = v5->_scenePresenter;
    v5->_scenePresenter = (UIScenePresenter *)v13;
  }

  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](self, "scenePresenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  [v3 appendString:v5 withName:@"scenePresenter.identifier"];

  id v6 =  objc_msgSend( v3,  "appendInteger:withName:",  -[_PBScenePresentation layoutLevel](self, "layoutLevel"),  @"layoutLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_self(&OBJC_CLASS____PBScenePresentation, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](self, "scenePresenter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100159A84;
  v24[3] = &unk_1003D2130;
  id v11 = v4;
  id v25 = v11;
  id v12 = [v8 appendObject:v10 counterpart:v24];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation sceneIdentifier](self, "sceneIdentifier"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100159AC4;
  v22[3] = &unk_1003D2130;
  id v14 = v11;
  id v23 = v14;
  id v15 = [v8 appendObject:v13 counterpart:v22];

  int64_t v16 = -[_PBScenePresentation layoutLevel](self, "layoutLevel");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100159AE4;
  v20[3] = &unk_1003D4148;
  id v21 = v14;
  id v17 = v14;
  id v18 = [v8 appendInteger:v16 counterpart:v20];
  LOBYTE(v16) = [v8 isEqual];

  return v16;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](self, "scenePresenter"));
  id v5 = [v3 appendObject:v4];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation sceneIdentifier](self, "sceneIdentifier"));
  id v7 = [v3 appendString:v6];

  id v8 = objc_msgSend(v3, "appendInteger:", -[_PBScenePresentation layoutLevel](self, "layoutLevel"));
  id v9 = [v3 hash];

  return (unint64_t)v9;
}

- (BOOL)matchesElement:(id)a3
{
  id v4 = a3;
  id v5 = -[_PBScenePresentation layoutLevel](self, "layoutLevel");
  if (v5 == [v4 layoutLevel])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation sceneIdentifier](self, "sceneIdentifier"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    if ([v6 isEqual:v7])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_PBScenePresentation scenePresenter](self, "scenePresenter"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      id v10 = sub_1001597A0(v4);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      unsigned __int8 v12 = [v9 isEqual:v11];
    }

    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[_PBScenePresentation layoutLevel](self, "layoutLevel");
  if (v5 >= (uint64_t)[v4 layoutLevel])
  {
    uint64_t v7 = -[_PBScenePresentation layoutLevel](self, "layoutLevel");
    int64_t v6 = v7 > (uint64_t)[v4 layoutLevel];
  }

  else
  {
    int64_t v6 = -1LL;
  }

  return v6;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
}

@end