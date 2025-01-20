@interface iAP2NMEAFilterParam
- (BOOL)isEqual:(id)a3;
- (iAP2NMEAFilterParam)initWithTypeParamID:(unsigned int)a3 andIntervalParamID:(unsigned int)a4 andIntervalMinMs:(unsigned int)a5;
- (unsigned)nmeaIntervalMinMs;
- (unsigned)nmeaIntervalParamID;
- (unsigned)nmeaTypeParamID;
- (void)setNmeaIntervalMinMs:(unsigned int)a3;
- (void)setNmeaIntervalParamID:(unsigned int)a3;
- (void)setNmeaTypeParamID:(unsigned int)a3;
@end

@implementation iAP2NMEAFilterParam

- (iAP2NMEAFilterParam)initWithTypeParamID:(unsigned int)a3 andIntervalParamID:(unsigned int)a4 andIntervalMinMs:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___iAP2NMEAFilterParam;
  result = -[iAP2NMEAFilterParam init](&v9, "init");
  if (result)
  {
    result->_nmeaTypeParamID = a3;
    result->_nmeaIntervalParamID = a4;
    result->_nmeaIntervalMinMs = a5;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___iAP2NMEAFilterParam);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (unsigned int v6 = -[iAP2NMEAFilterParam nmeaTypeParamID](self, "nmeaTypeParamID"),
        v6 == [v4 nmeaTypeParamID])
    && (unsigned int v7 = -[iAP2NMEAFilterParam nmeaIntervalParamID](self, "nmeaIntervalParamID"),
        v7 == [v4 nmeaIntervalParamID]))
  {
    unsigned int v8 = -[iAP2NMEAFilterParam nmeaIntervalMinMs](self, "nmeaIntervalMinMs");
    BOOL v9 = v8 == [v4 nmeaIntervalMinMs];
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unsigned)nmeaTypeParamID
{
  return self->_nmeaTypeParamID;
}

- (void)setNmeaTypeParamID:(unsigned int)a3
{
  self->_nmeaTypeParamID = a3;
}

- (unsigned)nmeaIntervalParamID
{
  return self->_nmeaIntervalParamID;
}

- (void)setNmeaIntervalParamID:(unsigned int)a3
{
  self->_nmeaIntervalParamID = a3;
}

- (unsigned)nmeaIntervalMinMs
{
  return self->_nmeaIntervalMinMs;
}

- (void)setNmeaIntervalMinMs:(unsigned int)a3
{
  self->_nmeaIntervalMinMs = a3;
}

@end