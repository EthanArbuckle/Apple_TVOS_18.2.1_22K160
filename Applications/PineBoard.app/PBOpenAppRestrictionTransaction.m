@interface PBOpenAppRestrictionTransaction
- (BOOL)_needsUI;
- (BOOL)passwordWasRequested;
- (PBOpenAppRestrictionTransaction)initWithRequest:(id)a3;
- (PBOpenApplicationRequest)openRequest;
- (PBRestrictionServiceRequest)restrictionRequest;
- (unint64_t)restrictionValue;
- (void)_begin;
- (void)setRestrictionValue:(unint64_t)a3;
@end

@implementation PBOpenAppRestrictionTransaction

- (PBOpenAppRestrictionTransaction)initWithRequest:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PBOpenAppRestrictionTransaction;
  v6 = -[PBOpenAppRestrictionTransaction init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_openRequest, a3);
    v8 = objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v10 = -[PBRestrictionServiceRequest initWithToken:requestType:](v8, "initWithToken:requestType:", v9, 1LL);
    restrictionRequest = v7->_restrictionRequest;
    v7->_restrictionRequest = v10;

    -[PBRestrictionServiceRequest setRestrictionContentType:]( v7->_restrictionRequest,  "setRestrictionContentType:",  3LL);
    v12 = v7->_restrictionRequest;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v5 toAppInfo]);
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v13 ratingRank]));
    -[PBRestrictionServiceRequest setRating:](v12, "setRating:", v14);

    -[PBRestrictionServiceRequest setAllowInteraction:](v7->_restrictionRequest, "setAllowInteraction:", 1LL);
  }

  return v7;
}

- (void)_begin
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___PBOpenAppRestrictionTransaction;
  -[PBOpenAppRestrictionTransaction _begin](&v11, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppRestrictionTransaction openRequest](self, "openRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 toAppInfo]);

  if (-[PBOpenAppRestrictionTransaction _needsUI](self, "_needsUI"))
  {
    self->_passwordWasRequested = 1;
    objc_initWeak(&location, self);
    restrictionRequest = self->_restrictionRequest;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100094CB0;
    v7[3] = &unk_1003D44B0;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    -[PBRestrictionServiceRequest setServiceRequestCompletionBlock:]( restrictionRequest,  "setServiceRequestCompletionBlock:",  v7);
    -[PBOpenAppRestrictionTransaction addMilestone:](self, "addMilestone:", @"ValidateRestriction");
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
    [v6 validateRestrictionForContentTypesWithRequest:self->_restrictionRequest];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  else
  {
    self->_restrictionValue = 0LL;
  }
}

- (BOOL)_needsUI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBRestrictionServiceRequestManager sharedManager]( &OBJC_CLASS___PBRestrictionServiceRequestManager,  "sharedManager"));
  unsigned __int8 v4 = [v3 requestPassesAgeRestriction:self->_restrictionRequest];

  if ((v4 & 1) != 0
    || (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppRestrictionTransaction openRequest](self, "openRequest")),
        v6 = (void *)objc_claimAutoreleasedReturnValue([v5 toAppInfo]),
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 applicationInfo]),
        id v8 = [v7 type],
        v7,
        v6,
        v5,
        v8 != (id)2))
  {
    LOBYTE(v10) = 0;
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBOpenAppRestrictionTransaction openRequest](self, "openRequest"));
    unsigned int v10 = [v9 waitForDebugger] ^ 1;
  }

  return v10;
}

- (PBOpenApplicationRequest)openRequest
{
  return self->_openRequest;
}

- (unint64_t)restrictionValue
{
  return self->_restrictionValue;
}

- (void)setRestrictionValue:(unint64_t)a3
{
  self->_restrictionValue = a3;
}

- (BOOL)passwordWasRequested
{
  return self->_passwordWasRequested;
}

- (PBRestrictionServiceRequest)restrictionRequest
{
  return self->_restrictionRequest;
}

- (void).cxx_destruct
{
}

@end