@interface UMUserSwitchContext
+ (id)contextWithSetupData:(id)a3 shortLivedToken:(id)a4 secondaryActionRequired:(BOOL)a5;
- (BOOL)secondaryActionRequired;
- (NSData)setupData;
- (NSString)shortLivedToken;
- (id)description;
- (void)setSecondaryActionRequired:(BOOL)a3;
- (void)setSetupData:(id)a3;
- (void)setShortLivedToken:(id)a3;
@end

@implementation UMUserSwitchContext

+ (id)contextWithSetupData:(id)a3 shortLivedToken:(id)a4 secondaryActionRequired:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = (void **)objc_opt_new();
  v12 = v9;
  if (v9)
  {
    objc_msgSend_setSetupData_(v9, v10, (uint64_t)v7, v11);
    objc_msgSend_setShortLivedToken_(v12, v13, (uint64_t)v8, v14);
    objc_msgSend_setSecondaryActionRequired_(v12, v15, v5, v16);
    if (sub_185F38F68())
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x189604038], v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dictionaryForKey_(v20, v21, (uint64_t)@"UMSwitchEnvironmentsByServicesForUser", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(v12, v24, v23, 32LL);

      sub_185F436A0();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v12[4], v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F468A0( (uint64_t)&OBJC_CLASS___UMLogMessage,  @"Environments by services: \n%@",  v30,  v31,  v32,  v33,  v34,  v35,  (uint64_t)v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_185F43A98((uint64_t)v25, v36);
    }
  }

  return v12;
}

- (id)description
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v4, v5, v6, v7);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)setupData
{
  return self->_setupData;
}

- (void)setSetupData:(id)a3
{
}

- (NSString)shortLivedToken
{
  return self->_shortLivedToken;
}

- (void)setShortLivedToken:(id)a3
{
}

- (BOOL)secondaryActionRequired
{
  return self->_secondaryActionRequired;
}

- (void)setSecondaryActionRequired:(BOOL)a3
{
  self->_secondaryActionRequired = a3;
}

- (void).cxx_destruct
{
}

@end