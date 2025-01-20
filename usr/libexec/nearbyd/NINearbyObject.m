@interface NINearbyObject
+ (BOOL)supportsSecureCoding;
+ (NINearbyObject)new;
+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5;
+ (id)objectFromBluetoothDevice:(id)a3;
- (BOOL)canInteract;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresBiasCorrection;
- (BOOL)resetARSession;
- (BOOL)revokeFindingExperience;
- (NIDiscoveryToken)discoveryToken;
- (NINearbyObject)init;
- (NINearbyObject)initWithCoder:(id)a3;
- (NINearbyObject)initWithNearbyObject:(id)a3;
- (NINearbyObject)initWithToken:(id)a3;
- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate;
- (NSData)bluetoothAdvertisingAddress;
- (NSNumber)spatialScore;
- (NSString)debugDisplayInfo;
- (NSString)deviceIdentifier;
- (NSString)name;
- (NSUUID)bluetoothPeerIdentifier;
- (UWBSignalFeatures)uwbSignalFeatures;
- (__n128)quaternion;
- (__n128)setQuaternion:(__n128 *)result;
- (__n128)worldPosition;
- (double)nbRssi;
- (double)rangeBiasEstimate;
- (double)rangeUncertainty;
- (double)signalStrength;
- (double)timestamp;
- (float)azimuth;
- (float)boundedRegionRange;
- (float)distance;
- (float)elevation;
- (float)horizontalAngle;
- (float)horizontalAngleAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)deviceIdentifer;
- (int64_t)algorithmSource;
- (int64_t)distanceMeasurementQuality;
- (int64_t)motionState;
- (simd_float3)direction;
- (unint64_t)hash;
- (unint64_t)relationship;
- (unsigned)mmsRxStatus;
- (unsigned)nbRxStatus;
- (unsigned)remoteTxAntennaMask;
- (void)encodeWithCoder:(id)a3;
- (void)overrideDirection:(NINearbyObject *)self;
- (void)overrideDistance:(float)a3;
- (void)overrideDistanceMeasurementQuality:(int64_t)a3;
- (void)overrideMotionState:(int64_t)a3;
- (void)overrideRelationship:(unint64_t)a3;
- (void)overrideSpatialScore:(id)a3;
- (void)overrideTimestamp:(float)a3;
- (void)setAlgorithmSource:(int64_t)a3;
- (void)setAzimuth:(float)a3;
- (void)setBluetoothAdvertisingAddress:(id)a3;
- (void)setBluetoothPeerIdentifier:(id)a3;
- (void)setBoundedRegionRange:(float)a3;
- (void)setCanInteract:(BOOL)a3;
- (void)setDebugDisplayInfo:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDirection:(NINearbyObject *)self;
- (void)setDiscoveryToken:(id)a3;
- (void)setDistance:(float)a3;
- (void)setDistanceMeasurementQuality:(int64_t)a3;
- (void)setElevation:(float)a3;
- (void)setHorizontalAngle:(float)a3;
- (void)setHorizontalAngleAccuracy:(float)a3;
- (void)setMmsRxStatus:(unsigned __int8)a3;
- (void)setMotionState:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNbRssi:(double)a3;
- (void)setNbRxStatus:(unsigned __int8)a3;
- (void)setRangeBiasEstimate:(double)a3;
- (void)setRangeUncertainty:(double)a3;
- (void)setRelationship:(unint64_t)a3;
- (void)setRemoteTxAntennaMask:(unsigned __int8)a3;
- (void)setRequiresBiasCorrection:(BOOL)a3;
- (void)setResetARSession:(BOOL)a3;
- (void)setRevokeFindingExperience:(BOOL)a3;
- (void)setSignalStrength:(double)a3;
- (void)setSpatialScore:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUwbSignalFeatures:(id)a3;
- (void)setVerticalDirectionEstimate:(int64_t)a3;
- (void)setWorldPosition:(NINearbyObject *)self;
@end

@implementation NINearbyObject

- (NINearbyObject)initWithToken:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v24 handleFailureInMethod:a2, self, @"NINearbyObject.mm", 105, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___NINearbyObject;
  v7 = -[NINearbyObject init](&v25, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryToken, a3);
    v8->_distance = NINearbyObjectDistanceNotAvailable;
    simd_float3 v9 = NINearbyObjectDirectionNotAvailable;
    v8->_distanceMeasurementQuality = 0LL;
    int v10 = NINearbyObjectElevationNotAvailable;
    LODWORD(v8->_azimuth) = NINearbyObjectAzimuthNotAvailable;
    LODWORD(v8->_elevation) = v10;
    __int128 v11 = NINearbyObjectQuaternionNotAvailable;
    *(simd_float3 *)v8->_direction = v9;
    *(_OWORD *)v8->_anon_d0 = v11;
    *(void *)&v8->_timestamp = qword_1008007A0;
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_relationship = 4LL;
    v8->_deviceIdentifier = 0LL;

    name = v8->_name;
    v8->_motionState = 0LL;
    v8->_name = 0LL;
    v8->_verticalDirectionEstimate = 0LL;
    float v14 = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngle = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngleAccuracy = v14;

    spatialScore = v8->_spatialScore;
    v8->_spatialScore = 0LL;

    bluetoothAdvertisingAddress = v8->_bluetoothAdvertisingAddress;
    v8->_bluetoothAdvertisingAddress = 0LL;

    bluetoothPeerIdentifier = v8->_bluetoothPeerIdentifier;
    v8->_bluetoothPeerIdentifier = 0LL;

    uint64_t v18 = NINearbyObjectSignalStrengthNotAvailable;
    v8->_remoteTxAntennaMask = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
    uint64_t v19 = NINearbyObjectRangeBiasEstimateNotAvailable;
    *(void *)&v8->_signalStrength = v18;
    *(void *)&v8->_rangeBiasEstimate = v19;
    *(void *)&v8->_rangeUncertainty = NINearbyObjectRangeUncertaintyNotAvailable;
    *(_OWORD *)v8->_worldPosition = NINearbyObjectWorldPositionNotAvailable;
    v8->_requiresBiasCorrection = byte_1008007A9;
    uwbSignalFeatures = v8->_uwbSignalFeatures;
    v8->_uwbSignalFeatures = 0LL;

    char v21 = NINearbyObjectRxStatusNotAvailable;
    v8->_nbRxStatus = NINearbyObjectRxStatusNotAvailable;
    v8->_mmsRxStatus = v21;
    *(void *)&v8->_nbRssi = NINearbyObjectNbRssiNotAvailable;
    *(_WORD *)&v8->_canInteract = 1;
    v8->_revokeFindingExperience = 0;
    LODWORD(v8->_boundedRegionRange) = NINearbyObjectRegionBoundaryRangeNotAvailable;
    debugDisplayInfo = v8->_debugDisplayInfo;
    v8->_algorithmSource = 1LL;
    v8->_debugDisplayInfo = 0LL;
  }

  return v8;
}

- (NINearbyObject)initWithNearbyObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"NINearbyObject.mm", 151, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }

  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___NINearbyObject;
  id v6 = -[NINearbyObject init](&v39, "init");
  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 discoveryToken]);
    discoveryToken = v6->_discoveryToken;
    v6->_discoveryToken = (NIDiscoveryToken *)v7;

    [v5 distance];
    v6->_distance = v9;
    [v5 direction];
    *(_OWORD *)v6->_direction = v10;
    v6->_distanceMeasurementQuality = (int64_t)[v5 distanceMeasurementQuality];
    [v5 azimuth];
    v6->_azimuth = v11;
    [v5 elevation];
    v6->_elevation = v12;
    [v5 quaternion];
    *(_OWORD *)v6->_anon_d0 = v13;
    v6->_relationship = (unint64_t)[v5 relationship];
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v14;

    [v5 timestamp];
    v6->_timestamp = v16;
    v6->_motionState = (int64_t)[v5 motionState];
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 name]);
    name = v6->_name;
    v6->_name = (NSString *)v17;

    v6->_verticalDirectionEstimate = (int64_t)[v5 verticalDirectionEstimate];
    [v5 horizontalAngle];
    v6->_horizontalAngle = v19;
    [v5 horizontalAngleAccuracy];
    v6->_horizontalAngleAccuracy = v20;
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 spatialScore]);
    spatialScore = v6->_spatialScore;
    v6->_spatialScore = (NSNumber *)v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue([v5 bluetoothAdvertisingAddress]);
    bluetoothAdvertisingAddress = v6->_bluetoothAdvertisingAddress;
    v6->_bluetoothAdvertisingAddress = (NSData *)v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v5 bluetoothPeerIdentifier]);
    bluetoothPeerIdentifier = v6->_bluetoothPeerIdentifier;
    v6->_bluetoothPeerIdentifier = (NSUUID *)v25;

    [v5 signalStrength];
    v6->_signalStrength = v27;
    v6->_remoteTxAntennaMask = [v5 remoteTxAntennaMask];
    [v5 rangeBiasEstimate];
    v6->_rangeBiasEstimate = v28;
    [v5 rangeUncertainty];
    v6->_rangeUncertainty = v29;
    [v5 worldPosition];
    *(_OWORD *)v6->_worldPosition = v30;
    v6->_requiresBiasCorrection = [v5 requiresBiasCorrection];
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v5 uwbSignalFeatures]);
    uwbSignalFeatures = v6->_uwbSignalFeatures;
    v6->_uwbSignalFeatures = (UWBSignalFeatures *)v31;

    v6->_nbRxStatus = [v5 nbRxStatus];
    v6->_mmsRxStatus = [v5 mmsRxStatus];
    [v5 nbRssi];
    v6->_nbRssi = v33;
    v6->_canInteract = [v5 canInteract];
    v6->_resetARSession = [v5 resetARSession];
    v6->_revokeFindingExperience = [v5 revokeFindingExperience];
    [v5 boundedRegionRange];
    v6->_boundedRegionRange = v34;
    v6->_algorithmSource = (int64_t)[v5 algorithmSource];
    uint64_t v35 = objc_claimAutoreleasedReturnValue([v5 debugDisplayInfo]);
    debugDisplayInfo = v6->_debugDisplayInfo;
    v6->_debugDisplayInfo = (NSString *)v35;
  }

  return v6;
}

- (NINearbyObject)init
{
}

+ (NINearbyObject)new
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  return _[v4 initWithNearbyObject:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_discoveryToken forKey:@"discoveryToken"];
  *(float *)&double v4 = self->_distance;
  [v10 encodeFloat:@"distance" forKey:v4];
  [v10 encodeVector3:@"direction" forKey:*(double *)self->_direction];
  *(float *)&double v5 = self->_azimuth;
  [v10 encodeFloat:@"azimuth" forKey:v5];
  *(float *)&double v6 = self->_elevation;
  [v10 encodeFloat:@"elevation" forKey:v6];
  [v10 encodeQuat:@"quaternion" forKey:*(double *)self->_anon_d0];
  [v10 encodeInteger:self->_relationship forKey:@"relationship"];
  [v10 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v10 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v10 encodeInteger:self->_distanceMeasurementQuality forKey:@"measurementQuality"];
  [v10 encodeInteger:self->_motionState forKey:@"motionState"];
  [v10 encodeObject:self->_name forKey:@"name"];
  [v10 encodeInteger:self->_verticalDirectionEstimate forKey:@"verticalDirectionEstimate"];
  *(float *)&double v7 = self->_horizontalAngle;
  [v10 encodeFloat:@"horizontalAngle" forKey:v7];
  *(float *)&double v8 = self->_horizontalAngleAccuracy;
  [v10 encodeFloat:@"horizontalAngleAccuracy" forKey:v8];
  [v10 encodeObject:self->_spatialScore forKey:@"spatialScore"];
  [v10 encodeObject:self->_bluetoothAdvertisingAddress forKey:@"bluetoothAdvertisingAddress"];
  [v10 encodeObject:self->_bluetoothPeerIdentifier forKey:@"bluetoothPeerIdentifier"];
  [v10 encodeDouble:@"signalStrength" forKey:self->_signalStrength];
  [v10 encodeInteger:self->_remoteTxAntennaMask forKey:@"remoteTxAntennaMask"];
  [v10 encodeDouble:@"rangeBiasEstimate" forKey:self->_rangeBiasEstimate];
  [v10 encodeDouble:@"rangeUncertainty" forKey:self->_rangeUncertainty];
  [v10 encodeVector3:@"worldPosition" forKey:*(double *)self->_worldPosition];
  [v10 encodeBool:self->_requiresBiasCorrection forKey:@"requiresBiasCorrection"];
  [v10 encodeObject:self->_uwbSignalFeatures forKey:@"uwbSignalFeatures"];
  [v10 encodeInteger:self->_nbRxStatus forKey:@"nbRxStatus"];
  [v10 encodeInteger:self->_mmsRxStatus forKey:@"mmsRxStatus"];
  [v10 encodeDouble:@"nbRssi" forKey:self->_nbRssi];
  [v10 encodeBool:self->_canInteract forKey:@"canInteract"];
  [v10 encodeBool:self->_resetARSession forKey:@"resetARSession"];
  [v10 encodeBool:self->_revokeFindingExperience forKey:@"revokeFindingExperience"];
  *(float *)&double v9 = self->_boundedRegionRange;
  [v10 encodeFloat:@"boundedRegionRange" forKey:v9];
  [v10 encodeInteger:self->_algorithmSource forKey:@"algorithmSource"];
  [v10 encodeObject:self->_debugDisplayInfo forKey:@"debugDisplayInfo"];
}

- (NINearbyObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NIDiscoveryToken, v5),  @"discoveryToken");
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NIDiscoveryToken, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    [v4 decodeFloatForKey:@"distance"];
    float v70 = v10;
    [v4 decodeVector3ForKey:@"direction"];
    __int128 v69 = v11;
    [v4 decodeFloatForKey:@"azimuth"];
    float v68 = v12;
    [v4 decodeFloatForKey:@"elevation"];
    float v67 = v13;
    [v4 decodeQuatForKey:@"quaternion"];
    __int128 v66 = v14;
    id v16 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v15),  @"deviceIdentifier");
    id v74 = (id)objc_claimAutoreleasedReturnValue(v16);
    id v17 = [v4 decodeIntegerForKey:@"relationship"];
    [v4 decodeDoubleForKey:@"timestamp"];
    double v19 = v18;
    id v20 = [v4 decodeIntegerForKey:@"measurementQuality"];
    id v21 = [v4 decodeIntegerForKey:@"motionState"];
    id v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), @"name");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v26 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v25),  @"spatialScore");
    v73 = (void *)objc_claimAutoreleasedReturnValue(v26);
    id v28 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v27),  @"bluetoothAdvertisingAddress");
    double v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v31 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSUUID, v30),  @"bluetoothPeerIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue(v31);
    id v32 = [v4 decodeIntegerForKey:@"verticalDirectionEstimate"];
    [v4 decodeFloatForKey:@"horizontalAngle"];
    float v34 = v33;
    [v4 decodeFloatForKey:@"horizontalAngleAccuracy"];
    float v36 = v35;
    [v4 decodeDoubleForKey:@"signalStrength"];
    double v38 = v37;
    unsigned __int8 v65 = [v4 decodeIntForKey:@"remoteTxAntennaMask"];
    [v4 decodeDoubleForKey:@"rangeBiasEstimate"];
    double v40 = v39;
    [v4 decodeDoubleForKey:@"rangeUncertainty"];
    double v42 = v41;
    [v4 decodeVector3ForKey:@"worldPosition"];
    __int128 v64 = v43;
    unsigned __int8 v63 = [v4 decodeBoolForKey:@"requiresBiasCorrection"];
    id v45 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(UWBSignalFeatures, v44),  @"uwbSignalFeatures");
    v71 = (void *)objc_claimAutoreleasedReturnValue(v45);
    unsigned __int8 v62 = [v4 decodeIntForKey:@"nbRxStatus"];
    unsigned __int8 v61 = [v4 decodeIntForKey:@"mmsRxStatus"];
    [v4 decodeDoubleForKey:@"nbRssi"];
    double v47 = v46;
    unsigned __int8 v60 = [v4 decodeBoolForKey:@"canInteract"];
    unsigned __int8 v59 = [v4 decodeBoolForKey:@"resetARSession"];
    unsigned __int8 v58 = [v4 decodeBoolForKey:@"revokeFindingExperience"];
    [v4 decodeFloatForKey:@"boundedRegionRange"];
    float v49 = v48;
    id v57 = [v4 decodeIntegerForKey:@"algorithmSource"];
    id v51 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v50),  @"debugDisplayInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v75.receiver = self;
    v75.super_class = (Class)&OBJC_CLASS___NINearbyObject;
    v53 = -[NINearbyObject init](&v75, "init");
    v54 = v53;
    if (v53)
    {
      objc_storeStrong((id *)&v53->_discoveryToken, v8);
      v54->_distance = v70;
      v54->_azimuth = v68;
      v54->_elevation = v67;
      *(_OWORD *)v54->_direction = v69;
      *(_OWORD *)v54->_anon_d0 = v66;
      v54->_relationship = (unint64_t)v17;
      objc_storeStrong((id *)&v54->_deviceIdentifier, v74);
      v54->_timestamp = v19;
      v54->_distanceMeasurementQuality = (int64_t)v20;
      v54->_motionState = (int64_t)v21;
      objc_storeStrong((id *)&v54->_name, v24);
      v54->_verticalDirectionEstimate = (int64_t)v32;
      v54->_horizontalAngle = v34;
      v54->_horizontalAngleAccuracy = v36;
      objc_storeStrong((id *)&v54->_spatialScore, v73);
      objc_storeStrong((id *)&v54->_bluetoothAdvertisingAddress, v29);
      objc_storeStrong((id *)&v54->_bluetoothPeerIdentifier, v72);
      v54->_remoteTxAntennaMask = v65;
      v54->_signalStrength = v38;
      v54->_rangeBiasEstimate = v40;
      v54->_rangeUncertainty = v42;
      *(_OWORD *)v54->_worldPosition = v64;
      v54->_requiresBiasCorrection = v63;
      objc_storeStrong((id *)&v54->_uwbSignalFeatures, v71);
      v54->_nbRxStatus = v62;
      v54->_mmsRxStatus = v61;
      v54->_nbRssi = v47;
      v54->_canInteract = v60;
      v54->_resetARSession = v59;
      v54->_revokeFindingExperience = v58;
      v54->_boundedRegionRange = v49;
      v54->_algorithmSource = (int64_t)v57;
      objc_storeStrong((id *)&v54->_debugDisplayInfo, v52);
    }

    self = v54;

    v55 = self;
  }

  else
  {
    v55 = 0LL;
  }

  return v55;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = (NINearbyObject *)v4;
    double v8 = v7;
    if (v7 == self)
    {
      char v79 = 1;
LABEL_60:

      goto LABEL_61;
    }

    discoveryToken = self->_discoveryToken;
    id v120 = v4;
    if (!discoveryToken)
    {
      float v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject discoveryToken](v7, "discoveryToken"));

      if (!v10)
      {
        unsigned __int8 v12 = 1;
LABEL_7:
        deviceIdentifier = self->_deviceIdentifier;
        if (!deviceIdentifier)
        {
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifier](v8, "deviceIdentifier"));

          if (!v14)
          {
            unsigned __int8 v16 = 1;
LABEL_11:
            float distance = self->_distance;
            -[NINearbyObject distance](v8, "distance");
            float v19 = v18;
            float32x4_t v119 = *(float32x4_t *)self->_direction;
            -[NINearbyObject direction](v8, "direction");
            float32x4_t v118 = v20;
            int64_t distanceMeasurementQuality = self->_distanceMeasurementQuality;
            id v22 = -[NINearbyObject distanceMeasurementQuality](v8, "distanceMeasurementQuality");
            unint64_t relationship = self->_relationship;
            id v24 = -[NINearbyObject relationship](v8, "relationship");
            double timestamp = self->_timestamp;
            -[NINearbyObject timestamp](v8, "timestamp");
            double v27 = v26;
            int64_t motionState = self->_motionState;
            id v117 = -[NINearbyObject motionState](v8, "motionState");
            double signalStrength = self->_signalStrength;
            -[NINearbyObject signalStrength](v8, "signalStrength");
            double v31 = v30;
            int remoteTxAntennaMask = self->_remoteTxAntennaMask;
            unsigned int v115 = -[NINearbyObject remoteTxAntennaMask](v8, "remoteTxAntennaMask");
            double rangeBiasEstimate = self->_rangeBiasEstimate;
            -[NINearbyObject rangeBiasEstimate](v8, "rangeBiasEstimate");
            double v34 = v33;
            id v112 = (id)motionState;
            id v113 = v24;
            unint64_t v114 = relationship;
            double rangeUncertainty = self->_rangeUncertainty;
            -[NINearbyObject rangeUncertainty](v8, "rangeUncertainty");
            double v110 = v35;
            name = self->_name;
            if (!name)
            {
              double v37 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject name](v8, "name"));

              if (!v37)
              {
                unsigned __int8 v39 = 1;
LABEL_15:
                int64_t verticalDirectionEstimate = self->_verticalDirectionEstimate;
                NINearbyObjectVerticalDirectionEstimate v41 = -[NINearbyObject verticalDirectionEstimate](v8, "verticalDirectionEstimate");
                float horizontalAngle = self->_horizontalAngle;
                -[NINearbyObject horizontalAngle](v8, "horizontalAngle");
                float v108 = v42;
                int64_t v105 = v41;
                int64_t v106 = verticalDirectionEstimate;
                unsigned __int8 v107 = v39;
                float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
                -[NINearbyObject horizontalAngleAccuracy](v8, "horizontalAngleAccuracy");
                float v103 = v43;
                spatialScore = self->_spatialScore;
                if (!spatialScore)
                {
                  id v45 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject spatialScore](v8, "spatialScore"));

                  if (!v45)
                  {
                    unsigned __int8 v102 = 1;
LABEL_19:
                    bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    if (!bluetoothAdvertisingAddress)
                    {
                      float v48 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothAdvertisingAddress](v8, "bluetoothAdvertisingAddress"));

                      if (!v48)
                      {
                        unsigned __int8 v101 = 1;
LABEL_23:
                        bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        if (!bluetoothPeerIdentifier)
                        {
                          id v51 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothPeerIdentifier](v8, "bluetoothPeerIdentifier"));

                          if (!v51)
                          {
                            unsigned __int8 v53 = 1;
LABEL_27:
                            float32x4_t v100 = *(float32x4_t *)self->_worldPosition;
                            -[NINearbyObject worldPosition](v8, "worldPosition");
                            float32x4_t v99 = v54;
                            int requiresBiasCorrection = self->_requiresBiasCorrection;
                            unsigned __int8 v98 = v53;
                            unsigned int v96 = -[NINearbyObject requiresBiasCorrection](v8, "requiresBiasCorrection");
                            uwbSignalFeatures = self->_uwbSignalFeatures;
                            id v95 = v22;
                            if (!uwbSignalFeatures)
                            {
                              v56 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject uwbSignalFeatures](v8, "uwbSignalFeatures"));

                              if (!v56) {
                                goto LABEL_31;
                              }
                              uwbSignalFeatures = self->_uwbSignalFeatures;
                            }

                            id v57 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject uwbSignalFeatures](v8, "uwbSignalFeatures"));
                            unsigned __int8 v58 = -[UWBSignalFeatures isEqual:](uwbSignalFeatures, "isEqual:", v57);

                            LOBYTE(v56) = v58 ^ 1;
LABEL_31:
                            int nbRxStatus = self->_nbRxStatus;
                            unsigned int v60 = -[NINearbyObject nbRxStatus](v8, "nbRxStatus");
                            int mmsRxStatus = self->_mmsRxStatus;
                            unsigned int v94 = -[NINearbyObject mmsRxStatus](v8, "mmsRxStatus");
                            int v91 = mmsRxStatus;
                            double nbRssi = self->_nbRssi;
                            -[NINearbyObject nbRssi](v8, "nbRssi");
                            double v92 = v62;
                            BOOL canInteract = self->_canInteract;
                            unsigned int v90 = -[NINearbyObject canInteract](v8, "canInteract");
                            int resetARSession = self->_resetARSession;
                            unsigned int v88 = -[NINearbyObject resetARSession](v8, "resetARSession");
                            int v86 = canInteract;
                            char v87 = (char)v56;
                            int revokeFindingExperience = self->_revokeFindingExperience;
                            unsigned int v84 = -[NINearbyObject revokeFindingExperience](v8, "revokeFindingExperience");
                            unsigned __int8 v64 = v16;
                            unsigned __int8 v65 = v12;
                            float boundedRegionRange = self->_boundedRegionRange;
                            -[NINearbyObject boundedRegionRange](v8, "boundedRegionRange");
                            float v82 = v66;
                            int64_t algorithmSource = self->_algorithmSource;
                            id v67 = -[NINearbyObject algorithmSource](v8, "algorithmSource");
                            debugDisplayInfo = self->_debugDisplayInfo;
                            if (!debugDisplayInfo)
                            {
                              __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject debugDisplayInfo](v8, "debugDisplayInfo"));

                              if (!v69)
                              {
                                unsigned __int8 v71 = 1;
                                goto LABEL_35;
                              }

                              debugDisplayInfo = self->_debugDisplayInfo;
                            }

                            float v70 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject debugDisplayInfo](v8, "debugDisplayInfo"));
                            unsigned __int8 v71 = -[NSString isEqualToString:](debugDisplayInfo, "isEqualToString:", v70);

LABEL_35:
                            uint32x4_t v72 = (uint32x4_t)vceqq_f32(v100, v99);
                            v72.i32[3] = v72.i32[2];
                            BOOL v73 = (vminvq_u32(v72) & 0x80000000) == 0;
                            uint32x4_t v74 = (uint32x4_t)vceqq_f32(v119, v118);
                            v74.i32[3] = v74.i32[2];
                            int v75 = vminvq_u32(v74);
                            char v76 = v65 ^ 1;
                            if (distance != v19) {
                              char v76 = 1;
                            }
                            if (v75 >= 0) {
                              char v76 = 1;
                            }
                            if ((id)distanceMeasurementQuality != v95) {
                              char v76 = 1;
                            }
                            char v77 = v76 | v64 ^ 1;
                            if ((id)v114 != v113) {
                              char v77 = 1;
                            }
                            char v78 = (nbRxStatus == v60) & ~(v77 | (timestamp != v27 || v112 != v117) | v107 ^ 1 | (v106 != v105) | (horizontalAngle != v108) | (horizontalAngleAccuracy != v103) | v102 ^ 1 | v101 ^ 1 | v98 ^ 1 | (signalStrength != v31) | (remoteTxAntennaMask != v115) | v73 | (requiresBiasCorrection != v96) | (rangeUncertainty != v110) | (rangeBiasEstimate != v34) | v87);
                            if (v91 != v94) {
                              char v78 = 0;
                            }
                            if (nbRssi != v92) {
                              char v78 = 0;
                            }
                            if (v86 != v90) {
                              char v78 = 0;
                            }
                            if (resetARSession != v88) {
                              char v78 = 0;
                            }
                            if (revokeFindingExperience != v84) {
                              char v78 = 0;
                            }
                            if (boundedRegionRange != v82) {
                              char v78 = 0;
                            }
                            if ((id)algorithmSource != v67) {
                              char v78 = 0;
                            }
                            char v79 = v78 & v71;
                            id v4 = v120;
                            goto LABEL_60;
                          }

                          bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        }

                        v52 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothPeerIdentifier](v8, "bluetoothPeerIdentifier"));
                        unsigned __int8 v53 = -[NSUUID isEqual:](bluetoothPeerIdentifier, "isEqual:", v52);

                        goto LABEL_27;
                      }

                      bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    }

                    float v49 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject bluetoothAdvertisingAddress](v8, "bluetoothAdvertisingAddress"));
                    unsigned __int8 v101 = -[NSData isEqualToData:](bluetoothAdvertisingAddress, "isEqualToData:", v49);

                    goto LABEL_23;
                  }

                  spatialScore = self->_spatialScore;
                }

                double v46 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject spatialScore](v8, "spatialScore"));
                unsigned __int8 v102 = -[NSNumber isEqualToNumber:](spatialScore, "isEqualToNumber:", v46);

                goto LABEL_19;
              }

              name = self->_name;
            }

            double v38 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject name](v8, "name"));
            unsigned __int8 v39 = -[NSString isEqualToString:](name, "isEqualToString:", v38);

            goto LABEL_15;
          }

          deviceIdentifier = self->_deviceIdentifier;
        }

        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifier](v8, "deviceIdentifier"));
        unsigned __int8 v16 = -[NSString isEqualToString:](deviceIdentifier, "isEqualToString:", v15);

        goto LABEL_11;
      }

      discoveryToken = self->_discoveryToken;
    }

    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject discoveryToken](v8, "discoveryToken"));
    unsigned __int8 v12 = -[NIDiscoveryToken isEqual:](discoveryToken, "isEqual:", v11);

    goto LABEL_7;
  }

  char v79 = 0;
LABEL_61:

  return v79;
}

- (unint64_t)hash
{
  discoveryToken = self->_discoveryToken;
  if (discoveryToken) {
    unint64_t v64 = -[NIDiscoveryToken hash](discoveryToken, "hash");
  }
  else {
    unint64_t v64 = 0LL;
  }
  float distance = self->_distance;
  float v6 = NINearbyObjectDistanceNotAvailable;
  if (distance == NINearbyObjectDistanceNotAvailable)
  {
    unint64_t v63 = 0LL;
  }

  else
  {
    *(float *)&double v2 = self->_distance;
    double v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2));
    unint64_t v63 = (unint64_t)[v33 hash];
  }

  __n128 v7 = *(__n128 *)self->_direction;
  uint32x4_t v8 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectDirectionNotAvailable, (float32x4_t)v7);
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) != 0) {
    unint64_t v62 = 0LL;
  }
  else {
    unint64_t v62 = sub_1001A5BD0(v7);
  }
  double timestamp = self->_timestamp;
  double v10 = *(double *)&qword_1008007A0;
  if (timestamp == *(double *)&qword_1008007A0)
  {
    unint64_t v61 = 0LL;
  }

  else
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_timestamp));
    unint64_t v61 = (unint64_t)[v32 hash];
  }

  unsigned __int8 v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_distanceMeasurementQuality));
  unint64_t v60 = (unint64_t)[v71 hash];
  float v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_motionState));
  unint64_t v58 = (unint64_t)[v70 hash];
  __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_relationship));
  unint64_t v57 = (unint64_t)[v69 hash];
  NSUInteger v56 = -[NSString hash](self->_deviceIdentifier, "hash");
  NSUInteger v54 = -[NSString hash](self->_name, "hash");
  float v68 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_verticalDirectionEstimate));
  unint64_t v53 = (unint64_t)[v68 hash];
  float horizontalAngle = self->_horizontalAngle;
  float v13 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
  {
    unint64_t v52 = 0LL;
  }

  else
  {
    *(float *)&double v11 = self->_horizontalAngle;
    double v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
    unint64_t v52 = (unint64_t)[v31 hash];
  }

  float v14 = NINearbyObjectAngleNotAvailable;
  float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    unint64_t v49 = 0LL;
  }

  else
  {
    *(float *)&double v11 = self->_horizontalAngleAccuracy;
    double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v11));
    unint64_t v49 = (unint64_t)[v30 hash];
  }

  unint64_t v50 = (unint64_t)-[NSNumber hash](self->_spatialScore, "hash");
  unint64_t v48 = (unint64_t)-[NSData hash](self->_bluetoothAdvertisingAddress, "hash");
  unint64_t v47 = (unint64_t)-[NSUUID hash](self->_bluetoothPeerIdentifier, "hash");
  id v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_signalStrength));
  unint64_t v46 = (unint64_t)[v67 hash];
  float v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_remoteTxAntennaMask));
  unint64_t v45 = (unint64_t)[v66 hash];
  unsigned __int8 v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rangeBiasEstimate));
  unint64_t v44 = (unint64_t)[v65 hash];
  unsigned __int8 v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_rangeUncertainty));
  unint64_t v43 = (unint64_t)[v59 hash];
  __n128 v16 = *(__n128 *)self->_worldPosition;
  uint32x4_t v17 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectWorldPositionNotAvailable, (float32x4_t)v16);
  v17.i32[3] = v17.i32[2];
  if ((vminvq_u32(v17) & 0x80000000) != 0) {
    unint64_t v42 = 0LL;
  }
  else {
    unint64_t v42 = sub_1001A5BD0(v16);
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_requiresBiasCorrection));
  unint64_t v41 = (unint64_t)[v55 hash];
  unint64_t v40 = -[UWBSignalFeatures hash](self->_uwbSignalFeatures, "hash");
  id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_nbRxStatus));
  unint64_t v39 = (unint64_t)[v51 hash];
  float v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", self->_mmsRxStatus));
  unint64_t v38 = (unint64_t)[v18 hash];
  float v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", self->_nbRssi));
  unint64_t v37 = (unint64_t)[v19 hash];
  float32x4_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_canInteract));
  unint64_t v36 = (unint64_t)[v20 hash];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_resetARSession));
  unint64_t v35 = (unint64_t)[v21 hash];
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_revokeFindingExperience));
  unint64_t v34 = (unint64_t)[v22 hash];
  *(float *)&double v23 = self->_boundedRegionRange;
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v23));
  unint64_t v25 = (unint64_t)[v24 hash];
  double v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_algorithmSource));
  unint64_t v27 = (unint64_t)[v26 hash];
  NSUInteger v28 = -[NSString hash](self->_debugDisplayInfo, "hash");

  if (horizontalAngleAccuracy != v14) {
  if (horizontalAngle != v13)
  }

  if (timestamp != v10) {
  if (distance != v6)
  }

  return v63 ^ v64 ^ v62 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v54 ^ v53 ^ v52 ^ v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v25 ^ v27 ^ v28;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  float v6 = NSStringFromClass(v5);
  __n128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint32x4_t v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIDiscoveryToken descriptionInternal](discoveryToken, "descriptionInternal"));
    -[NSMutableString appendFormat:](v8, "appendFormat:", @"Token: %@", v10);
  }

  else
  {
    -[NSMutableString appendString:](v8, "appendString:", @"Token: null");
  }

  float distance = self->_distance;
  if (distance == NINearbyObjectDistanceNotAvailable) {
    -[NSMutableString appendString:](v8, "appendString:", @", Distance not available");
  }
  else {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @", Distance: %.2fm", distance);
  }
  float32x4_t v12 = *(float32x4_t *)self->_direction;
  uint32x4_t v13 = (uint32x4_t)vceqq_f32(v12, (float32x4_t)NINearbyObjectDirectionNotAvailable);
  v13.i32[3] = v13.i32[2];
  if ((vminvq_u32(v13) & 0x80000000) != 0) {
    -[NSMutableString appendString:](v8, "appendString:", @", Direction not available");
  }
  else {
    -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", Direction: (%.3f,%.3f,%.3f)",  v12.f32[0],  v12.f32[1],  v12.f32[2]);
  }
  float horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable) {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @", Horizontal Angle: %.2frad", horizontalAngle);
  }
  else {
    -[NSMutableString appendString:](v8, "appendString:", @", Horizontal Angle not available");
  }
  unint64_t verticalDirectionEstimate = self->_verticalDirectionEstimate;
  if (verticalDirectionEstimate >= 5) {
    __assert_rtn("NINearbyObjectVerticalDirectionEstimateToString", "NINearbyObject.mm", 78, "false");
  }
  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", Vertical Direction Estimate: %@ ",  off_1007B4328[verticalDirectionEstimate]);
  -[NSMutableString appendString:](v8, "appendString:", @">");
  return v8;
}

- (id)descriptionInternal
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = (objc_class *)objc_opt_class(self, v4);
  float v6 = NSStringFromClass(v5);
  __n128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint32x4_t v8 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: ", v7);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject description](self, "description"));
  -[NSMutableString appendString:](v8, "appendString:", v9);

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NINearbyObject deviceIdentifer](self, "deviceIdentifer"));
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", deviceIdentifier: %@", v10);

  float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  float v12 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable) {
    uint32x4_t v13 = @"-";
  }
  else {
    uint32x4_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.2frad",  horizontalAngleAccuracy));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", HorizAngleAcc: %@", v13);
  if (horizontalAngleAccuracy != v12) {

  }
  unint64_t distanceMeasurementQuality = self->_distanceMeasurementQuality;
  if (distanceMeasurementQuality > 3)
  {
    int v43 = 46;
    unint64_t v44 = "NIDistanceMeasurementQualityToString";
    goto LABEL_55;
  }

  -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", Ranging Quality: %@ ",  off_1007B4350[distanceMeasurementQuality]);
  unint64_t motionState = self->_motionState;
  if (motionState >= 3)
  {
    int v43 = 60;
    unint64_t v44 = "NIMotionActivityStateToString";
LABEL_55:
    __assert_rtn(v44, "NINearbyObject.mm", v43, "false");
  }

  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Motion State: %@", off_1007B4370[motionState]);
  double signalStrength = self->_signalStrength;
  double v17 = *(double *)&NINearbyObjectSignalStrengthNotAvailable;
  else {
    float v18 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.2f dBm",  *(void *)&self->_signalStrength));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Signal Strength: %@", v18);
  if (signalStrength != v17) {

  }
  int remoteTxAntennaMask = self->_remoteTxAntennaMask;
  int v20 = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
  else {
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%02x",  self->_remoteTxAntennaMask));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Remote Tx Antenna Mask: %@", v21);
  if (remoteTxAntennaMask != v20) {

  }
  float32x4_t v22 = *(float32x4_t *)self->_worldPosition;
  uint32x4_t v23 = (uint32x4_t)vceqq_f32(v22, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) != 0) {
    -[NSMutableString appendString:](v8, "appendString:", @", World Position not available");
  }
  else {
    -[NSMutableString appendFormat:]( v8,  "appendFormat:",  @", World Position: (%.2f,%.2f,%.2f)",  v22.f32[0],  v22.f32[1],  v22.f32[2]);
  }
  if (self->_requiresBiasCorrection) {
    id v24 = @"YES";
  }
  else {
    id v24 = @"NO";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Require Bias Correction: %@", v24);
  double rangeBiasEstimate = self->_rangeBiasEstimate;
  double v26 = *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable;
  else {
    unint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.2f m",  *(void *)&self->_rangeBiasEstimate));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Range Bias Estimate: %@", v27);
  if (rangeBiasEstimate != v26) {

  }
  double rangeUncertainty = self->_rangeUncertainty;
  double v29 = *(double *)&NINearbyObjectRangeUncertaintyNotAvailable;
  else {
    double v30 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.2f m",  *(void *)&self->_rangeUncertainty));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Range Uncertainty: %@", v30);
  double v31 = (void *)objc_claimAutoreleasedReturnValue(-[UWBSignalFeatures description](self->_uwbSignalFeatures, "description"));
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Bias features: %@", v31);

  int nbRxStatus = self->_nbRxStatus;
  int v33 = NINearbyObjectRxStatusNotAvailable;
  else {
    unint64_t v34 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  self->_nbRxStatus));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", NB Rx status: %@", v34);
  if (nbRxStatus != v33) {

  }
  int mmsRxStatus = self->_mmsRxStatus;
  int v36 = NINearbyObjectRxStatusNotAvailable;
  else {
    unint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d",  self->_mmsRxStatus));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", UWB Rx status: %@", v37);
  if (mmsRxStatus != v36) {

  }
  double nbRssi = self->_nbRssi;
  double v39 = *(double *)&NINearbyObjectNbRssiNotAvailable;
  else {
    unint64_t v40 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%0.2f dBm",  *(void *)&self->_nbRssi));
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", NB RSSI: %@", v40);
  if (nbRssi != v39) {

  }
  if (self->_canInteract) {
    unint64_t v41 = @"YES";
  }
  else {
    unint64_t v41 = @"NO";
  }
  -[NSMutableString appendFormat:](v8, "appendFormat:", @", Can Interact: %@", v41);
  -[NSMutableString appendString:](v8, "appendString:", @">");
  return v8;
}

- (id)deviceIdentifer
{
  return self->_deviceIdentifier;
}

+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = -[NINearbyObject initWithToken:](objc_alloc(&OBJC_CLASS___NINearbyObject), "initWithToken:", v7);
  -[NINearbyObject setName:](v10, "setName:", v8);
  -[NINearbyObject setDeviceIdentifier:](v10, "setDeviceIdentifier:", v9);

  return v10;
}

- (void)overrideDistance:(float)a3
{
  self->_float distance = a3;
}

- (void)overrideDirection:(NINearbyObject *)self
{
  *(_OWORD *)self->_direction = v2;
}

- (void)overrideRelationship:(unint64_t)a3
{
  self->_unint64_t relationship = a3;
}

- (void)overrideDistanceMeasurementQuality:(int64_t)a3
{
  self->_unint64_t distanceMeasurementQuality = a3;
}

- (void)overrideMotionState:(int64_t)a3
{
  self->_unint64_t motionState = a3;
}

- (void)overrideTimestamp:(float)a3
{
  self->_double timestamp = a3;
}

- (void)overrideSpatialScore:(id)a3
{
}

- (NIDiscoveryToken)discoveryToken
{
  return self->_discoveryToken;
}

- (void)setDiscoveryToken:(id)a3
{
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_float distance = a3;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (void)setDirection:(NINearbyObject *)self
{
  *(_OWORD *)self->_direction = v2;
}

- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate
{
  return self->_verticalDirectionEstimate;
}

- (void)setVerticalDirectionEstimate:(int64_t)a3
{
  self->_unint64_t verticalDirectionEstimate = a3;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(float)a3
{
  self->_float horizontalAngle = a3;
}

- (__n128)quaternion
{
  return a1[13];
}

- (__n128)setQuaternion:(__n128 *)result
{
  result[13] = a2;
  return result;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)elevation
{
  return self->_elevation;
}

- (void)setElevation:(float)a3
{
  self->_elevation = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_unint64_t relationship = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (int64_t)distanceMeasurementQuality
{
  return self->_distanceMeasurementQuality;
}

- (void)setDistanceMeasurementQuality:(int64_t)a3
{
  self->_unint64_t distanceMeasurementQuality = a3;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int64_t)a3
{
  self->_unint64_t motionState = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)spatialScore
{
  return self->_spatialScore;
}

- (void)setSpatialScore:(id)a3
{
}

- (NSData)bluetoothAdvertisingAddress
{
  return self->_bluetoothAdvertisingAddress;
}

- (void)setBluetoothAdvertisingAddress:(id)a3
{
}

- (NSUUID)bluetoothPeerIdentifier
{
  return self->_bluetoothPeerIdentifier;
}

- (void)setBluetoothPeerIdentifier:(id)a3
{
}

- (float)horizontalAngleAccuracy
{
  return self->_horizontalAngleAccuracy;
}

- (void)setHorizontalAngleAccuracy:(float)a3
{
  self->_float horizontalAngleAccuracy = a3;
}

- (double)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(double)a3
{
  self->_double signalStrength = a3;
}

- (double)rangeBiasEstimate
{
  return self->_rangeBiasEstimate;
}

- (void)setRangeBiasEstimate:(double)a3
{
  self->_double rangeBiasEstimate = a3;
}

- (double)rangeUncertainty
{
  return self->_rangeUncertainty;
}

- (void)setRangeUncertainty:(double)a3
{
  self->_double rangeUncertainty = a3;
}

- (unsigned)remoteTxAntennaMask
{
  return self->_remoteTxAntennaMask;
}

- (void)setRemoteTxAntennaMask:(unsigned __int8)a3
{
  self->_int remoteTxAntennaMask = a3;
}

- (__n128)worldPosition
{
  return a1[14];
}

- (void)setWorldPosition:(NINearbyObject *)self
{
  *(_OWORD *)self->_worldPosition = v2;
}

- (BOOL)requiresBiasCorrection
{
  return self->_requiresBiasCorrection;
}

- (void)setRequiresBiasCorrection:(BOOL)a3
{
  self->_int requiresBiasCorrection = a3;
}

- (UWBSignalFeatures)uwbSignalFeatures
{
  return self->_uwbSignalFeatures;
}

- (void)setUwbSignalFeatures:(id)a3
{
}

- (unsigned)nbRxStatus
{
  return self->_nbRxStatus;
}

- (void)setNbRxStatus:(unsigned __int8)a3
{
  self->_int nbRxStatus = a3;
}

- (unsigned)mmsRxStatus
{
  return self->_mmsRxStatus;
}

- (void)setMmsRxStatus:(unsigned __int8)a3
{
  self->_int mmsRxStatus = a3;
}

- (double)nbRssi
{
  return self->_nbRssi;
}

- (void)setNbRssi:(double)a3
{
  self->_double nbRssi = a3;
}

- (BOOL)canInteract
{
  return self->_canInteract;
}

- (void)setCanInteract:(BOOL)a3
{
  self->_BOOL canInteract = a3;
}

- (float)boundedRegionRange
{
  return self->_boundedRegionRange;
}

- (void)setBoundedRegionRange:(float)a3
{
  self->_float boundedRegionRange = a3;
}

- (int64_t)algorithmSource
{
  return self->_algorithmSource;
}

- (void)setAlgorithmSource:(int64_t)a3
{
  self->_int64_t algorithmSource = a3;
}

- (NSString)debugDisplayInfo
{
  return self->_debugDisplayInfo;
}

- (void)setDebugDisplayInfo:(id)a3
{
}

- (BOOL)resetARSession
{
  return self->_resetARSession;
}

- (void)setResetARSession:(BOOL)a3
{
  self->_int resetARSession = a3;
}

- (BOOL)revokeFindingExperience
{
  return self->_revokeFindingExperience;
}

- (void)setRevokeFindingExperience:(BOOL)a3
{
  self->_int revokeFindingExperience = a3;
}

- (void).cxx_destruct
{
}

+ (id)objectFromBluetoothDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___NINearbyObject);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 discoveryToken]);
  float v6 = -[NINearbyObject initWithToken:](v4, "initWithToken:", v5);

  if ([v3 systemKeyRelationship])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 idsDeviceID]);
    -[NINearbyObject setDeviceIdentifier:](v6, "setDeviceIdentifier:", v7);

    -[NINearbyObject setRelationship:](v6, "setRelationship:", 2LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    -[NINearbyObject setName:](v6, "setName:", v8);

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 cbDevice]);
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 btAddressData]);
    -[NINearbyObject setBluetoothAdvertisingAddress:](v6, "setBluetoothAdvertisingAddress:", v10);
  }

  return v6;
}

@end