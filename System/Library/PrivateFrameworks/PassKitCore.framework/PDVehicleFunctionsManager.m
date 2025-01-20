@interface PDVehicleFunctionsManager
- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6;
- (void)vehicleReportDidChangeForCarKeyWithAppletIdentifier:(id)a3 keyIdentifier:(id)a4;
@end

@implementation PDVehicleFunctionsManager

- (void)vehicleReportDidChangeForCarKeyWithAppletIdentifier:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)PDOSTransactionCreate("PDVehicleFunctionsManager");
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002E0784;
    v13[3] = &unk_10063B060;
    id v14 = v9;
    v15 = self;
    id v16 = v6;
    id v17 = v8;
    id v11 = v9;
    dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, v13);
    dispatch_async((dispatch_queue_t)queue, v12);
  }
}

- (BOOL)passTileManager:(id)a3 isRelevantForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 passType] == (id)1)
  {
    v15 = 0LL;
    id v16 = 0LL;
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 devicePrimaryPaymentApplication]);
    sub_1002E0AFC(v9, &v16, &v15);

    BOOL v10 = 0;
    dispatch_block_t v12 = v15;
    id v11 = v16;
    if (v16 && v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
      BOOL v10 = [v13 type] == (id)1;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)passTileManager:(id)a3 isTileSupportedForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  if (-[PDVehicleFunctionsManager passTileManager:isRelevantForPass:tileDescriptor:descriptorState:]( self,  "passTileManager:isRelevantForPass:tileDescriptor:descriptorState:",  a3,  a4,  a5,  a6))
  {
    return 2LL;
  }

  else
  {
    return 0LL;
  }

- (BOOL)passTileManager:(id)a3 wantsUpdateDescriptorStateForPass:(id)a4 tileDescriptor:(id)a5 descriptorState:(id)a6
{
  return 1;
}

- (void).cxx_destruct
{
}

@end