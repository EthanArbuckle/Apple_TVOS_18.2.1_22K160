@interface ACTKeyTap
- (ACTKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7 secondaryString:(BOOL)a8;
- (BOOL)secondaryString;
- (CGPoint)location;
- (TIPointError)error;
- (UIKBTree)intendedKey;
- (UIKBTree)touchedKey;
- (double)timestamp;
- (id)abbreviatedDescription;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTKeyTap

- (ACTKeyTap)initWithIntendedKey:(id)a3 touchedKey:(id)a4 error:(id)a5 location:(CGPoint)a6 timestamp:(double)a7 secondaryString:(BOOL)a8
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ACTKeyTap;
  v19 = -[ACTKeyTap init](&v22, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_intendedKey, a3);
    objc_storeStrong((id *)&v20->_touchedKey, a4);
    objc_storeStrong((id *)&v20->_error, a5);
    v20->_location.CGFloat x = x;
    v20->_location.CGFloat y = y;
    v20->_timestamp = a7;
    v20->_secondaryString = a8;
  }

  return v20;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap intendedKey](self, "intendedKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 representedString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap touchedKey](self, "touchedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 representedString]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap error](self, "error"));
  -[ACTKeyTap location](self, "location");
  uint64_t v12 = v11;
  -[ACTKeyTap location](self, "location");
  uint64_t v14 = v13;
  -[ACTKeyTap timestamp](self, "timestamp");
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: intended=%@, touched=%@, error=%@, loc=(%.0f,%.0f), t=%.2f>",  v5,  v7,  v9,  v10,  v12,  v14,  v15));

  return v16;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  -[ACTKeyTap location](self, "location");
  double v8 = v7;
  double v10 = v9;
  -[ACTKeyTap timestamp](self, "timestamp");
  double v12 = v11;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap intendedKey](self, "intendedKey"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap touchedKey](self, "touchedKey"));
  BOOL v15 = -[ACTKeyTap secondaryString](self, "secondaryString");
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap error](self, "error"));
  id v17 =  objc_msgSend( v18,  "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:",  v13,  v14,  v15,  v16,  v6,  v8,  v10,  v12);
}

- (id)shortDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap intendedKey](self, "intendedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 displayString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap touchedKey](self, "touchedKey"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 displayString]);
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByPaddingToLength:7 withString:@" " startingAtIndex:0]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"KeyTap intended/touched: %@ %@",  v5,  v8));

  return v9;
}

- (id)abbreviatedDescription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap intendedKey](self, "intendedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 representedString]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACTKeyTap touchedKey](self, "touchedKey"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 representedString]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v6));

  return v7;
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

- (BOOL)secondaryString
{
  return self->_secondaryString;
}

- (void).cxx_destruct
{
}

@end