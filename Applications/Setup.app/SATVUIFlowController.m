@interface SATVUIFlowController
+ (void)initialize;
- (BOOL)_isPresentableStepAfterCurrentlyActiveStep:(id)a3;
- (BOOL)_wasStepPresented:(id)a3;
- (NSArray)flowStepClasses;
- (NSMutableArray)presentedSteps;
- (NSMutableDictionary)presentedStepClassesToViewControllers;
- (SATVUIFlowController)initWithNavigationController:(id)a3 flowStepClasses:(id)a4;
- (TVSKNavigationController)navigationController;
- (TVSKStep)lastPresentedStep;
- (id)_presentedStepClassesToSteps;
- (id)viewControllerForStepClass:(Class)a3;
- (void)_configurePresentableStep:(id)a3 withViewController:(id)a4;
- (void)_removeAllStepsTillStep:(id)a3;
- (void)popToStepViewControllerForStep:(id)a3;
- (void)presentStepViewController:(id)a3 forStep:(id)a4;
- (void)setFlowStepClasses:(id)a3;
- (void)setLastPresentedStep:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setPresentedStepClassesToViewControllers:(id)a3;
- (void)setPresentedSteps:(id)a3;
@end

@implementation SATVUIFlowController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVUIFlowController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVUIFlowController");
    v3 = (void *)qword_100109918;
    qword_100109918 = (uint64_t)v2;
  }

- (SATVUIFlowController)initWithNavigationController:(id)a3 flowStepClasses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SATVUIFlowController;
  v8 = -[SATVUIFlowController init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[SATVUIFlowController setNavigationController:](v8, "setNavigationController:", v6);
    -[SATVUIFlowController setFlowStepClasses:](v9, "setFlowStepClasses:", v7);
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    presentedSteps = v9->_presentedSteps;
    v9->_presentedSteps = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    presentedStepClassesToViewControllers = v9->_presentedStepClassesToViewControllers;
    v9->_presentedStepClassesToViewControllers = v12;
  }

  return v9;
}

- (id)viewControllerForStepClass:(Class)a3
{
  if (a3) {
    return (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_presentedStepClassesToViewControllers,  "objectForKey:"));
  }
  else {
    return 0LL;
  }
}

- (void)presentStepViewController:(id)a3 forStep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController lastPresentedStep](self, "lastPresentedStep"));
  if ([v7 isEqual:v8])
  {

    goto LABEL_4;
  }

  unsigned __int8 v9 = -[SATVUIFlowController _wasStepPresented:](self, "_wasStepPresented:", v7);

  if ((v9 & 1) != 0)
  {
LABEL_4:
    v10 = (os_log_s *)qword_100109918;
    if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_ERROR)) {
      sub_10007745C((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_9;
  }

  v17 = (os_log_s *)qword_100109918;
  if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Presenting view controller %@ for step %@",  (uint8_t *)&v18,  0x16u);
  }

  -[SATVUIFlowController _configurePresentableStep:withViewController:]( self,  "_configurePresentableStep:withViewController:",  v7,  v6);
LABEL_9:
}

- (void)popToStepViewControllerForStep:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SATVUIFlowController _wasStepPresented:](self, "_wasStepPresented:", v4);
  id v6 = (os_log_s *)qword_100109918;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Step %@ was presented earlier. Pop all other view controllers until this step..",  (uint8_t *)&v17,  0xCu);
    }

    id v7 = -[NSMutableDictionary objectForKey:]( self->_presentedStepClassesToViewControllers,  "objectForKey:",  objc_opt_class(v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SATVUIFlowController _removeAllStepsTillStep:](self, "_removeAllStepsTillStep:", v4);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController navigationController](self, "navigationController"));
    id v10 = [v9 popToViewController:v8 animated:1];

    -[SATVUIFlowController setLastPresentedStep:](self, "setLastPresentedStep:", v4);
  }

  else if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_ERROR))
  {
    sub_1000774C4((uint64_t)v4, v6, v11, v12, v13, v14, v15, v16);
  }
}

- (void)_configurePresentableStep:(id)a3 withViewController:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController flowStepClasses](self, "flowStepClasses"));
  v8 = (char *)[v7 indexOfObject:objc_opt_class(v27)];

  if (v8
    && !-[SATVUIFlowController _isPresentableStepAfterCurrentlyActiveStep:]( self,  "_isPresentableStepAfterCurrentlyActiveStep:",  v27))
  {
    id v26 = v6;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController _presentedStepClassesToSteps](self, "_presentedStepClassesToSteps"));
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    for (i = 0LL; i != v8; ++i)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController flowStepClasses](self, "flowStepClasses"));
      id v17 = [v16 objectAtIndex:i];

      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[SATVUIFlowController presentedStepClassesToViewControllers]( self,  "presentedStepClassesToViewControllers"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v17]);

      if (v19)
      {
        -[NSMutableArray addObject:](v14, "addObject:", v19);
        -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v19, v17);
      }

      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v17]);
      if (v20) {
        -[NSMutableArray addObject:](v12, "addObject:", v20);
      }
    }

    id v6 = v26;
    -[NSMutableArray addObject:](v14, "addObject:", v26);
    -[NSMutableArray addObject:](v12, "addObject:", v27);
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v26, objc_opt_class(v27));
    presentedSteps = self->_presentedSteps;
    self->_presentedSteps = v12;
    v22 = v12;

    presentedStepClassesToViewControllers = self->_presentedStepClassesToViewControllers;
    self->_presentedStepClassesToViewControllers = v13;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController navigationController](self, "navigationController"));
    id v25 = -[NSMutableArray copy](v14, "copy");
    [v24 replaceContentViewControllersWithViewControllers:v25];
  }

  else
  {
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController presentedSteps](self, "presentedSteps"));
    [v9 addObject:v27];

    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVUIFlowController presentedStepClassesToViewControllers]( self,  "presentedStepClassesToViewControllers"));
    [v10 setObject:v6 forKey:objc_opt_class(v27)];

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController navigationController](self, "navigationController"));
    [v11 pushViewController:v6 animated:1];
  }

  -[SATVUIFlowController setLastPresentedStep:](self, "setLastPresentedStep:", v27);
}

- (BOOL)_wasStepPresented:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (os_log_s *)qword_100109918;
  if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Checking to see if this step was already presented..",  v14,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController presentedSteps](self, "presentedSteps"));
  id v7 = [v6 indexOfObjectIdenticalTo:v4];

  v8 = (void *)objc_claimAutoreleasedReturnValue( -[SATVUIFlowController presentedStepClassesToViewControllers]( self,  "presentedStepClassesToViewControllers"));
  id v9 = [v8 objectForKey:objc_opt_class(v4)];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  BOOL v12 = v7 != (id)0x7FFFFFFFFFFFFFFFLL && v10 != 0LL;
  return v12;
}

- (void)_removeAllStepsTillStep:(id)a3
{
  id v4 = (char *)-[NSMutableArray indexOfObjectIdenticalTo:](self->_presentedSteps, "indexOfObjectIdenticalTo:", a3);
  unsigned int v5 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_presentedSteps, "mutableCopy");
  id v6 = (char *)-[NSMutableArray count](self->_presentedSteps, "count");
  id v7 = v4 + 1;
  if (v7 < v6)
  {
    v8 = v6;
    do
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_presentedSteps, "objectAtIndex:", v7));
      -[NSMutableArray removeObject:](v5, "removeObject:", v9);
      -[NSMutableDictionary removeObjectForKey:]( self->_presentedStepClassesToViewControllers,  "removeObjectForKey:",  objc_opt_class(v9));

      ++v7;
    }

    while (v8 != v7);
  }

  presentedSteps = self->_presentedSteps;
  self->_presentedSteps = v5;
}

- (id)_presentedStepClassesToSteps
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController presentedSteps](self, "presentedSteps", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8),  objc_opt_class(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v8)));
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v6);
  }

  return v3;
}

- (BOOL)_isPresentableStepAfterCurrentlyActiveStep:(id)a3
{
  uint64_t v4 = objc_opt_class(a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController flowStepClasses](self, "flowStepClasses"));
  id v6 = [v5 indexOfObject:v4];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController lastPresentedStep](self, "lastPresentedStep"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController lastPresentedStep](self, "lastPresentedStep"));
    uint64_t v9 = objc_opt_class(v8);

    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVUIFlowController flowStepClasses](self, "flowStepClasses"));
    id v11 = [v10 indexOfObject:v9];
  }

  else
  {
    id v11 = 0LL;
  }

  __int128 v12 = (os_log_s *)qword_100109918;
  if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Presentable step type index: %lu",  (uint8_t *)&v15,  0xCu);
  }

  __int128 v13 = (os_log_s *)qword_100109918;
  if (os_log_type_enabled((os_log_t)qword_100109918, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    id v16 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Last presented step type index: %lu",  (uint8_t *)&v15,  0xCu);
  }

  return v6 > v11;
}

- (TVSKNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (NSArray)flowStepClasses
{
  return self->_flowStepClasses;
}

- (void)setFlowStepClasses:(id)a3
{
}

- (NSMutableArray)presentedSteps
{
  return self->_presentedSteps;
}

- (void)setPresentedSteps:(id)a3
{
}

- (NSMutableDictionary)presentedStepClassesToViewControllers
{
  return self->_presentedStepClassesToViewControllers;
}

- (void)setPresentedStepClassesToViewControllers:(id)a3
{
}

- (TVSKStep)lastPresentedStep
{
  return self->_lastPresentedStep;
}

- (void)setLastPresentedStep:(id)a3
{
}

- (void).cxx_destruct
{
}

@end