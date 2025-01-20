@interface SAAuxiliaryData
+ (id)auxiliaryDataForTimestamp:(id)a3;
- (void)dealloc;
@end

@implementation SAAuxiliaryData

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SAAuxiliaryData;
  -[SAAuxiliaryData dealloc](&v3, sel_dealloc);
}

+ (id)auxiliaryDataForTimestamp:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    +[SATimestamp timestamp](&OBJC_CLASS___SATimestamp, "timestamp");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v6 = v5;
  v7 = objc_alloc_init(&OBJC_CLASS___SAAuxiliaryData);
  v8 = -[SAFanSpeed initWithTimestamp:](objc_alloc(&OBJC_CLASS___SAFanSpeed), "initWithTimestamp:", v6);
  v10 = v8;
  if (v7)
  {
    objc_setProperty_atomic(v7, v9, v8, 8LL);

    v7->_mountStatus = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)CopyMountStatusData();
    objc_setProperty_atomic(v7, v11, v6, 24LL);
  }

  else
  {

    CopyMountStatusData();
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end