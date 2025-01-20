@interface PBUnavailableBundleList
- (NSArray)disabledAdamIDs;
- (NSArray)provisionedAdamIDs;
- (NSDictionary)mappingInfo;
- (PBUnavailableBundleList)initWithProvisionedAdamIDs:(id)a3 disabledAdamIDs:(id)a4 mappingInfo:(id)a5;
- (void)setDisabledAdamIDs:(id)a3;
- (void)setMappingInfo:(id)a3;
- (void)setProvisionedAdamIDs:(id)a3;
@end

@implementation PBUnavailableBundleList

- (PBUnavailableBundleList)initWithProvisionedAdamIDs:(id)a3 disabledAdamIDs:(id)a4 mappingInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBUnavailableBundleList;
  v11 = -[PBUnavailableBundleList init](&v19, "init");
  if (v11)
  {
    v12 = (NSArray *)[v8 copy];
    provisionedAdamIDs = v11->_provisionedAdamIDs;
    v11->_provisionedAdamIDs = v12;

    v14 = (NSArray *)[v9 copy];
    disabledAdamIDs = v11->_disabledAdamIDs;
    v11->_disabledAdamIDs = v14;

    v16 = (NSDictionary *)[v10 copy];
    mappingInfo = v11->_mappingInfo;
    v11->_mappingInfo = v16;
  }

  return v11;
}

- (NSArray)provisionedAdamIDs
{
  return self->_provisionedAdamIDs;
}

- (void)setProvisionedAdamIDs:(id)a3
{
}

- (NSArray)disabledAdamIDs
{
  return self->_disabledAdamIDs;
}

- (void)setDisabledAdamIDs:(id)a3
{
}

- (NSDictionary)mappingInfo
{
  return self->_mappingInfo;
}

- (void)setMappingInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end