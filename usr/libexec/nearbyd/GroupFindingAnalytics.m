@interface GroupFindingAnalytics
- (GroupFindingAnalytics)init;
- (id)descriptions;
- (void)resetAnalytics;
- (void)submitAnalytics;
- (void)updateTo0Finder2Findee;
- (void)updateTo1Finder1Findee;
- (void)updateTo1Finder2Findee;
- (void)updateToReciprocalFinding;
- (void)updateWithFindeeRequestAt0Finder2Findee:(id)a3;
- (void)updateWithFindeeRequestAt1Finder1Findee:(id)a3;
- (void)updateWithFindeeRequestAt1Finder2Findee:(id)a3;
- (void)updateWithFinderRequestAt0Finder2Findee:(id)a3;
@end

@implementation GroupFindingAnalytics

- (GroupFindingAnalytics)init
{
  return self;
}

- (void)updateTo1Finder1Findee
{
  self->_1Finder1Findee = 1;
}

- (void)updateWithFindeeRequestAt0Finder2Findee:(id)a3
{
}

- (void)updateWithFindeeRequestAt1Finder1Findee:(id)a3
{
}

- (void)updateWithFinderRequestAt0Finder2Findee:(id)a3
{
}

- (void)updateWithFindeeRequestAt1Finder2Findee:(id)a3
{
}

- (void)updateTo0Finder2Findee
{
  self->_0Finder2Findee = 1;
}

- (void)updateToReciprocalFinding
{
  self->_reciprocalFinding = 1;
}

- (void)updateTo1Finder2Findee
{
  self->_1Finder2Findee = 1;
}

- (void)resetAnalytics
{
  *(_DWORD *)&self->_1Finder1Findee = 0;
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  findeeRequestAt0Finder2Findee = self->_findeeRequestAt0Finder2Findee;
  self->_findeeRequestAt0Finder2Findee = v3;

  v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  findeeRequestAt1Finder1Findee = self->_findeeRequestAt1Finder1Findee;
  self->_findeeRequestAt1Finder1Findee = v5;

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  finderRequestAt0Finder2Findee = self->_finderRequestAt0Finder2Findee;
  self->_finderRequestAt0Finder2Findee = v7;

  v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  findeeRequestAt1Finder2Findee = self->_findeeRequestAt1Finder2Findee;
  self->_findeeRequestAt1Finder2Findee = v9;
}

- (void)submitAnalytics
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_0Finder2Findee));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, @"0Finder2Findee");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_1Finder1Findee));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, @"1Finder1Findee");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_1Finder2Findee));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, @"1Finder2Findee");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_reciprocalFinding));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v7, @"ReciprocalFinding");

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSMutableSet count](self->_findeeRequestAt0Finder2Findee, "count")));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v8,  @"NumberOfUniqueFindeeRequestsAt0Finder2Findee");

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSMutableSet count](self->_finderRequestAt0Finder2Findee, "count")));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v9,  @"NumberOfUniqueFinderRequestsAt0Finder2Findee");

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSMutableSet count](self->_findeeRequestAt1Finder1Findee, "count")));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v10,  @"NumberOfUniqueFindeeRequestsAt1Finder1Findee");

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[NSMutableSet count](self->_findeeRequestAt1Finder2Findee, "count")));
  -[NSMutableDictionary setObject:forKey:]( v3,  "setObject:forKey:",  v11,  @"NumberOfUniqueFinderRequestsAt1Finder2Findee");

  id v12 = -[NSMutableDictionary mutableCopy](v3, "mutableCopy");
  v13 = (os_log_s *)(id)qword_1008000A0;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([@"com.apple.nearbyinteraction.groupfinding" description]);
    *(_DWORD *)buf = 138412290;
    v19 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "#ni-ca,send group finding  analytics event:\n%@\n",  buf,  0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100030798;
  v16[3] = &unk_1007A2298;
  id v15 = v12;
  id v17 = v15;
  AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.groupfinding", v16);
  -[GroupFindingAnalytics resetAnalytics](self, "resetAnalytics");
}

- (id)descriptions
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (self->_1Finder1Findee) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(1,1): %s", v4));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  if (self->_0Finder2Findee) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(0,2): %s", v6));
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  if (self->_reciprocalFinding) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(1<->1): %s", v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  if (self->_1Finder2Findee) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"(1,2): %s", v10));
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  if (-[NSMutableSet count](self->_findeeRequestAt0Finder2Findee, "count")) {
    id v12 = "YES";
  }
  else {
    id v12 = "NO";
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(0,2) + Findee: %s",  v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  if (-[NSMutableSet count](self->_finderRequestAt0Finder2Findee, "count")) {
    v14 = "YES";
  }
  else {
    v14 = "NO";
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(0,2) + Finder: %s",  v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  if (-[NSMutableSet count](self->_findeeRequestAt1Finder1Findee, "count")) {
    v16 = "YES";
  }
  else {
    v16 = "NO";
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(1,1) + Findee: %s",  v16));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  if (-[NSMutableSet count](self->_findeeRequestAt1Finder2Findee, "count")) {
    v18 = "YES";
  }
  else {
    v18 = "NO";
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(1,2) + Findee: %s",  v18));
  -[NSMutableArray addObject:](v3, "addObject:", v19);

  return v3;
}

- (void).cxx_destruct
{
}

@end