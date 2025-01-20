@interface ACTDoubleKeyTap
- (ACTDoubleKeyTap)initWithFirstTap:(id)a3 secondTap:(id)a4;
- (ACTUserAction)firstTap;
- (ACTUserAction)secondTap;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTDoubleKeyTap

- (ACTDoubleKeyTap)initWithFirstTap:(id)a3 secondTap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ACTDoubleKeyTap;
  v9 = -[ACTDoubleKeyTap init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTap, a3);
    objc_storeStrong((id *)&v10->_secondTap, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTDoubleKeyTap firstTap](self, "firstTap"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTDoubleKeyTap secondTap](self, "secondTap"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: firstTap=%@, secondTap=%@>",  v5,  v6,  v7));

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTDoubleKeyTap firstTap](self, "firstTap"));
  [v8 applyWithTyper:v7 log:v6];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[ACTDoubleKeyTap secondTap](self, "secondTap"));
  [v9 applyWithTyper:v7 log:v6];
}

- (id)shortDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTUserAction twoKeyTapShortDescription](self, "twoKeyTapShortDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DoubleTap first/second: %@",  v2));

  return v3;
}

- (ACTUserAction)firstTap
{
  return self->_firstTap;
}

- (ACTUserAction)secondTap
{
  return self->_secondTap;
}

- (void).cxx_destruct
{
}

@end