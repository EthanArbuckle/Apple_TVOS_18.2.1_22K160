@interface NISystemState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NISystemState)init;
- (NISystemState)initWithCoder:(id)a3;
- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)hash;
- (unint64_t)uwbExtendedDistanceAvailability;
- (unint64_t)uwbPreciseDistanceAvailability;
- (void)encodeWithCoder:(id)a3;
- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3;
- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3;
@end

@implementation NISystemState

- (NISystemState)init
{
  v3 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]( objc_alloc(&OBJC_CLASS___NISystemState),  "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:",  0LL,  0LL);

  return v3;
}

- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NISystemState;
  result = -[NISystemState init](&v7, "init");
  if (result)
  {
    result->_uwbPreciseDistanceAvailability = a3;
    result->_uwbExtendedDistanceAvailability = a4;
  }

  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]( +[NISystemState allocWithZone:](&OBJC_CLASS___NISystemState, "allocWithZone:", a3),  "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:",  self->_uwbPreciseDistanceAvailability,  self->_uwbExtendedDistanceAvailability);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_uwbPreciseDistanceAvailability forKey:@"uwbPreciseDistanceAvailability"];
  [v4 encodeInteger:self->_uwbExtendedDistanceAvailability forKey:@"uwbExtendedDistanceAvailability"];
}

- (NISystemState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]( [NISystemState alloc],  "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:",  [v4 decodeIntegerForKey:@"uwbPreciseDistanceAvailability"],  objc_msgSend(v4, "decodeIntegerForKey:", @"uwbExtendedDistanceAvailability"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    objc_super v7 = (NISystemState *)v4;
    v8 = v7;
    if (v7 == self)
    {
      BOOL v13 = 1;
    }

    else
    {
      id v9 = -[NISystemState uwbPreciseDistanceAvailability](v7, "uwbPreciseDistanceAvailability");
      unint64_t uwbPreciseDistanceAvailability = self->_uwbPreciseDistanceAvailability;
      id v11 = -[NISystemState uwbExtendedDistanceAvailability](v8, "uwbExtendedDistanceAvailability");
      BOOL v13 = v9 == (id)uwbPreciseDistanceAvailability && v11 == (id)self->_uwbExtendedDistanceAvailability;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_uwbPreciseDistanceAvailability ^ self->_uwbExtendedDistanceAvailability ^ 0x1F;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NISystemState descriptionInternal](self, "descriptionInternal"));
  id v9 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %@>", v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NIInternalUtils NISystemResourceAvailabilityToString:]( &OBJC_CLASS___NIInternalUtils,  "NISystemResourceAvailabilityToString:",  self->_uwbPreciseDistanceAvailability));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NIInternalUtils NISystemResourceAvailabilityToString:]( &OBJC_CLASS___NIInternalUtils,  "NISystemResourceAvailabilityToString:",  self->_uwbExtendedDistanceAvailability));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<UWB [precise distance: %@, extended distance: %@]>",  v3,  v4));

  return v5;
}

- (unint64_t)uwbPreciseDistanceAvailability
{
  return self->_uwbPreciseDistanceAvailability;
}

- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3
{
  self->_unint64_t uwbPreciseDistanceAvailability = a3;
}

- (unint64_t)uwbExtendedDistanceAvailability
{
  return self->_uwbExtendedDistanceAvailability;
}

- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3
{
  self->_uwbExtendedDistanceAvailability = a3;
}

@end