@interface _DASBudget
+ (BOOL)supportsSecureCoding;
+ (id)budgetWithName:(id)a3 capacity:(double)a4 allocationType:(unsigned __int8)a5 lastModulatedDate:(id)a6;
+ (id)budgetWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPositive;
- (BOOL)unlockedDecrementBy:(double)a3 whileModulatingBudget:(BOOL)a4;
- (NSDate)lastModulatedDate;
- (NSString)name;
- (_DASBudget)initWithCoder:(id)a3;
- (_DASBudget)initWithDictionary:(id)a3;
- (_DASBudget)initWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7;
- (double)balance;
- (double)capacity;
- (double)maxBudgetValue;
- (double)minBudgetValue;
- (id)callback;
- (id)description;
- (id)dictionaryRepresentation;
- (os_unfair_lock_s)lock;
- (unint64_t)hash;
- (unsigned)allocationType;
- (void)decrementBy:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementBy:(double)a3;
- (void)registerSignificantBudgetChangeCallback:(id)a3;
- (void)setAllocationType:(unsigned __int8)a3;
- (void)setBalance:(double)a3;
- (void)setCallback:(id)a3;
- (void)setCapacity:(double)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMaxBudgetValue:(double)a3;
- (void)setMinBudgetValue:(double)a3;
@end

@implementation _DASBudget

- (_DASBudget)initWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____DASBudget;
  v14 = -[_DASBudget init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    v15->_capacity = a4;
    v15->_balance = a5;
    v15->_allocationType = a6;
    objc_storeStrong((id *)&v15->_lastModulatedDate, a7);
    *(float64x2_t *)&v15->_maxBudgetValue = vmulq_n_f64((float64x2_t)xmmword_1000D81C0, a4);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (_DASBudget)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"capacity"]);
    if (!v7)
    {
      v9 = 0LL;
LABEL_12:

      goto LABEL_13;
    }

    v8 = (void *)v7;
    v9 = (_DASBudget *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"balance"]);
    if (!v9)
    {
LABEL_11:

      goto LABEL_12;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allocationType"]);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"lastModulatedDateInterval"]);
      [v11 doubleValue];
      double v13 = v12;

      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"name"]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"capacity"]);
      [v8 doubleValue];
      double v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"balance"]);
      [v16 doubleValue];
      double v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"allocationType"]);
      unsigned __int8 v20 = [v19 intValue];
      unsigned __int8 v21 = v20;
      if (v13 <= 0.0)
      {
        self =  -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:]( self,  "initWithName:capacity:balance:allocationType:lastModulatedDate:",  v6,  v20,  0LL,  v15,  v18);
      }

      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v13));
        self =  -[_DASBudget initWithName:capacity:balance:allocationType:lastModulatedDate:]( self,  "initWithName:capacity:balance:allocationType:lastModulatedDate:",  v6,  v21,  v22,  v15,  v18);
      }

      v9 = self;
      goto LABEL_11;
    }
  }

  v9 = 0LL;
LABEL_13:

  return v9;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 allocationType:(unsigned __int8)a5 lastModulatedDate:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)objc_opt_class(a1)) initWithName:v11 capacity:v6 balance:v10 allocationType:a4 lastModulatedDate:a4];

  return v12;
}

+ (id)budgetWithName:(id)a3 capacity:(double)a4 balance:(double)a5 allocationType:(unsigned __int8)a6 lastModulatedDate:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a3;
  id v14 = [objc_alloc((Class)objc_opt_class(a1)) initWithName:v13 capacity:v7 balance:v12 allocationType:a4 lastModulatedDate:a5];

  return v14;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](self, "name"));
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  -[_DASBudget capacity](self, "capacity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v3 setObject:v5 forKeyedSubscript:@"capacity"];

  -[_DASBudget balance](self, "balance");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  [v3 setObject:v6 forKeyedSubscript:@"balance"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[_DASBudget allocationType](self, "allocationType")));
  [v3 setObject:v7 forKeyedSubscript:@"allocationType"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget lastModulatedDate](self, "lastModulatedDate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget lastModulatedDate](self, "lastModulatedDate"));
    [v9 timeIntervalSinceReferenceDate];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    [v3 setObject:v10 forKeyedSubscript:@"lastModulatedDateInterval"];
  }

  id v11 = [v3 copy];

  return v11;
}

- (void)registerSignificantBudgetChangeCallback:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id callback = self->_callback;
  self->_id callback = v4;
}

- (BOOL)isPositive
{
  return self->_balance > 0.0;
}

- (BOOL)unlockedDecrementBy:(double)a3 whileModulatingBudget:(BOOL)a4
{
  double balance = self->_balance;
  double maxBudgetValue = balance - a3;
  if (self->_maxBudgetValue < maxBudgetValue) {
    double maxBudgetValue = self->_maxBudgetValue;
  }
  if (self->_minBudgetValue >= maxBudgetValue) {
    double minBudgetValue = self->_minBudgetValue;
  }
  else {
    double minBudgetValue = maxBudgetValue;
  }
  self->_double balance = minBudgetValue;
  if (a4)
  {
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    lastModulatedDate = self->_lastModulatedDate;
    self->_lastModulatedDate = v8;
  }

  return (balance > 0.0) ^ (minBudgetValue > 0.0);
}

- (void)decrementBy:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v6 = -[_DASBudget unlockedDecrementBy:whileModulatingBudget:]( self,  "unlockedDecrementBy:whileModulatingBudget:",  0LL,  a3);
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id callback = (void (**)(id, _DASBudget *))self->_callback;
    if (callback) {
      callback[2](callback, self);
    }
  }

- (void)incrementBy:(double)a3
{
}

- (void)setBalance:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v6 = -[_DASBudget unlockedDecrementBy:whileModulatingBudget:]( self,  "unlockedDecrementBy:whileModulatingBudget:",  1LL,  self->_balance - a3);
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    id callback = (void (**)(id, _DASBudget *))self->_callback;
    if (callback) {
      callback[2](callback, self);
    }
  }

- (void)setCapacity:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v6 = a3 * -1.2;
  double balance = self->_balance;
  if (a3 * 1.5 < balance) {
    double balance = a3 * 1.5;
  }
  self->_double maxBudgetValue = a3 * 1.5;
  self->_double minBudgetValue = v6;
  if (v6 >= balance) {
    double v8 = a3 * -1.2;
  }
  else {
    double v8 = balance;
  }
  self->_capacity = a3;
  self->_double balance = v8;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAllocationType:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allocationType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASBudget *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      name = self->_name;
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASBudget name](v4, "name"));
      unsigned __int8 v8 = -[NSString isEqual:](name, "isEqual:", v7);
    }

    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  unsigned int v3 = -[NSString isEqualToString:](self->_name, "isEqualToString:", @"com.apple.dasd.remoteWidget");
  name = self->_name;
  double capacity = self->_capacity;
  if (v3) {
    double v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_DASBudget %@: %12.2lf/%12.2lf Last Modulated: %@>",  name,  *(void *)&self->_balance,  *(void *)&capacity,  self->_lastModulatedDate);
  }
  else {
    double v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_DASBudget %@: %12.2lf/%12.2lf>",  name,  *(void *)&self->_balance,  *(void *)&capacity,  v8);
  }
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_name forKey:@"name"];
  [v6 encodeDouble:@"capacity" forKey:self->_capacity];
  [v6 encodeDouble:@"balance" forKey:self->_balance];
  [v6 encodeInteger:self->_allocationType forKey:@"type"];
  lastModulatedDate = self->_lastModulatedDate;
  if (lastModulatedDate) {
    -[NSDate timeIntervalSinceReferenceDate](lastModulatedDate, "timeIntervalSinceReferenceDate");
  }
  else {
    double v5 = 0.0;
  }
  [v6 encodeDouble:@"lastModulatedDateInterval" forKey:v5];
}

- (_DASBudget)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 decodeDoubleForKey:@"capacity"];
  double v8 = v7;
  unsigned __int8 v9 = [v4 decodeIntegerForKey:@"type"];
  if (v6 || v8 != 0.0)
  {
    [v4 decodeDoubleForKey:@"balance"];
    double v12 = v11;
    [v4 decodeDoubleForKey:@"lastModulatedDateInterval"];
    if (v13 <= 0.0)
    {
      id v17 = objc_alloc((Class)objc_opt_class(self));
      if (v12 == 0.0) {
        double v18 = v8;
      }
      else {
        double v18 = v12;
      }
      id v10 = (_DASBudget *)[v17 initWithName:v6 capacity:v9 balance:0 allocationType:v8 lastModulatedDate:v18];
    }

    else
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      id v15 = objc_alloc((Class)objc_opt_class(self));
      if (v12 == 0.0) {
        double v16 = v8;
      }
      else {
        double v16 = v12;
      }
      id v10 = (_DASBudget *)[v15 initWithName:v6 capacity:v9 balance:v14 allocationType:v8 lastModulatedDate:v16];
    }
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (double)capacity
{
  return self->_capacity;
}

- (unsigned)allocationType
{
  return self->_allocationType;
}

- (double)balance
{
  return self->_balance;
}

- (NSDate)lastModulatedDate
{
  return self->_lastModulatedDate;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (double)maxBudgetValue
{
  return self->_maxBudgetValue;
}

- (void)setMaxBudgetValue:(double)a3
{
  self->_double maxBudgetValue = a3;
}

- (double)minBudgetValue
{
  return self->_minBudgetValue;
}

- (void)setMinBudgetValue:(double)a3
{
  self->_double minBudgetValue = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end