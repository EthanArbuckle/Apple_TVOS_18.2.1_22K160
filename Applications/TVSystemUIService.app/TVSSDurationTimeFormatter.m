@interface TVSSDurationTimeFormatter
- (NSDateComponentsFormatter)longerFormatter;
- (NSDateComponentsFormatter)shorterFormatter;
- (TVSSDurationTimeFormatter)init;
- (id)stringForObjectValue:(id)a3;
- (id)stringForTimeInterval:(double)a3;
@end

@implementation TVSSDurationTimeFormatter

- (TVSSDurationTimeFormatter)init
{
  SEL v10 = a2;
  v11 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSSDurationTimeFormatter;
  v8 = -[TVSSDurationTimeFormatter init](&v9, "init");
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    longerFormatter = v11->_longerFormatter;
    v11->_longerFormatter = v2;

    v4 = objc_alloc_init(&OBJC_CLASS___NSDateComponentsFormatter);
    shorterFormatter = v11->_shorterFormatter;
    v11->_shorterFormatter = v4;

    -[NSDateComponentsFormatter setAllowedUnits:](v11->_shorterFormatter, "setAllowedUnits:", 192LL);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:]( v11->_shorterFormatter,  "setZeroFormattingBehavior:",  0x10000LL);
  }

  v7 = v11;
  objc_storeStrong((id *)&v11, 0LL);
  return v7;
}

- (id)stringForObjectValue:(id)a3
{
  objc_super v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v6 = 0;
  if ((objc_opt_respondsToSelector(location[0], "doubleValue") & 1) != 0)
  {
    v5 = v9;
    [location[0] doubleValue];
    id v7 = -[TVSSDurationTimeFormatter stringForTimeInterval:](v5, "stringForTimeInterval:");
    char v6 = 1;
    id v3 = v7;
  }

  else
  {
    id v3 = 0LL;
  }

  id v10 = v3;
  if ((v6 & 1) != 0) {

  }
  objc_storeStrong(location, 0LL);
  return v10;
}

- (id)stringForTimeInterval:(double)a3
{
  v21 = self;
  SEL v20 = a2;
  double v19 = a3;
  v18 = 0LL;
  if (a3 >= 0.0) {
    id v3 = @"%@";
  }
  else {
    id v3 = @"-%@";
  }
  id v17 = v3;
  double v19 = fabs(v19);
  if (v19 < 60.0)
  {
    uint64_t v16 = (uint64_t)rint(v19);
    v15 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setSecond:](v15, "setSecond:", v16);
    id v10 = v17;
    v12 = -[TVSSDurationTimeFormatter shorterFormatter](v21, "shorterFormatter");
    v11 = -[NSDateComponentsFormatter stringFromDateComponents:](v12, "stringFromDateComponents:", v15);
    char v6 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v11);
    id v7 = v18;
    v18 = v6;

    objc_storeStrong((id *)&v15, 0LL);
  }

  else
  {
    v14 = -[TVSSDurationTimeFormatter longerFormatter](v21, "longerFormatter", v19);
    v13 = -[NSDateComponentsFormatter stringFromTimeInterval:](v14, "stringFromTimeInterval:", v19);
    v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v17, v13);
    v5 = v18;
    v18 = v4;
  }

  objc_super v9 = v18;
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  return v9;
}

- (NSDateComponentsFormatter)longerFormatter
{
  return self->_longerFormatter;
}

- (NSDateComponentsFormatter)shorterFormatter
{
  return self->_shorterFormatter;
}

- (void).cxx_destruct
{
}

@end