@interface UIImage
+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5;
+ (id)phCarPlayImageNamed:(id)a3;
+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4;
+ (id)phImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3;
+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4;
@end

@implementation UIImage

+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:compatibleWithTraitCollection:",  v7,  v8,  v9));

  return v10;
}

+ (id)phImageNamed:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _phImageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "_phImageNamed:inBundle:compatibleWithTraitCollection:",  v3,  0LL,  v5));

  return v6;
}

+ (id)phCarPlayImageNamed:(id)a3
{
  return _[a1 phCarPlayImageNamed:a3 inBundle:0];
}

+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](&OBJC_CLASS___UIScreen, "_carScreen"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 traitCollection]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage _phImageNamed:inBundle:compatibleWithTraitCollection:]( &OBJC_CLASS___UIImage,  "_phImageNamed:inBundle:compatibleWithTraitCollection:",  v6,  v5,  v8));

  return v9;
}

+ (id)phPathForImageNamed:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage phPathForImageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "phPathForImageNamed:inBundle:",  v3,  v4));

  return v5;
}

+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 scale];
  double v9 = v8;

  if (v9 <= 1.0) {
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v10 scale];
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"@%dx",  (int)v11));

  if ([v5 hasSuffix:v12])
  {

LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 pathForResource:v5 ofType:@"png"]);
    goto LABEL_8;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingString:v12]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 pathForResource:v13 ofType:@"png"]);

  if (!v14) {
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

@end