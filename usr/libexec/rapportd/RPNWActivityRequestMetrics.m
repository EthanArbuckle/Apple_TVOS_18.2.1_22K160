@interface RPNWActivityRequestMetrics
- (NSString)destination;
- (id)_metricsDictionary;
- (unint64_t)replyTime;
- (unint64_t)requestSize;
- (unint64_t)responseSize;
- (void)setDestination:(id)a3;
- (void)setReplyTime:(unint64_t)a3;
- (void)setRequestSize:(unint64_t)a3;
- (void)setResponseSize:(unint64_t)a3;
@end

@implementation RPNWActivityRequestMetrics

- (void)setDestination:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069830;
  v4[3] = &unk_100111968;
  v5 = (os_unfair_lock_s *)self;
  id v6 = a3;
  id v3 = v6;
  sub_100069408(v5, v4);
}

- (NSString)destination
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = sub_1000695B4;
  v9 = sub_1000695C4;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069908;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setRequestSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100069974;
  v3[3] = &unk_100112A20;
  v3[4] = self;
  v3[5] = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (unint64_t)requestSize
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069A24;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setResponseSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100069A90;
  v3[3] = &unk_100112A20;
  v3[4] = self;
  v3[5] = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (unint64_t)responseSize
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069B40;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setReplyTime:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100069BAC;
  v3[3] = &unk_100112A20;
  v3[4] = self;
  v3[5] = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (unint64_t)replyTime
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069C5C;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWActivityRequestMetrics destination](self, "destination"));
  if (v4) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"destination");
  }
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[RPNWActivityRequestMetrics requestSize](self, "requestSize")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, @"bytesOut");

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[RPNWActivityRequestMetrics responseSize](self, "responseSize")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"bytesIn");

  if (-[RPNWActivityRequestMetrics replyTime](self, "replyTime"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[RPNWActivityRequestMetrics replyTime](self, "replyTime")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"replyTime");
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end