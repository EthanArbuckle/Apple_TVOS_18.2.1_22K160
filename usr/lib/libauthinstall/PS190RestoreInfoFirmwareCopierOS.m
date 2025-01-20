@interface PS190RestoreInfoFirmwareCopierOS
- (PS190RestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4;
- (unsigned)boardID;
- (unsigned)securityDomain;
@end

@implementation PS190RestoreInfoFirmwareCopierOS

- (PS190RestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PS190RestoreInfoFirmwareCopierOS;
  v9 = -[PS190SoCRestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]( &v17,  sel_initWithOptions_logFunction_logContext_,  v8,  a4,  a5);
  if (!v9) {
    goto LABEL_5;
  }
  id v10 = (id)[v8 objectForKeyedSubscript:@"BuildIdentity"];
  id v11 = (id)[v10 valueForKeyWithSuffix:@",BoardID"];
  if (!v11)
  {
    -[PS190SoCRestoreInfoHelperOS log:]( v9,  "log:",  @"%s: Failed to locate board ID",  "-[PS190RestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]");
LABEL_8:

    v15 = 0LL;
    goto LABEL_9;
  }

  v12 = v11;
  v9->_boardID = [v11 unsignedIntValue];
  id v13 = (id)[v10 valueForKeyWithSuffix:@",SecurityDomain"];
  v14 = v13;
  if (!v13)
  {
    -[PS190SoCRestoreInfoHelperOS log:]( v9,  "log:",  @"%s: Failed to locate security domain",  "-[PS190RestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]");

    goto LABEL_8;
  }

  v9->_securityDomain = [v13 unsignedIntValue];

LABEL_5:
  v15 = v9;
LABEL_9:

  return v15;
}

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  return (id)objc_msgSend(a3, "keyWithSuffix:", @",Firmware", a4);
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

@end