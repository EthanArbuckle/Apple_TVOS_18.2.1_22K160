@interface PDBarcodeServiceBarcodeEventTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSData)event;
- (NSData)signature;
- (NSString)barcodeIdentifier;
- (PDBarcodeServiceBarcodeEventTask)initWithCoder:(id)a3;
- (id)bodyDictionary;
- (id)description;
- (id)endpointComponents;
- (id)method;
- (void)encodeWithCoder:(id)a3;
- (void)handleError:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setBarcodeIdentifier:(id)a3;
- (void)setEvent:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation PDBarcodeServiceBarcodeEventTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDBarcodeServiceBarcodeEventTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask;
  v6 = -[PDBarcodeServiceConnectionTask initWithCoder:](&v19, "initWithCoder:", v4);
  if (v6)
  {
    id v7 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v5),  @"barcodeIdentifier");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    barcodeIdentifier = v6->_barcodeIdentifier;
    v6->_barcodeIdentifier = (NSString *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v10), @"event");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    event = v6->_event;
    v6->_event = (NSData *)v12;

    id v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v14), @"signature");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    signature = v6->_signature;
    v6->_signature = (NSData *)v16;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask;
  id v4 = a3;
  -[PDBarcodeServiceConnectionTask encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_barcodeIdentifier,  @"barcodeIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_event forKey:@"event"];
  [v4 encodeObject:self->_signature forKey:@"signature"];
}

- (BOOL)isValid
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask;
  BOOL v3 = -[PDBarcodeServiceConnectionTask isValid](&v5, "isValid");
  if (v3) {
    LOBYTE(v3) = self->_barcodeIdentifier && self->_event && self->_signature != 0LL;
  }
  return v3;
}

- (id)method
{
  return @"POST";
}

- (id)endpointComponents
{
  v3[0] = @"v1";
  v3[1] = @"barcode";
  v3[2] = self->_barcodeIdentifier;
  v3[3] = @"event";
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  4LL));
}

- (id)bodyDictionary
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_event, "base64EncodedStringWithOptions:", 0LL));
  [v3 setObject:v4 forKey:@"event"];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_signature, "base64EncodedStringWithOptions:", 0LL));
  [v3 setObject:v5 forKey:@"signature"];

  id v6 = [v3 copy];
  return v6;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PDBarcodeServiceBarcodeEventTask;
  id v7 = a3;
  -[PDBarcodeServiceConnectionTask handleResponse:data:](&v18, "handleResponse:data:", v7, v6);
  id v8 = [v7 statusCode];

  if (v8 == (id)403)
  {
    id v11 = -[PDBarcodeServiceConnectionForbiddenErrorResponse initWithData:]( objc_alloc(&OBJC_CLASS___PDBarcodeServiceConnectionForbiddenErrorResponse),  "initWithData:",  v6);
    if ((id)-[PDBarcodeServiceConnectionForbiddenErrorResponse errorCode](v11, "errorCode") == (id)40601)
    {
      id v16 = PDTaskError(40601LL, self, 0LL, @"Invalid Certificate", v12, v13, v14, v15, (uint64_t)v18.receiver);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[PDNetworkTask reportError:](self, "reportError:", v17);
    }

    -[PDNetworkTask fail](self, "fail", v18.receiver, v18.super_class);
  }

  else if (v8 == (id)200)
  {
    v9 = objc_alloc(&OBJC_CLASS___PDBarcodeServiceBarcodeEventResponse);
    uint64_t v10 = -[PDBarcodeServiceBarcodeEventResponse initWithData:](v9, "initWithData:", v6, v18.receiver, v18.super_class);
    -[PDNetworkTask deliverResult:](self, "deliverResult:", v10);

    -[PDNetworkTask succeed](self, "succeed");
  }

  else
  {
    -[PDNetworkTask fail](self, "fail", v18.receiver, v18.super_class);
  }
}

- (void)handleError:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(28LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error: %@ (%@)", (uint8_t *)&v7, 0x16u);
  }

  -[PDNetworkTask fail](self, "fail");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"BarcodeEvent Task (barcode identifier: %@)",  self->_barcodeIdentifier);
}

- (NSString)barcodeIdentifier
{
  return self->_barcodeIdentifier;
}

- (void)setBarcodeIdentifier:(id)a3
{
}

- (NSData)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end