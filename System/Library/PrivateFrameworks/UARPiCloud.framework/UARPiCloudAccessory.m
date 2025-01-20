@interface UARPiCloudAccessory
- (BOOL)isEqual:(id)a3;
- (BOOL)signatureValidationNeeded;
- (CHIPAccessoryFirmwareRecord)chipFirmwareRecord;
- (NSMutableArray)availableRecords;
- (NSString)firmwareVersion;
- (NSString)productGroup;
- (NSString)productNumber;
- (NSUUID)uuid;
- (UARPiCloudAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5;
- (UARPiCloudAccessory)initWithUUID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 firmwareVersion:(id)a6;
- (UARPiCloudAccessoryRecord)record;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAvailableRecords:(id)a3;
- (void)setChipFirmwareRecord:(id)a3;
- (void)setRecord:(id)a3;
- (void)setSignatureValidationNeeded:(BOOL)a3;
@end

@implementation UARPiCloudAccessory

- (UARPiCloudAccessory)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___UARPiCloudAccessory;
  v11 = -[UARPiCloudAccessory init](&v23, sel_init);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x189607AB8] UUID];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v8 copy];
    productGroup = v11->_productGroup;
    v11->_productGroup = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    productNumber = v11->_productNumber;
    v11->_productNumber = (NSString *)v16;

    uint64_t v18 = [v10 copy];
    firmwareVersion = v11->_firmwareVersion;
    v11->_firmwareVersion = (NSString *)v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    availableRecords = v11->_availableRecords;
    v11->_availableRecords = v20;

    v11->_signatureValidationNeeded = 1;
  }

  return v11;
}

- (UARPiCloudAccessory)initWithUUID:(id)a3 productGroup:(id)a4 productNumber:(id)a5 firmwareVersion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___UARPiCloudAccessory;
  uint64_t v14 = -[UARPiCloudAccessory init](&v26, sel_init);
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    productGroup = v14->_productGroup;
    v14->_productGroup = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    productNumber = v14->_productNumber;
    v14->_productNumber = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    firmwareVersion = v14->_firmwareVersion;
    v14->_firmwareVersion = (NSString *)v21;

    objc_super v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    availableRecords = v14->_availableRecords;
    v14->_availableRecords = v23;

    v14->_signatureValidationNeeded = 1;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[UARPiCloudAccessory initWithUUID:productGroup:productNumber:firmwareVersion:]( objc_alloc(&OBJC_CLASS___UARPiCloudAccessory),  "initWithUUID:productGroup:productNumber:firmwareVersion:",  self->_uuid,  self->_productGroup,  self->_productNumber,  self->_firmwareVersion);
  -[UARPiCloudAccessory setRecord:](v4, "setRecord:", self->_record);
  -[UARPiCloudAccessory setChipFirmwareRecord:](v4, "setChipFirmwareRecord:", self->_chipFirmwareRecord);
  -[UARPiCloudAccessory setAvailableRecords:](v4, "setAvailableRecords:", self->_availableRecords);
  -[UARPiCloudAccessory setSignatureValidationNeeded:]( v4,  "setSignatureValidationNeeded:",  self->_signatureValidationNeeded);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPiCloudAccessory *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      char v7 = 1;
    }

    else
    {
      uuid = self->_uuid;
      v6 = -[UARPiCloudAccessory uuid](v4, "uuid");
      char v7 = -[NSUUID isEqual:](uuid, "isEqual:", v6);
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setAvailableRecords:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  availableRecords = self->_availableRecords;
  self->_availableRecords = v4;
}

- (NSMutableArray)availableRecords
{
  return self->_availableRecords;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24LL, 1);
}

- (NSString)productGroup
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)productNumber
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)signatureValidationNeeded
{
  return self->_signatureValidationNeeded;
}

- (void)setSignatureValidationNeeded:(BOOL)a3
{
  self->_signatureValidationNeeded = a3;
}

- (UARPiCloudAccessoryRecord)record
{
  return (UARPiCloudAccessoryRecord *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setRecord:(id)a3
{
}

- (CHIPAccessoryFirmwareRecord)chipFirmwareRecord
{
  return (CHIPAccessoryFirmwareRecord *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setChipFirmwareRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end