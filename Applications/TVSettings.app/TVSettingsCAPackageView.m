@interface TVSettingsCAPackageView
- (BOOL)setState:(id)a3;
- (BOOL)setState:(id)a3 animated:(BOOL)a4;
- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6;
- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7;
- (CALayer)rootLayer;
- (CAStateControllerDelegate)stateControllerDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)publishedObjectNames;
- (TVSettingsCAPackageView)initWithPackageName:(id)a3 type:(id)a4 inBundle:(id)a5;
- (id)publishedObjectWithName:(id)a3;
- (void)_clearPendingCompletion;
- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5;
- (void)layoutSubviews;
- (void)setStateControllerDelegate:(id)a3;
- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
@end

@implementation TVSettingsCAPackageView

- (TVSettingsCAPackageView)initWithPackageName:(id)a3 type:(id)a4 inBundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if ((id)kCAPackageTypeCAMLBundle == v9) {
    v12 = @"ca";
  }
  else {
    v12 = @"caar";
  }
  if ((id)kCAPackageTypeCAMLFile == v9) {
    v13 = @"caml";
  }
  else {
    v13 = v12;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 URLForResource:v8 withExtension:v13]);
  id v47 = 0LL;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[_TVCAPackage packageWithContentsOfURL:type:options:error:]( &OBJC_CLASS____TVCAPackage,  "packageWithContentsOfURL:type:options:error:",  v14,  v9,  0LL,  &v47));
  id v16 = v47;
  v17 = (void *)objc_claimAutoreleasedReturnValue([v15 rootLayer]);
  [v17 frame];
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TVSettingsCAPackageView;
  v18 = -[TVSettingsCAPackageView initWithFrame:](&v46, "initWithFrame:");
  v19 = v18;
  if (v18)
  {
    id v37 = v16;
    v38 = v14;
    v39 = v11;
    id v40 = v9;
    id v41 = v8;
    p_rootLayer = (id *)&v18->_rootLayer;
    objc_storeStrong((id *)&v18->_rootLayer, v17);
    [v17 frame];
    v19->_originalSize.width = v21;
    v19->_originalSize.height = v22;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v15, "isGeometryFlipped"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageView layer](v19, "layer"));
    [v23 addSublayer:*p_rootLayer];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v15 publishedObjectNames]);
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v25 = [v24 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v25)
    {
      id v26 = v25;
      v27 = 0LL;
      uint64_t v28 = *(void *)v43;
      do
      {
        for (i = 0LL; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8LL * (void)i);
          v31 = (void *)objc_claimAutoreleasedReturnValue([v15 publishedObjectWithName:v30]);
          if (v31)
          {
            if (!v27) {
              v27 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v24 count]);
            }
            -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v31, v30);
          }
        }

        id v26 = [v24 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }

      while (v26);
    }

    else
    {
      v27 = 0LL;
    }

    v32 = (NSDictionary *)-[NSMutableDictionary copy](v27, "copy");
    publishedObjectMap = v19->_publishedObjectMap;
    v19->_publishedObjectMap = v32;

    v34 = -[CAStateController initWithLayer:]( objc_alloc(&OBJC_CLASS___CAStateController),  "initWithLayer:",  v19->_rootLayer);
    stateController = v19->_stateController;
    v19->_stateController = v34;

    -[CAStateController setDelegate:](v19->_stateController, "setDelegate:", v19);
    id v9 = v40;
    id v8 = v41;
    v14 = v38;
    v11 = v39;
    id v16 = v37;
  }

  return v19;
}

- (id)publishedObjectWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_publishedObjectMap, "objectForKey:", a3);
}

- (NSArray)publishedObjectNames
{
  return -[NSDictionary allKeys](self->_publishedObjectMap, "allKeys");
}

- (BOOL)setState:(id)a3
{
  return -[TVSettingsCAPackageView setState:animated:](self, "setState:animated:", a3, 1LL);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[TVSettingsCAPackageView setState:animated:transitionSpeed:completion:]( self,  "setState:animated:transitionSpeed:completion:",  a3,  a4,  &stru_1001902D0,  1.0);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return -[TVSettingsCAPackageView setState:onLayer:animated:transitionSpeed:completion:]( self,  "setState:onLayer:animated:transitionSpeed:completion:",  a3,  self->_rootLayer,  a4,  a6,  a5);
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  if (v12)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 stateWithName:v12]);
    BOOL v18 = v16 != 0LL;
    if (v16)
    {
      if (v9)
      {
        if (v14)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", v13));
          v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
          -[TVSettingsCAPackageView _setPendingCompletion:fromState:toState:]( self,  "_setPendingCompletion:fromState:toState:",  v14,  v20,  v12);
        }

        *(float *)&double v17 = a6;
        -[CAStateController setState:ofLayer:transitionSpeed:]( self->_stateController,  "setState:ofLayer:transitionSpeed:",  v16,  v13,  v17);
      }

      else
      {
        -[TVSettingsCAPackageView _clearPendingCompletion](self, "_clearPendingCompletion");
        -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v16, v13);
        if (v14) {
          v14[2](v14, 1LL);
        }
      }
    }

    else if (v14)
    {
      v14[2](v14, 0LL);
    }
  }

  else
  {
    *(float *)&double v15 = a6;
    -[CAStateController setInitialStatesOfLayer:transitionSpeed:]( self->_stateController,  "setInitialStatesOfLayer:transitionSpeed:",  v13,  v15);
    BOOL v18 = 1;
    if (v14) {
      v14[2](v14, 1LL);
    }
  }

  return v18;
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  return (CAStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
}

- (void)setStateControllerDelegate:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSettingsCAPackageView;
  -[TVSettingsCAPackageView layoutSubviews](&v8, "layoutSubviews");
  -[TVSettingsCAPackageView bounds](self, "bounds");
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height) {
    double v5 = v4 / self->_originalSize.height;
  }
  else {
    double v5 = v3 / self->_originalSize.width;
  }
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v7);
}

- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:didSetStateOfLayer:") & 1) != 0) {
    [WeakRetained stateController:v8 didSetStateOfLayer:v6];
  }
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v11 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:transitionDidStart:speed:") & 1) != 0)
  {
    *(float *)&double v10 = a5;
    [WeakRetained stateController:v11 transitionDidStart:v8 speed:v10];
  }
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (self->_pendingCompletion)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 toState]);
    unsigned int v11 = [v10 isEqualToString:self->_pendingCompletionToState];

    if (v11)
    {
      (*((void (**)(void))self->_pendingCompletion + 2))();
      id pendingCompletion = self->_pendingCompletion;
      self->_id pendingCompletion = 0LL;

      pendingCompletionFromState = self->_pendingCompletionFromState;
      self->_pendingCompletionFromState = 0LL;

      pendingCompletionToState = self->_pendingCompletionToState;
      self->_pendingCompletionToState = 0LL;
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:transitionDidStop:completed:") & 1) != 0) {
    [WeakRetained stateController:v16 transitionDidStop:v9 completed:v5];
  }
}

- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id pendingCompletion = (void (**)(id, void))self->_pendingCompletion;
  if (pendingCompletion) {
    pendingCompletion[2](pendingCompletion, 0LL);
  }
  id v11 = [v17 copy];
  id v12 = self->_pendingCompletion;
  self->_id pendingCompletion = v11;

  id v13 = (NSString *)[v8 copy];
  pendingCompletionFromState = self->_pendingCompletionFromState;
  self->_pendingCompletionFromState = v13;

  double v15 = (NSString *)[v9 copy];
  pendingCompletionToState = self->_pendingCompletionToState;
  self->_pendingCompletionToState = v15;
}

- (void)_clearPendingCompletion
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void).cxx_destruct
{
}

@end