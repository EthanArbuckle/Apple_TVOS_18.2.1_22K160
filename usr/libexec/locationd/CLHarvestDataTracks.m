@interface CLHarvestDataTracks
+ (BOOL)supportsSecureCoding;
- (BOOL)isProactiveLocationSession;
- (BOOL)motionVehicleConnected;
- (BOOL)motionVehicleConnectedStateChanged;
- (CLDaemonLocation)location;
- (CLHarvestDataTracks)initWithCoder:(id)a3;
- (CLHarvestDataTracks)initWithTracksData:(HarvestData *)a3 andLocation:;
- (CLMotionActivity)dominantMotionActivity;
- (CLMotionActivity)motionActivity;
- (CLMotionActivity)rawMotionActivity;
- (CLPAccessoryMeta)activeAccessory;
- (NSString)bundleId;
- (NSString)bundleIds;
- (NSString)tripId;
- (double)tripTimestamp;
- (id).cxx_construct;
- (id)description;
- (id)jsonObject;
- (int)context;
- (int)mcc;
- (int)mnc;
- (int)modeIndicator;
- (int)rat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveAccessory:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setContext:(int)a3;
- (void)setDominantMotionActivity:(CLMotionActivity *)a3;
- (void)setIsProactiveLocationSession:(BOOL)a3;
- (void)setLocation:(CLDaemonLocation *)a3;
- (void)setMcc:(int)a3;
- (void)setMnc:(int)a3;
- (void)setModeIndicator:(int)a3;
- (void)setMotionActivity:(CLMotionActivity *)a3;
- (void)setMotionVehicleConnected:(BOOL)a3;
- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3;
- (void)setRat:(int)a3;
- (void)setRawMotionActivity:(CLMotionActivity *)a3;
- (void)setTripId:(id)a3;
- (void)setTripTimestamp:(double)a3;
@end

@implementation CLHarvestDataTracks

- (CLHarvestDataTracks)initWithCoder:(id)a3
{
  v72.receiver = self;
  v72.super_class = (Class)&OBJC_CLASS___CLHarvestDataTracks;
  v4 = -[CLHarvestDataTracks init](&v72, "init");
  if (v4)
  {
    *(void *)&double v5 = objc_opt_class(&OBJC_CLASS___CLLocation).n128_u64[0];
    id v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v6, @"LocationKey", v5);
    if (v7)
    {
      [v7 clientLocation];
    }

    else
    {
      __int128 v70 = 0u;
      memset(v71, 0, 28);
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v63 = 0u;
    }

    v61[6] = v69;
    v61[7] = v70;
    v62[0] = v71[0];
    *(_OWORD *)((char *)v62 + 12) = *(_OWORD *)((char *)v71 + 12);
    v61[2] = v65;
    v61[3] = v66;
    v61[4] = v67;
    v61[5] = v68;
    v61[0] = v63;
    v61[1] = v64;
    -[CLHarvestDataTracks setLocation:](v4, "setLocation:", v61);
    [a3 decodeFloatForKey:@"TripTimestampKey"];
    -[CLHarvestDataTracks setTripTimestamp:](v4, "setTripTimestamp:", v8);
    *(void *)&double v9 = objc_opt_class(&OBJC_CLASS___NSUUID).n128_u64[0];
    -[CLHarvestDataTracks setTripId:]( v4,  "setTripId:",  objc_msgSend(a3, "decodeObjectOfClass:forKey:", v10, @"TripIdKey", v9));
    -[CLHarvestDataTracks setRat:](v4, "setRat:", [a3 decodeIntForKey:@"RatKey"]);
    -[CLHarvestDataTracks setMcc:](v4, "setMcc:", [a3 decodeIntForKey:@"MccKey"]);
    -[CLHarvestDataTracks setMnc:](v4, "setMnc:", [a3 decodeIntForKey:@"MncKey"]);
    -[CLHarvestDataTracks setContext:](v4, "setContext:", [a3 decodeIntForKey:@"ContextKey"]);
    *(void *)&double v11 = objc_opt_class(&OBJC_CLASS___NSString).n128_u64[0];
    -[CLHarvestDataTracks setBundleId:]( v4,  "setBundleId:",  objc_msgSend(a3, "decodeObjectOfClass:forKey:", v12, @"BundleIdKey", v11));
    *(void *)&double v13 = objc_opt_class(&OBJC_CLASS___NSString).n128_u64[0];
    -[CLHarvestDataTracks setBundleIds:]( v4,  "setBundleIds:",  objc_msgSend(a3, "decodeObjectOfClass:forKey:", v14, @"BundleIdsKey", v13));
    else {
      uint64_t v15 = 78LL;
    }
    -[CLHarvestDataTracks setModeIndicator:](v4, "setModeIndicator:", v15);
    if ([a3 containsValueForKey:@"ActiveAccessoryKey"])
    {
      *(void *)&double v16 = objc_opt_class(&OBJC_CLASS___CLPAccessoryMeta).n128_u64[0];
      -[CLHarvestDataTracks setActiveAccessory:]( v4,  "setActiveAccessory:",  objc_msgSend(a3, "decodeObjectOfClass:forKey:", v17, @"ActiveAccessoryKey", v16));
    }

    -[CLHarvestDataTracks setIsProactiveLocationSession:]( v4,  "setIsProactiveLocationSession:",  [a3 decodeBoolForKey:@"IsProactiveLocationSessionKey"]);
    -[CLHarvestDataTracks setMotionVehicleConnectedStateChanged:]( v4,  "setMotionVehicleConnectedStateChanged:",  [a3 decodeBoolForKey:@"MotionVehicleStateChangedKey"]);
    -[CLHarvestDataTracks setMotionVehicleConnected:]( v4,  "setMotionVehicleConnected:",  [a3 decodeBoolForKey:@"MotionVehicleKey"]);
    *(void *)&double v18 = objc_opt_class(&OBJC_CLASS___CLHarvestDataMotionActivity).n128_u64[0];
    id v20 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v19, @"RawMotionActivityKey", v18);
    if (v20)
    {
      [v20 activity];
    }

    else
    {
      uint64_t v60 = 0LL;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v52 = 0u;
      __int128 v53 = 0u;
    }

    v50[6] = v58;
    v50[7] = v59;
    uint64_t v51 = v60;
    v50[2] = v54;
    v50[3] = v55;
    v50[4] = v56;
    v50[5] = v57;
    v50[0] = v52;
    v50[1] = v53;
    -[CLHarvestDataTracks setRawMotionActivity:](v4, "setRawMotionActivity:", v50);
    *(void *)&double v21 = objc_opt_class(&OBJC_CLASS___CLHarvestDataMotionActivity).n128_u64[0];
    id v23 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v22, @"MotionActivityKey", v21);
    if (v23)
    {
      [v23 activity];
    }

    else
    {
      uint64_t v49 = 0LL;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
    }

    v39[6] = v47;
    v39[7] = v48;
    uint64_t v40 = v49;
    v39[2] = v43;
    v39[3] = v44;
    v39[4] = v45;
    v39[5] = v46;
    v39[0] = v41;
    v39[1] = v42;
    -[CLHarvestDataTracks setMotionActivity:](v4, "setMotionActivity:", v39);
    *(void *)&double v24 = objc_opt_class(&OBJC_CLASS___CLHarvestDataMotionActivity).n128_u64[0];
    id v26 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", v25, @"DominantMotionActivityKey", v24);
    if (v26)
    {
      [v26 activity];
    }

    else
    {
      uint64_t v38 = 0LL;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
    }

    v28[6] = v36;
    v28[7] = v37;
    uint64_t v29 = v38;
    v28[2] = v32;
    v28[3] = v33;
    v28[4] = v34;
    v28[5] = v35;
    v28[0] = v30;
    v28[1] = v31;
    -[CLHarvestDataTracks setDominantMotionActivity:](v4, "setDominantMotionActivity:", v28);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5 = objc_alloc(&OBJC_CLASS___CLLocation);
  if (self)
  {
    -[CLHarvestDataTracks location](self, "location");
  }

  else
  {
    __int128 v27 = 0u;
    memset(v28, 0, 28);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v20 = 0u;
  }

  v29[6] = v26;
  v29[7] = v27;
  v30[0] = v28[0];
  *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)((char *)v28 + 12);
  v29[2] = v22;
  v29[3] = v23;
  v29[4] = v24;
  v29[5] = v25;
  v29[0] = v20;
  v29[1] = v21;
  uint64_t v6 = -[CLLocation initWithClientLocation:](v5, "initWithClientLocation:", v29);
  [a3 encodeObject:v6 forKey:@"LocationKey"];

  -[CLHarvestDataTracks tripTimestamp](self, "tripTimestamp");
  *(float *)&double v7 = v7;
  [a3 encodeFloat:@"TripTimestampKey" forKey:v7];
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks tripId](self, "tripId"), @"TripIdKey");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks rat](self, "rat"), @"RatKey");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks mcc](self, "mcc"), @"MccKey");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks mnc](self, "mnc"), @"MncKey");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLHarvestDataTracks context](self, "context"), @"ContextKey");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks bundleId](self, "bundleId"), @"BundleIdKey");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLHarvestDataTracks bundleIds](self, "bundleIds"), @"BundleIdsKey");
  objc_msgSend( a3,  "encodeInt:forKey:",  -[CLHarvestDataTracks modeIndicator](self, "modeIndicator"),  @"ModeIndicatorKey");
  objc_msgSend( a3,  "encodeObject:forKey:",  -[CLHarvestDataTracks activeAccessory](self, "activeAccessory"),  @"ActiveAccessoryKey");
  objc_msgSend( a3,  "encodeBool:forKey:",  -[CLHarvestDataTracks isProactiveLocationSession](self, "isProactiveLocationSession"),  @"IsProactiveLocationSessionKey");
  objc_msgSend( a3,  "encodeBool:forKey:",  -[CLHarvestDataTracks motionVehicleConnectedStateChanged](self, "motionVehicleConnectedStateChanged"),  @"MotionVehicleStateChangedKey");
  objc_msgSend( a3,  "encodeBool:forKey:",  -[CLHarvestDataTracks motionVehicleConnected](self, "motionVehicleConnected"),  @"MotionVehicleKey");
  float v8 = objc_alloc(&OBJC_CLASS___CLHarvestDataMotionActivity);
  if (self)
  {
    -[CLHarvestDataTracks rawMotionActivity](self, "rawMotionActivity");
  }

  else
  {
    uint64_t v19 = 0LL;
    memset(v18, 0, sizeof(v18));
  }

  double v9 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v8, "initWithMotionActivity:", v18);
  [a3 encodeObject:v9 forKey:@"RawMotionActivityKey"];

  uint64_t v10 = objc_alloc(&OBJC_CLASS___CLHarvestDataMotionActivity);
  if (self)
  {
    -[CLHarvestDataTracks motionActivity](self, "motionActivity");
  }

  else
  {
    uint64_t v17 = 0LL;
    memset(v16, 0, sizeof(v16));
  }

  double v11 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v10, "initWithMotionActivity:", v16);
  [a3 encodeObject:v11 forKey:@"MotionActivityKey"];

  uint64_t v12 = objc_alloc(&OBJC_CLASS___CLHarvestDataMotionActivity);
  if (self)
  {
    -[CLHarvestDataTracks dominantMotionActivity](self, "dominantMotionActivity");
  }

  else
  {
    uint64_t v15 = 0LL;
    memset(v14, 0, sizeof(v14));
  }

  double v13 = -[CLHarvestDataMotionActivity initWithMotionActivity:](v12, "initWithMotionActivity:", v14);
  [a3 encodeObject:v13 forKey:@"DominantMotionActivityKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHarvestDataTracks)initWithTracksData:(HarvestData *)a3 andLocation:
{
  v4 = v3;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___CLHarvestDataTracks;
  uint64_t v6 = -[CLHarvestDataTracks init](&v36, "init");
  double v7 = v6;
  if (v6)
  {
    __int128 v8 = v4[7];
    v34[6] = v4[6];
    v34[7] = v8;
    v35[0] = v4[8];
    *(_OWORD *)((char *)v35 + 12) = *(_OWORD *)((char *)v4 + 140);
    __int128 v9 = v4[3];
    v34[2] = v4[2];
    v34[3] = v9;
    __int128 v10 = v4[5];
    v34[4] = v4[4];
    v34[5] = v10;
    __int128 v11 = v4[1];
    v34[0] = *v4;
    v34[1] = v11;
    -[CLHarvestDataTracks setLocation:](v6, "setLocation:", v34);
    -[CLHarvestDataTracks setTripTimestamp:](v7, "setTripTimestamp:", a3->var0);
    p_var1 = &a3->var1;
    -[CLHarvestDataTracks setTripId:]( v7,  "setTripId:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", p_var1));
    -[CLHarvestDataTracks setRat:](v7, "setRat:", a3->var1.__r_.var0);
    -[CLHarvestDataTracks setMcc:](v7, "setMcc:", *(unsigned int *)&a3->var1.__r_.var1);
    -[CLHarvestDataTracks setMnc:](v7, "setMnc:", LODWORD(a3->var1.var0));
    -[CLHarvestDataTracks setContext:](v7, "setContext:", HIDWORD(a3->var1.var0));
    double v13 = a3 + 1;
    if (a3[1].var1.__r_.__value_.var0.var0.__data_[15] < 0) {
      double v13 = *(HarvestData **)&v13->var0;
    }
    -[CLHarvestDataTracks setBundleId:]( v7,  "setBundleId:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v13));
    uint64_t v14 = &a3[1].var1.__r_.__value_.var0.var1 + 1;
    if (SHIBYTE(a3[1].var1.var0) < 0) {
      uint64_t v14 = (void *)*v14;
    }
    -[CLHarvestDataTracks setBundleIds:]( v7,  "setBundleIds:",  +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v14));
    -[CLHarvestDataTracks setIsProactiveLocationSession:](v7, "setIsProactiveLocationSession:", BYTE4(a3[2].var0));
    -[CLHarvestDataTracks setMotionVehicleConnectedStateChanged:]( v7,  "setMotionVehicleConnectedStateChanged:",  BYTE5(a3[2].var0));
    -[CLHarvestDataTracks setMotionVehicleConnected:](v7, "setMotionVehicleConnected:", BYTE6(a3[2].var0));
    __int128 v15 = *(_OWORD *)&a3[3].var1.var0;
    __int128 v16 = *((_OWORD *)&a3[4].var1.__r_.__value_.var0.var1 + 1);
    v32[6] = *(_OWORD *)a3[4].var1.__r_.__value_.var0.var0.__data_;
    v32[7] = v16;
    int64_t var0 = a3[4].var1.var0;
    __int128 v17 = *((_OWORD *)&a3[2].var1.__r_.__value_.var0.var1 + 1);
    __int128 v18 = *(_OWORD *)a3[3].var1.__r_.__value_.var0.var0.__data_;
    v32[2] = *(_OWORD *)&a3[2].var1.var0;
    v32[3] = v18;
    v32[4] = *((_OWORD *)&a3[3].var1.__r_.__value_.var0.var1 + 1);
    v32[5] = v15;
    v32[0] = *(_OWORD *)a3[2].var1.__r_.__value_.var0.var0.__data_;
    v32[1] = v17;
    -[CLHarvestDataTracks setRawMotionActivity:](v7, "setRawMotionActivity:", v32);
    __int128 v19 = *(_OWORD *)&a3[7].var1.__r_.__value_.var0.var1.__size_;
    v30[6] = *(_OWORD *)&a3[7].var0;
    v30[7] = v19;
    uint64_t v31 = *(void *)&a3[7].var1.__r_.var0;
    __int128 v20 = *(_OWORD *)&a3[6].var0;
    _OWORD v30[2] = *(_OWORD *)&a3[5].var1.__r_.var0;
    v30[3] = v20;
    __int128 v21 = *(_OWORD *)&a3[6].var1.__r_.var0;
    v30[4] = *(_OWORD *)&a3[6].var1.__r_.__value_.var0.var1.__size_;
    v30[5] = v21;
    __int128 v22 = *(_OWORD *)&a3[5].var1.__r_.__value_.var0.var1.__size_;
    v30[0] = *(_OWORD *)&a3[5].var0;
    v30[1] = v22;
    -[CLHarvestDataTracks setMotionActivity:](v7, "setMotionActivity:", v30);
    __int128 v23 = *(_OWORD *)a3[10].var1.__r_.__value_.var0.var0.__data_;
    v28[6] = *(_OWORD *)&a3[9].var1.var0;
    v28[7] = v23;
    uint64_t v29 = *((void *)&a3[10].var1.__r_.__value_.var0.var1 + 2);
    __int128 v24 = *(_OWORD *)&a3[8].var1.var0;
    _OWORD v28[2] = *((_OWORD *)&a3[8].var1.__r_.__value_.var0.var1 + 1);
    v28[3] = v24;
    __int128 v25 = *((_OWORD *)&a3[9].var1.__r_.__value_.var0.var1 + 1);
    v28[4] = *(_OWORD *)a3[9].var1.__r_.__value_.var0.var0.__data_;
    v28[5] = v25;
    __int128 v26 = *(_OWORD *)a3[8].var1.__r_.__value_.var0.var0.__data_;
    v28[0] = *(_OWORD *)&a3[7].var1.var0;
    v28[1] = v26;
    -[CLHarvestDataTracks setDominantMotionActivity:](v7, "setDominantMotionActivity:", v28);
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHarvestDataTracks;
  -[CLHarvestDataTracks dealloc](&v3, "dealloc");
}

- (id)jsonObject
{
  v16[0] = @"location";
  objc_super v3 = objc_alloc(&OBJC_CLASS___CLLocation);
  if (self)
  {
    -[CLHarvestDataTracks location](self, "location");
  }

  else
  {
    __int128 v12 = 0u;
    memset(v13, 0, 28);
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    __int128 v5 = 0u;
  }

  v14[6] = v11;
  v14[7] = v12;
  v15[0] = v13[0];
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)v13 + 12);
  v14[2] = v7;
  v14[3] = v8;
  v14[4] = v9;
  v14[5] = v10;
  v14[0] = v5;
  v14[1] = v6;
  v17[0] = -[CLLocation jsonObject](  -[CLLocation initWithClientLocation:]( v3,  "initWithClientLocation:",  v14,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13[0],  *(void *)&v13[1],  *((void *)&v13[1] + 1)),  "jsonObject");
  v16[1] = @"tripTimestamp";
  -[CLHarvestDataTracks tripTimestamp](self, "tripTimestamp");
  v17[1] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:");
  v16[2] = @"tripId";
  v17[2] = -[CLHarvestDataTracks tripId](self, "tripId");
  v16[3] = @"rat";
  v17[3] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", -[CLHarvestDataTracks rat](self, "rat"));
  v16[4] = @"mcc";
  v17[4] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", -[CLHarvestDataTracks mcc](self, "mcc"));
  v16[5] = @"mnc";
  v17[5] = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", -[CLHarvestDataTracks mnc](self, "mnc"));
  v16[6] = @"context";
  v17[6] = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[CLHarvestDataTracks context](self, "context"));
  v16[7] = @"bundleId";
  v17[7] = -[CLHarvestDataTracks bundleId](self, "bundleId");
  _OWORD v16[8] = @"bundleIds";
  v17[8] = -[CLHarvestDataTracks bundleIds](self, "bundleIds");
  v16[9] = @"modeIndicator";
  v17[9] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CLHarvestDataTracks modeIndicator](self, "modeIndicator"));
  v16[10] = @"isProactiveLocationSession";
  v17[10] = +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[CLHarvestDataTracks isProactiveLocationSession](self, "isProactiveLocationSession"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  11LL);
}

- (id)description
{
  return  -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  -[CLHarvestDataTracks jsonObject](self, "jsonObject"),  0LL,  0LL),  4LL);
}

- (CLDaemonLocation)location
{
  $AB5116BA7E623E054F959CECB034F4E7 v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self[3].course;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self[3].speed;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self[3].timestamp;
  __int128 v4 = *(_OWORD *)&self[3].suitability;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[2].ellipsoidalAltitude;
  *(_OWORD *)&retstr->speed = v4;
  __int128 v5 = *(_OWORD *)&self[3].altitude;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self[3].coordinate.longitude;
  *(_OWORD *)&retstr->timestamp = v5;
  __int128 v6 = *(_OWORD *)&self[2].referenceFrame;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self[2].rawCourse;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)(&self[3].confidence + 1);
  return self;
}

- (void)setLocation:(CLDaemonLocation *)a3
{
  __int128 v3 = *(_OWORD *)&a3->coordinate.longitude;
  *(_OWORD *)&self->_location.suitability = *(_OWORD *)&a3->suitability;
  *(_OWORD *)&self->_location.coordinate.longitude = v3;
  __int128 v4 = *(_OWORD *)&a3->altitude;
  __int128 v5 = *(_OWORD *)&a3->speed;
  __int128 v6 = *(_OWORD *)&a3->timestamp;
  *(_OWORD *)&self->_location.course = *(_OWORD *)&a3->course;
  *(_OWORD *)&self->_location.timestamp = v6;
  *(_OWORD *)&self->_location.altitude = v4;
  *(_OWORD *)&self->_location.speed = v5;
  __int128 v7 = *(_OWORD *)&a3->lifespan;
  $AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = a3->rawCoordinate;
  __int128 v9 = *(_OWORD *)&a3->rawCourse;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->integrity;
  self->_location.$AB5116BA7E623E054F959CECB034F4E7 rawCoordinate = rawCoordinate;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- (double)tripTimestamp
{
  return self->_tripTimestamp;
}

- (void)setTripTimestamp:(double)a3
{
  self->_tripTimestamp = a3;
}

- (NSString)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
}

- (int)rat
{
  return self->_rat;
}

- (void)setRat:(int)a3
{
  self->_rat = a3;
}

- (int)mcc
{
  return self->_mcc;
}

- (void)setMcc:(int)a3
{
  self->_mcc = a3;
}

- (int)mnc
{
  return self->_mnc;
}

- (void)setMnc:(int)a3
{
  self->_mnc = a3;
}

- (int)context
{
  return self->_context;
}

- (void)setContext:(int)a3
{
  self->_context = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (int)modeIndicator
{
  return self->_modeIndicator;
}

- (void)setModeIndicator:(int)a3
{
  self->_modeIndicator = a3;
}

- (CLPAccessoryMeta)activeAccessory
{
  return self->_activeAccessory;
}

- (void)setActiveAccessory:(id)a3
{
}

- (BOOL)isProactiveLocationSession
{
  return self->_isProactiveLocationSession;
}

- (void)setIsProactiveLocationSession:(BOOL)a3
{
  self->_isProactiveLocationSession = a3;
}

- (BOOL)motionVehicleConnectedStateChanged
{
  return self->_motionVehicleConnectedStateChanged;
}

- (void)setMotionVehicleConnectedStateChanged:(BOOL)a3
{
  self->_motionVehicleConnectedStateChanged = a3;
}

- (BOOL)motionVehicleConnected
{
  return self->_motionVehicleConnected;
}

- (void)setMotionVehicleConnected:(BOOL)a3
{
  self->_motionVehicleConnected = a3;
}

- (CLMotionActivity)rawMotionActivity
{
  __int128 v10 = *(_OWORD *)&self[1].fsmTransitionData.fConsecStatic;
  __int128 v11 = *(_OWORD *)&self[2].conservativeMountedProbability;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[2].source;
  *(_OWORD *)&retstr[1].isStanding = v11;
  *(double *)&retstr[1].isVehicleConnected = self[2].timestamp;
  __int128 v12 = *(_OWORD *)&self[1].source;
  __int128 v13 = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[1].conservativeMountedProbability;
  *(_OWORD *)&retstr->isVehicleConnected = v13;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[1].estExitTime;
  *(_OWORD *)&retstr[1].type = v10;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self->fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->mountedConfidence = v12;
  return self;
}

- (void)setRawMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_rawMotionActivity.type = *(_OWORD *)&a3->type;
  __int128 v12 = *(_OWORD *)&a3->mountedConfidence;
  __int128 v13 = *(_OWORD *)&a3->isStanding;
  __int128 v14 = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_rawMotionActivity.vehicleType = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_rawMotionActivity.isVehicleConnected = v14;
  *(_OWORD *)&self->_rawMotionActivity.isStanding = v13;
  *(_OWORD *)&self->_rawMotionActivity.mountedConfidence = v12;
  __int128 v15 = *(_OWORD *)&a3[1].type;
  __int128 v16 = *(_OWORD *)&a3[1].mountedConfidence;
  __int128 v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_98[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_98[32] = v17;
  *(_OWORD *)&self->_anon_98[16] = v16;
  *(_OWORD *)self->_anon_98 = v15;
}

- (CLMotionActivity)motionActivity
{
  __int128 v10 = *(_OWORD *)&self[4].type;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[3].vehicleType;
  *(_OWORD *)&retstr[1].isStanding = v10;
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[4].mountedConfidence;
  __int128 v11 = *(_OWORD *)&self[3].mountedConfidence;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[3].type;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  __int128 v12 = *(_OWORD *)&self[3].isVehicleConnected;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[3].isStanding;
  *(_OWORD *)&retstr[1].type = v12;
  __int128 v13 = *(_OWORD *)&self[2].vehicleType;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[2].isVehicleConnected;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_motionActivity.type = *(_OWORD *)&a3->type;
  __int128 v12 = *(_OWORD *)&a3->mountedConfidence;
  __int128 v13 = *(_OWORD *)&a3->isStanding;
  __int128 v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_motionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_motionActivity.vehicleType = v14;
  *(_OWORD *)&self->_motionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_motionActivity.isStanding = v13;
  __int128 v15 = *(_OWORD *)&a3[1].type;
  __int128 v16 = *(_OWORD *)&a3[1].mountedConfidence;
  __int128 v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_120[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_120[16] = v16;
  *(_OWORD *)&self->_anon_120[32] = v17;
  *(_OWORD *)self->_anon_120 = v15;
}

- (CLMotionActivity)dominantMotionActivity
{
  *(void *)&retstr[1].isVehicleConnected = *(void *)&self[5].fsmTransitionData.fConsecStatic;
  __int128 v10 = *(_OWORD *)&self[5].estExitTime;
  *(_OWORD *)&retstr[1].mountedConfidence = *(_OWORD *)&self[5].timestamp;
  *(_OWORD *)&retstr[1].isStanding = v10;
  __int128 v11 = *(_OWORD *)&self[4].fsmTransitionData.fConsecStatic;
  *(_OWORD *)&retstr->isStanding = *(_OWORD *)&self[4].estExitTime;
  *(_OWORD *)&retstr->isVehicleConnected = v11;
  __int128 v12 = *(_OWORD *)&self[5].conservativeMountedProbability;
  *(_OWORD *)&retstr->vehicleType = *(_OWORD *)&self[5].source;
  *(_OWORD *)&retstr[1].type = v12;
  __int128 v13 = *(_OWORD *)&self[4].timestamp;
  *(_OWORD *)&retstr->type = *(_OWORD *)&self[4].conservativeMountedProbability;
  *(_OWORD *)&retstr->mountedConfidence = v13;
  return self;
}

- (void)setDominantMotionActivity:(CLMotionActivity *)a3
{
  *(_OWORD *)&self->_dominantMotionActivity.type = *(_OWORD *)&a3->type;
  __int128 v12 = *(_OWORD *)&a3->mountedConfidence;
  __int128 v13 = *(_OWORD *)&a3->isStanding;
  __int128 v14 = *(_OWORD *)&a3->vehicleType;
  *(_OWORD *)&self->_dominantMotionActivity.isVehicleConnected = *(_OWORD *)&a3->isVehicleConnected;
  *(_OWORD *)&self->_dominantMotionActivity.vehicleType = v14;
  *(_OWORD *)&self->_dominantMotionActivity.mountedConfidence = v12;
  *(_OWORD *)&self->_dominantMotionActivity.isStanding = v13;
  __int128 v15 = *(_OWORD *)&a3[1].type;
  __int128 v16 = *(_OWORD *)&a3[1].mountedConfidence;
  __int128 v17 = *(_OWORD *)&a3[1].isStanding;
  *(void *)&self->_anon_1a8[48] = *(void *)&a3[1].isVehicleConnected;
  *(_OWORD *)&self->_anon_1a8[16] = v16;
  *(_OWORD *)&self->_anon_1a8[32] = v17;
  *(_OWORD *)self->_anon_1a8 = v15;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 120) = 0xFFFF;
  *(_OWORD *)((char *)self + 484) = 0u;
  __asm { FMOV            V2.2D, #-1.0 }

  *(_OWORD *)((char *)self + 500) = xmmword_1012E0070;
  *(_OWORD *)((char *)self + 516) = _Q2;
  *(_OWORD *)((char *)self + 532) = _Q2;
  *(_OWORD *)((char *)self + 548) = _Q2;
  *((_DWORD *)self + 141) = 0;
  *((void *)self + 71) = 0xBFF0000000000000LL;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 0;
  *(void *)((char *)self + 596) = 0xBFF0000000000000LL;
  *((_DWORD *)self + 151) = 0x7FFFFFFF;
  *((void *)self + 76) = 0LL;
  *((void *)self + 78) = 0LL;
  *((void *)self + 77) = 0LL;
  *((_BYTE *)self + 632) = 0;
  return self;
}

@end