@interface PDBarcodeServiceConnectionForbiddenErrorResponse
- (NSString)serverDebugDescription;
- (PDBarcodeServiceConnectionForbiddenErrorResponse)initWithData:(id)a3;
- (int64_t)errorCode;
@end

@implementation PDBarcodeServiceConnectionForbiddenErrorResponse

- (PDBarcodeServiceConnectionForbiddenErrorResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = 0LL;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v19));
    serverDebugDescription = (NSString *)v19;
    if (serverDebugDescription)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(28LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = serverDebugDescription;
        v10 = "PDAuxiliaryCapabilityConnectionForbiddenErrorResponse failed to parse response data with error: %@";
        v11 = v9;
        uint32_t v12 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        goto LABEL_14;
      }

      goto LABEL_14;
    }

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v14) & 1) == 0)
    {
      uint64_t v16 = PKLogFacilityTypeGetObject(28LL);
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "PDAuxiliaryCapabilityConnectionForbiddenErrorResponse body is not a dictionary";
        v11 = v9;
        uint32_t v12 = 2;
        goto LABEL_13;
      }

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)serverDebugDescription
{
  return self->_serverDebugDescription;
}

- (void).cxx_destruct
{
}

@end