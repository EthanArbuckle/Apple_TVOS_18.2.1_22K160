@interface DetailsViewAnalytics
- (DetailsViewAnalytics)initWithCurrentTime:(double)a3;
- (void)resetAnalytics;
- (void)setEnteredFromActiveFindingUI:(BOOL)a3;
- (void)submitAnalytics;
- (void)updateDistanceAnalytics:(int)a3;
- (void)updateTimeAnalytics:(int)a3 currentTime:(double)a4;
- (void)updateWithMostRecentDistance:(double)a3;
- (void)updateWithMostRecentRawDistance:(double)a3;
@end

@implementation DetailsViewAnalytics

- (DetailsViewAnalytics)initWithCurrentTime:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DetailsViewAnalytics;
  v4 = -[DetailsViewAnalytics init](&v6, "init");
  -[DetailsViewAnalytics resetAnalytics](v4, "resetAnalytics");
  v4->_timeAtContainerCreation = a3;
  return v4;
}

- (void)updateDistanceAnalytics:(int)a3
{
  switch(a3)
  {
    case 3:
      double distanceAtEndFinding = self->_distanceAtEndFinding;
      if (distanceAtEndFinding == -1.0) {
        double distanceAtEndFinding = self->_mostRecentDistance;
      }
      self->_double distanceAtEndFinding = distanceAtEndFinding;
      break;
    case 2:
      double distanceAtFindButtonPressed = self->_distanceAtFindButtonPressed;
      if (distanceAtFindButtonPressed == -1.0) {
        double distanceAtFindButtonPressed = self->_mostRecentDistance;
      }
      self->_double distanceAtFindButtonPressed = distanceAtFindButtonPressed;
      break;
    case 1:
      double distanceAtFindButtonAvailable = self->_distanceAtFindButtonAvailable;
      if (distanceAtFindButtonAvailable == -1.0) {
        double distanceAtFindButtonAvailable = self->_mostRecentDistance;
      }
      self->_double distanceAtFindButtonAvailable = distanceAtFindButtonAvailable;
      break;
  }

- (void)updateTimeAnalytics:(int)a3 currentTime:(double)a4
{
  if (a3 <= 3)
  {
    v4 = (double *)&(&self->super.isa)[a3];
    if (v4[2] != -1.0) {
      a4 = v4[2];
    }
    v4[2] = a4;
  }

- (void)updateWithMostRecentDistance:(double)a3
{
  self->_mostRecentDistance = a3;
}

- (void)updateWithMostRecentRawDistance:(double)a3
{
  if (self->_distanceAtDiscovery == -1.0) {
    self->_distanceAtDiscovery = a3;
  }
}

- (void)setEnteredFromActiveFindingUI:(BOOL)a3
{
  self->_enteredFromActiveFindingUI = a3;
}

- (void)resetAnalytics
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#ni-ca,CoreAnalytics: resetting analytics",  v9,  2u);
  }

  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)&self->_distanceAtDiscovery = _Q0;
  *(_OWORD *)&self->_double distanceAtFindButtonPressed = _Q0;
  *(_OWORD *)&self->_timeAtDiscovery = _Q0;
  *(_OWORD *)&self->_timeAtFindButtonPressed = _Q0;
  self->_mostRecentDistance = -1.0;
  self->_enteredFromActiveFindingUI = 0;
}

- (void)submitAnalytics
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_enteredFromActiveFindingUI));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"EnteredFromActiveFindingUI");

  double timeAtDiscovery = self->_timeAtDiscovery;
  double v6 = -1.0;
  if (timeAtDiscovery != -1.0) {
    double v6 = timeAtDiscovery - self->_timeAtContainerCreation;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v7,  @"DeltaTimeFromContainerCreationToDiscovery");

  double timeAtFindButtonAvailable = self->_timeAtFindButtonAvailable;
  double v9 = -1.0;
  if (timeAtFindButtonAvailable != -1.0) {
    double v9 = timeAtFindButtonAvailable - self->_timeAtContainerCreation;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v10,  @"DeltaTimeFromContainerCreationToFindButtonAvailable");

  double timeAtFindButtonPressed = self->_timeAtFindButtonPressed;
  double v12 = -1.0;
  if (timeAtFindButtonPressed != -1.0) {
    double v12 = timeAtFindButtonPressed - self->_timeAtContainerCreation;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v13,  @"DeltaTimeFromContainerCreationToFindButtonPressed");

  double v14 = self->_timeAtFindButtonAvailable;
  double v15 = -1.0;
  if (v14 != -1.0) {
    double v15 = v14 - self->_timeAtDiscovery;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v15));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v16,  @"DeltaTimeFromDiscoveryToFindButtonAvailable");

  double v17 = self->_timeAtFindButtonPressed;
  double v18 = -1.0;
  if (v17 != -1.0) {
    double v18 = v17 - self->_timeAtFindButtonAvailable;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v18));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v19,  @"DeltaTimeFromFindButtonAvailableToFindButtonPressed");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_distanceAtDiscovery));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v20, @"DistanceAtDiscovery");

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_distanceAtFindButtonAvailable));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v21, @"DistanceAtFindButtonAvailable");

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_distanceAtFindButtonPressed));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v22, @"DistanceAtPressFind");

  double distanceAtEndFinding = self->_distanceAtEndFinding;
  double v24 = -1.0;
  if (distanceAtEndFinding != -1.0) {
    double v24 = vabdd_f64(distanceAtEndFinding, self->_distanceAtFindButtonPressed);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v24));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v25, @"DistanceBetweenStartAndEndFinding");

  double timeAtFindingSessionEnd = self->_timeAtFindingSessionEnd;
  double v27 = -1.0;
  if (timeAtFindingSessionEnd != -1.0) {
    double v27 = timeAtFindingSessionEnd - self->_timeAtFindButtonPressed;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v28, @"FindingTime");

  id v29 = -[NSMutableDictionary mutableCopy](v3, "mutableCopy");
  v30 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v29 description]);
    *(_DWORD *)buf = 138412290;
    v36 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_INFO,  "#ni-ca,send find button availability analytics event:\n%@\n",  buf,  0xCu);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100030348;
  v33[3] = &unk_1007A2298;
  id v32 = v29;
  id v34 = v32;
  AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.peopleFindingSession.DetailsViewBehavior", v33);
  -[DetailsViewAnalytics resetAnalytics](self, "resetAnalytics");
}

@end