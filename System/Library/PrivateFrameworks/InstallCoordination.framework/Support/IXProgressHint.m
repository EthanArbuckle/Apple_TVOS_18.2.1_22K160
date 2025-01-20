@interface IXProgressHint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)setPhaseProportionsForLoadingPhase:(id)a3 installingPhase:(id)a4 postProcessingPhase:(id)a5 error:(id *)a6;
- (IXProgressHint)init;
- (IXProgressHint)initWithCoder:(id)a3;
- (NSDictionary)progressProportionsDictionaryForLaunchServices;
- (NSNumber)compressedAppAssetSizeInBytes;
- (NSNumber)filesInAppAssetCount;
- (NSNumber)installingPhaseProportion;
- (NSNumber)loadingPhaseProportion;
- (NSNumber)postProcessingPhaseProportion;
- (NSNumber)totalExpectedEssentialAssetSizeInBytes;
- (NSNumber)totalODRAssetSizeInBytes;
- (NSNumber)uncompressedAppAssetSizeInBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCompressedAppAssetSizeInBytes:(id)a3;
- (void)setFilesInAppAssetCount:(id)a3;
- (void)setTotalExpectedEssentialAssetSizeInBytes:(id)a3;
- (void)setTotalODRAssetSizeInBytes:(id)a3;
- (void)setUncompressedAppAssetSizeInBytes:(id)a3;
@end

@implementation IXProgressHint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXProgressHint)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXProgressHint;
  return -[IXProgressHint init](&v3, "init");
}

- (IXProgressHint)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___IXProgressHint;
  v5 = -[IXProgressHint init](&v31, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"compressedAppAssetSizeInBytes"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    compressedAppAssetSizeInBytes = v5->_compressedAppAssetSizeInBytes;
    v5->_compressedAppAssetSizeInBytes = (NSNumber *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"uncompressedAppAssetSizeInBytes"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    uncompressedAppAssetSizeInBytes = v5->_uncompressedAppAssetSizeInBytes;
    v5->_uncompressedAppAssetSizeInBytes = (NSNumber *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"filesInAppAssetCount"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    filesInAppAssetCount = v5->_filesInAppAssetCount;
    v5->_filesInAppAssetCount = (NSNumber *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"totalODRAssetSizeInBytes"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    totalODRAssetSizeInBytes = v5->_totalODRAssetSizeInBytes;
    v5->_totalODRAssetSizeInBytes = (NSNumber *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"totalExpectedEssentialAssetSizeInBytes"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    totalExpectedEssentialAssetSizeInBytes = v5->_totalExpectedEssentialAssetSizeInBytes;
    v5->_totalExpectedEssentialAssetSizeInBytes = (NSNumber *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"loadingPhaseProportion"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    loadingPhaseProportion = v5->_loadingPhaseProportion;
    v5->_loadingPhaseProportion = (NSNumber *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"installingPhaseProportion"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    installingPhaseProportion = v5->_installingPhaseProportion;
    v5->_installingPhaseProportion = (NSNumber *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"postProcessingPhaseProportion"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    postProcessingPhaseProportion = v5->_postProcessingPhaseProportion;
    v5->_postProcessingPhaseProportion = (NSNumber *)v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes"));
  [v4 encodeObject:v5 forKey:@"compressedAppAssetSizeInBytes"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes"));
  [v4 encodeObject:v6 forKey:@"uncompressedAppAssetSizeInBytes"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount"));
  [v4 encodeObject:v7 forKey:@"filesInAppAssetCount"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes"));
  [v4 encodeObject:v8 forKey:@"totalODRAssetSizeInBytes"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IXProgressHint totalExpectedEssentialAssetSizeInBytes]( self,  "totalExpectedEssentialAssetSizeInBytes"));
  [v4 encodeObject:v9 forKey:@"totalExpectedEssentialAssetSizeInBytes"];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
  [v4 encodeObject:v10 forKey:@"loadingPhaseProportion"];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"));
  [v4 encodeObject:v11 forKey:@"installingPhaseProportion"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
  [v4 encodeObject:v12 forKey:@"postProcessingPhaseProportion"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes"));
  [v4 setCompressedAppAssetSizeInBytes:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes"));
  [v4 setUncompressedAppAssetSizeInBytes:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount"));
  [v4 setFilesInAppAssetCount:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes"));
  [v4 setTotalODRAssetSizeInBytes:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[IXProgressHint totalExpectedEssentialAssetSizeInBytes]( self,  "totalExpectedEssentialAssetSizeInBytes"));
  [v4 setTotalExpectedEssentialAssetSizeInBytes:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
  [v4 setPhaseProportionsForLoadingPhase:v10 installingPhase:v11 postProcessingPhase:v12 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXProgressHint *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
    goto LABEL_21;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    BOOL v21 = 0;
    goto LABEL_21;
  }

  id v6 = v4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint compressedAppAssetSizeInBytes](v6, "compressedAppAssetSizeInBytes"));
  id v9 = v7;
  id v10 = v8;
  v11 = v10;

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint uncompressedAppAssetSizeInBytes](v6, "uncompressedAppAssetSizeInBytes"));
  id v9 = v12;
  id v14 = v13;
  v11 = v14;

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint filesInAppAssetCount](v6, "filesInAppAssetCount"));
  id v9 = v15;
  id v17 = v16;
  v11 = v17;

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint totalODRAssetSizeInBytes](v6, "totalODRAssetSizeInBytes"));
  id v9 = v18;
  id v20 = v19;
  v11 = v20;
  if ((v9 != 0) != (v20 != 0) || v9 && v20 && ![v9 isEqual:v20])
  {
LABEL_16:

    BOOL v21 = 0;
  }

  else
  {

    v23 = (void *)objc_claimAutoreleasedReturnValue( -[IXProgressHint totalExpectedEssentialAssetSizeInBytes]( self,  "totalExpectedEssentialAssetSizeInBytes"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue( -[IXProgressHint totalExpectedEssentialAssetSizeInBytes]( v6,  "totalExpectedEssentialAssetSizeInBytes"));
    BOOL v25 = sub_10000860C(v23, v24);

    if (!v25) {
      goto LABEL_29;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](v6, "loadingPhaseProportion"));
    BOOL v28 = sub_10000860C(v26, v27);

    if (!v28
      || (v29 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion")),
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](v6, "installingPhaseProportion")),
          BOOL v31 = sub_10000860C(v29, v30),
          v30,
          v29,
          !v31))
    {
LABEL_29:
      BOOL v21 = 0;
      goto LABEL_18;
    }

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](v6, "postProcessingPhaseProportion"));
    BOOL v21 = sub_10000860C(v9, v11);
  }

LABEL_18:
LABEL_21:

  return v21;
}

- (unint64_t)hash
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint compressedAppAssetSizeInBytes](self, "compressedAppAssetSizeInBytes"));
  unint64_t v4 = (unint64_t)[v3 hash];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint uncompressedAppAssetSizeInBytes](self, "uncompressedAppAssetSizeInBytes"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint filesInAppAssetCount](self, "filesInAppAssetCount"));
  unint64_t v8 = (unint64_t)[v7 hash];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint totalODRAssetSizeInBytes](self, "totalODRAssetSizeInBytes"));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[IXProgressHint totalExpectedEssentialAssetSizeInBytes]( self,  "totalExpectedEssentialAssetSizeInBytes"));
  unint64_t v12 = (unint64_t)[v11 hash];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
  unint64_t v14 = v12 ^ (unint64_t)[v13 hash];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"));
  unint64_t v16 = v10 ^ v14 ^ (unint64_t)[v15 hash];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
  unint64_t v18 = v16 ^ (unint64_t)[v17 hash];

  return v18;
}

- (NSDictionary)progressProportionsDictionaryForLaunchServices
{
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
  if (v4) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, &off_1000D6CA8);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"));
  if (v5) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, &off_1000D6CC0);
  }

  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
  if (v6) {
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v6, &off_1000D6CD8);
  }

  id v7 = -[NSMutableDictionary copy](v3, "copy");
  return (NSDictionary *)v7;
}

- (BOOL)setPhaseProportionsForLoadingPhase:(id)a3 installingPhase:(id)a4 postProcessingPhase:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  [a3 doubleValue];
  double v13 = v12;
  [v11 doubleValue];
  double v15 = v14;

  if (v10) {
    [v10 doubleValue];
  }
  else {
    double v16 = 0.0;
  }
  if (v13 == 0.0)
  {
    id v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100079544();
    }

    id v20 = @"The loading phase is required and thus cannot be 0 percent of the total progress.";
    uint64_t v21 = 176LL;
  }

  else if (v15 == 0.0)
  {
    uint64_t v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000795B4();
    }

    id v20 = @"The installing phase is required and thus cannot be 0 percent of the total progress.";
    uint64_t v21 = 180LL;
  }

  else if (v13 >= 0.0)
  {
    if (v15 >= 0.0)
    {
      if (v16 >= 0.0)
      {
        double v34 = v13 + v15 + v16;
        double v35 = v13 / v34;
        double v36 = v15 / v34;
        double v37 = v16 / v34;
        v38 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
        loadingPhaseProportion = self->_loadingPhaseProportion;
        self->_loadingPhaseProportion = v38;

        v40 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v36));
        installingPhaseProportion = self->_installingPhaseProportion;
        self->_installingPhaseProportion = v40;

        v42 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v37));
        postProcessingPhaseProportion = self->_postProcessingPhaseProportion;
        self->_postProcessingPhaseProportion = v42;

        id v31 = 0LL;
        BOOL v32 = 1;
        goto LABEL_27;
      }

      BOOL v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100079704();
      }

      id v20 = @"The post processing installation phase proportion cannot be negative.";
      uint64_t v21 = 193LL;
    }

    else
    {
      v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100079694();
      }

      id v20 = @"The installing installation phase proportion cannot be negative.";
      uint64_t v21 = 189LL;
    }
  }

  else
  {
    id v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100079624();
    }

    id v20 = @"The loading installation phase proportion cannot be negative.";
    uint64_t v21 = 185LL;
  }

  id v30 = sub_10003556C( (uint64_t)"-[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]",  v21,  @"IXErrorDomain",  0x37uLL,  0LL,  0LL,  v20,  v19,  v44);
  id v31 = (id)objc_claimAutoreleasedReturnValue(v30);
  if (a6)
  {
    id v31 = v31;
    BOOL v32 = 0;
    *a6 = v31;
  }

  else
  {
    BOOL v32 = 0;
  }

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint loadingPhaseProportion](self, "loadingPhaseProportion"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint installingPhaseProportion](self, "installingPhaseProportion"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXProgressHint postProcessingPhaseProportion](self, "postProcessingPhaseProportion"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ loading:%@ installing:%@ postprocessing:%@>",  v5,  v6,  v7,  v8));

  return v9;
}

- (NSNumber)compressedAppAssetSizeInBytes
{
  return self->_compressedAppAssetSizeInBytes;
}

- (void)setCompressedAppAssetSizeInBytes:(id)a3
{
}

- (NSNumber)uncompressedAppAssetSizeInBytes
{
  return self->_uncompressedAppAssetSizeInBytes;
}

- (void)setUncompressedAppAssetSizeInBytes:(id)a3
{
}

- (NSNumber)filesInAppAssetCount
{
  return self->_filesInAppAssetCount;
}

- (void)setFilesInAppAssetCount:(id)a3
{
}

- (NSNumber)totalODRAssetSizeInBytes
{
  return self->_totalODRAssetSizeInBytes;
}

- (void)setTotalODRAssetSizeInBytes:(id)a3
{
}

- (NSNumber)totalExpectedEssentialAssetSizeInBytes
{
  return self->_totalExpectedEssentialAssetSizeInBytes;
}

- (void)setTotalExpectedEssentialAssetSizeInBytes:(id)a3
{
}

- (NSNumber)loadingPhaseProportion
{
  return self->_loadingPhaseProportion;
}

- (NSNumber)installingPhaseProportion
{
  return self->_installingPhaseProportion;
}

- (NSNumber)postProcessingPhaseProportion
{
  return self->_postProcessingPhaseProportion;
}

- (void).cxx_destruct
{
}

  ;
}

@end