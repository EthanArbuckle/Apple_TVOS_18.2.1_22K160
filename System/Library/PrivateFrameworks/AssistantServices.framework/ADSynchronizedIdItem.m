@interface ADSynchronizedIdItem
+ (id)alignToMidnight:(id)a3;
+ (id)calendar;
- (ADSynchronizedIdItem)initWithBMHomeSeed:(id)a3;
- (ADSynchronizedIdItem)initWithBMUserAggregationId:(id)a3;
- (ADSynchronizedIdItem)initWithBMUserSeed:(id)a3;
- (ADSynchronizedIdItem)initWithValue:(id)a3 andEffectiveFrom:(id)a4 andValidityDays:(unsigned int)a5 andCreatedOn:(id)a6 andAdoptedOn:(id)a7 andSwitchedCount:(unsigned int)a8;
- (NSDate)adoptedOn;
- (NSDate)createdOn;
- (NSDate)effectiveFrom;
- (NSDate)expirationDate;
- (NSUUID)value;
- (id)description;
- (id)initAndAdopt:(id)a3;
- (id)initAndAdopt:(id)a3 andSwitchedCount:(unsigned int)a4;
- (id)selectEarliest:(id)a3;
- (id)toBMSiriHomeSeedWithHomeIdentifier:(id)a3;
- (id)toBMSiriUserAggregationId;
- (id)toBMSiriUserSeed;
- (int64_t)_expirationDaysFrom:(id)a3 withCalendar:(id)a4;
- (int64_t)expirationDaysFrom:(id)a3;
- (int64_t)timelinePosition;
- (int64_t)timelinePositionWithTime:(id)a3;
- (int64_t)timelinePositionWithToday:(id)a3 withCalendar:(id)a4;
- (unsigned)switchedCount;
- (unsigned)validityDays;
@end

@implementation ADSynchronizedIdItem

- (ADSynchronizedIdItem)initWithBMUserSeed:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItem;
  v5 = -[ADSynchronizedIdItem init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 seed]);
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 effectiveFrom]);
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_validityDays = [v4 validityDays];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 createdOn]);
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 adoptedOn]);
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

- (ADSynchronizedIdItem)initWithBMUserAggregationId:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItem;
  v5 = -[ADSynchronizedIdItem init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 aggregationId]);
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 effectiveFrom]);
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_validityDays = [v4 validityDays];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 createdOn]);
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 adoptedOn]);
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

- (ADSynchronizedIdItem)initWithBMHomeSeed:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItem;
  v5 = -[ADSynchronizedIdItem init](&v15, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 seed]);
    value = v5->_value;
    v5->_value = (NSUUID *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 effectiveFrom]);
    effectiveFrom = v5->_effectiveFrom;
    v5->_effectiveFrom = (NSDate *)v8;

    v5->_validityDays = [v4 validityDays];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 createdOn]);
    createdOn = v5->_createdOn;
    v5->_createdOn = (NSDate *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 adoptedOn]);
    adoptedOn = v5->_adoptedOn;
    v5->_adoptedOn = (NSDate *)v12;

    v5->_switchedCount = [v4 switchedCount];
  }

  return v5;
}

- (ADSynchronizedIdItem)initWithValue:(id)a3 andEffectiveFrom:(id)a4 andValidityDays:(unsigned int)a5 andCreatedOn:(id)a6 andAdoptedOn:(id)a7 andSwitchedCount:(unsigned int)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItem;
  v18 = -[ADSynchronizedIdItem init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_value, a3);
    objc_storeStrong((id *)&v19->_effectiveFrom, a4);
    v19->_validityDays = a5;
    objc_storeStrong((id *)&v19->_createdOn, a6);
    objc_storeStrong((id *)&v19->_adoptedOn, a7);
    v19->_switchedCount = a8;
  }

  return v19;
}

- (id)initAndAdopt:(id)a3
{
  return -[ADSynchronizedIdItem initAndAdopt:andSwitchedCount:](self, "initAndAdopt:andSwitchedCount:", a3, 1LL);
}

- (id)initAndAdopt:(id)a3 andSwitchedCount:(unsigned int)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADSynchronizedIdItem;
  v7 = -[ADSynchronizedIdItem init](&v17, "init");
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v6 value]);
    value = v7->_value;
    v7->_value = (NSUUID *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v6 effectiveFrom]);
    effectiveFrom = v7->_effectiveFrom;
    v7->_effectiveFrom = (NSDate *)v10;

    v7->_validityDays = [v6 validityDays];
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 createdOn]);
    createdOn = v7->_createdOn;
    v7->_createdOn = (NSDate *)v12;

    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    adoptedOn = v7->_adoptedOn;
    v7->_adoptedOn = (NSDate *)v14;

    v7->_switchedCount = a4;
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"effectiveFrom:%@ validityDays:%d createdOn:%@ adoptedOn:%@ switchedCount:%d",  self->_effectiveFrom,  self->_validityDays,  self->_createdOn,  self->_adoptedOn,  self->_switchedCount);
}

- (NSDate)expirationDate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem calendar](&OBJC_CLASS___ADSynchronizedIdItem, "calendar"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 dateByAddingUnit:16 value:self->_validityDays toDate:self->_effectiveFrom options:0]);

  return (NSDate *)v4;
}

- (int64_t)expirationDaysFrom:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem calendar](&OBJC_CLASS___ADSynchronizedIdItem, "calendar"));
  int64_t v6 = -[ADSynchronizedIdItem _expirationDaysFrom:withCalendar:](self, "_expirationDaysFrom:withCalendar:", v4, v5);

  return v6;
}

- (int64_t)_expirationDaysFrom:(id)a3 withCalendar:(id)a4
{
  uint64_t validityDays = self->_validityDays;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 components:16 fromDate:self->_effectiveFrom toDate:a3 options:0]);
  int64_t v6 = validityDays - (void)[v5 day];

  return v6;
}

- (id)selectEarliest:(id)a3
{
  id v4 = (ADSynchronizedIdItem *)a3;
  createdOn = self->_createdOn;
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem createdOn](v4, "createdOn"));
  id v7 = -[NSDate compare:](createdOn, "compare:", v6);

  if (v7 == (id)-1LL)
  {
    uint64_t v8 = self;
  }

  else
  {
    uint64_t v8 = v4;
    if (v7 != (id)1)
    {
      value = self->_value;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSynchronizedIdItem value](v4, "value"));
      NSComparisonResult v11 = -[NSUUID compare:](value, "compare:", v10);

      else {
        uint64_t v8 = self;
      }
    }
  }

  uint64_t v12 = v8;

  return v12;
}

- (int64_t)timelinePosition
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  int64_t v4 = -[ADSynchronizedIdItem timelinePositionWithTime:](self, "timelinePositionWithTime:", v3);

  return v4;
}

- (int64_t)timelinePositionWithTime:(id)a3
{
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem alignToMidnight:](&OBJC_CLASS___ADSynchronizedIdItem, "alignToMidnight:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem calendar](&OBJC_CLASS___ADSynchronizedIdItem, "calendar"));
  int64_t v6 = -[ADSynchronizedIdItem timelinePositionWithToday:withCalendar:]( self,  "timelinePositionWithToday:withCalendar:",  v4,  v5);

  return v6;
}

- (int64_t)timelinePositionWithToday:(id)a3 withCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)-[NSDate compare:](self->_effectiveFrom, "compare:", v6) == (id)1) {
    int64_t v8 = 2LL;
  }
  else {
    int64_t v8 = -[ADSynchronizedIdItem _expirationDaysFrom:withCalendar:](self, "_expirationDaysFrom:withCalendar:", v6, v7) > 0;
  }

  return v8;
}

- (id)toBMSiriUserSeed
{
  v3 = objc_alloc(&OBJC_CLASS___BMSiriUserSeed);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_validityDays));
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_switchedCount));
  uint64_t v10 = -[BMSiriUserSeed initWithSeed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:]( v3,  "initWithSeed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:",  value,  effectiveFrom,  v6,  createdOn,  adoptedOn,  v9);

  return v10;
}

- (id)toBMSiriUserAggregationId
{
  v3 = objc_alloc(&OBJC_CLASS___BMSiriUserAggregationId);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_validityDays));
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_switchedCount));
  uint64_t v10 = -[BMSiriUserAggregationId initWithAggregationId:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:]( v3,  "initWithAggregationId:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:",  value,  effectiveFrom,  v6,  createdOn,  adoptedOn,  v9);

  return v10;
}

- (id)toBMSiriHomeSeedWithHomeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc(&OBJC_CLASS___BMSiriHomeSeed);
  value = self->_value;
  effectiveFrom = self->_effectiveFrom;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_validityDays));
  createdOn = self->_createdOn;
  adoptedOn = self->_adoptedOn;
  NSComparisonResult v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_switchedCount));
  uint64_t v12 = -[BMSiriHomeSeed initWithHomeIdentifier:seed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:]( v5,  "initWithHomeIdentifier:seed:effectiveFrom:validityDays:createdOn:adoptedOn:switchedCount:",  v4,  value,  effectiveFrom,  v8,  createdOn,  adoptedOn,  v11);

  return v12;
}

- (NSUUID)value
{
  return (NSUUID *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDate)effectiveFrom
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (unsigned)validityDays
{
  return self->_validityDays;
}

- (NSDate)createdOn
{
  return (NSDate *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDate)adoptedOn
{
  return (NSDate *)objc_getProperty(self, a2, 40LL, 1);
}

- (unsigned)switchedCount
{
  return self->_switchedCount;
}

- (void).cxx_destruct
{
}

+ (id)calendar
{
  v2 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](&OBJC_CLASS___NSTimeZone, "timeZoneWithName:", @"UTC"));
  -[NSCalendar setTimeZone:](v2, "setTimeZone:", v3);

  return v2;
}

+ (id)alignToMidnight:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ADSynchronizedIdItem calendar](&OBJC_CLASS___ADSynchronizedIdItem, "calendar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 startOfDayForDate:v3]);

  return v5;
}

@end