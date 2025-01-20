@interface TVSSHUDTimeIntervalVisualization
+ (TVSSHUDTimeIntervalVisualization)visualizationWithTimeInterval:(id)a3;
- (TVSSTimeInterval)timeInterval;
- (void)setTimeInterval:(id)a3;
@end

@implementation TVSSHUDTimeIntervalVisualization

+ (TVSSHUDTimeIntervalVisualization)visualizationWithTimeInterval:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init(&OBJC_CLASS___TVSSHUDTimeIntervalVisualization);
  -[TVSSHUDTimeIntervalVisualization setTimeInterval:](v5, "setTimeInterval:", location[0]);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)setTimeInterval:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v14->_timeInterval != location[0])
  {
    -[TVSSTimeInterval removeStateTransitionHandler:]( v14->_timeInterval,  "removeStateTransitionHandler:",  v14->_stateTransitionHandlerToken);
    objc_storeStrong((id *)&v14->_timeInterval, location[0]);
    objc_initWeak(&v12, v14);
    timeInterval = v14->_timeInterval;
    v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_100095D84;
    v10 = &unk_1001B9608;
    objc_copyWeak(&v11, &v12);
    id v3 = -[TVSSTimeInterval addStateTransitionHandler:](timeInterval, "addStateTransitionHandler:", &v6);
    id stateTransitionHandlerToken = v14->_stateTransitionHandlerToken;
    v14->_id stateTransitionHandlerToken = v3;

    -[TVSSHUDVisualization _notifyDelegateVisualizationDidChange](v14, "_notifyDelegateVisualizationDidChange");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v12);
  }

  objc_storeStrong(location, 0LL);
}

- (TVSSTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void).cxx_destruct
{
}

@end