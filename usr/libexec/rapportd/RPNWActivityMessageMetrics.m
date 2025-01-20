@interface RPNWActivityMessageMetrics
+ (id)startMessageMetrics:(int)a3 withParent:(id)a4;
- (NSString)peerDeviceModel;
- (NSString)peerOSVersion;
- (id)_metricsDictionary;
- (int)linkType;
- (int)messageType;
- (unint64_t)messageSize;
- (void)setLinkType:(int)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setMessageType:(int)a3;
- (void)setPeerDeviceModel:(id)a3;
- (void)setPeerOSVersion:(id *)a3;
@end

@implementation RPNWActivityMessageMetrics

+ (id)startMessageMetrics:(int)a3 withParent:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)nw_activity_create(61LL, 3LL);
  id v8 = [objc_alloc((Class)a1) _initWithNWActivity:v7];
  [v8 setMessageType:v4];
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 nwActivity]);
    nw_activity_set_parent_activity(v7, v9);
  }

  nw_activity_activate(v7);

  return v8;
}

- (void)setMessageType:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100069E98;
  v3[3] = &unk_100111878;
  v3[4] = self;
  int v4 = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (int)messageType
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100069F4C;
  v4[3] = &unk_100112D38;
  v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setMessageSize:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100069FB8;
  v3[3] = &unk_100112A20;
  v3[4] = self;
  void v3[5] = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (unint64_t)messageSize
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A068;
  v4[3] = &unk_100112D38;
  v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setLinkType:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006A0D8;
  v3[3] = &unk_100111878;
  v3[4] = self;
  int v4 = a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (int)linkType
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A18C;
  v4[3] = &unk_100112D38;
  v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setPeerDeviceModel:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A220;
  v4[3] = &unk_100111968;
  uint64_t v5 = (os_unfair_lock_s *)self;
  id v6 = a3;
  id v3 = v6;
  sub_100069408(v5, v4);
}

- (NSString)peerDeviceModel
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000695B4;
  v9 = sub_1000695C4;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A2F8;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)setPeerOSVersion:(id *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10006A374;
  v3[3] = &unk_100113410;
  v3[4] = self;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v4 = *a3;
  sub_100069408((os_unfair_lock_s *)self, v3);
}

- (NSString)peerOSVersion
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  id v8 = sub_1000695B4;
  v9 = sub_1000695C4;
  id v10 = 0LL;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006A490;
  v4[3] = &unk_100112D38;
  void v4[4] = self;
  v4[5] = &v5;
  sub_100069408((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (id)_metricsDictionary
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v4 = -[RPNWActivityMessageMetrics messageType](self, "messageType");
  if (v4 > 3) {
    uint64_t v5 = "?";
  }
  else {
    uint64_t v5 = off_100113430[v4];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, @"messageType");

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  -[RPNWActivityMessageMetrics messageSize](self, "messageSize")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"bytesOut");

  unsigned int v8 = -[RPNWActivityMessageMetrics linkType](self, "linkType");
  if (v8 > 0xB) {
    v9 = "?";
  }
  else {
    v9 = off_100113450[v8];
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v10, @"linkType");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWActivityMessageMetrics peerDeviceModel](self, "peerDeviceModel"));
  if (v11) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v11, @"peerModel");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNWActivityMessageMetrics peerOSVersion](self, "peerOSVersion"));
  if (v12) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, @"peerOSVersion");
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end