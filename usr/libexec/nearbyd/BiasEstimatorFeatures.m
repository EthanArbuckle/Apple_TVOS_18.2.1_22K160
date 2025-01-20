@interface BiasEstimatorFeatures
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3;
- (BiasEstimatorFeatures)initWithCoder:(id)a3;
- (NSArray)cirPacket1;
- (NSArray)cirPacket2;
- (double)firstPathIndexPacket1;
- (double)firstPathIndexPacket2;
- (double)leadingEdgePacket1;
- (double)leadingEdgePacket2;
- (double)rssiDbm;
- (double)rttInitiator;
- (double)rttResponder;
- (double)soiRssiDbm;
- (double)tatInitiator;
- (double)tatResponder;
- (double)timestamp;
- (double)toaNoiseRms;
- (double)toaPpwinPeak;
- (double)toaPpwinRms;
- (double)tofPicSecond;
- (double)uwbTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)populateOrderedInputFeature;
- (int)antennaMask;
- (int)rxAntennaPacket1;
- (int)rxAntennaPacket2;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAntennaMask:(int)a3;
- (void)setCirPacket1:(id)a3;
- (void)setCirPacket2:(id)a3;
- (void)setFirstPathIndexPacket1:(double)a3;
- (void)setFirstPathIndexPacket2:(double)a3;
- (void)setLeadingEdgePacket1:(double)a3;
- (void)setLeadingEdgePacket2:(double)a3;
- (void)setRssiDbm:(double)a3;
- (void)setRttInitiator:(double)a3;
- (void)setRttResponder:(double)a3;
- (void)setRxAntennaPacket1:(int)a3;
- (void)setRxAntennaPacket2:(int)a3;
- (void)setSoiRssiDbm:(double)a3;
- (void)setTatInitiator:(double)a3;
- (void)setTatResponder:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setToaNoiseRms:(double)a3;
- (void)setToaPpwinPeak:(double)a3;
- (void)setToaPpwinRms:(double)a3;
- (void)setTofPicSecond:(double)a3;
- (void)setUwbTime:(double)a3;
@end

@implementation BiasEstimatorFeatures

- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v30 handleFailureInMethod:a2, self, @"UWBSignalFeatures.mm", 43, @"Invalid parameter not satisfying: %@", @"features" object file lineNumber description];
  }

  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___BiasEstimatorFeatures;
  v6 = -[BiasEstimatorFeatures init](&v31, "init");
  if (v6)
  {
    v6->_antennaMask = [v5 antennaMask];
    [v5 uwbTime];
    v6->_uwbTime = v7;
    [v5 timestamp];
    v6->_timestamp = v8;
    [v5 tofPicSecond];
    v6->_tofPicSecond = v9;
    [v5 rssiDbm];
    v6->_rssiDbm = v10;
    [v5 soiRssiDbm];
    v6->_soiRssiDbm = v11;
    [v5 toaNoiseRms];
    v6->_toaNoiseRms = v12;
    [v5 toaPpwinRms];
    v6->_toaPpwinRms = v13;
    [v5 toaPpwinPeak];
    v6->_toaPpwinPeak = v14;
    [v5 rttInitiator];
    v6->_rttInitiator = v15;
    [v5 tatInitiator];
    v6->_tatInitiator = v16;
    [v5 rttResponder];
    v6->_rttResponder = v17;
    [v5 tatResponder];
    v6->_tatResponder = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 cirPacket1]);
    v20 = (NSArray *)[v19 copy];
    cirPacket1 = v6->_cirPacket1;
    v6->_cirPacket1 = v20;

    [v5 leadingEdgePacket1];
    v6->_leadingEdgePacket1 = v22;
    [v5 firstPathIndexPacket1];
    v6->_firstPathIndexPacket1 = v23;
    v6->_rxAntennaPacket1 = [v5 rxAntennaPacket1];
    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 cirPacket2]);
    v25 = (NSArray *)[v24 copy];
    cirPacket2 = v6->_cirPacket2;
    v6->_cirPacket2 = v25;

    [v5 leadingEdgePacket2];
    v6->_leadingEdgePacket2 = v27;
    [v5 firstPathIndexPacket2];
    v6->_firstPathIndexPacket2 = v28;
    v6->_rxAntennaPacket2 = [v5 rxAntennaPacket2];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_antennaMask forKey:@"antennaMask"];
  [v4 encodeDouble:@"uwbTime" forKey:self->_uwbTime];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeDouble:@"tofPicSecond" forKey:self->_tofPicSecond];
  [v4 encodeDouble:@"rssiDbm" forKey:self->_rssiDbm];
  [v4 encodeDouble:@"soiRssiDbm" forKey:self->_soiRssiDbm];
  [v4 encodeDouble:@"toaNoiseRms" forKey:self->_toaNoiseRms];
  [v4 encodeDouble:@"toaPpwinRms" forKey:self->_toaPpwinRms];
  [v4 encodeDouble:@"toaPpwinPeak" forKey:self->_toaPpwinPeak];
  [v4 encodeDouble:@"rttInitiator" forKey:self->_rttInitiator];
  [v4 encodeDouble:@"tatInitiator" forKey:self->_tatInitiator];
  [v4 encodeDouble:@"rttResponder" forKey:self->_rttResponder];
  [v4 encodeDouble:@"tatResponder" forKey:self->_tatResponder];
  [v4 encodeObject:self->_cirPacket1 forKey:@"cirPacket1"];
  [v4 encodeDouble:@"leadingEdgePacket1" forKey:self->_leadingEdgePacket1];
  [v4 encodeDouble:@"firstPathIndexPacket1" forKey:self->_firstPathIndexPacket1];
  [v4 encodeInt:self->_rxAntennaPacket1 forKey:@"rxAntennaPacket1"];
  [v4 encodeObject:self->_cirPacket2 forKey:@"cirPacket2"];
  [v4 encodeDouble:@"leadingEdgePacket2" forKey:self->_leadingEdgePacket2];
  [v4 encodeDouble:@"firstPathIndexPacket2" forKey:self->_firstPathIndexPacket2];
  [v4 encodeInt:self->_rxAntennaPacket2 forKey:@"rxAntennaPacket2"];
}

- (BiasEstimatorFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntForKey:@"antennaMask"];
  [v4 decodeDoubleForKey:@"uwbTime"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"timestamp"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"tofPicSecond"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"soiRssiDbm"];
  double v48 = v12;
  [v4 decodeDoubleForKey:@"rssiDbm"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"toaNoiseRms"];
  double v47 = v15;
  [v4 decodeDoubleForKey:@"toaPpwinRms"];
  double v46 = v16;
  [v4 decodeDoubleForKey:@"toaPpwinPeak"];
  double v45 = v17;
  [v4 decodeDoubleForKey:@"rttInitiator"];
  double v44 = v18;
  [v4 decodeDoubleForKey:@"tatInitiator"];
  double v43 = v19;
  [v4 decodeDoubleForKey:@"rttResponder"];
  double v42 = v20;
  [v4 decodeDoubleForKey:@"tatResponder"];
  double v41 = v21;
  id v23 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(Complex, v22),  @"cirPacket1");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  [v4 decodeDoubleForKey:@"leadingEdgePacket1"];
  double v26 = v25;
  [v4 decodeDoubleForKey:@"firstPathIndexPacket1"];
  double v28 = v27;
  id v29 = [v4 decodeIntForKey:@"rxAntennaPacket1"];
  id v31 = objc_msgSend( v4,  "decodeArrayOfObjectsOfClass:forKey:",  objc_opt_class(Complex, v30),  @"cirPacket2");
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  [v4 decodeDoubleForKey:@"leadingEdgePacket2"];
  double v34 = v33;
  [v4 decodeDoubleForKey:@"firstPathIndexPacket2"];
  double v36 = v35;
  id v37 = [v4 decodeIntForKey:@"rxAntennaPacket2"];
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___BiasEstimatorFeatures;
  v38 = -[BiasEstimatorFeatures init](&v49, "init");
  v39 = v38;
  if (v38)
  {
    -[BiasEstimatorFeatures setAntennaMask:](v38, "setAntennaMask:", v5);
    -[BiasEstimatorFeatures setUwbTime:](v39, "setUwbTime:", v7);
    -[BiasEstimatorFeatures setTimestamp:](v39, "setTimestamp:", v9);
    -[BiasEstimatorFeatures setTofPicSecond:](v39, "setTofPicSecond:", v11);
    -[BiasEstimatorFeatures setRssiDbm:](v39, "setRssiDbm:", v14);
    -[BiasEstimatorFeatures setSoiRssiDbm:](v39, "setSoiRssiDbm:", v48);
    -[BiasEstimatorFeatures setToaNoiseRms:](v39, "setToaNoiseRms:", v47);
    -[BiasEstimatorFeatures setToaPpwinRms:](v39, "setToaPpwinRms:", v46);
    -[BiasEstimatorFeatures setToaPpwinPeak:](v39, "setToaPpwinPeak:", v45);
    -[BiasEstimatorFeatures setRttInitiator:](v39, "setRttInitiator:", v44);
    -[BiasEstimatorFeatures setTatInitiator:](v39, "setTatInitiator:", v43);
    -[BiasEstimatorFeatures setRttResponder:](v39, "setRttResponder:", v42);
    -[BiasEstimatorFeatures setTatResponder:](v39, "setTatResponder:", v41);
    -[BiasEstimatorFeatures setCirPacket1:](v39, "setCirPacket1:", v24);
    -[BiasEstimatorFeatures setLeadingEdgePacket1:](v39, "setLeadingEdgePacket1:", v26);
    -[BiasEstimatorFeatures setFirstPathIndexPacket1:](v39, "setFirstPathIndexPacket1:", v28);
    -[BiasEstimatorFeatures setRxAntennaPacket1:](v39, "setRxAntennaPacket1:", v29);
    -[BiasEstimatorFeatures setCirPacket2:](v39, "setCirPacket2:", v32);
    -[BiasEstimatorFeatures setLeadingEdgePacket2:](v39, "setLeadingEdgePacket2:", v34);
    -[BiasEstimatorFeatures setFirstPathIndexPacket2:](v39, "setFirstPathIndexPacket2:", v36);
    -[BiasEstimatorFeatures setRxAntennaPacket2:](v39, "setRxAntennaPacket2:", v37);
  }

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3),  "initWithBiasEstimatorFeatures:",  self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    double v7 = (BiasEstimatorFeatures *)v4;
    double v8 = v7;
    if (v7 == self)
    {
      BOOL v58 = 1;
LABEL_36:

      goto LABEL_37;
    }

    int antennaMask = self->_antennaMask;
    unsigned int v10 = -[BiasEstimatorFeatures antennaMask](v7, "antennaMask");
    double uwbTime = self->_uwbTime;
    -[BiasEstimatorFeatures uwbTime](v8, "uwbTime");
    double v13 = v12;
    double timestamp = self->_timestamp;
    -[BiasEstimatorFeatures timestamp](v8, "timestamp");
    double v16 = v15;
    double rssiDbm = self->_rssiDbm;
    -[BiasEstimatorFeatures rssiDbm](v8, "rssiDbm");
    double v19 = v18;
    double soiRssiDbm = self->_soiRssiDbm;
    -[BiasEstimatorFeatures soiRssiDbm](v8, "soiRssiDbm");
    double v22 = v21;
    double tofPicSecond = self->_tofPicSecond;
    -[BiasEstimatorFeatures tofPicSecond](v8, "tofPicSecond");
    double v82 = v23;
    double toaNoiseRms = self->_toaNoiseRms;
    -[BiasEstimatorFeatures toaNoiseRms](v8, "toaNoiseRms");
    double v80 = v24;
    double toaPpwinRms = self->_toaPpwinRms;
    -[BiasEstimatorFeatures toaPpwinRms](v8, "toaPpwinRms");
    double v78 = v25;
    double toaPpwinPeak = self->_toaPpwinPeak;
    -[BiasEstimatorFeatures toaPpwinPeak](v8, "toaPpwinPeak");
    double v76 = v26;
    double rttInitiator = self->_rttInitiator;
    -[BiasEstimatorFeatures rttInitiator](v8, "rttInitiator");
    double v74 = v27;
    double tatInitiator = self->_tatInitiator;
    -[BiasEstimatorFeatures tatInitiator](v8, "tatInitiator");
    double v72 = v28;
    double rttResponder = self->_rttResponder;
    -[BiasEstimatorFeatures rttResponder](v8, "rttResponder");
    double v70 = v29;
    double tatResponder = self->_tatResponder;
    -[BiasEstimatorFeatures tatResponder](v8, "tatResponder");
    double v68 = v30;
    cirPacket1 = self->_cirPacket1;
    if (!cirPacket1)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket1](v8, "cirPacket1"));

      if (!v32)
      {
        char v35 = 0;
LABEL_7:
        double leadingEdgePacket1 = self->_leadingEdgePacket1;
        -[BiasEstimatorFeatures leadingEdgePacket1](v8, "leadingEdgePacket1");
        double v66 = v36;
        double firstPathIndexPacket1 = self->_firstPathIndexPacket1;
        -[BiasEstimatorFeatures firstPathIndexPacket1](v8, "firstPathIndexPacket1");
        double v64 = v37;
        int rxAntennaPacket1 = self->_rxAntennaPacket1;
        unsigned int v39 = -[BiasEstimatorFeatures rxAntennaPacket1](v8, "rxAntennaPacket1");
        cirPacket2 = self->_cirPacket2;
        double v62 = v19;
        double v63 = rssiDbm;
        double v60 = v22;
        double v61 = soiRssiDbm;
        if (!cirPacket2)
        {
          uint64_t v41 = objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket2](v8, "cirPacket2"));

          if (!v41)
          {
            double v43 = v16;
            double v44 = timestamp;
            double v45 = v13;
            double v46 = uwbTime;
            goto LABEL_11;
          }

          cirPacket2 = self->_cirPacket2;
        }

        uint64_t v41 = objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket2](v8, "cirPacket2"));
        unsigned __int8 v42 = -[NSArray isEqualToArray:](cirPacket2, "isEqualToArray:", v41);
        double v43 = v16;
        double v44 = timestamp;
        double v45 = v13;
        double v46 = uwbTime;

        LOBYTE(v41) = v42 ^ 1;
LABEL_11:
        double leadingEdgePacket2 = self->_leadingEdgePacket2;
        -[BiasEstimatorFeatures leadingEdgePacket2](v8, "leadingEdgePacket2");
        double v49 = v48;
        double firstPathIndexPacket2 = self->_firstPathIndexPacket2;
        -[BiasEstimatorFeatures firstPathIndexPacket2](v8, "firstPathIndexPacket2");
        double v52 = v51;
        int rxAntennaPacket2 = self->_rxAntennaPacket2;
        unsigned int v54 = -[BiasEstimatorFeatures rxAntennaPacket2](v8, "rxAntennaPacket2");
        BOOL v56 = v46 != v45 || antennaMask != v10;
        if (v44 != v43) {
          BOOL v56 = 1;
        }
        if (tofPicSecond != v82) {
          BOOL v56 = 1;
        }
        if (v63 != v62) {
          BOOL v56 = 1;
        }
        if (v61 != v60) {
          BOOL v56 = 1;
        }
        if (toaNoiseRms != v80) {
          BOOL v56 = 1;
        }
        if (toaPpwinRms != v78) {
          BOOL v56 = 1;
        }
        BOOL v57 = (leadingEdgePacket2 == v49) & ~(v56 | (toaPpwinPeak != v76
                                                  || rttInitiator != v74
                                                  || tatInitiator != v72
                                                  || rttResponder != v70
                                                  || tatResponder != v68) | v35 | (leadingEdgePacket1 != v66) | (firstPathIndexPacket1 != v64) | (rxAntennaPacket1 != v39) | v41);
        if (firstPathIndexPacket2 != v52) {
          BOOL v57 = 0;
        }
        BOOL v58 = rxAntennaPacket2 == v54 && v57;
        goto LABEL_36;
      }

      cirPacket1 = self->_cirPacket1;
    }

    double v33 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorFeatures cirPacket1](v8, "cirPacket1"));
    unsigned __int8 v34 = -[NSArray isEqualToArray:](cirPacket1, "isEqualToArray:", v33);

    char v35 = v34 ^ 1;
    goto LABEL_7;
  }

  BOOL v58 = 0;
LABEL_37:

  return v58;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  uint64_t v6 = NSStringFromClass(v5);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  double v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  -[NSMutableString appendFormat:](v8, "appendFormat:", @"AntennaMask: %d", self->_antennaMask);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", current Timestamp: %f", *(void *)&self->_timestamp);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", uwbTime: %f", *(void *)&self->_uwbTime);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", tofPicSecond: %f", *(void *)&self->_tofPicSecond);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", rssiDbm: %.3f", *(void *)&self->_rssiDbm);
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", soiRssiDbm: %.3f", *(void *)&self->_soiRssiDbm);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", toaNoiseRms: %d",  (int)self->_toaNoiseRms);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", toaPpwinRms: %d",  (int)self->_toaPpwinRms);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", toaPpwinPeak: %d",  (int)self->_toaPpwinPeak);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", rttInitiator: %d",  (int)self->_rttInitiator);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", tatInitiator: %d",  (int)self->_tatInitiator);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", rttResponder: %d",  (int)self->_rttResponder);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", tatResponder: %d",  (int)self->_tatResponder);
  cirPacket1 = self->_cirPacket1;
  if (cirPacket1)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray description](cirPacket1, "description"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @", cirPacket1: %@", v10);
  }

  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", leadingEdgePacket1: %d",  (int)self->_leadingEdgePacket1);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", firstPathIndexPacket1: %d",  (int)self->_firstPathIndexPacket1);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", rxAntennaPacket1: %d",  self->_rxAntennaPacket1);
  cirPacket2 = self->_cirPacket2;
  if (cirPacket2)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray description](cirPacket2, "description"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @", cirPacket1: %@", v12);
  }

  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", leadingEdgePacket2: %d",  (int)self->_leadingEdgePacket2);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", firstPathIndexPacket2: %d",  (int)self->_firstPathIndexPacket2);
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", rxAntennaPacket2: %d>",  self->_rxAntennaPacket2);
  return v8;
}

- (id)populateOrderedInputFeature
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%d, %f, %f, %d, %.3f, %.3f",  self->_antennaMask,  *(void *)&self->_timestamp,  *(void *)&self->_uwbTime,  (int)self->_tofPicSecond,  *(void *)&self->_rssiDbm,  *(void *)&self->_soiRssiDbm);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %d, %d, %d",  (int)self->_toaNoiseRms,  (int)self->_toaPpwinRms,  (int)self->_toaPpwinPeak);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %llu, %llu, %llu, %llu",  (unint64_t)self->_rttInitiator,  (unint64_t)self->_tatInitiator,  (unint64_t)self->_rttResponder,  (unint64_t)self->_tatResponder);
  for (unint64_t i = 0LL; -[NSArray count](self->_cirPacket1, "count") > i; ++i)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 real]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket1, "objectAtIndex:", i));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 imag]);

    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %d, %d",  [v6 intValue],  objc_msgSend(v8, "intValue"));
  }

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %d, %d, %d",  (int)self->_leadingEdgePacket1,  (int)self->_firstPathIndexPacket1,  self->_rxAntennaPacket1);
  for (unint64_t j = 0LL; -[NSArray count](self->_cirPacket2, "count") > j; ++j)
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 real]);

    double v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_cirPacket2, "objectAtIndex:", j));
    double v13 = (void *)objc_claimAutoreleasedReturnValue([v12 imag]);

    -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %d, %d",  [v11 intValue],  objc_msgSend(v13, "intValue"));
  }

  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @", %d, %d, %d",  (int)self->_leadingEdgePacket2,  (int)self->_firstPathIndexPacket2,  self->_rxAntennaPacket2);
  return v3;
}

- (unint64_t)hash
{
  double v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_antennaMask));
  unint64_t v33 = (unint64_t)[v43 hash];
  unsigned __int8 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_uwbTime));
  unint64_t v31 = (unint64_t)[v42 hash];
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timestamp));
  unint64_t v30 = (unint64_t)[v41 hash];
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_tofPicSecond));
  unint64_t v28 = (unint64_t)[v40 hash];
  unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rssiDbm));
  unint64_t v27 = (unint64_t)[v39 hash];
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_soiRssiDbm));
  unint64_t v25 = (unint64_t)[v38 hash];
  double v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_toaNoiseRms));
  unint64_t v24 = (unint64_t)[v37 hash];
  double v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_toaPpwinRms));
  unint64_t v23 = (unint64_t)[v36 hash];
  char v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_toaPpwinPeak));
  unint64_t v21 = (unint64_t)[v35 hash];
  unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rttInitiator));
  unint64_t v20 = (unint64_t)[v34 hash];
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_tatInitiator));
  unint64_t v18 = (unint64_t)[v32 hash];
  double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rttResponder));
  unint64_t v17 = (unint64_t)[v29 hash];
  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_tatResponder));
  unint64_t v16 = (unint64_t)[v26 hash];
  unint64_t v15 = (unint64_t)-[NSArray hash](self->_cirPacket1, "hash");
  double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_leadingEdgePacket1));
  unint64_t v14 = (unint64_t)[v22 hash];
  double v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_firstPathIndexPacket1));
  unint64_t v3 = (unint64_t)[v19 hash];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_rxAntennaPacket1));
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = (unint64_t)-[NSArray hash](self->_cirPacket2, "hash");
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_leadingEdgePacket2));
  unint64_t v8 = (unint64_t)[v7 hash];
  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_firstPathIndexPacket2));
  unint64_t v10 = (unint64_t)[v9 hash];
  double v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_rxAntennaPacket2));
  unint64_t v12 = v31 ^ v33 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v5 ^ v6 ^ v8 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (int)antennaMask
{
  return self->_antennaMask;
}

- (void)setAntennaMask:(int)a3
{
  self->_int antennaMask = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)uwbTime
{
  return self->_uwbTime;
}

- (void)setUwbTime:(double)a3
{
  self->_double uwbTime = a3;
}

- (double)tofPicSecond
{
  return self->_tofPicSecond;
}

- (void)setTofPicSecond:(double)a3
{
  self->_double tofPicSecond = a3;
}

- (double)rssiDbm
{
  return self->_rssiDbm;
}

- (void)setRssiDbm:(double)a3
{
  self->_double rssiDbm = a3;
}

- (double)soiRssiDbm
{
  return self->_soiRssiDbm;
}

- (void)setSoiRssiDbm:(double)a3
{
  self->_double soiRssiDbm = a3;
}

- (double)toaNoiseRms
{
  return self->_toaNoiseRms;
}

- (void)setToaNoiseRms:(double)a3
{
  self->_double toaNoiseRms = a3;
}

- (double)toaPpwinRms
{
  return self->_toaPpwinRms;
}

- (void)setToaPpwinRms:(double)a3
{
  self->_double toaPpwinRms = a3;
}

- (double)toaPpwinPeak
{
  return self->_toaPpwinPeak;
}

- (void)setToaPpwinPeak:(double)a3
{
  self->_double toaPpwinPeak = a3;
}

- (double)rttInitiator
{
  return self->_rttInitiator;
}

- (void)setRttInitiator:(double)a3
{
  self->_double rttInitiator = a3;
}

- (double)tatInitiator
{
  return self->_tatInitiator;
}

- (void)setTatInitiator:(double)a3
{
  self->_double tatInitiator = a3;
}

- (double)rttResponder
{
  return self->_rttResponder;
}

- (void)setRttResponder:(double)a3
{
  self->_double rttResponder = a3;
}

- (double)tatResponder
{
  return self->_tatResponder;
}

- (void)setTatResponder:(double)a3
{
  self->_double tatResponder = a3;
}

- (NSArray)cirPacket1
{
  return self->_cirPacket1;
}

- (void)setCirPacket1:(id)a3
{
}

- (double)leadingEdgePacket1
{
  return self->_leadingEdgePacket1;
}

- (void)setLeadingEdgePacket1:(double)a3
{
  self->_double leadingEdgePacket1 = a3;
}

- (double)firstPathIndexPacket1
{
  return self->_firstPathIndexPacket1;
}

- (void)setFirstPathIndexPacket1:(double)a3
{
  self->_double firstPathIndexPacket1 = a3;
}

- (int)rxAntennaPacket1
{
  return self->_rxAntennaPacket1;
}

- (void)setRxAntennaPacket1:(int)a3
{
  self->_int rxAntennaPacket1 = a3;
}

- (NSArray)cirPacket2
{
  return self->_cirPacket2;
}

- (void)setCirPacket2:(id)a3
{
}

- (double)leadingEdgePacket2
{
  return self->_leadingEdgePacket2;
}

- (void)setLeadingEdgePacket2:(double)a3
{
  self->_double leadingEdgePacket2 = a3;
}

- (double)firstPathIndexPacket2
{
  return self->_firstPathIndexPacket2;
}

- (void)setFirstPathIndexPacket2:(double)a3
{
  self->_double firstPathIndexPacket2 = a3;
}

- (int)rxAntennaPacket2
{
  return self->_rxAntennaPacket2;
}

- (void)setRxAntennaPacket2:(int)a3
{
  self->_int rxAntennaPacket2 = a3;
}

- (void).cxx_destruct
{
}

@end