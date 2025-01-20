@interface ADRapportProximityObservation
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportProximityObservation)init;
- (ADRapportProximityObservation)initWithBuilder:(id)a3;
- (ADRapportProximityObservation)initWithCoder:(id)a3;
- (ADRapportProximityObservation)initWithDeviceIDPair:(id)a3 proximity:(int)a4 observationDate:(id)a5;
- (ADRapportProximityObservation)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)observationDate;
- (NSSet)deviceIDPair;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportProximityObservation

- (ADRapportProximityObservation)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADRapportProximityObservationMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADRapportProximityObservation;
  v5 = -[ADRapportProximityObservation init](&v15, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADRapportProximityObservationMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportProximityObservationMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADRapportProximityObservationMutation isDirty](v7, "isDirty"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportProximityObservationMutation getDeviceIDPair](v7, "getDeviceIDPair"));
      v9 = (NSSet *)[v8 copy];
      deviceIDPair = v6->_deviceIDPair;
      v6->_deviceIDPair = v9;

      v6->_proximity = -[_ADRapportProximityObservationMutation getProximity](v7, "getProximity");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportProximityObservationMutation getObservationDate](v7, "getObservationDate"));
      v12 = (NSDate *)[v11 copy];
      observationDate = v6->_observationDate;
      v6->_observationDate = v12;
    }
  }

  return v6;
}

- (ADRapportProximityObservation)init
{
  return -[ADRapportProximityObservation initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADRapportProximityObservation)initWithDeviceIDPair:(id)a3 proximity:(int)a4 observationDate:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100336804;
  v11[3] = &unk_1004FCB10;
  int v14 = a4;
  id v12 = a3;
  id v13 = a5;
  id v7 = v13;
  id v8 = v12;
  v9 = -[ADRapportProximityObservation initWithBuilder:](self, "initWithBuilder:", v11);

  return v9;
}

- (NSString)description
{
  return (NSString *)-[ADRapportProximityObservation _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportProximityObservation;
  v5 = -[ADRapportProximityObservation description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {deviceIDPair = %@, proximity = %d, observationDate = %@}",  v6,  self->_deviceIDPair,  self->_proximity,  self->_observationDate);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)-[NSSet hash](self->_deviceIDPair, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proximity));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ v3 ^ (unint64_t)-[NSDate hash](self->_observationDate, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADRapportProximityObservation *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADRapportProximityObservation);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      int proximity = self->_proximity;
      if (proximity == -[ADRapportProximityObservation proximity](v6, "proximity"))
      {
        id v8 = (NSSet *)objc_claimAutoreleasedReturnValue(-[ADRapportProximityObservation deviceIDPair](v6, "deviceIDPair"));
        deviceIDPair = self->_deviceIDPair;
        if (deviceIDPair == v8 || -[NSSet isEqual:](deviceIDPair, "isEqual:", v8))
        {
          v10 = (NSDate *)objc_claimAutoreleasedReturnValue(-[ADRapportProximityObservation observationDate](v6, "observationDate"));
          observationDate = self->_observationDate;
          BOOL v12 = observationDate == v10 || -[NSDate isEqual:](observationDate, "isEqual:", v10);
        }

        else
        {
          BOOL v12 = 0;
        }
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (ADRapportProximityObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSSet);
  unint64_t v6 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", v5, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeObjectOfClasses:v7 forKey:@"ADRapportProximityObservation::deviceIDPair"]);

  id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportProximityObservation::proximity"];
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v10 intValue];

  id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"ADRapportProximityObservation::observationDate"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  int v14 = -[ADRapportProximityObservation initWithDeviceIDPair:proximity:observationDate:]( self,  "initWithDeviceIDPair:proximity:observationDate:",  v8,  v11,  v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  deviceIDPair = self->_deviceIDPair;
  id v6 = a3;
  [v6 encodeObject:deviceIDPair forKey:@"ADRapportProximityObservation::deviceIDPair"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_proximity));
  [v6 encodeObject:v5 forKey:@"ADRapportProximityObservation::proximity"];

  [v6 encodeObject:self->_observationDate forKey:@"ADRapportProximityObservation::observationDate"];
}

- (ADRapportProximityObservation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"deviceIDPair"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      id v8 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v6 count]);
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v28;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(id *)(*((void *)&v27 + 1) + 8LL * (void)i);
            uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              id v16 = v14;

              if (v16) {
                -[NSMutableArray addObject:](v8, "addObject:", v16, (void)v27);
              }
            }

            else
            {

              id v16 = 0LL;
            }
          }

          id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }

        while (v11);
      }

      v17 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", v8);
    }

    else
    {
      v17 = 0LL;
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"proximity"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0) {
      id v21 = v19;
    }
    else {
      id v21 = 0LL;
    }

    id v22 = [v21 intValue];
    v23 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"observationDate"]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0) {
      id v25 = v23;
    }
    else {
      id v25 = 0LL;
    }

    self =  -[ADRapportProximityObservation initWithDeviceIDPair:proximity:observationDate:]( self,  "initWithDeviceIDPair:proximity:observationDate:",  v17,  v22,  v25);
    v18 = self;
  }

  else
  {
    v18 = 0LL;
  }

  return v18;
}

- (id)buildDictionaryRepresentation
{
  unint64_t v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (self->_deviceIDPair)
  {
    id v4 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSSet count](self->_deviceIDPair, "count"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v5 = self->_deviceIDPair;
    id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          -[NSMutableArray addObject:]( v4,  "addObject:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)v9),  (void)v15);
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v15,  v19,  16LL);
      }

      while (v7);
    }

    id v10 = -[NSMutableArray copy](v4, "copy");
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, @"deviceIDPair");
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_proximity,  (void)v15));
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v11, @"proximity");

  observationDate = self->_observationDate;
  if (observationDate) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", observationDate, @"observationDate");
  }
  id v13 = -[NSMutableDictionary copy](v3, "copy");

  return v13;
}

- (NSSet)deviceIDPair
{
  return self->_deviceIDPair;
}

- (int)proximity
{
  return self->_proximity;
}

- (NSDate)observationDate
{
  return self->_observationDate;
}

- (void).cxx_destruct
{
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADRapportProximityObservationMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADRapportProximityObservationMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportProximityObservationMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADRapportProximityObservationMutation isDirty](v5, "isDirty"))
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___ADRapportProximityObservation);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportProximityObservationMutation getDeviceIDPair](v5, "getDeviceIDPair"));
      uint64_t v8 = (NSSet *)[v7 copy];
      deviceIDPair = v6->_deviceIDPair;
      v6->_deviceIDPair = v8;

      v6->_int proximity = -[_ADRapportProximityObservationMutation getProximity](v5, "getProximity");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADRapportProximityObservationMutation getObservationDate](v5, "getObservationDate"));
      id v11 = (NSDate *)[v10 copy];
      observationDate = v6->_observationDate;
      v6->_observationDate = v11;
    }

    else
    {
      id v6 = (ADRapportProximityObservation *)-[ADRapportProximityObservation copy](self, "copy");
    }
  }

  else
  {
    id v6 = (ADRapportProximityObservation *)-[ADRapportProximityObservation copy](self, "copy");
  }

  return v6;
}

@end