@interface ICDRequest
+ (id)request;
- (BOOL)acceptsGzipEncoding;
- (BOOL)includeCloudLibraryDAAPDebugFeature;
- (BOOL)isConcurrent;
- (BOOL)requestGroupEntityPayloadForTrackSourceMatch;
- (ICDRequest)initWithAction:(id)a3;
- (NSData)bodyData;
- (NSString)action;
- (NSString)requestingBundleID;
- (NSString)sagaClientFeaturesVersion;
- (NSURL)responseDataDestinationFileURL;
- (double)timeoutInterval;
- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (id)_HTTPMethodStringForICDRequestMethod:(int64_t)a3;
- (id)canonicalResponseForResponse:(id)a3;
- (id)description;
- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (int64_t)allowedRetryCount;
- (int64_t)method;
- (int64_t)reason;
- (int64_t)requestPersonalizationStyle;
- (int64_t)verificationInteractionLevel;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setBodyData:(id)a3;
- (void)setIncludeCloudLibraryDAAPDebugFeature:(BOOL)a3;
- (void)setMethod:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestGroupEntityPayloadForTrackSourceMatch:(BOOL)a3;
- (void)setRequestPersonalizationStyle:(int64_t)a3;
- (void)setRequestingBundleID:(id)a3;
- (void)setResponseDataDestinationFileURL:(id)a3;
- (void)setSagaClientFeaturesVersion:(id)a3;
- (void)setValue:(id)a3 forArgument:(id)a4;
- (void)setVerificationInteractionLevel:(int64_t)a3;
@end

@implementation ICDRequest

- (ICDRequest)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ICDRequest;
  v5 = -[ICDRequest init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    *((void *)v5 + 11) = 1LL;
    *((void *)v5 + 6) = 1LL;
    *(_WORD *)(v5 + 17) = 0;
  }

  return (ICDRequest *)v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ICDRequest;
  id v3 = -[ICDRequest description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICDRequest _HTTPMethodStringForICDRequestMethod:]( self,  "_HTTPMethodStringForICDRequestMethod:",  self->_method));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingFormat:@" %@ [%@]", v5, self->_action]);

  return v6;
}

- (double)timeoutInterval
{
  return 60.0;
}

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    objc_super v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_super v9 = self->_arguments;
    self->_arguments = &v8->super;

    arguments = self->_arguments;
  }

  -[NSDictionary setObject:forKey:](arguments, "setObject:forKey:", v10, v6);
}

- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = -[NSString mutableCopy](self->_action, "mutableCopy");
  if ((_DWORD)v4)
  {
    arguments = self->_arguments;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v4));
    -[NSDictionary setValue:forKey:](arguments, "setValue:forKey:", v9, @"session-id");
  }

  if (-[NSDictionary count](self->_arguments, "count"))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v11 = self->_arguments;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001091FC;
    v17[3] = &unk_1001A6A30;
    id v12 = v10;
    id v18 = v12;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@"&"]);
    if (self->_requestGroupEntityPayloadForTrackSourceMatch) {
      v14 = @"&";
    }
    else {
      v14 = @"?";
    }
    [v7 appendString:v14];
    [v7 appendString:v13];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v7, v6));

  return v15;
}

- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[ICDRequest requestURLForBaseURL:sessionID:]( self,  "requestURLForBaseURL:sessionID:",  a3,  *(void *)&a4));
  -[ICDRequest timeoutInterval](self, "timeoutInterval");
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v5,  0LL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[ICDRequest _HTTPMethodStringForICDRequestMethod:]( self,  "_HTTPMethodStringForICDRequestMethod:",  self->_method));
  [v6 setHTTPMethod:v7];

  if (-[ICDRequest acceptsGzipEncoding](self, "acceptsGzipEncoding")) {
    [v6 setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
  }
  if (-[NSData length](self->_bodyData, "length")) {
    [v6 setHTTPBody:self->_bodyData];
  }
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d.%d", 3LL, 16LL));
  [v6 setValue:v8 forHTTPHeaderField:@"Client-iTunes-Sharing-Version"];

  return v6;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (id)_HTTPMethodStringForICDRequestMethod:(int64_t)a3
{
  if (a3 == 1) {
    return @"POST";
  }
  else {
    return @"GET";
  }
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (int64_t)method
{
  return self->_method;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
}

- (int64_t)verificationInteractionLevel
{
  return self->_verificationInteractionLevel;
}

- (void)setVerificationInteractionLevel:(int64_t)a3
{
  self->_verificationInteractionLevel = a3;
}

- (NSURL)responseDataDestinationFileURL
{
  return self->_responseDataDestinationFileURL;
}

- (void)setResponseDataDestinationFileURL:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (NSString)requestingBundleID
{
  return self->_requestingBundleID;
}

- (void)setRequestingBundleID:(id)a3
{
}

- (BOOL)requestGroupEntityPayloadForTrackSourceMatch
{
  return self->_requestGroupEntityPayloadForTrackSourceMatch;
}

- (void)setRequestGroupEntityPayloadForTrackSourceMatch:(BOOL)a3
{
  self->_requestGroupEntityPayloadForTrackSourceMatch = a3;
}

- (int64_t)requestPersonalizationStyle
{
  return self->_requestPersonalizationStyle;
}

- (void)setRequestPersonalizationStyle:(int64_t)a3
{
  self->_requestPersonalizationStyle = a3;
}

- (BOOL)includeCloudLibraryDAAPDebugFeature
{
  return self->_includeCloudLibraryDAAPDebugFeature;
}

- (void)setIncludeCloudLibraryDAAPDebugFeature:(BOOL)a3
{
  self->_includeCloudLibraryDAAPDebugFeature = a3;
}

- (NSString)sagaClientFeaturesVersion
{
  return self->_sagaClientFeaturesVersion;
}

- (void)setSagaClientFeaturesVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)request
{
  uint64_t v3 = objc_opt_class(a1, a2);
  if (v3 == objc_opt_class(&OBJC_CLASS___ICDRequest, v4)) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"subclass must implement");
  }
  return objc_alloc_init((Class)objc_opt_class(a1, v5));
}

@end