@interface OSADateCounter
- (OSADateCounter)initWithIdentifier:(id)a3;
- (unint64_t)count;
- (void)increment;
- (void)resetCount;
@end

@implementation OSADateCounter

- (OSADateCounter)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___OSADateCounter;
  v5 = -[OSADateCounter init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@Day", v4];
    dayKey = v5->_dayKey;
    v5->_dayKey = (NSString *)v6;

    uint64_t v8 = [NSString stringWithFormat:@"%@Count", v4];
    countKey = v5->_countKey;
    v5->_countKey = (NSString *)v8;
  }

  return v5;
}

- (unint64_t)count
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 integerForKey:self->_dayKey];

  time_t v5 = time(0LL);
  if (v5 >= 0) {
    unint64_t v6 = v5 / 0x15180uLL;
  }
  else {
    unint64_t v6 = v5;
  }
  if (v6 != v4)
  {
    -[OSADateCounter resetCount](self, "resetCount");
    [MEMORY[0x189604038] standardUserDefaults];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setInteger:v6 forKey:self->_dayKey];

    return 0LL;
  }

  [MEMORY[0x189604038] standardUserDefaults];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 integerForKey:self->_countKey];

  if ((v8 & 0x8000000000000000LL) != 0)
  {
    -[OSADateCounter resetCount](self, "resetCount");
    return 0LL;
  }

  return v8;
}

- (void)increment
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", -[OSADateCounter count](self, "count") + 1, self->_countKey);
}

- (void)resetCount
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setInteger:0 forKey:self->_countKey];
}

- (void).cxx_destruct
{
}

@end