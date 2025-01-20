@interface SDAPerBundleHistogram
+ (id)newWithVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8;
- (NSMutableDictionary)perBundle;
- (SDAPerBundleHistogram)init;
- (void)setPerBundle:(id)a3;
- (void)updateVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8;
@end

@implementation SDAPerBundleHistogram

- (SDAPerBundleHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SDAPerBundleHistogram;
  v2 = -[SDAPerBundleHistogram init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    perBundle = v2->_perBundle;
    v2->_perBundle = v3;
  }

  return v2;
}

+ (id)newWithVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  v14 = objc_opt_new(&OBJC_CLASS___SDAPerBundleHistogram);
  -[SDAPerBundleHistogram updateVolType:residency:urgency:state:age:size:]( v14,  "updateVolType:residency:urgency:state:age:size:",  v13,  v12,  v11,  v10,  a7,  a8);
  return v14;
}

- (void)updateVolType:(int)a3 residency:(int)a4 urgency:(int)a5 state:(int)a6 age:(unint64_t)a7 size:(unint64_t)a8
{
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  a5));
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  a6));
  v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_perBundle, "objectForKey:", v22));
  if (!v17)
  {
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](self->_perBundle, "setObject:forKey:", v17, v22);
  }

  v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v17, "objectForKey:", v14));
  if (!v18)
  {
    v18 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, v14);
  }

  v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v18, "objectForKey:", v15));
  if (!v19)
  {
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v18, "setObject:forKey:", v19, v15);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v19, "objectForKey:", v16));
  if (v20)
  {
    id v21 = v20;
    [v20 adjAge:a7 andSize:a8];
  }

  else
  {
    id v21 = +[SDAHistogramElement newWithAge:andSize:](&OBJC_CLASS___SDAHistogramElement, "newWithAge:andSize:", a7, a8);
    -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v21, v16);
  }
}

- (NSMutableDictionary)perBundle
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPerBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end