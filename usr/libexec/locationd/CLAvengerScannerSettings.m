@interface CLAvengerScannerSettings
- (CLAvengerScannerSettings)initWithUniverse:(id)a3;
- (double)getSettings:(id)a3;
- (double)longAggressiveScanCoexImpactedDuration;
- (double)longAggressiveScanNonCoexImpactedDuration;
- (id)settingsDictionary;
- (void)dealloc;
@end

@implementation CLAvengerScannerSettings

- (CLAvengerScannerSettings)initWithUniverse:(id)a3
{
  self->_otaSettings = objc_alloc_init(&OBJC_CLASS___NSDictionary);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScannerSettings;
  -[CLAvengerScannerSettings dealloc](&v3, "dealloc");
}

- (id)settingsDictionary
{
  v4[0] = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "AvengerScannerLongAggressiveScanNonCoexImpactedDuration");
  -[CLAvengerScannerSettings longAggressiveScanNonCoexImpactedDuration]( self,  "longAggressiveScanNonCoexImpactedDuration");
  v5[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v4[1] = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "AvengerScannerLongAggressiveScanCoexImpactedDuration");
  -[CLAvengerScannerSettings longAggressiveScanCoexImpactedDuration](self, "longAggressiveScanCoexImpactedDuration");
  v5[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  2LL);
}

- (double)getSettings:(id)a3
{
  double v14 = 0.0;
  sub_1002F0B04(&v12);
  int v5 = sub_1002A82BC(v12, (const char *)[a3 cStringUsingEncoding:1], &v14);
  int v6 = v5;
  v7 = v13;
  if (!v13) {
    goto LABEL_5;
  }
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    unint64_t v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    if (v6) {
      return v14;
    }
  }

  else
  {
LABEL_5:
    if (v5) {
      return v14;
    }
  }

  if (-[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", a3))
  {
    objc_msgSend( -[NSDictionary objectForKeyedSubscript:](self->_otaSettings, "objectForKeyedSubscript:", a3),  "doubleValue");
  }

  else
  {
    unsigned int v11 = objc_msgSend( a3,  "isEqualToString:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  "AvengerScannerLongAggressiveScanNonCoexImpactedDuration"));
    double result = 120.0;
    if (v11) {
      return 39.0;
    }
  }

  return result;
}

- (double)longAggressiveScanNonCoexImpactedDuration
{
  return result;
}

- (double)longAggressiveScanCoexImpactedDuration
{
  return result;
}

@end