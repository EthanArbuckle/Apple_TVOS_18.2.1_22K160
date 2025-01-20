@interface CSEndpointerMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeOut;
- (CSASRFeatures)asrFeaturesAtEndpoint;
- (CSEndpointerMetrics)initWithCoder:(id)a3;
- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10;
- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10 osdFeatures:(id)a11 asrFeatures:(id)a12 isRequestTimeOut:(BOOL)a13 assetConfigVersion:(id)a14 blkHepAudioOrigin:(double)a15 vtExtraAudioAtStartInMs:(double)a16 firstAudioSampleSensorTimestamp:(unint64_t)a17 isAnchorTimeBuffered:(BOOL)a18 endpointHostTime:(unint64_t)a19 audioDeliveryHostTimeDelta:(unint64_t)a20;
- (NSArray)featuresAtEndpoint;
- (NSDictionary)additionalMetrics;
- (NSDictionary)asrFeatureLatencyDistribution;
- (NSString)assetConfigVersion;
- (NSString)requestId;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (double)blkHepAudioOrigin;
- (double)totalAudioRecorded;
- (double)trailingSilenceDurationAtEndpoint;
- (double)vtExtraAudioAtStartInMs;
- (id)description;
- (id)metricsCopyWithRequestId:(id)a3 lastAudioChunkHostTime:(unint64_t)a4;
- (int64_t)endpointerType;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)endpointBufferHostTime;
- (unint64_t)endpointHostTime;
- (unint64_t)firstAudioSampleSensorTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalMetrics:(id)a3;
- (void)setAsrFeatureLatencyDistribution:(id)a3;
- (void)setAsrFeaturesAtEndpoint:(id)a3;
- (void)setAssetConfigVersion:(id)a3;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setBlkHepAudioOrigin:(double)a3;
- (void)setEndpointBufferHostTime:(unint64_t)a3;
- (void)setEndpointHostTime:(unint64_t)a3;
- (void)setEndpointerType:(int64_t)a3;
- (void)setFeaturesAtEndpoint:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(unint64_t)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeOut:(BOOL)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTotalAudioRecorded:(double)a3;
- (void)setTrailingSilenceDurationAtEndpoint:(double)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
@end

@implementation CSEndpointerMetrics

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10 osdFeatures:(id)a11 asrFeatures:(id)a12 isRequestTimeOut:(BOOL)a13 assetConfigVersion:(id)a14 blkHepAudioOrigin:(double)a15 vtExtraAudioAtStartInMs:(double)a16 firstAudioSampleSensorTimestamp:(unint64_t)a17 isAnchorTimeBuffered:(BOOL)a18 endpointHostTime:(unint64_t)a19 audioDeliveryHostTimeDelta:(unint64_t)a20
{
  id v29 = a5;
  id v30 = a7;
  id v40 = a8;
  id v39 = a10;
  id v38 = a11;
  id v37 = a12;
  id v36 = a14;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___CSEndpointerMetrics;
  v31 = -[CSEndpointerMetrics init](&v41, "init");
  v32 = v31;
  if (v31)
  {
    v31->_totalAudioRecorded = a3;
    v31->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v31->_featuresAtEndpoint, a5);
    v32->_endpointerType = a6;
    objc_storeStrong((id *)&v32->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v32->_additionalMetrics, a8);
    v32->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v32->_requestId, a10);
    objc_storeStrong((id *)&v32->_osdFeaturesAtEndpoint, a11);
    objc_storeStrong((id *)&v32->_asrFeaturesAtEndpoint, a12);
    v32->_isRequestTimeOut = a13;
    objc_storeStrong((id *)&v32->_assetConfigVersion, a14);
    v32->_blkHepAudioOrigin = a15;
    v32->_vtExtraAudioAtStartInMs = a16;
    v32->_isAnchorTimeBuffered = a18;
    v32->_firstAudioSampleSensorTimestamp = a17;
    v32->_endpointHostTime = a19;
    v32->_audioDeliveryHostTimeDelta = a20;
  }

  return v32;
}

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10
{
  id v28 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___CSEndpointerMetrics;
  v22 = -[CSEndpointerMetrics init](&v29, "init");
  v23 = v22;
  if (v22)
  {
    v22->_totalAudioRecorded = a3;
    v22->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v22->_featuresAtEndpoint, a5);
    v23->_endpointerType = a6;
    objc_storeStrong((id *)&v23->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v23->_additionalMetrics, a8);
    v23->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v23->_requestId, a10);
    osdFeaturesAtEndpoint = v23->_osdFeaturesAtEndpoint;
    v23->_osdFeaturesAtEndpoint = 0LL;

    asrFeaturesAtEndpoint = v23->_asrFeaturesAtEndpoint;
    v23->_asrFeaturesAtEndpoint = 0LL;

    v23->_isRequestTimeOut = 0;
    assetConfigVersion = v23->_assetConfigVersion;
    v23->_assetConfigVersion = 0LL;

    v23->_isAnchorTimeBuffered = 0;
    v23->_vtExtraAudioAtStartInMs = 0.0;
    v23->_firstAudioSampleSensorTimestamp = 0LL;
    v23->_blkHepAudioOrigin = 0.0;
  }

  return v23;
}

- (id)metricsCopyWithRequestId:(id)a3 lastAudioChunkHostTime:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSEndpointerMetrics additionalMetrics](self, "additionalMetrics"));
  id v8 = [v7 mutableCopy];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
  [v8 setObject:v9 forKey:@"lastAudioChunkHostTime"];

  v10 = objc_alloc(&OBJC_CLASS___CSEndpointerMetrics);
  -[CSEndpointerMetrics totalAudioRecorded](self, "totalAudioRecorded");
  LOBYTE(v14) = self->_isAnchorTimeBuffered;
  LOBYTE(v13) = self->_isRequestTimeOut;
  v11 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:]( v10,  "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribut ion:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:ass etConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered :endpointHostTime:audioDeliveryHostTimeDelta:",  self->_endpointBufferHostTime,  self->_featuresAtEndpoint,  self->_endpointerType,  self->_asrFeatureLatencyDistribution,  v8,  v6,  self->_osdFeaturesAtEndpoint,  self->_asrFeaturesAtEndpoint,  v13,  self->_assetConfigVersion,  self->_firstAudioSampleSensorTimestamp,  v14,  self->_endpointHostTime,  self->_audioDeliveryHostTimeDelta);

  return v11;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  objc_msgSend(v3, "appendFormat:", @"[totalAudioRecorded = %f]", *(void *)&self->_totalAudioRecorded);
  objc_msgSend(v3, "appendFormat:", @"[endpointBufferHostTime = %llu]", self->_endpointBufferHostTime);
  objc_msgSend( v3,  "appendFormat:",  @"[trailingSilenceDurationAtEndpoint = %f]",  *(void *)&self->_trailingSilenceDurationAtEndpoint);
  objc_msgSend(v3, "appendFormat:", @"[endpointerType = %lu]", self->_endpointerType);
  [v3 appendFormat:@"[featuresAtEndpoint = %@]", self->_featuresAtEndpoint];
  [v3 appendFormat:@"[additionalMetrics = %@]", self->_additionalMetrics];
  [v3 appendFormat:@"[requestId = %@]", self->_requestId];
  return v3;
}

- (CSEndpointerMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  id v5 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v4),  @"CSEndpointMetrics:::totalAudioRecorded");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v6 doubleValue];
  double v8 = v7;

  id v10 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v9),  @"CSEndpointMetrics:::endpointBufferHostTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v48 = [v11 unsignedLongLongValue];

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v12);
  v15 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v13,  objc_opt_class(&OBJC_CLASS___NSNumber, v14),  0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue( [v3 decodeObjectOfClasses:v16 forKey:@"CSEndpointMetrics:::featuresAtEndpoint"]);

  id v19 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v18),  @"CSEndpointMetrics:::endpointerType");
  id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = [v20 unsignedIntegerValue];

  uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSDictionary, v22);
  uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSString, v24);
  v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v23,  v25,  objc_opt_class(&OBJC_CLASS___NSNumber, v26),  0LL);
  id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_super v29 = (void *)objc_claimAutoreleasedReturnValue( [v3 decodeObjectOfClasses:v28 forKey:@"CSEndpointMetrics:::asrFeatureLatencyDistribution"]);

  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary, v30);
  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString, v32);
  v35 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v31,  v33,  objc_opt_class(&OBJC_CLASS___NSNumber, v34),  0LL);
  id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v3 decodeObjectOfClasses:v36 forKey:@"CSEndpointMetrics:::additionalMetrics"]);

  id v39 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSNumber, v38),  @"CSEndpointMetrics:::trailingSilenceDurationAtEndpoint");
  id v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  [v40 doubleValue];
  double v42 = v41;

  id v44 = objc_msgSend( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v43),  @"CSEndpointMetrics:::requestId");
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

  v46 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:]( self,  "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribut ion:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:",  v48,  v17,  v21,  v29,  v37,  v45,  v8,  v42);
  return v46;
}

- (void)encodeWithCoder:(id)a3
{
  double totalAudioRecorded = self->_totalAudioRecorded;
  id v9 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", totalAudioRecorded));
  [v9 encodeObject:v5 forKey:@"CSEndpointMetrics:::totalAudioRecorded"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_endpointBufferHostTime));
  [v9 encodeObject:v6 forKey:@"CSEndpointMetrics:::endpointBufferHostTime"];

  [v9 encodeObject:self->_featuresAtEndpoint forKey:@"CSEndpointMetrics:::featuresAtEndpoint"];
  double v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_endpointerType));
  [v9 encodeObject:v7 forKey:@"CSEndpointMetrics:::endpointerType"];

  [v9 encodeObject:self->_asrFeatureLatencyDistribution forKey:@"CSEndpointMetrics:::asrFeatureLatencyDistribution"];
  [v9 encodeObject:self->_additionalMetrics forKey:@"CSEndpointMetrics:::additionalMetrics"];
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  self->_trailingSilenceDurationAtEndpoint));
  [v9 encodeObject:v8 forKey:@"CSEndpointMetrics:::trailingSilenceDurationAtEndpoint"];

  [v9 encodeObject:self->_requestId forKey:@"CSEndpointMetrics:::requestId"];
}

- (double)totalAudioRecorded
{
  return self->_totalAudioRecorded;
}

- (void)setTotalAudioRecorded:(double)a3
{
  self->_double totalAudioRecorded = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_endpointBufferHostTime = a3;
}

- (NSArray)featuresAtEndpoint
{
  return self->_featuresAtEndpoint;
}

- (void)setFeaturesAtEndpoint:(id)a3
{
}

- (int64_t)endpointerType
{
  return self->_endpointerType;
}

- (void)setEndpointerType:(int64_t)a3
{
  self->_endpointerType = a3;
}

- (NSDictionary)asrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution;
}

- (void)setAsrFeatureLatencyDistribution:(id)a3
{
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (void)setAdditionalMetrics:(id)a3
{
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (void)setTrailingSilenceDurationAtEndpoint:(double)a3
{
  self->_trailingSilenceDurationAtEndpoint = a3;
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
}

- (CSASRFeatures)asrFeaturesAtEndpoint
{
  return self->_asrFeaturesAtEndpoint;
}

- (void)setAsrFeaturesAtEndpoint:(id)a3
{
}

- (BOOL)isRequestTimeOut
{
  return self->_isRequestTimeOut;
}

- (void)setIsRequestTimeOut:(BOOL)a3
{
  self->_isRequestTimeOut = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (NSString)assetConfigVersion
{
  return self->_assetConfigVersion;
}

- (void)setAssetConfigVersion:(id)a3
{
}

- (double)blkHepAudioOrigin
{
  return self->_blkHepAudioOrigin;
}

- (void)setBlkHepAudioOrigin:(double)a3
{
  self->_blkHepAudioOrigin = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (unint64_t)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(unint64_t)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_endpointHostTime = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end