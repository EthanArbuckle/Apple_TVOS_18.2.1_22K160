@interface MRAction
- (MCAction)mcAction;
- (MRAction)initWithAction:(id)a3 andTarget:(id)a4;
- (MRAction)initWithAction:(id)a3 inRenderer:(id)a4;
- (MRAction)initWithBlock:(id)a3 andSender:(id)a4;
- (MRAction)initWithSelector:(SEL)a3 sender:(id)a4 andTargetPath:(id)a5 inRenderer:(id)a6;
- (MRLayer)resolvedTarget;
- (NSMutableDictionary)states;
- (NSString)targetPath;
- (double)invoke;
- (double)time;
- (id)description;
- (id)sender;
- (id)specificObject;
- (void)_resolveTargetPath:(id)a3;
- (void)dealloc;
- (void)setResolvedTarget:(id)a3;
- (void)setSender:(id)a3;
- (void)setSpecificObject:(id)a3;
- (void)setStates:(id)a3;
- (void)setTargetPath:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation MRAction

- (MRAction)initWithAction:(id)a3 inRenderer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRAction;
  v6 = -[MRAction init](&v9, "init");
  if (v6)
  {
    v7 = (MCAction *)a3;
    v6->_renderer = (MRRenderer *)a4;
    v6->_mcAction = v7;
    v6->_targetPath = (NSString *)-[NSString copy](-[MCAction targetObjectID](v7, "targetObjectID"), "copy");
  }

  return v6;
}

- (MRAction)initWithAction:(id)a3 andTarget:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRAction;
  v6 = -[MRAction init](&v8, "init");
  if (v6)
  {
    v6->_mcAction = (MCAction *)a3;
    v6->_resolvedTarget = (MRLayer *)a4;
  }

  return v6;
}

- (MRAction)initWithSelector:(SEL)a3 sender:(id)a4 andTargetPath:(id)a5 inRenderer:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MRAction;
  v10 = -[MRAction init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    v10->_renderer = (MRRenderer *)a6;
    v12 =  +[NSInvocation invocationWithMethodSignature:]( &OBJC_CLASS___NSInvocation,  "invocationWithMethodSignature:",  +[NSMethodSignature signatureWithObjCTypes:]( &OBJC_CLASS___NSMethodSignature,  "signatureWithObjCTypes:",  "d@:@"));
    v11->_invocation = v12;
    -[NSInvocation setSelector:](v12, "setSelector:", a3);
    v11->_sender = a4;
    v11->_targetPath = (NSString *)[a5 copy];
  }

  return v11;
}

- (MRAction)initWithBlock:(id)a3 andSender:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRAction;
  v6 = -[MRAction init](&v8, "init");
  if (v6)
  {
    v6->_block = [a3 copy];
    v6->_sender = a4;
  }

  return v6;
}

- (void)dealloc
{
  self->_renderer = 0LL;
  self->_mcAction = 0LL;

  self->_invocation = 0LL;
  self->_block = 0LL;

  self->_sender = 0LL;
  self->_resolvedTarget = 0LL;

  self->_states = 0LL;
  self->_specificObject = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRAction;
  -[MRAction dealloc](&v3, "dealloc");
}

- (id)description
{
  return -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( -[NSString stringByAppendingFormat:]( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"MRAction: self=%p",  self),  "stringByAppendingFormat:",  @"\n\tmMCAction: %@",  self->_mcAction),  "stringByAppendingFormat:",  @"\n\tmSender: %@ (%p)",  [self->_sender performSelector:"idInSupercontainer"],  self->_sender),  "stringByAppendingFormat:",  @"\n\tmResolvedTarget: %@ (%p)",  -[MRLayer performSelector:](self->_resolvedTarget, "performSelector:", "idInSupercontainer"),  self->_resolvedTarget);
}

- (double)invoke
{
  double v5 = 0.0;
  v6 = self;
  block = (void (**)(id, MRAction *))self->_block;
  if (block)
  {
    block[2](block, self);
  }

  else if (self->_invocation)
  {
    -[NSInvocation setTarget:](self->_invocation, "setTarget:", -[MRAction resolvedTarget](self, "resolvedTarget"));
    -[NSInvocation setArgument:atIndex:](self->_invocation, "setArgument:atIndex:", &v6, 2LL);
    -[NSInvocation invoke](v6->_invocation, "invoke");
    -[NSInvocation getReturnValue:](v6->_invocation, "getReturnValue:", &v5);
    return v5;
  }

  else
  {
    return 0.0;
  }

  return result;
}

- (MRLayer)resolvedTarget
{
  if (!self->_resolvedTarget)
  {
    if (-[NSString hasPrefix:](self->_targetPath, "hasPrefix:", @"/"))
    {
      renderer = self->_renderer;
      if (renderer)
      {
        v4 = (MRLayer *)-[MRRenderer _layerForPlugObjectID:](renderer, "_layerForPlugObjectID:", self->_targetPath);
        self->_resolvedTarget = v4;
        if (!v4) {
          goto LABEL_8;
        }
      }

      else if (!self->_resolvedTarget)
      {
LABEL_8:
        NSLog(@"Error: could not resolve action target path '%@'.", self->_targetPath);
      }
    }

    else
    {
      -[MRAction _resolveTargetPath:](self, "_resolveTargetPath:", self->_targetPath);
    }
  }

  return self->_resolvedTarget;
}

- (void)_resolveTargetPath:(id)a3
{
  id sender = self->_sender;
  if (![a3 length]) {
    goto LABEL_21;
  }
  id v6 = [a3 componentsSeparatedByString:@"/"];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_21;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v20;
  do
  {
    v10 = 0LL;
    do
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v10);
      if ([v11 isEqualToString:@".."])
      {
        id v13 = [sender superlayer];
        goto LABEL_14;
      }

      uint64_t v14 = objc_opt_class(&OBJC_CLASS___MRLayerParallelizer, v12);
      if ((objc_opt_isKindOfClass(sender, v14) & 1) != 0) {
        goto LABEL_13;
      }
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___MRLayerNavigator, v15);
      if ((objc_opt_isKindOfClass(sender, v16) & 1) != 0)
      {
        else {
LABEL_13:
        }
          id v13 = [sender sublayerForKey:v11];
LABEL_14:
        id sender = v13;
        goto LABEL_15;
      }

      if (self->_resolvedTarget) {
        id sender = 0LL;
      }
      else {
        NSLog(@"Consistency error: non-terminal layer in action target path is not a collection layer.");
      }
LABEL_15:
      v10 = (char *)v10 + 1;
    }

    while (v8 != v10);
    id v17 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    id v8 = v17;
  }

  while (v17);
LABEL_21:
  if (sender) {
    self->_resolvedTarget = (MRLayer *)sender;
  }
  else {
    NSLog(@"Error: could not resolve action target path '%@'.", a3);
  }
}

- (MCAction)mcAction
{
  return self->_mcAction;
}

- (id)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void)setResolvedTarget:(id)a3
{
}

- (NSMutableDictionary)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (id)specificObject
{
  return objc_getProperty(self, a2, 72LL, 1);
}

- (void)setSpecificObject:(id)a3
{
}

- (NSString)targetPath
{
  return self->_targetPath;
}

- (void)setTargetPath:(id)a3
{
}

@end