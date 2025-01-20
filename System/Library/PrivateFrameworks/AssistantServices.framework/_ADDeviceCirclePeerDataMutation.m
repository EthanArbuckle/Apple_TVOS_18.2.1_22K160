@interface _ADDeviceCirclePeerDataMutation
- (BOOL)isDirty;
- (_ADDeviceCirclePeerDataMutation)initWithBase:(id)a3;
- (id)getAceVersion;
- (id)getAssistantIdentifier;
- (id)getBuildVersion;
- (id)getHomeAccessoryInfo;
- (id)getIsLocationSharingDevice;
- (id)getIsSiriCloudSyncEnabled;
- (id)getMyriadTrialTreatment;
- (id)getProductType;
- (id)getSharedUserIdentifier;
- (id)getUserAssignedDeviceName;
- (id)getUserInterfaceIdiom;
- (void)setAceVersion:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHomeAccessoryInfo:(id)a3;
- (void)setIsLocationSharingDevice:(id)a3;
- (void)setIsSiriCloudSyncEnabled:(id)a3;
- (void)setMyriadTrialTreatment:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSharedUserIdentifier:(id)a3;
- (void)setUserAssignedDeviceName:(id)a3;
- (void)setUserInterfaceIdiom:(id)a3;
@end

@implementation _ADDeviceCirclePeerDataMutation

- (_ADDeviceCirclePeerDataMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____ADDeviceCirclePeerDataMutation;
  v6 = -[_ADDeviceCirclePeerDataMutation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getAceVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    v2 = self->_aceVersion;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData aceVersion](self->_base, "aceVersion"));
  }
  return v2;
}

- (void)setAceVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getAssistantIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    v2 = self->_assistantIdentifier;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData assistantIdentifier](self->_base, "assistantIdentifier"));
  }
  return v2;
}

- (void)setAssistantIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getBuildVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    v2 = self->_buildVersion;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData buildVersion](self->_base, "buildVersion"));
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getProductType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    v2 = self->_productType;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData productType](self->_base, "productType"));
  }
  return v2;
}

- (void)setProductType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getSharedUserIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    v2 = self->_sharedUserIdentifier;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData sharedUserIdentifier](self->_base, "sharedUserIdentifier"));
  }
  return v2;
}

- (void)setSharedUserIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getUserAssignedDeviceName
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    v2 = self->_userAssignedDeviceName;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData userAssignedDeviceName](self->_base, "userAssignedDeviceName"));
  }
  return v2;
}

- (void)setUserAssignedDeviceName:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getUserInterfaceIdiom
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    v2 = self->_userInterfaceIdiom;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData userInterfaceIdiom](self->_base, "userInterfaceIdiom"));
  }
  return v2;
}

- (void)setUserInterfaceIdiom:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getIsLocationSharingDevice
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    v2 = self->_isLocationSharingDevice;
  }
  else {
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData isLocationSharingDevice](self->_base, "isLocationSharingDevice"));
  }
  return v2;
}

- (void)setIsLocationSharingDevice:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getHomeAccessoryInfo
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    v2 = self->_homeAccessoryInfo;
  }
  else {
    v2 = (AFHomeAccessoryInfo *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData homeAccessoryInfo](self->_base, "homeAccessoryInfo"));
  }
  return v2;
}

- (void)setHomeAccessoryInfo:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getIsSiriCloudSyncEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0) {
    v2 = self->_isSiriCloudSyncEnabled;
  }
  else {
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData isSiriCloudSyncEnabled](self->_base, "isSiriCloudSyncEnabled"));
  }
  return v2;
}

- (void)setIsSiriCloudSyncEnabled:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getMyriadTrialTreatment
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0) {
    v2 = self->_myriadTrialTreatment;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[ADDeviceCirclePeerData myriadTrialTreatment](self->_base, "myriadTrialTreatment"));
  }
  return v2;
}

- (void)setMyriadTrialTreatment:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (void).cxx_destruct
{
}

@end