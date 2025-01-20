@interface STSettingChange
- (id)_ad_aceSettingBooleanEntityRepresentation;
- (id)_ad_aceSettingsResponseRepresentationForSetValueCommand:(id)a3;
@end

@implementation STSettingChange

- (id)_ad_aceSettingBooleanEntityRepresentation
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SASettingBooleanEntity);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STSettingChange valueBeforeUpdate](self, "valueBeforeUpdate"));
  [v3 setPreviousValue:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSettingChange valueAfterUpdate](self, "valueAfterUpdate"));
  objc_msgSend(v3, "setValue:", objc_msgSend(v5, "BOOLValue"));

  return v3;
}

- (id)_ad_aceSettingsResponseRepresentationForSetValueCommand:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STSettingChange valueBeforeUpdate](self, "valueBeforeUpdate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STSettingChange valueAfterUpdate](self, "valueAfterUpdate"));
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    v9 = v8;
    v10 = &SASettingValueUnchangedErrorCode;
  }

  else
  {
    if (![v4 failOnSiriDisconnectWarnings]
      || -[STSettingChange settingType](self, "settingType") != (id)1
      || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[STSettingChange valueAfterUpdate](self, "valueAfterUpdate")),
          unsigned int v12 = [v11 BOOLValue],
          v11,
          !v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( -[STSettingChange _ad_aceSettingBooleanEntityRepresentation]( self,  "_ad_aceSettingBooleanEntityRepresentation"));
      v9 = (SACommandFailed *)objc_alloc_init(&OBJC_CLASS___SASettingSetBoolResponse);
      -[SACommandFailed setSetting:](v9, "setSetting:", v13);

      goto LABEL_9;
    }

    v8 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
    v9 = v8;
    v10 = &SASettingSiriDisconnectErrorCode;
  }

  -[SACommandFailed setErrorCode:](v8, "setErrorCode:", *v10);
LABEL_9:

  return v9;
}

@end