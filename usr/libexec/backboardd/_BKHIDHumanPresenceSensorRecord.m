@interface _BKHIDHumanPresenceSensorRecord
- (BOOL)humanIsPresent;
- (NSMutableArray)services;
- (double)proximityInCentimeters;
- (id)description;
- (unint64_t)status;
- (void)_resetServiceStatus;
- (void)addService:(id)a3;
- (void)removeService:(id)a3;
- (void)setHumanIsPresent:(BOOL)a3;
- (void)setProximityInCentimeters:(double)a3;
- (void)setServices:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation _BKHIDHumanPresenceSensorRecord

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  uint64_t v4 = NSStringFromBKSHIDServicesHumanPresenceStatus(self->_status);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = [v3 appendObject:v5 withName:@"status"];

  id v7 = [v3 appendFloat:@"proximityInCentimeters" withName:self->_proximityInCentimeters];
  id v8 = [v3 appendBool:self->_humanIsPresent withName:@"humanIsPresent"];
  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v9;
}

- (void)_resetServiceStatus
{
  self->_status &= 0xFFFFFFFFFFFFFFFCLL;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_services;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "primaryUsage", (void)v12);
        if (v8 == 17)
        {
          uint64_t v9 = 1LL;
        }

        else
        {
          if (v8 != 18) {
            continue;
          }
          uint64_t v9 = 2LL;
        }

        self->_status |= v9;
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }

  unint64_t status = self->_status;
  unint64_t v11 = status & 0xFFFFFFFFFFFFFFFBLL;
  if ((status & 1) == 0 || (unint64_t v11 = self->_status, (v11 & 2) == 0))
  {
    if ((v11 & 2) == 0) {
      v11 &= ~8uLL;
    }
    self->_unint64_t status = v11;
  }

- (void)setProximityInCentimeters:(double)a3
{
  if (self->_proximityInCentimeters != a3)
  {
    self->_proximityInCentimeters = a3;
    self->_status |= 8uLL;
  }

- (void)setHumanIsPresent:(BOOL)a3
{
  if (self->_humanIsPresent != a3)
  {
    self->_humanIsPresent = a3;
    self->_status |= 4uLL;
  }

- (void)addService:(id)a3
{
  id v4 = a3;
  services = self->_services;
  id v8 = v4;
  if (!services)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v7 = self->_services;
    self->_services = v6;

    id v4 = v8;
    services = self->_services;
  }

  -[NSMutableArray addObject:](services, "addObject:", v4);
  -[_BKHIDHumanPresenceSensorRecord _resetServiceStatus](self, "_resetServiceStatus");
}

- (void)removeService:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (double)proximityInCentimeters
{
  return self->_proximityInCentimeters;
}

- (BOOL)humanIsPresent
{
  return self->_humanIsPresent;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end