@interface TransitionTester
+ (id)sharedTransitionTester;
- (_TSKSplitViewController)mainViewController;
- (int64_t)animationCount;
- (int64_t)testsRun;
- (int64_t)totalTestsToRun;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)runTest;
- (void)setAnimationCount:(int64_t)a3;
- (void)setMainViewController:(id)a3;
- (void)setTestsRun:(int64_t)a3;
- (void)setTotalTestsToRun:(int64_t)a3;
- (void)startPopTransition;
- (void)startPushTransition;
@end

@implementation TransitionTester

+ (id)sharedTransitionTester
{
  v2 = (void *)qword_1001E1720;
  if (!qword_1001E1720)
  {
    uint64_t v3 = objc_opt_new(&OBJC_CLASS___TransitionTester, a2);
    v4 = (void *)qword_1001E1720;
    qword_1001E1720 = v3;

    v2 = (void *)qword_1001E1720;
  }

  return v2;
}

- (void)runTest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
    id v5 = [v4 popToRootViewControllerAnimated:0];
    self->_animationCount = 0LL;
    self->_testsRun = 0LL;
    [v6 addObserver:self forKeyPath:@"isAnimatingTransition" options:3 context:0];
    -[TransitionTester startPushTransition](self, "startPushTransition");

    id WeakRetained = v6;
  }
}

- (void)startPushTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  id v9 = (id)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v9 topViewController]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _settingGroups]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 settingItems]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 _prepareChildViewControllerWithItem:v7]);
  [v9 pushViewController:v8 animated:1];
}

- (void)startPopTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained navigationController]);
  id v3 = [v2 popViewControllerAnimated:1];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a5;
  if ([v9 isEqualToString:@"isAnimatingTransition"])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSKeyValueChangeOldKey]);
    unsigned int v12 = [v11 BOOLValue];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
    unsigned int v14 = [v13 BOOLValue];

    if (self->_animationCount)
    {
      if (((v12 ^ 1 | v14) & 1) == 0)
      {
        int64_t totalTestsToRun = self->_totalTestsToRun;
        int64_t v16 = self->_testsRun + 1;
        self->_animationCount = 0LL;
        self->_testsRun = v16;
        if (v16 >= totalTestsToRun)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
          [v20 finishedTest:@"PushPopTest" extraResults:0];

          id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
          [WeakRetained removeObserver:self forKeyPath:v9 context:a6];
        }

        else
        {
          dispatch_time_t v17 = dispatch_time(0LL, 0LL);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472LL;
          v22[2] = sub_100054B90;
          v22[3] = &unk_10018E440;
          v22[4] = self;
          dispatch_after(v17, &_dispatch_main_q, v22);
        }
      }
    }

    else if (((v12 | v14 ^ 1) & 1) != 0)
    {
      if (((v12 ^ 1 | v14) & 1) == 0)
      {
        dispatch_time_t v18 = dispatch_time(0LL, 0LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100054B88;
        block[3] = &unk_10018E440;
        block[4] = self;
        dispatch_after(v18, &_dispatch_main_q, block);
        ++self->_animationCount;
      }
    }

    else if (!self->_testsRun)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v19 startedTest:@"PushPopTest"];
    }
  }
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (int64_t)testsRun
{
  return self->_testsRun;
}

- (void)setTestsRun:(int64_t)a3
{
  self->_testsRun = a3;
}

- (int64_t)totalTestsToRun
{
  return self->_totalTestsToRun;
}

- (void)setTotalTestsToRun:(int64_t)a3
{
  self->_int64_t totalTestsToRun = a3;
}

- (_TSKSplitViewController)mainViewController
{
  return (_TSKSplitViewController *)objc_loadWeakRetained((id *)&self->_mainViewController);
}

- (void)setMainViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end