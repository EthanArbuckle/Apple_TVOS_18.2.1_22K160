@interface IDSIMLEncryptionComponent
- (IDSIMLEncryptionComponent)initWithEncryptionController:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSIMLEncryptionComponent

- (IDSIMLEncryptionComponent)initWithEncryptionController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSIMLEncryptionComponent;
  v6 = -[IDSIMLEncryptionComponent init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_encryptionController, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dataToEncrypt]);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 guid]);
    v7 = (void *)v6;
    v8 = @"YES";
    if (!v4) {
      v8 = @"NO";
    }
    int v11 = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "GUID %@ finished encryption with success: %@",  (uint8_t *)&v11,  0x16u);
  }

  [v3 setEncryptedTopLevelPayload:v4];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[CUTUnsafePromise fulfilledPromiseWithValue:]( &OBJC_CLASS___CUTUnsafePromise,  "fulfilledPromiseWithValue:",  v3));

  return v9;
}

- (void).cxx_destruct
{
}

@end