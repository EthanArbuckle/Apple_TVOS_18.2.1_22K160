@interface CLHEndpointSelector
- (CLHEndpointSelector)init;
- (NSURL)altimeterEndpoint;
- (NSURL)appEndpoint;
- (NSURL)batchEndpoint;
- (NSURL)cellWifiEndpoint;
- (NSURL)indoorEndpoint;
- (NSURL)ionosphereEndpoint;
- (NSURL)passEndpoint;
- (NSURL)poiEndpoint;
- (NSURL)pressureEndpoint;
- (NSURL)traceEndpoint;
- (id)description;
- (id)jsonObject;
- (void)dealloc;
- (void)refresh;
- (void)updateEndpoint:(id *)a3 withKey:(id)a4;
@end

@implementation CLHEndpointSelector

- (CLHEndpointSelector)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLHEndpointSelector;
  v2 = -[CLHEndpointSelector init](&v4, "init");
  if (v2)
  {
    v2->_appEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/au");
    v2->_batchEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/pds/pd");
    v2->_cellWifiEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/hcy/pbcwloc");
    v2->_indoorEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/incs");
    v2->_passEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/pbu");
    v2->_poiEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.ls.apple.com/hvr/aploc");
    v2->_pressureEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/psr");
    v2->_traceEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/hvr/trc");
    v2->_altimeterEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-carry.ls.apple.com/hvr/alt");
    v2->_ionosphereEndpoint = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  @"https://gsp10-ssl.apple.com/hvr/ion");
    -[CLHEndpointSelector refresh](v2, "refresh");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHEndpointSelector;
  -[CLHEndpointSelector dealloc](&v3, "dealloc");
}

- (void)refresh
{
}

- (void)updateEndpoint:(id *)a3 withKey:(id)a4
{
  BOOL v6 = sub_1002A85D0(v14, (uint64_t)a4, &__p);
  BOOL v7 = v6;
  v8 = v15;
  if (!v15) {
    goto LABEL_5;
  }
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    unint64_t v10 = __ldaxr(p_shared_owners);
  while (__stlxr(v10 - 1, p_shared_owners));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    if (v7) {
      goto LABEL_6;
    }
  }

  else
  {
LABEL_5:
    if (v6)
    {
LABEL_6:

      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v12 = -[NSURL initWithString:]( objc_alloc(&OBJC_CLASS___NSURL),  "initWithString:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_p));
      goto LABEL_13;
    }
  }

  id v13 = objc_msgSend( +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"),  "defaultForKey:defaultValue:",  a4,  0);
  if (!v13) {
    goto LABEL_14;
  }

  v12 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v13);
LABEL_13:
  *a3 = v12;
LABEL_14:
}

- (id)jsonObject
{
  v4[0] = @"CLAppleCollectionServer_App";
  v5[0] = -[NSURL absoluteString](self->_appEndpoint, "absoluteString");
  v4[1] = @"CLAppleCollectionServer_Tracks";
  v5[1] = -[NSURL absoluteString](self->_batchEndpoint, "absoluteString");
  v4[2] = @"CLAppleCollectionServer_CellWifi";
  v5[2] = -[NSURL absoluteString](self->_cellWifiEndpoint, "absoluteString");
  v4[3] = @"CLAppleCollectionServer_Indoor";
  v5[3] = -[NSURL absoluteString](self->_indoorEndpoint, "absoluteString");
  v4[4] = @"CLAppleCollectionServer_Pass";
  v5[4] = -[NSURL absoluteString](self->_passEndpoint, "absoluteString");
  v4[5] = @"CLAppleCollectionServer_Poi";
  v5[5] = -[NSURL absoluteString](self->_poiEndpoint, "absoluteString");
  v4[6] = @"CLAppleCollectionServer_Pressure";
  v5[6] = -[NSURL absoluteString](self->_pressureEndpoint, "absoluteString");
  v4[7] = @"CLAppleCollectionServer_Trace";
  v5[7] = -[NSURL absoluteString](self->_traceEndpoint, "absoluteString");
  v4[8] = @"CLAppleCollectionServer_Altimeter";
  v5[8] = -[NSURL absoluteString](self->_altimeterEndpoint, "absoluteString");
  v4[9] = @"CLAppleCollectionServer_Ionosphere";
  v5[9] = -[NSURL absoluteString](self->_ionosphereEndpoint, "absoluteString");
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  10LL);
}

- (id)description
{
  return  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  -[CLHEndpointSelector jsonObject](self, "jsonObject"),  2LL,  0LL),  4LL);
}

- (NSURL)appEndpoint
{
  return self->_appEndpoint;
}

- (NSURL)batchEndpoint
{
  return self->_batchEndpoint;
}

- (NSURL)cellWifiEndpoint
{
  return self->_cellWifiEndpoint;
}

- (NSURL)indoorEndpoint
{
  return self->_indoorEndpoint;
}

- (NSURL)passEndpoint
{
  return self->_passEndpoint;
}

- (NSURL)poiEndpoint
{
  return self->_poiEndpoint;
}

- (NSURL)pressureEndpoint
{
  return self->_pressureEndpoint;
}

- (NSURL)traceEndpoint
{
  return self->_traceEndpoint;
}

- (NSURL)altimeterEndpoint
{
  return self->_altimeterEndpoint;
}

- (NSURL)ionosphereEndpoint
{
  return self->_ionosphereEndpoint;
}

@end