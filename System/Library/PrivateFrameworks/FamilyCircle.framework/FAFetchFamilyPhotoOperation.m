@interface FAFetchFamilyPhotoOperation
- (BOOL)localFallback;
- (BOOL)useMonogramAsLastResort;
- (FAFamilyPhotoCache)cache;
- (FAFetchFamilyPhotoOperation)initWithNetworkService:(id)a3 memberDSID:(id)a4 memberHashedDSID:(id)a5 size:(int64_t)a6 localFallback:(BOOL)a7 context:(id)a8 requestCoalescer:(id)a9 fetchFamilyFactory:(id)a10;
- (FAFetchFamilyPhotoOperationContext)context;
- (FARequestCoalescer)requestCoalescer;
- (NSNumber)dsid;
- (NSString)clientProcess;
- (NSString)emailAddress;
- (NSString)fullname;
- (NSString)hashedDSID;
- (NSString)phoneNumber;
- (double)monogramDiameter;
- (double)screenScale;
- (id)_monogramForContact:(id)a3;
- (id)_monogramWithFirstName:(id)a3 lastName:(id)a4;
- (id)familyMemberMatchingDSID;
- (id)fetchCachedPhotoForFamilyMember:(id)a3;
- (id)fetchFamilyFactory;
- (id)fetchPhoto;
- (id)fetchRemotePhotoForFamilyMember:(id)a3;
- (int64_t)backgroundType;
- (int64_t)size;
- (void)setBackgroundType:(int64_t)a3;
- (void)setCache:(id)a3;
- (void)setClientProcess:(id)a3;
- (void)setDsid:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFetchFamilyFactory:(id)a3;
- (void)setFullname:(id)a3;
- (void)setHashedDSID:(id)a3;
- (void)setLocalFallback:(BOOL)a3;
- (void)setMonogramDiameter:(double)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setRequestCoalescer:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setUseMonogramAsLastResort:(BOOL)a3;
@end

@implementation FAFetchFamilyPhotoOperation

- (FAFetchFamilyPhotoOperation)initWithNetworkService:(id)a3 memberDSID:(id)a4 memberHashedDSID:(id)a5 size:(int64_t)a6 localFallback:(BOOL)a7 context:(id)a8 requestCoalescer:(id)a9 fetchFamilyFactory:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a8;
  id v17 = a9;
  id v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___FAFetchFamilyPhotoOperation;
  v19 = -[FANetworkClient initWithNetworkService:](&v27, "initWithNetworkService:", a3);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dsid, a4);
    objc_storeStrong((id *)&v20->_hashedDSID, a5);
    v20->_size = a6;
    v20->_localFallback = a7;
    objc_storeStrong((id *)&v20->_context, a8);
    v20->_useMonogramAsLastResort = 1;
    id v21 = objc_retainBlock(v18);
    id fetchFamilyFactory = v20->_fetchFamilyFactory;
    v20->_id fetchFamilyFactory = v21;

    objc_storeStrong((id *)&v20->_requestCoalescer, a9);
  }

  return v20;
}

- (id)fetchPhoto
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ensureDeviceUnlockedSinceBoot]);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v4 then]);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000BD58;
  v17[3] = &unk_100040EA0;
  v17[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000BD94;
  v16[3] = &unk_100040F08;
  v16[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue([v10 thenOnQueue]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000BD9C;
  v15[3] = &unk_1000418A8;
  v15[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, dispatch_queue_s *, void *))v11)[2](v11, &_dispatch_main_q, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)familyMemberMatchingDSID
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000C4B4;
  v3[3] = &unk_1000410C0;
  v3[4] = self;
  return -[AAFPromise initWithBlock:](objc_alloc(&OBJC_CLASS___AAFPromise), "initWithBlock:", v3);
}

- (id)fetchCachedPhotoForFamilyMember:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = (id)objc_opt_class(self);
    __int16 v16 = 2112;
    id v17 = v4;
    id v8 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Fetching cached photo for member %@",  (uint8_t *)&v14,  0x16u);
  }

  uint64_t v9 = objc_alloc(&OBJC_CLASS___FAFamilyPhotoCache);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  v11 = -[FAFamilyPhotoCache initWithAltDSID:](v9, "initWithAltDSID:", v10);

  -[FAFetchFamilyPhotoOperation setCache:](self, "setCache:", v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FAFamilyPhotoCache load](v11, "load"));

  return v12;
}

- (id)fetchRemotePhotoForFamilyMember:(id)a3
{
  id v4 = a3;
  uint64_t v6 = _FALogSystem(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = (id)objc_opt_class(self);
    __int16 v21 = 2112;
    id v22 = v4;
    id v8 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%@: Fetching remote photo for member %@",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 dsid]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"FAFetchFamilyPhotoOperationKeyPrefix",  v10));

  requestCoalescer = self->_requestCoalescer;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10000CAE8;
  v16[3] = &unk_100040FF8;
  id v17 = v4;
  id v18 = self;
  id v13 = v4;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( -[FARequestCoalescer performBlockForKey:force:block:]( requestCoalescer,  "performBlockForKey:force:block:",  v11,  0LL,  v16));

  return v14;
}

- (id)_monogramWithFirstName:(id)a3 lastName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___CNMutableContact);
  -[CNMutableContact setContactType:](v8, "setContactType:", 0LL);
  -[CNMutableContact setGivenName:](v8, "setGivenName:", v7);

  -[CNMutableContact setFamilyName:](v8, "setFamilyName:", v6);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyPhotoOperation _monogramForContact:](self, "_monogramForContact:", v8));

  return v9;
}

- (id)_monogramForContact:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[FAFetchFamilyPhotoOperation backgroundType](self, "backgroundType");
  double monogramDiameter = self->_monogramDiameter;
  -[FAFetchFamilyPhotoOperation screenScale](self, "screenScale");
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[FAMonogram monogramWithBackgroundType:contact:diameter:scale:]( &OBJC_CLASS___FAMonogram,  "monogramWithBackgroundType:contact:diameter:scale:",  v5,  v4,  monogramDiameter,  v7));

  return v8;
}

- (double)screenScale
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2050000000LL;
  v2 = (void *)qword_100052700;
  uint64_t v12 = qword_100052700;
  if (!qword_100052700)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000D400;
    v8[3] = &unk_100041970;
    v8[4] = &v9;
    sub_10000D400((uint64_t)v8);
    v2 = (void *)v10[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainScreen]);
  [v4 scale];
  double v6 = v5;

  return v6;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)hashedDSID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setHashedDSID:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (BOOL)localFallback
{
  return self->_localFallback;
}

- (void)setLocalFallback:(BOOL)a3
{
  self->_localFallback = a3;
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void)setMonogramDiameter:(double)a3
{
  self->_double monogramDiameter = a3;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_backgroundType = a3;
}

- (BOOL)useMonogramAsLastResort
{
  return self->_useMonogramAsLastResort;
}

- (void)setUseMonogramAsLastResort:(BOOL)a3
{
  self->_useMonogramAsLastResort = a3;
}

- (NSString)fullname
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setFullname:(id)a3
{
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)clientProcess
{
  return (NSString *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setClientProcess:(id)a3
{
}

- (FAFetchFamilyPhotoOperationContext)context
{
  return self->_context;
}

- (id)fetchFamilyFactory
{
  return self->_fetchFamilyFactory;
}

- (void)setFetchFamilyFactory:(id)a3
{
}

- (FAFamilyPhotoCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (FARequestCoalescer)requestCoalescer
{
  return self->_requestCoalescer;
}

- (void)setRequestCoalescer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end