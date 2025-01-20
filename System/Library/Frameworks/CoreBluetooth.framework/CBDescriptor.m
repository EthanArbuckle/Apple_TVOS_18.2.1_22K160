@interface CBDescriptor
- (CBCharacteristic)characteristic;
- (CBDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4;
- (CBPeripheral)peripheral;
- (NSNumber)handle;
- (id)description;
- (id)handleValueUpdated:(id)a3;
- (id)value;
- (void)invalidate;
- (void)setCharacteristic:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CBDescriptor

- (CBDescriptor)initWithCharacteristic:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[CBUUID UUIDWithData:](&OBJC_CLASS___CBUUID, "UUIDWithData:", v8);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___CBDescriptor;
  v10 = -[CBAttribute initWithUUID:](&v18, sel_initWithUUID_, v9);

  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"kCBMsgArgDescriptorHandle"];
    handle = v10->_handle;
    v10->_handle = (NSNumber *)v11;

    uint64_t v13 = [v7 objectForKeyedSubscript:@"kCBMsgArgData"];
    id value = v10->_value;
    v10->_id value = (id)v13;

    uint64_t v15 = [v6 peripheral];
    peripheral = v10->_peripheral;
    v10->_peripheral = (CBPeripheral *)v15;

    objc_storeWeak((id *)&v10->_characteristic, v6);
  }

  return v10;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  v5 = -[CBAttribute UUID](self, "UUID");
  [v3 stringWithFormat:@"<%@: %p, UUID = %@, id value = %@>", v4, self, v5, self->_value];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
}

- (id)handleValueUpdated:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBDescriptor setValue:](self, "setValue:", v4);

  return self;
}

- (CBCharacteristic)characteristic
{
  return (CBCharacteristic *)objc_loadWeakRetained((id *)&self->_characteristic);
}

- (void)setCharacteristic:(id)a3
{
}

- (id)value
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setValue:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (NSNumber)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end