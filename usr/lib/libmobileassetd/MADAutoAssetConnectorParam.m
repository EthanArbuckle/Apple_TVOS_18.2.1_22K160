@interface MADAutoAssetConnectorParam
+ (BOOL)supportsSecureCoding;
- (BOOL)potentialNetworkFailure;
- (MADAutoAssetConnectorParam)initWithCoder:(id)a3;
- (MADAutoAssetConnectorParam)initWithMonitorMarkers:(id)a3 withMarkersNoRetry:(id)a4 withMarkersRequiringRetry:(id)a5;
- (MADAutoAssetConnectorParam)initWithObservedNetworkPath:(id)a3;
- (MADAutoAssetConnectorParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withMonitorMarkers:(id)a5 withMarkersNoRetry:(id)a6 withMarkersRequiringRetry:(id)a7 withFinishedMarker:(id)a8 withPotentialNetworkFailure:(BOOL)a9 withObservedNetworkPath:(id)a10;
- (MADAutoAssetConnectorParam)initWithSafeSummary:(id)a3;
- (MADAutoAssetConnectorParam)initWithScheduledMarkerFinished:(id)a3 withPotentialNetworkFailure:(BOOL)a4;
- (MADMarker)finishedMarker;
- (NSArray)markersNoRetry;
- (NSArray)markersRequiringRetry;
- (NSArray)monitorMarkers;
- (NSString)paramSafeSummary;
- (NSURL)observedNetworkPath;
- (id)_newSummary;
- (int64_t)paramType;
- (void)encodeWithCoder:(id)a3;
- (void)setFinishedMarker:(id)a3;
- (void)setMarkersNoRetry:(id)a3;
- (void)setMarkersRequiringRetry:(id)a3;
- (void)setMonitorMarkers:(id)a3;
- (void)setObservedNetworkPath:(id)a3;
- (void)setParamSafeSummary:(id)a3;
- (void)setPotentialNetworkFailure:(BOOL)a3;
- (void)updateSafeSummary;
@end

@implementation MADAutoAssetConnectorParam

- (MADAutoAssetConnectorParam)initWithSafeSummary:(id)a3
{
  LOBYTE(v4) = 0;
  return -[MADAutoAssetConnectorParam initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishedMarker:withPotentialNetworkFailure:withObservedNetworkPath:]( self,  "initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishe dMarker:withPotentialNetworkFailure:withObservedNetworkPath:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  v4,  0LL);
}

- (MADAutoAssetConnectorParam)initWithMonitorMarkers:(id)a3 withMarkersNoRetry:(id)a4 withMarkersRequiringRetry:(id)a5
{
  LOBYTE(v6) = 0;
  return -[MADAutoAssetConnectorParam initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishedMarker:withPotentialNetworkFailure:withObservedNetworkPath:]( self,  "initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishe dMarker:withPotentialNetworkFailure:withObservedNetworkPath:",  1LL,  0LL,  a3,  a4,  a5,  0LL,  v6,  0LL);
}

- (MADAutoAssetConnectorParam)initWithScheduledMarkerFinished:(id)a3 withPotentialNetworkFailure:(BOOL)a4
{
  LOBYTE(v5) = a4;
  return -[MADAutoAssetConnectorParam initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishedMarker:withPotentialNetworkFailure:withObservedNetworkPath:]( self,  "initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishe dMarker:withPotentialNetworkFailure:withObservedNetworkPath:",  2LL,  0LL,  0LL,  0LL,  0LL,  a3,  v5,  0LL);
}

- (MADAutoAssetConnectorParam)initWithObservedNetworkPath:(id)a3
{
  LOBYTE(v4) = 0;
  return -[MADAutoAssetConnectorParam initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishedMarker:withPotentialNetworkFailure:withObservedNetworkPath:]( self,  "initWithParamType:withSafeSummary:withMonitorMarkers:withMarkersNoRetry:withMarkersRequiringRetry:withFinishe dMarker:withPotentialNetworkFailure:withObservedNetworkPath:",  3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v4,  a3);
}

- (MADAutoAssetConnectorParam)initWithParamType:(int64_t)a3 withSafeSummary:(id)a4 withMonitorMarkers:(id)a5 withMarkersNoRetry:(id)a6 withMarkersRequiringRetry:(id)a7 withFinishedMarker:(id)a8 withPotentialNetworkFailure:(BOOL)a9 withObservedNetworkPath:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnectorParam;
  v19 = -[MADAutoAssetConnectorParam init](&v27, "init");
  v20 = v19;
  if (v19)
  {
    v19->_paramType = a3;
    objc_storeStrong((id *)&v19->_monitorMarkers, a5);
    objc_storeStrong((id *)&v20->_markersNoRetry, a6);
    objc_storeStrong((id *)&v20->_markersRequiringRetry, a7);
    objc_storeStrong((id *)&v20->_finishedMarker, a8);
    v20->_potentialNetworkFailure = a9;
    objc_storeStrong((id *)&v20->_observedNetworkPath, a10);
    if (v16) {
      v21 = (NSString *)v16;
    }
    else {
      v21 = -[MADAutoAssetConnectorParam _newSummary](v20, "_newSummary");
    }
    paramSafeSummary = v20->_paramSafeSummary;
    v20->_paramSafeSummary = v21;
  }

  return v20;
}

- (MADAutoAssetConnectorParam)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___MADAutoAssetConnectorParam;
  uint64_t v5 = -[MADAutoAssetConnectorParam init](&v31, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"paramSafeSummary"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    paramSafeSummary = v5->_paramSafeSummary;
    v5->_paramSafeSummary = (NSString *)v7;

    v5->_paramType = (int64_t)[v4 decodeInt64ForKey:@"paramType"];
    v9 = objc_alloc(&OBJC_CLASS___NSSet);
    v34[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v34[1] = objc_opt_class(&OBJC_CLASS___MADMarker);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    v11 = -[NSSet initWithArray:](v9, "initWithArray:", v10);
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v11 forKey:@"monitorMarkers"]);
    monitorMarkers = v5->_monitorMarkers;
    v5->_monitorMarkers = (NSArray *)v12;

    v14 = objc_alloc(&OBJC_CLASS___NSSet);
    v33[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v33[1] = objc_opt_class(&OBJC_CLASS___MADMarker);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
    id v16 = -[NSSet initWithArray:](v14, "initWithArray:", v15);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v16 forKey:@"markersNoRetry"]);
    markersNoRetry = v5->_markersNoRetry;
    v5->_markersNoRetry = (NSArray *)v17;

    v19 = objc_alloc(&OBJC_CLASS___NSSet);
    v32[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v32[1] = objc_opt_class(&OBJC_CLASS___MADMarker);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
    v21 = -[NSSet initWithArray:](v19, "initWithArray:", v20);
    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v21 forKey:@"markersRequiringRetry"]);
    markersRequiringRetry = v5->_markersRequiringRetry;
    v5->_markersRequiringRetry = (NSArray *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(MADMarker) forKey:@"finishedMarker"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    finishedMarker = v5->_finishedMarker;
    v5->_finishedMarker = (MADMarker *)v25;

    v5->_potentialNetworkFailure = [v4 decodeBoolForKey:@"potentialNetworkFailure"];
    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"observedNetworkPath"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    observedNetworkPath = v5->_observedNetworkPath;
    v5->_observedNetworkPath = (NSURL *)v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam paramSafeSummary](self, "paramSafeSummary"));
  [v4 encodeObject:v5 forKey:@"paramSafeSummary"];

  objc_msgSend( v4,  "encodeInt64:forKey:",  -[MADAutoAssetConnectorParam paramType](self, "paramType"),  @"paramType");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam monitorMarkers](self, "monitorMarkers"));
  [v4 encodeObject:v6 forKey:@"monitorMarkers"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam markersNoRetry](self, "markersNoRetry"));
  [v4 encodeObject:v7 forKey:@"markersNoRetry"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam markersRequiringRetry](self, "markersRequiringRetry"));
  [v4 encodeObject:v8 forKey:@"markersRequiringRetry"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam finishedMarker](self, "finishedMarker"));
  [v4 encodeObject:v9 forKey:@"finishedMarker"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MADAutoAssetConnectorParam potentialNetworkFailure](self, "potentialNetworkFailure"),  @"potentialNetworkFailure");
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetConnectorParam observedNetworkPath](self, "observedNetworkPath"));
  [v4 encodeObject:v10 forKey:@"observedNetworkPath"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_newSummary
{
  int64_t v3 = -[MADAutoAssetConnectorParam paramType](self, "paramType");
  id result = @"SUMMARY";
  switch(v3)
  {
    case 0LL:
      return result;
    case 1LL:
      id result = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"MONITOR_WITH_MARKERS|monitor:%ld|noRetry:%ld|requiringRetry:%ld",  -[NSArray count](self->_monitorMarkers, "count"),  -[NSArray count](self->_markersNoRetry, "count"),  -[NSArray count](self->_markersRequiringRetry, "count"));
      break;
    case 2LL:
      uint64_t v5 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MADMarker description](self->_finishedMarker, "description"));
      uint64_t v7 = (void *)v6;
      if (self->_potentialNetworkFailure) {
        v8 = @"Y";
      }
      else {
        v8 = @"N";
      }
      v9 = -[NSString initWithFormat:](v5, "initWithFormat:", @"ACTIVE_FINISHED|marker:%@|NWFail:%@", v6, v8);

      id result = v9;
      break;
    case 3LL:
      id v10 = objc_alloc(&OBJC_CLASS___NSString);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_observedNetworkPath, "absoluteString"));
      uint64_t v12 = -[NSString initWithFormat:](v10, "initWithFormat:", @"OBSERVED_NETWORK_PATH|observedNWPath:%@", v11);

      id result = v12;
      break;
    default:
      id result = @"UNKNOWN_TYPE";
      break;
  }

  return result;
}

- (void)updateSafeSummary
{
  id v3 = -[MADAutoAssetConnectorParam _newSummary](self, "_newSummary");
  -[MADAutoAssetConnectorParam setParamSafeSummary:](self, "setParamSafeSummary:", v3);
}

- (NSString)paramSafeSummary
{
  return self->_paramSafeSummary;
}

- (void)setParamSafeSummary:(id)a3
{
}

- (int64_t)paramType
{
  return self->_paramType;
}

- (NSArray)monitorMarkers
{
  return self->_monitorMarkers;
}

- (void)setMonitorMarkers:(id)a3
{
}

- (NSArray)markersNoRetry
{
  return self->_markersNoRetry;
}

- (void)setMarkersNoRetry:(id)a3
{
}

- (NSArray)markersRequiringRetry
{
  return self->_markersRequiringRetry;
}

- (void)setMarkersRequiringRetry:(id)a3
{
}

- (MADMarker)finishedMarker
{
  return self->_finishedMarker;
}

- (void)setFinishedMarker:(id)a3
{
}

- (BOOL)potentialNetworkFailure
{
  return self->_potentialNetworkFailure;
}

- (void)setPotentialNetworkFailure:(BOOL)a3
{
  self->_potentialNetworkFailure = a3;
}

- (NSURL)observedNetworkPath
{
  return self->_observedNetworkPath;
}

- (void)setObservedNetworkPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end