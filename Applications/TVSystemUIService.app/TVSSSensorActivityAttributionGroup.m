@interface TVSSSensorActivityAttributionGroup
- (BOOL)_addAttributionIfMatched:(id)a3 force:(BOOL)a4;
- (BOOL)addAttributionIfMatched:(id)a3;
- (BOOL)attributionMatchesGroup:(id)a3;
- (BOOL)hasCameraSensor;
- (BOOL)hasLocationSensor;
- (BOOL)hasMicrophoneSensor;
- (NSArray)attributions;
- (NSMutableArray)mutableAttributions;
- (TVSSSensorActivityAttributionGroup)initWithAttribution:(id)a3;
@end

@implementation TVSSSensorActivityAttributionGroup

- (TVSSSensorActivityAttributionGroup)initWithAttribution:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityAttributionGroup;
  v10 = -[TVSSSensorActivityAttributionGroup init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mutableAttributions = v10->_mutableAttributions;
    v10->_mutableAttributions = v4;

    -[TVSSSensorActivityAttributionGroup _addAttributionIfMatched:force:]( v10,  "_addAttributionIfMatched:force:",  location[0],  1LL);
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (NSArray)attributions
{
  v3 = -[TVSSSensorActivityAttributionGroup mutableAttributions](self, "mutableAttributions");
  id v4 = -[NSMutableArray copy](v3, "copy");

  return (NSArray *)v4;
}

- (BOOL)attributionMatchesGroup:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSSensorActivityAttributionGroup mutableAttributions](v8, "mutableAttributions");
  id v6 = -[NSMutableArray firstObject](v4, "firstObject");

  unsigned __int8 v5 = [v6 matchesActivityAttribution:location[0]];
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

- (BOOL)addAttributionIfMatched:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unsigned __int8 v4 = -[TVSSSensorActivityAttributionGroup _addAttributionIfMatched:force:]( v6,  "_addAttributionIfMatched:force:",  location[0],  0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (BOOL)_addAttributionIfMatched:(id)a3 force:(BOOL)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v8 = -[TVSSSensorActivityAttributionGroup attributionMatchesGroup:](v10, "attributionMatchesGroup:", location[0]);
  if ((v8 & 1) != 0 || a4)
  {
    unsigned __int8 v5 = -[TVSSSensorActivityAttributionGroup mutableAttributions](v10, "mutableAttributions");
    -[NSMutableArray addObject:](v5, "addObject:", location[0]);

    id v6 = [location[0] sensorType];
    if (v6)
    {
      if (v6 == (id)1)
      {
        v10->_hasMicrophoneSensor = 1;
      }

      else if (v6 == (id)2)
      {
        v10->_hasLocationSensor = 1;
      }
    }

    else
    {
      v10->_hasCameraSensor = 1;
    }
  }

  objc_storeStrong(location, 0LL);
  return v8 & 1;
}

- (BOOL)hasCameraSensor
{
  return self->_hasCameraSensor;
}

- (BOOL)hasMicrophoneSensor
{
  return self->_hasMicrophoneSensor;
}

- (BOOL)hasLocationSensor
{
  return self->_hasLocationSensor;
}

- (NSMutableArray)mutableAttributions
{
  return self->_mutableAttributions;
}

- (void).cxx_destruct
{
}

@end