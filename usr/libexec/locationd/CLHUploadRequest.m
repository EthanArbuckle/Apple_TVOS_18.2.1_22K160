@interface CLHUploadRequest
- (CLHEndpointSelector)endpointSelector;
- (CLHRequestArchive)requestArchive;
- (CLHUploadRequest)initWithArchive:(id)a3;
- (CLHUploadRequest)initWithPayload:(id)a3;
- (CLHUploadRequest)initWithPayload:(id)a3 requestTypeCode:(unsigned int)a4 endpoint:(id)a5 headers:(id)a6;
- (CLHUploadRequest)initWithRequest:(id)a3 endpoint:(id)a4 headers:(id)a5;
- (NSDictionary)headers;
- (NSURL)endpoint;
- (NSURLRequest)URLRequest;
- (id)description;
- (id)jsonObject;
- (unsigned)requestTypeCode;
- (void)dealloc;
- (void)setEndpoint:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setRequestTypeCode:(unsigned int)a3;
@end

@implementation CLHUploadRequest

- (CLHUploadRequest)initWithPayload:(id)a3 requestTypeCode:(unsigned int)a4 endpoint:(id)a5 headers:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CLHUploadRequest;
  v10 = -[CLHUploadRequest init](&v12, "init");
  if (v10)
  {
    v10->_payload = (NSData *)a3;
    v10->_requestTypeCode = a4;
    v10->_endpoint = (NSURL *)a5;
    v10->_headers = (NSDictionary *)a6;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHUploadRequest;
  -[CLHUploadRequest dealloc](&v3, "dealloc");
}

- (CLHUploadRequest)initWithRequest:(id)a3 endpoint:(id)a4 headers:(id)a5
{
  id v9 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  [a3 writeTo:v9];
  v10 = -[CLHUploadRequest initWithPayload:requestTypeCode:endpoint:headers:]( self,  "initWithPayload:requestTypeCode:endpoint:headers:",  [v9 immutableData],  objc_msgSend(a3, "requestTypeCode"),  a4,  a5);

  return v10;
}

- (CLHUploadRequest)initWithArchive:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLHUploadRequest;
  v4 = -[CLHUploadRequest init](&v6, "init");
  if (v4) {
    v4->_requestArchive = (CLHRequestArchive *)a3;
  }
  return v4;
}

- (CLHUploadRequest)initWithPayload:(id)a3
{
  return -[CLHUploadRequest initWithPayload:requestTypeCode:endpoint:headers:]( self,  "initWithPayload:requestTypeCode:endpoint:headers:",  a3,  0LL,  0LL,  0LL);
}

- (NSURLRequest)URLRequest
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableURLRequest);
  -[NSMutableURLRequest setURL:](v3, "setURL:", self->_endpoint);
  -[NSMutableURLRequest setHTTPMethod:](v3, "setHTTPMethod:", @"POST");
  -[NSMutableURLRequest setTimeoutInterval:](v3, "setTimeoutInterval:", 60.0);
  headers = self->_headers;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100EA6298;
  v12[3] = &unk_10188A7C0;
  v12[4] = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](headers, "enumerateKeysAndObjectsUsingBlock:", v12);
  requestArchive = self->_requestArchive;
  if (requestArchive)
  {
    payload = -[CLHRequestArchive mappedDataByDestructivelyCombiningPrimaryAndSecondaryData]( requestArchive,  "mappedDataByDestructivelyCombiningPrimaryAndSecondaryData");
  }

  else
  {
    payload = self->_payload;
    if (!payload)
    {
      if (qword_1019349B0 != -1) {
        dispatch_once(&qword_1019349B0, &stru_10188A7E0);
      }
      v7 = (os_log_s *)qword_1019349B8;
      if (os_log_type_enabled((os_log_t)qword_1019349B8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Request archive and Payload both were nil for upload request",  buf,  2u);
      }

      if (sub_1002921D0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1019349B0 != -1) {
          dispatch_once(&qword_1019349B0, &stru_10188A7E0);
        }
        __int16 v11 = 0;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019349B8,  16LL,  "Request archive and Payload both were nil for upload request",  &v11,  2);
        v10 = (uint8_t *)v9;
        sub_10029211C("Generic", 1LL, 0, 0LL, "-[CLHUploadRequest URLRequest]", "%s\n", v9);
        if (v10 != buf) {
          free(v10);
        }
      }

      payload = 0LL;
    }
  }

  -[NSMutableURLRequest setHTTPBody:](v3, "setHTTPBody:", payload);
  return (NSURLRequest *)v3;
}

- (id)jsonObject
{
  requestArchive = self->_requestArchive;
  v4 = @"archive";
  v5 = requestArchive;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL);
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"requestCode: %d, itemCount: %lu",  -[CLHRequestArchive requestCode](self->_requestArchive, "requestCode"),  -[CLHRequestArchive count](self->_requestArchive, "count"));
}

- (unsigned)requestTypeCode
{
  return self->_requestTypeCode;
}

- (void)setRequestTypeCode:(unsigned int)a3
{
  self->_requestTypeCode = a3;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSURL)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (CLHEndpointSelector)endpointSelector
{
  return self->_endpointSelector;
}

- (CLHRequestArchive)requestArchive
{
  return self->_requestArchive;
}

@end