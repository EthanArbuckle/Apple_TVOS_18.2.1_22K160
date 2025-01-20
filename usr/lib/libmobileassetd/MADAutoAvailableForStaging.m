@interface MADAutoAvailableForStaging
+ (BOOL)supportsSecureCoding;
- (MADAutoAvailableForStaging)initWithCoder:(id)a3;
- (NSArray)descriptorsOptionalForStaging;
- (NSArray)descriptorsRequiredForStaging;
- (NSArray)targetGroupNames;
- (NSString)targetBuild;
- (NSString)targetOSVersion;
- (NSString)targetRestoreVersion;
- (NSString)targetTrainName;
- (id)initForTargetOSVersion:(id)a3 forTargetBuild:(id)a4 forTargetTrainName:(id)a5 forTargetRestoreVersion:(id)a6 withRequiredDescriptors:(id)a7 withOptionalDescriptors:(id)a8;
- (id)newSummaryWithoutEntryID;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptorsOptionalForStaging:(id)a3;
- (void)setDescriptorsRequiredForStaging:(id)a3;
@end

@implementation MADAutoAvailableForStaging

- (id)initForTargetOSVersion:(id)a3 forTargetBuild:(id)a4 forTargetTrainName:(id)a5 forTargetRestoreVersion:(id)a6 withRequiredDescriptors:(id)a7 withOptionalDescriptors:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MADAutoAvailableForStaging;
  v18 = -[MADAutoAvailableForStaging init](&v24, "init");
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_targetOSVersion, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 6, a7);
    objc_storeStrong(p_isa + 7, a8);
  }

  return p_isa;
}

- (MADAutoAvailableForStaging)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___MADAutoAvailableForStaging;
  v5 = -[MADAutoAvailableForStaging init](&v25, "init");
  if (v5)
  {
    v26[0] = objc_opt_class(&OBJC_CLASS___NSArray);
    v26[1] = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 2LL));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v6));

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetOSVersion"];
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);
    targetOSVersion = v5->_targetOSVersion;
    v5->_targetOSVersion = (NSString *)v9;

    id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetBuild"];
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    targetBuild = v5->_targetBuild;
    v5->_targetBuild = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetTrainName"];
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    targetTrainName = v5->_targetTrainName;
    v5->_targetTrainName = (NSString *)v15;

    id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"targetRestoreVersion"];
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
    targetRestoreVersion = v5->_targetRestoreVersion;
    v5->_targetRestoreVersion = (NSString *)v18;

    uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"requiredDescriptors"]);
    descriptorsRequiredForStaging = v5->_descriptorsRequiredForStaging;
    v5->_descriptorsRequiredForStaging = (NSArray *)v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"optionalDescriptors"]);
    descriptorsOptionalForStaging = v5->_descriptorsOptionalForStaging;
    v5->_descriptorsOptionalForStaging = (NSArray *)v22;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetOSVersion](self, "targetOSVersion"));
  [v4 encodeObject:v5 forKey:@"targetOSVersion"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetBuild](self, "targetBuild"));
  [v4 encodeObject:v6 forKey:@"targetBuild"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetTrainName](self, "targetTrainName"));
  [v4 encodeObject:v7 forKey:@"targetTrainName"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetRestoreVersion](self, "targetRestoreVersion"));
  [v4 encodeObject:v8 forKey:@"targetRestoreVersion"];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging descriptorsRequiredForStaging](self, "descriptorsRequiredForStaging"));
  [v4 encodeObject:v9 forKey:@"requiredDescriptors"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging descriptorsOptionalForStaging](self, "descriptorsOptionalForStaging"));
  [v4 encodeObject:v10 forKey:@"optionalDescriptors"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetTrainName](self, "targetTrainName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetRestoreVersion](self, "targetRestoreVersion"));
  id v5 = -[MADAutoAvailableForStaging newSummaryWithoutEntryID](self, "newSummaryWithoutEntryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TARGET[trainName:%@|restoreVersion:%@]%@",  v3,  v4,  v5));

  return v6;
}

- (id)newSummaryWithoutEntryID
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetOSVersion](self, "targetOSVersion"));
  if (v4) {
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetOSVersion](self, "targetOSVersion"));
  }
  else {
    id v5 = @"N";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetBuild](self, "targetBuild"));
  if (v6) {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging targetBuild](self, "targetBuild"));
  }
  else {
    v7 = @"N";
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging descriptorsRequiredForStaging](self, "descriptorsRequiredForStaging"));
  id v9 = [v8 count];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAvailableForStaging descriptorsOptionalForStaging](self, "descriptorsOptionalForStaging"));
  id v11 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"[OSVersion:%@|Build:%@|descriptorsRequired:%ld|descriptorsOptional:%ld]",  v5,  v7,  v9,  [v10 count]);

  if (v6) {
  if (v4)
  }

  return v11;
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (NSString)targetBuild
{
  return self->_targetBuild;
}

- (NSString)targetTrainName
{
  return self->_targetTrainName;
}

- (NSString)targetRestoreVersion
{
  return self->_targetRestoreVersion;
}

- (NSArray)targetGroupNames
{
  return self->_targetGroupNames;
}

- (NSArray)descriptorsRequiredForStaging
{
  return self->_descriptorsRequiredForStaging;
}

- (void)setDescriptorsRequiredForStaging:(id)a3
{
}

- (NSArray)descriptorsOptionalForStaging
{
  return self->_descriptorsOptionalForStaging;
}

- (void)setDescriptorsOptionalForStaging:(id)a3
{
}

- (void).cxx_destruct
{
}

@end