@interface SDAHistogramMatrix
- (NSMutableDictionary)histogram;
- (SDAHistogramMatrix)init;
- (void)enumerateBundleHistogram:(id)a3;
- (void)print;
- (void)setHistogram:(id)a3;
- (void)upsertBundleID:(id)a3 volType:(int)a4 urgency:(int)a5 state:(int)a6 residency:(int)a7 age:(unint64_t)a8 size:(unint64_t)a9;
@end

@implementation SDAHistogramMatrix

- (SDAHistogramMatrix)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SDAHistogramMatrix;
  v2 = -[SDAHistogramMatrix init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  50LL));
    -[SDAHistogramMatrix setHistogram:](v2, "setHistogram:", v3);
  }

  return v2;
}

- (void)enumerateBundleHistogram:(id)a3
{
  id v4 = a3;
  histogram = self->_histogram;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100020F58;
  v7[3] = &unk_10004D030;
  id v8 = v4;
  id v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](histogram, "enumerateKeysAndObjectsUsingBlock:", v7);
}

- (void)print
{
  uint64_t v3 = SALog(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Histogram Begin:", buf, 2u);
  }

  *(void *)buf = 0LL;
  v10 = buf;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002146C;
  v8[3] = &unk_10004D058;
  v8[4] = buf;
  uint64_t v5 = SALog(-[SDAHistogramMatrix enumerateBundleHistogram:](self, "enumerateBundleHistogram:", v8));
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *((void *)v10 + 3);
    *(_DWORD *)v13 = 134217984;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Histogram End (%zu).", v13, 0xCu);
  }

  _Block_object_dispose(buf, 8);
}

- (void)upsertBundleID:(id)a3 volType:(int)a4 urgency:(int)a5 state:(int)a6 residency:(int)a7 age:(unint64_t)a8 size:(unint64_t)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  id v17 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_histogram, "objectForKey:"));
  if (v15)
  {
    id v16 = v15;
    [v15 updateVolType:v13 residency:v10 urgency:v12 state:v11 age:a8 size:a9];
  }

  else
  {
    id v16 = +[SDAPerBundleHistogram newWithVolType:residency:urgency:state:age:size:]( &OBJC_CLASS___SDAPerBundleHistogram,  "newWithVolType:residency:urgency:state:age:size:",  v13,  v10,  v12,  v11,  a8,  a9);
    -[NSMutableDictionary setObject:forKey:](self->_histogram, "setObject:forKey:", v16, v17);
  }
}

- (NSMutableDictionary)histogram
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setHistogram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end