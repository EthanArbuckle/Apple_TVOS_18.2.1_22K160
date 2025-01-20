@interface PDFamilyCircleMembersRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)_isValidFamilyMember:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)isPendingMembers;
- (NSArray)completionHandlers;
- (PDFamilyCircleMembersRequest)init;
- (id)_pkFamilyMemberArrayFromFAFamilyMemberArray:(id)a3;
- (unint64_t)cachePolicy;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)executeRequestWithManager:(id)a3 completion:(id)a4;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setPendingMembers:(BOOL)a3;
@end

@implementation PDFamilyCircleMembersRequest

- (PDFamilyCircleMembersRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PDFamilyCircleMembersRequest;
  v2 = -[PDFamilyCircleMembersRequest init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }

  return v2;
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
  return 0LL;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PDFamilyCircleMembersRequest _canCoalesceRequest:](self, "_canCoalesceRequest:", v4);
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
  id v5 = -[PDFamilyCircleMembersRequest requestType](self, "requestType");
  if (v5 == [v4 requestType])
  {
    id v6 = v4;
    int pendingMembers = self->_pendingMembers;
    if (pendingMembers == [v6 isPendingMembers])
    {
      id cachePolicy = (id)self->_cachePolicy;
      BOOL v9 = cachePolicy == [v6 cachePolicy] || self->_cachePolicy == 1;
    }

    else
    {
      BOOL v9 = 0;
    }
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)executeRequestWithManager:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1002D4834;
  v15[3] = &unk_10063F520;
  v15[4] = self;
  id v16 = a4;
  id v5 = v16;
  id v6 = objc_retainBlock(v15);
  id v7 = objc_alloc_init(&OBJC_CLASS___FAFetchFamilyCircleRequest);
  v8 = v7;
  unint64_t cachePolicy = self->_cachePolicy;
  uint64_t v10 = 1LL;
  if (cachePolicy == 1) {
    uint64_t v10 = 2LL;
  }
  if (cachePolicy == 2) {
    uint64_t v11 = 0LL;
  }
  else {
    uint64_t v11 = v10;
  }
  [v7 setCachePolicy:v11];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002D4950;
  v13[3] = &unk_100653AA0;
  v13[4] = self;
  id v14 = v6;
  v12 = v6;
  [v8 startRequestWithCompletionHandler:v13];
}

- (id)_pkFamilyMemberArrayFromFAFamilyMemberArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        v12 = -[PKFamilyMember initWithFAFamilyMember:]( objc_alloc(&OBJC_CLASS___PKFamilyMember),  "initWithFAFamilyMember:",  v11);
        if (-[PDFamilyCircleMembersRequest _isValidFamilyMember:](self, "_isValidFamilyMember:", v12))
        {
          -[NSMutableArray safelyAddObject:](v5, "safelyAddObject:", v12);
        }

        else
        {
          uint64_t Object = PKLogFacilityTypeGetObject(6LL);
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue([v11 dictionary]);
            *(_DWORD *)buf = 138412546;
            v23 = v12;
            __int16 v24 = 2112;
            v25 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error!! Family Member has invalid data %@. FAFamilyMember: %@ Please file a radar.",  buf,  0x16u);
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v8);
  }

  id v16 = -[NSMutableArray copy](v5, "copy");
  return v16;
}

- (BOOL)_isValidFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = [v3 status];
  if (v4 == (id)2)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 dsid]);
    if (v5)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 altDSID]);
      BOOL v6 = [v7 length] != 0;
    }

    else
    {
      BOOL v6 = 0;
    }

    goto LABEL_8;
  }

  if (v4 == (id)1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 inviteEmail]);
    BOOL v6 = [v5 length] != 0;
LABEL_8:

    goto LABEL_9;
  }

  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_unint64_t cachePolicy = a3;
}

- (BOOL)isPendingMembers
{
  return self->_pendingMembers;
}

- (void)setPendingMembers:(BOOL)a3
{
  self->_int pendingMembers = a3;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end