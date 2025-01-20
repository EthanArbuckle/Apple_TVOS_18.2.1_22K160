@interface PDBarcodeServiceBarcodeEventResponse
- (BOOL)transactionAvailable;
- (PDBarcodeServiceBarcodeEventResponse)initWithData:(id)a3;
- (id)description;
@end

@implementation PDBarcodeServiceBarcodeEventResponse

- (PDBarcodeServiceBarcodeEventResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_13;
  }
  id v17 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v4,  0LL,  &v17));
  id v7 = v17;
  if (v7)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(28LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      v10 = "PDBarcodeServiceBarcodeEventResponse failed to parse response data with error: %@";
      v11 = v9;
      uint32_t v12 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_12;
    }

    goto LABEL_12;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v5, v13) & 1) == 0)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(28LL);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "PDBarcodeServiceBarcodeEventResponse body is not a dictionary";
      v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_11;
    }

- (id)description
{
  if (self->_transactionAvailable) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PDBarcodeServiceBarcodeEventResponse <%p>: transactionAvailable %@",  self,  v2);
}

- (BOOL)transactionAvailable
{
  return self->_transactionAvailable;
}

@end