@interface BDWorkoutPreviewMetadata
+ (void)getPreviewMetadata:(id)a3 withCompletion:(id)a4;
- (BDWorkoutPreviewMetadata)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7;
- (BOOL)isIndoor;
- (NSString)configurationName;
- (int64_t)configurationType;
- (unint64_t)activityType;
- (unint64_t)goalTypeIdentifier;
@end

@implementation BDWorkoutPreviewMetadata

- (BDWorkoutPreviewMetadata)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___BDWorkoutPreviewMetadata;
  v14 = -[BDWorkoutPreviewMetadata init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_isIndoor = a4;
    v14->_activityType = a3;
    v14->_configurationType = a5;
    objc_storeStrong((id *)&v14->_configurationName, a6);
    v15->_goalTypeIdentifier = a7;
  }

  return v15;
}

+ (void)getPreviewMetadata:(id)a3 withCompletion:(id)a4
{
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void).cxx_destruct
{
}

@end