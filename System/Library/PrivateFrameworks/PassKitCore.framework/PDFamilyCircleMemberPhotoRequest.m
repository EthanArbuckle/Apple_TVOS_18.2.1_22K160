@interface PDFamilyCircleMemberPhotoRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSNumber)dsid;
- (NSString)description;
- (PDFamilyCircleMemberPhotoRequest)init;
- (PDFamilyCircleMemberPhotoRequest)initWithDSID:(id)a3;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)executeRequestWithManager:(id)a3 completion:(id)a4;
@end

@implementation PDFamilyCircleMemberPhotoRequest

- (PDFamilyCircleMemberPhotoRequest)init
{
  return -[PDFamilyCircleMemberPhotoRequest initWithDSID:](self, "initWithDSID:", 0LL);
}

- (PDFamilyCircleMemberPhotoRequest)initWithDSID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDFamilyCircleMemberPhotoRequest;
  v6 = -[PDFamilyCircleMemberPhotoRequest init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = v7;

    objc_storeStrong((id *)&v6->_dsid, a3);
  }

  return v6;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v4);
  }

- (unint64_t)requestType
{
  return 1LL;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDFamilyCircleMemberPhotoRequest _canCoalesceRequest:](self, "_canCoalesceRequest:", v4);
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 completionHandlers]);
    -[NSMutableArray addObjectsFromArray:](completionHandlers, "addObjectsFromArray:", v7);
  }

  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  id v5 = -[PDFamilyCircleMemberPhotoRequest requestType](self, "requestType");
  if (v5 == [v4 requestType])
  {
    dsid = self->_dsid;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 dsid]);
    char v8 = PKEqualObjects(dsid, v7);
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)executeRequestWithManager:(id)a3 completion:(id)a4
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002D50F4;
  v14[3] = &unk_100653AC8;
  v14[4] = self;
  id v5 = a4;
  id v15 = v5;
  v6 = objc_retainBlock(v14);
  dsid = self->_dsid;
  uint64_t Object = PKLogFacilityTypeGetObject(6LL);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (dsid)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v17 = dsid;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Family member image request for dsid %@",  buf,  0xCu);
    }

    id v11 = [[FAFetchFamilyPhotoRequest alloc] initWithFamilyMemberDSID:self->_dsid size:1 localFallback:1];
    [v11 setMonogramDiameter:100.0];
    [v11 setBackgroundType:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1002D5210;
    v12[3] = &unk_100653AF0;
    v12[4] = self;
    v13 = v6;
    [v11 startRequestWithCompletionHandler:v12];
  }

  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Error: Cannot download image for family member because no dsid is defined.",  buf,  2u);
    }

    ((void (*)(void *, void))v6[2])(v6, 0LL);
  }
}

- (NSString)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  unint64_t v5 = -[PDFamilyCircleMemberPhotoRequest requestType](self, "requestType");
  v6 = @"members";
  if (v5 == 1) {
    v6 = @"photo";
  }
  if (v5 == 2) {
    v6 = @"memberType";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"requstType: '%@'; ", v6);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"dsid: '%@'; ", self->_dsid);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @">");
  return (NSString *)v3;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end