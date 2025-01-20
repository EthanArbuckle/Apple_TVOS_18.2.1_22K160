@interface PBWorkspaceTransitionRequest
- (BOOL)animated;
- (BOOL)isEqual:(id)a3;
- (BSAnimationSettings)animationSettings;
- (PBWorkspaceTransitionRequest)init;
- (id)_completionBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)layout;
- (unint64_t)_completionBlockCount;
- (unint64_t)hash;
- (void)addCompletionBlock:(id)a3;
- (void)dealloc;
- (void)setAnimated:(BOOL)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setLayout:(int64_t)a3;
@end

@implementation PBWorkspaceTransitionRequest

- (PBWorkspaceTransitionRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBWorkspaceTransitionRequest;
  result = -[PBWorkspaceTransitionRequest init](&v3, "init");
  if (result)
  {
    result->_layout = -1LL;
    result->_animated = 1;
  }

  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___PBWorkspaceTransitionRequest;
  -[PBWorkspaceTransitionRequest dealloc](&v2, "dealloc");
}

- (void)addCompletionBlock:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    id v7 = [v5 copy];

    completionBlocks = self->_completionBlocks;
    id v9 = objc_retainBlock(v7);
    if (completionBlocks)
    {
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v9);
    }

    else
    {
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v9));
      v11 = self->_completionBlocks;
      self->_completionBlocks = v10;
    }
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002822F8(a2, (uint64_t)self, (uint64_t)v12);
    }
    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
  }

- (id)_completionBlock
{
  objc_super v3 = self->_completionBlocks;
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0LL;

  id v5 = v3;
  if (-[NSMutableArray count](v5, "count"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001115D8;
    v9[3] = &unk_1003CFEE0;
    id v10 = -[NSMutableArray copy](v5, "copy");
    id v6 = v10;
    id v7 = objc_retainBlock(v9);
  }

  else
  {
    id v7 = &stru_1003D7E80;
  }

  return v7;
}

- (unint64_t)_completionBlockCount
{
  return (unint64_t)-[NSMutableArray count](self->_completionBlocks, "count");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v5 = v4;
  if (v4)
  {
    v4[3] = self->_layout;
    *((_BYTE *)v4 + 16) = self->_animated;
    id v6 = -[BSAnimationSettings copy](self->_animationSettings, "copy");
    id v7 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v6;

    objc_storeStrong((id *)v5 + 1, self->_completionBlocks);
    completionBlocks = self->_completionBlocks;
    self->_completionBlocks = 0LL;
  }

  return v5;
}

- (unint64_t)hash
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  id v4 = [v3 appendInteger:self->_layout];
  id v5 = [v3 appendBool:self->_animated];
  id v6 = [v3 appendObject:self->_animationSettings];
  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBWorkspaceTransitionRequest));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  int64_t layout = self->_layout;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001113D0;
  v21[3] = &unk_1003D4148;
  id v8 = v4;
  id v22 = v8;
  id v9 = [v6 appendInteger:layout counterpart:v21];
  BOOL animated = self->_animated;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001113E8;
  v19[3] = &unk_1003D2B58;
  id v11 = v8;
  id v20 = v11;
  id v12 = [v6 appendBool:animated counterpart:v19];
  animationSettings = self->_animationSettings;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100111400;
  v17[3] = &unk_1003D7E60;
  id v18 = v11;
  id v14 = v11;
  id v15 = [v6 appendObject:animationSettings counterpart:v17];
  LOBYTE(animationSettings) = [v6 isEqual];

  return (char)animationSettings;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = sub_1000EDB0C(self->_layout);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 appendObject:v5 withName:@"layout"];

  id v7 = [v3 appendBool:self->_animated withName:@"animated"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 activeMultilinePrefix]);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100111530;
  id v15 = &unk_1003CFEB8;
  id v16 = v3;
  v17 = self;
  id v9 = v3;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:&v12];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "build", v12, v13, v14, v15));
  return v10;
}

- (int64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(int64_t)a3
{
  self->_int64_t layout = a3;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_BOOL animated = a3;
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end