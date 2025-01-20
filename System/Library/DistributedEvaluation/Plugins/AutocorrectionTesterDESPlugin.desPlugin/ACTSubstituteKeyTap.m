@interface ACTSubstituteKeyTap
- (ACTSubstituteKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7;
- (CGPoint)location;
- (TIPointError)error;
- (UIKBTree)intendedKey;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSubstituteKeyTap

- (ACTSubstituteKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ACTSubstituteKeyTap;
  v17 = -[ACTSubstituteKeyTap init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_intendedKey, a3);
    objc_storeStrong((id *)&v18->_touchedKey, a4);
    objc_storeStrong((id *)&v18->_error, a5);
    v18->_location.CGFloat x = x;
    v18->_location.CGFloat y = y;
    v18->_timestamp = a7;
  }

  return v18;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap intendedKey](self, "intendedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 representedString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap touchedKey](self, "touchedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedString]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap error](self, "error"));
  -[ACTSubstituteKeyTap location](self, "location");
  uint64_t v12 = v11;
  -[ACTSubstituteKeyTap location](self, "location");
  uint64_t v14 = v13;
  -[ACTSubstituteKeyTap timestamp](self, "timestamp");
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: intended=%@, touched=%@, error=%@, loc=(%.0f,%.0f), t=%.2f>",  v5,  v7,  v9,  v10,  v12,  v14,  v15));

  return v16;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  -[ACTSubstituteKeyTap location](self, "location");
  double v8 = v7;
  double v10 = v9;
  -[ACTSubstituteKeyTap timestamp](self, "timestamp");
  double v12 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap intendedKey](self, "intendedKey"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap touchedKey](self, "touchedKey"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap error](self, "error"));
  id v16 =  objc_msgSend( v17,  "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:",  v13,  v14,  0,  v15,  v6,  v8,  v10,  v12);
}

- (id)shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap intendedKey](self, "intendedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSubstituteKeyTap touchedKey](self, "touchedKey"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayString]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SubstituteKeyTap intended/touched: %@ %@",  v5,  v8));

  return v9;
}

- (UIKBTree)intendedKey
{
  return self->_intendedKey;
}

- (UIKBTree)touchedKey
{
  return self->_touchedKey;
}

- (TIPointError)error
{
  return self->_error;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end