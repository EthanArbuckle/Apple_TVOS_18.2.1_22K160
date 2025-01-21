@interface ConnectionParameters
- (float)maxInterval;
- (float)minInterval;
- (float)preferredInterval;
- (id)description;
- (int)maxCELength;
- (int)maxDeferment;
- (int)maxPeripheralLatency;
- (int)minCELength;
- (int)preferredPeripheralLatency;
- (int)timeout;
- (void)setMaxCELength:(int)a3;
- (void)setMaxDeferment:(int)a3;
- (void)setMaxInterval:(float)a3;
- (void)setMaxPeripheralLatency:(int)a3;
- (void)setMinCELength:(int)a3;
- (void)setMinInterval:(float)a3;
- (void)setPreferredInterval:(float)a3;
- (void)setPreferredPeripheralLatency:(int)a3;
- (void)setTimeout:(int)a3;
@end

@implementation ConnectionParameters

- (id)description
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unsigned int outCount = 0;
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = class_copyPropertyList(v5, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      Name = property_getName(v6[i]);
      v9 = [NSString stringWithUTF8String:Name];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectionParameters valueForKey:](self, "valueForKey:", v9));

      v11 = [NSString stringWithUTF8String:Name];
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, v11);
    }
  }

  free(v6);
  v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ 0x%x %@",  objc_opt_class(self, v12),  self,  v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (float)minInterval
{
  return self->_minInterval;
}

- (void)setMinInterval:(float)a3
{
  self->_minInterval = a3;
}

- (float)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(float)a3
{
  self->_preferredInterval = a3;
}

- (float)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(float)a3
{
  self->_maxInterval = a3;
}

- (int)minCELength
{
  return self->_minCELength;
}

- (void)setMinCELength:(int)a3
{
  self->_minCELength = a3;
}

- (int)maxCELength
{
  return self->_maxCELength;
}

- (void)setMaxCELength:(int)a3
{
  self->_maxCELength = a3;
}

- (int)preferredPeripheralLatency
{
  return self->_preferredPeripheralLatency;
}

- (void)setPreferredPeripheralLatency:(int)a3
{
  self->_preferredPeripheralLatency = a3;
}

- (int)maxPeripheralLatency
{
  return self->_maxPeripheralLatency;
}

- (void)setMaxPeripheralLatency:(int)a3
{
  self->_maxPeripheralLatency = a3;
}

- (int)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(int)a3
{
  self->_timeout = a3;
}

- (int)maxDeferment
{
  return self->_maxDeferment;
}

- (void)setMaxDeferment:(int)a3
{
  self->_maxDeferment = a3;
}

@end