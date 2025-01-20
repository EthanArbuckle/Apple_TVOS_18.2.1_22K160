@interface SDXPCHelperConnection
+ (id)identifierForColor:(id)a3;
+ (id)makeActivatedConnection;
+ (void)updateCacheFromSFCGImageData:(id)a3 cacheKey:(id)a4 contactIDs:(id)a5;
- (CGImage)CGImageWithCacheKey:(id)a3 contactIDs:(id)a4 type:(id)a5;
- (CGImage)CGImgForActionPlatterWithTitle:(id)a3 tintColor:(id)a4;
- (CGImage)CGImgForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 processOppositeColor:(BOOL)a8;
- (CGImage)CGImgForNearbyBadgeWithCount:(int64_t)a3;
- (NSMutableArray)queuedBlocks;
- (NSString)serviceName;
- (SDXPCHelperConnection)initWithQueue:(id)a3;
- (SDXPCHelperConnection)initWithQueue:(id)a3 serviceName:(id)a4;
- (SDXPCHelperConnection)initWithQueue:(id)a3 xrRenderingMode:(unint64_t)a4;
- (id)CGImgDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 processOppositeColor:(BOOL)a5 activityCategory:(int64_t)a6;
- (id)CGImgForUIActivityTitles:(id)a3 foregroundColor:(id)a4 processOppositeColor:(BOOL)a5;
- (id)MD5HashOfStrings:(id)a3;
- (id)_loadGroupContactIdentityImage:(id)a3;
- (id)copyConversationIdentityImageIconDataForImage:(id)a3 forConversationIdentifier:(id)a4 style:(int64_t)a5 diameter:(double)a6 monogramsAsFlatImages:(BOOL)a7 isContactImage:(BOOL *)a8;
- (id)getOppositeColor:(id)a3;
- (id)groupMonogramImageDataForContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 processOppositeBackgroundStyle:(BOOL)a7;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)keyDerivedFromRelevantTraitCollectionProperties;
- (id)keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle;
- (id)loadBatchImageCacheData:(id)a3 cacheKey:(id)a4 mapCacheHitImage:(id)a5 runProxy:(id)a6 type:(id)a7;
- (id)monogramImageDataForContact:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 isContactImage:(BOOL *)a7;
- (id)monogramImagesForMultipleContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6;
- (id)perspectiveDataForActionPlatterWithTitle:(id)a3 tintColor:(id)a4;
- (id)perspectiveDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 activityCategory:(int64_t)a5;
- (id)perspectiveDataForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7;
- (id)perspectiveDataForNearbyBadgeWithCount:(int64_t)a3;
- (id)perspectiveDataForUIActivityTitle:(id)a3 textColor:(id)a4;
- (id)urlToCGImgDataForCallHandoffIconWithAppIconImageData:(id)a3 contact:(id)a4;
- (id)whitelistedDownloadsFolderURL;
- (void)_updateShareSheetHostConfiguration;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)sendShareSheetInvocationMetricsWithAppBundleID:(id)a3 numSuggestions:(int64_t)a4 suggestionDisplayNames:(id)a5 extensionsCacheResult:(id)a6 isDarkMode:(BOOL)a7 duration:(int64_t)a8 isCollaborative:(BOOL)a9;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueuedBlocks:(id)a3;
- (void)setSessionKeepAliveTransactionIdentifier:(id)a3;
- (void)updateShareSheetHostConfiguration:(id)a3;
@end

@implementation SDXPCHelperConnection

+ (void)updateCacheFromSFCGImageData:(id)a3 cacheKey:(id)a4 contactIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v12 = v7;
  if (v12)
  {
    uint64_t v10 = SFCreateCGImageFromData(v12);
    if (v10)
    {
      v11 = (const void *)v10;
      +[SDXPCHelperImageCache setImage:forKey:contactIDs:]( &OBJC_CLASS____TtC16DaemoniOSLibrary21SDXPCHelperImageCache,  "setImage:forKey:contactIDs:",  v10,  v8,  v9);
      CFRelease(v11);
    }
  }
}

- (SDXPCHelperConnection)initWithQueue:(id)a3 serviceName:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SDXPCHelperConnection;
  id v7 = -[SDXPCHelperConnection init](&v17, "init");
  if (v7)
  {
    uint64_t v8 = sharingXPCHelperLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    v7->_intervalID = os_signpost_id_generate(v9);

    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection description](v7, "description"));
    signpostName = v7->_signpostName;
    v7->_signpostName = (NSString *)v10;

    v7->_cacheAccessCount = 0LL;
    id v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    cacheAccessDict = v7->_cacheAccessDict;
    v7->_cacheAccessDict = v12;

    v7->_cacheAccessLock._os_unfair_lock_opaque = 0;
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    queuedBlocks = v7->_queuedBlocks;
    v7->_queuedBlocks = v14;

    objc_storeStrong((id *)&v7->_serviceName, a4);
  }

  return v7;
}

- (SDXPCHelperConnection)initWithQueue:(id)a3
{
  return -[SDXPCHelperConnection initWithQueue:serviceName:]( self,  "initWithQueue:serviceName:",  a3,  @"com.apple.SharingXPCHelper");
}

- (SDXPCHelperConnection)initWithQueue:(id)a3 xrRenderingMode:(unint64_t)a4
{
  return -[SDXPCHelperConnection initWithQueue:serviceName:]( self,  "initWithQueue:serviceName:",  a3,  @"com.apple.SharingXPCHelper");
}

- (void)activate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection serviceName](self, "serviceName"));
    v5 = -[NSXPCConnection initWithServiceName:](v3, "initWithServiceName:", v4);
    connectionToService = self->_connectionToService;
    self->_connectionToService = v5;

    if (self->_queue) {
      -[NSXPCConnection _setQueue:](self->_connectionToService, "_setQueue:");
    }
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SharingXPCHelperProtocol));
    -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToService, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setInvalidationHandler:]( self->_connectionToService,  "setInvalidationHandler:",  self->_invalidationHandler);
    -[NSXPCConnection setInterruptionHandler:]( self->_connectionToService,  "setInterruptionHandler:",  self->_interruptionHandler);
    -[NSXPCConnection resume](self->_connectionToService, "resume");
  }

- (void)invalidate
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10012B3D8;
  v16[3] = &unk_1005CB2F8;
  v16[4] = self;
  v3 = objc_retainBlock(v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    id v7 = objc_retainBlock(v3);
    [v6 addObject:v7];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    id v9 = [v8 copy];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](self, "queuedBlocks"));
    [v10 removeAllObjects];

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10012B460;
    v14[3] = &unk_1005CB2F8;
    id v15 = v9;
    id v13 = v9;
    dispatch_async(v12, v14);
  }

  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)dealloc
{
  if (!self->_invalidateCalled)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v4 handleFailureInMethod:a2 object:self file:@"SDXPCHelperConnection.m" lineNumber:198 description:@"SDXPCHelperConnection deallocated without -invalidate call"];

    if (!self->_invalidateCalled)
    {
      uint64_t v6 = daemon_log(v5);
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        sub_10012FB64();
      }
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDXPCHelperConnection;
  -[SDXPCHelperConnection dealloc](&v8, "dealloc");
}

+ (id)makeActivatedConnection
{
  v2 = -[SDXPCHelperConnection initWithQueue:](objc_alloc(&OBJC_CLASS___SDXPCHelperConnection), "initWithQueue:", 0LL);
  -[SDXPCHelperConnection setInvalidationHandler:](v2, "setInvalidationHandler:", &stru_1005CEEB0);
  -[SDXPCHelperConnection activate](v2, "activate");
  return v2;
}

- (id)whitelistedDownloadsFolderURL
{
  return 0LL;
}

- (id)monogramImageDataForContact:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 isContactImage:(BOOL *)a7
{
  BOOL v7 = a6;
  id v42 = a3;
  uint64_t v11 = sharingXPCHelperLog();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = intervalID;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "monogramImageDataForContact",  "%llu",  (uint8_t *)&buf,  0xCu);
  }

  id v15 = v42;
  if (!v42)
  {
    uint64_t v16 = sharingXPCHelperLog();
    objc_super v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "monogramImageDataForContact called with nil contact, will use fallback.",  (uint8_t *)&buf,  2u);
    }

    id v15 = 0LL;
  }

  uint64_t v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier", a7));
  v19 = (void *)v18;
  v20 = @"FALLBACK";
  if (v18) {
    v20 = (__CFString *)v18;
  }
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDXPCHelperConnection monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:]"));
  v53[0] = v22;
  v53[1] = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
  v53[2] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", floor(a5)));
  v53[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  v53[4] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 5LL));

  v27 = (void *)objc_claimAutoreleasedReturnValue([v26 componentsJoinedByString:@","]);
  v52 = v21;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));
  v29 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v27,  v28,  @"contact");

  if (v29)
  {
    uint64_t v30 = SFDataFromCGImage(v29);
    id v31 = (id)objc_claimAutoreleasedReturnValue(v30);
  }

  else
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000LL;
    v49 = sub_10012BACC;
    v50 = sub_10012BADC;
    id v51 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CEED0));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10012BB34;
    v43[3] = &unk_1005CEEF8;
    v43[4] = &buf;
    v43[5] = v41;
    [v32 monogramImageDataForContactSync:v42 style:a4 diameter:v7 monogramsAsFlatImages:v43 replyHandler:a5];

    uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40LL);
    v46 = v21;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  v33,  v27,  v34);

    uint64_t v35 = sharingXPCHelperLog();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    v37 = v36;
    os_signpost_id_t v38 = self->_intervalID;
    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_DWORD *)v44 = 134217984;
      os_signpost_id_t v45 = v38;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v37,  OS_SIGNPOST_INTERVAL_END,  v38,  "monogramImageDataForContact",  "%llu",  v44,  0xCu);
    }

    id v31 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);
  }

  return v31;
}

- (id)copyConversationIdentityImageIconDataForImage:(id)a3 forConversationIdentifier:(id)a4 style:(int64_t)a5 diameter:(double)a6 monogramsAsFlatImages:(BOOL)a7 isContactImage:(BOOL *)a8
{
  return 0LL;
}

- (id)groupMonogramImageDataForContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 processOppositeBackgroundStyle:(BOOL)a7
{
  id v12 = a3;
  uint64_t v13 = sharingXPCHelperLog();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v33 = intervalID;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "groupMonogramImageDataForContacts",  "%llu",  buf,  0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10012BDD8;
  v27[3] = &unk_1005CEF20;
  id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "-[SDXPCHelperConnection groupMonogramImageDataForContacts:style:diameter:monogramsAsFlatImages:processOp positeBackgroundStyle:]"));
  int64_t v29 = a4;
  double v30 = a5;
  BOOL v31 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10012BF04;
  v24[3] = &unk_1005CEFF8;
  v24[4] = self;
  v24[5] = a4;
  *(double *)&v24[6] = a5;
  BOOL v25 = a6;
  BOOL v26 = a7;
  id v17 = v28;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:]( self,  "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:",  v12,  v27,  &stru_1005CEF60,  v24,  @"groupContacts"));

  uint64_t v19 = sharingXPCHelperLog();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  v21 = v20;
  os_signpost_id_t v22 = self->_intervalID;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v33 = v22;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_END,  v22,  "groupMonogramImageDataForContacts",  "%llu",  buf,  0xCu);
  }

  return v18;
}

- (id)urlToCGImgDataForCallHandoffIconWithAppIconImageData:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  BOOL v25 = sub_10012BACC;
  BOOL v26 = sub_10012BADC;
  id v27 = 0LL;
  uint64_t v8 = sharingXPCHelperLog(-[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration"));
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = v9;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "urlToCGImgDataForCallHandoffIconWithAppIconImageData",  "",  buf,  2u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF018));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10012C410;
  v20[3] = &unk_1005CF040;
  v20[4] = &v22;
  [v12 urlToCGImgDataForCallHandoffIconWithAppIconImageData:v6 contact:v7 replyHandler:v20];

  uint64_t v14 = sharingXPCHelperLog(v13);
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = v15;
  os_signpost_id_t v17 = self->_intervalID;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_END,  v17,  "urlToCGImgDataForCallHandoffIconWithAppIconImageData",  "",  buf,  2u);
  }

  id v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v18;
}

- (id)monogramImagesForMultipleContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6
{
  id v10 = a3;
  uint64_t v11 = sharingXPCHelperLog(v10);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = v12;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v31 = intervalID;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "monogramImagesForMultipleContacts",  "%llu",  buf,  0xCu);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10012C64C;
  v25[3] = &unk_1005CEF20;
  id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "-[SDXPCHelperConnection monogramImagesForMultipleContacts:style:diameter:monogramsAsFlatImages:]"));
  int64_t v27 = a4;
  double v28 = a5;
  BOOL v29 = a6;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10012C804;
  v23[3] = &unk_1005CF0D0;
  v23[4] = self;
  v23[5] = a4;
  *(double *)&v23[6] = a5;
  BOOL v24 = a6;
  id v15 = v26;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:]( self,  "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:",  v10,  v25,  &stru_1005CF060,  v23,  @"multipleContacts"));

  uint64_t v18 = sharingXPCHelperLog(v17);
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  os_signpost_id_t v21 = self->_intervalID;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)__int128 buf = 134217984;
    os_signpost_id_t v31 = v21;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "monogramImagesForMultipleContacts",  "%llu",  buf,  0xCu);
  }

  return v16;
}

- (id)_loadGroupContactIdentityImage:(id)a3
{
  return 0LL;
}

- (id)getOppositeColor:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
  unsigned __int8 v5 = [v3 isEqual:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  if ((v5 & 1) == 0)
  {
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    }

    else
    {
      uint64_t v8 = (CGColor *)[v3 CGColor];
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.235294118,  0.235294118,  0.262745098,  0.6));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.921568627,  0.921568627,  0.960784314,  0.6));
      id v11 = v9;
      BOOL v12 = CGColorEqualToColor(v8, (CGColorRef)[v11 CGColor]);
      uint64_t v13 = v10;
      if (v12
        || (BOOL v14 = CGColorEqualToColor(v8, (CGColorRef)[v10 CGColor]),
            uint64_t v13 = v11,
            v14))
      {
        id v6 = v13;
      }

      else
      {
        id v6 = 0LL;
      }
    }
  }

  return v6;
}

- (id)CGImgForUIActivityTitles:(id)a3 foregroundColor:(id)a4 processOppositeColor:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = sharingXPCHelperLog(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = v11;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "CGImgDataForUIActivityTitle",  "",  buf,  2u);
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "-[SDXPCHelperConnection CGImgForUIActivityTitles:foregroundColor:processOppositeColor:]"));
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_10012CF20;
  v34[3] = &unk_1005CF0F8;
  id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v35 = v15;
  [v9 enumerateObjectsUsingBlock:v34];

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10012CF84;
  v30[3] = &unk_1005CF120;
  BOOL v33 = a5;
  v30[4] = self;
  id v16 = v14;
  id v31 = v16;
  id v32 = v8;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10012D0D8;
  v27[3] = &unk_1005CF1B0;
  void v27[4] = self;
  id v17 = v32;
  id v28 = v17;
  BOOL v29 = a5;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:]( self,  "loadBatchImageCacheData:cacheKey:mapCacheHitImage:runProxy:type:",  v15,  v30,  &stru_1005CF140,  v27,  @"activityTitles"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10012D460;
  v25[3] = &unk_1005CF188;
  uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v26 = v19;
  uint64_t v20 = sharingXPCHelperLog([v18 enumerateObjectsUsingBlock:v25]);
  os_signpost_id_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  uint64_t v22 = v21;
  os_signpost_id_t v23 = self->_intervalID;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_END,  v23,  "CGImgDataForUIActivityTitle",  "",  buf,  2u);
  }

  return v19;
}

- (CGImage)CGImageWithCacheKey:(id)a3 contactIDs:(id)a4 type:(id)a5
{
  id v8 = a5;
  id v9 = +[SDXPCHelperImageCache imageForKey:contactIDs:]( &OBJC_CLASS____TtC16DaemoniOSLibrary21SDXPCHelperImageCache,  "imageForKey:contactIDs:",  a3,  a4);
  if (v9) {
    uint64_t v10 = @"CacheHits";
  }
  else {
    uint64_t v10 = @"CacheMisses";
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:v10]);

  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  cacheAccessDict = self->_cacheAccessDict;
  ++self->_cacheAccessCount;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](cacheAccessDict, "objectForKeyedSubscript:", v11));
  id v15 = self->_cacheAccessDict;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 intValue] + 1));
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v11);

  os_unfair_lock_unlock(p_cacheAccessLock);
  return v9;
}

- (id)MD5HashOfStrings:(id)a3
{
  id v3 = a3;
  int8x16_t v20 = 0uLL;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    int8x16_t v13 = v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (const char *)[*(id *)(*((void *)&v14 + 1) + 8 * (void)i) UTF8String];
        memset(md, 0, sizeof(md));
        CC_LONG v9 = strlen(v8);
        CC_MD5(v8, v9, md);
        int8x16_t v13 = veorq_s8(v13, *(int8x16_t *)md);
      }

      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }

    while (v5);
    int8x16_t v20 = v13;
  }

  uint64_t v10 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 32LL);
  for (uint64_t j = 0LL; j != 16; ++j)
    -[NSMutableString appendFormat:](v10, "appendFormat:", @"%02x", v20.u8[j]);

  return v10;
}

- (void)sendShareSheetInvocationMetricsWithAppBundleID:(id)a3 numSuggestions:(int64_t)a4 suggestionDisplayNames:(id)a5 extensionsCacheResult:(id)a6 isDarkMode:(BOOL)a7 duration:(int64_t)a8 isCollaborative:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (self->_cacheAccessCount >= 1)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012D884;
    block[3] = &unk_1005CF1D8;
    block[4] = self;
    id v21 = v16;
    id v22 = v17;
    id v23 = v15;
    int64_t v24 = a4;
    int64_t v25 = a8;
    BOOL v26 = a7;
    BOOL v27 = a9;
    dispatch_async(v19, block);
  }
}

- (CGImage)CGImgForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 processOppositeColor:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v46 = a4;
  id v15 = v14;
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = sharingXPCHelperLog(v15);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    os_signpost_id_t intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = intervalID;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "CGImgForNameLabelWithStringDaemon",  "%llu",  (uint8_t *)&buf,  0xCu);
    }

    if (v8) {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties]( self,  "keyDerivedFromRelevantTraitCollectionProperties"));
    }
    else {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle]( self,  "keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle"));
    }
    id v23 = (os_log_s *)v21;
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDXPCHelperConnection CGImgForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNam eWrapping:processOppositeColor:]"));
    BOOL v26 = (void *)objc_claimAutoreleasedReturnValue( +[SDXPCHelperConnection identifierForColor:]( &OBJC_CLASS___SDXPCHelperConnection,  "identifierForColor:",  v46));
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue( [v25 stringByAppendingFormat:@",%@,%@,%lu,%i,%i,%@,", v16, v26, a5, v10, v9, v23]);

    id v28 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v27,  &__NSArray0__struct,  @"nameLabel");
    BOOL v29 = v28;
    if (v28)
    {
      uint64_t v30 = sharingXPCHelperLog(v28);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      id v32 = v31;
      os_signpost_id_t v33 = self->_intervalID;
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v33;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_END,  v33,  "CGImgForNameLabelWithStringDaemon",  "%llu",  (uint8_t *)&buf,  0xCu);
      }

      if (v8) {
        int64_t v24 = v29;
      }
      else {
        int64_t v24 = 0LL;
      }
    }

    else
    {
      -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v57 = 0x3032000000LL;
      v58 = sub_10012BACC;
      v59 = sub_10012BADC;
      id v60 = 0LL;
      v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF1F8));
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_10012DEB4;
      v53[3] = &unk_1005CF220;
      v53[4] = &buf;
      [v34 CGImgDataForNameLabelWithString:v16 textColor:v46 maxNumberOfLines:a5 isAirDrop:v10 ignoreNameWrapping:v9 replyHandler:v53];

      id v35 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  *(void *)(*((void *)&buf + 1) + 40LL),  v27,  &__NSArray0__struct);
      if (v8)
      {
        v36 = self;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](v36, "queuedBlocks"));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472LL;
        v47[2] = sub_10012DEC4;
        v47[3] = &unk_1005CF248;
        v47[4] = v36;
        id v48 = v46;
        id v49 = v16;
        unint64_t v50 = a5;
        BOOL v51 = v10;
        BOOL v52 = v9;
        os_signpost_id_t v38 = objc_retainBlock(v47);
        [v37 addObject:v38];
      }

      uint64_t v39 = sharingXPCHelperLog(v35);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      uint64_t v41 = v40;
      os_signpost_id_t v42 = self->_intervalID;
      if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_DWORD *)v54 = 134217984;
        os_signpost_id_t v55 = v42;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v41,  OS_SIGNPOST_INTERVAL_END,  v42,  "CGImgForNameLabelWithString",  "%llu",  v54,  0xCu);
      }

      uint64_t v43 = *(void *)(*((void *)&buf + 1) + 40LL);
      if (v43)
      {
        v44 = (const void *)SFCreateCGImageFromData(v43);
        int64_t v24 = (CGImage *)CFAutorelease(v44);
      }

      else
      {
        int64_t v24 = 0LL;
      }

      _Block_object_dispose(&buf, 8);
    }
  }

  else
  {
    uint64_t v22 = daemon_log(0LL);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      sub_10012FE04();
    }
    int64_t v24 = 0LL;
  }

  return v24;
}

- (id)CGImgDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 processOppositeColor:(BOOL)a5 activityCategory:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = sharingXPCHelperLog(v11);
  int8x16_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "CGImgDataForActivityMoreListEntryForActivityTitle",  "",  buf,  2u);
  }

  if (v7) {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties]( self,  "keyDerivedFromRelevantTraitCollectionProperties"));
  }
  else {
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle]( self,  "keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle"));
  }
  uint64_t v17 = (void *)v16;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDXPCHelperConnection CGImgDataForActivityMoreListEntryForActivityTitle:labelColor:processOpposite Color:activityCategory:]"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SDXPCHelperConnection identifierForColor:]( &OBJC_CLASS___SDXPCHelperConnection,  "identifierForColor:",  v11));
  int8x16_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingFormat:@",%@,%@,%@,", v10, v19, v17]);

  uint64_t v21 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v20,  &__NSArray0__struct,  @"activityTitle");
  if (v21)
  {
    if (v7)
    {
      uint64_t v22 = SFDataFromCGImage(v21);
      id v23 = (id)objc_claimAutoreleasedReturnValue(v22);
    }

    else
    {
      id v23 = 0LL;
    }
  }

  else
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(void *)__int128 buf = 0LL;
    uint64_t v41 = buf;
    uint64_t v42 = 0x3032000000LL;
    uint64_t v43 = sub_10012BACC;
    v44 = sub_10012BADC;
    id v45 = 0LL;
    int64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF268));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10012E364;
    v39[3] = &unk_1005CF220;
    v39[4] = buf;
    [v24 CGImgDataForActivityMoreListEntryForActivityTitle:v10 labelColor:v11 activityCategory:a6 replyHandler:v39];

    id v25 = +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  *((void *)v41 + 5),  v20,  &__NSArray0__struct);
    if (v7)
    {
      BOOL v26 = self;
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDXPCHelperConnection queuedBlocks](v26, "queuedBlocks"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_10012E374;
      v35[3] = &unk_1005CE990;
      v35[4] = v26;
      id v36 = v11;
      id v37 = v10;
      int64_t v38 = a6;
      id v28 = objc_retainBlock(v35);
      [v27 addObject:v28];
    }

    uint64_t v29 = sharingXPCHelperLog(v25);
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    os_signpost_id_t v32 = self->_intervalID;
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v34 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v31,  OS_SIGNPOST_INTERVAL_END,  v32,  "CGImgDataForActivityMoreListEntryForActivityTitle",  "",  v34,  2u);
    }

    id v23 = *((id *)v41 + 5);
    _Block_object_dispose(buf, 8);
  }

  return v23;
}

- (CGImage)CGImgForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sharingXPCHelperLog(v7);
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "CGImgForActionPlatterWithTitle",  "",  buf,  2u);
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDXPCHelperConnection CGImgForActionPlatterWithTitle:tintColor:]"));
  int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[SDXPCHelperConnection identifierForColor:]( &OBJC_CLASS___SDXPCHelperConnection,  "identifierForColor:",  v7));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties]( self,  "keyDerivedFromRelevantTraitCollectionProperties"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingFormat:@",%@,%@,%@,", v6, v13, v14]);

  uint64_t v16 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v15,  &__NSArray0__struct,  @"actionPlatter");
  if (!v16)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(void *)__int128 buf = 0LL;
    id v28 = buf;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = sub_10012BACC;
    id v31 = sub_10012BADC;
    id v32 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF288));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10012E758;
    v26[3] = &unk_1005CF220;
    v26[4] = buf;
    [v17 CGImgDataForActionPlatterWithTitle:v6 tintColor:v7 replyHandler:v26];

    uint64_t v18 = sharingXPCHelperLog( +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  *((void *)v28 + 5),  v15,  &__NSArray0__struct));
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    int8x16_t v20 = v19;
    os_signpost_id_t v21 = self->_intervalID;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)id v25 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v21,  "CGImgForActionPlatterWithTitle",  "",  v25,  2u);
    }

    uint64_t v22 = *((void *)v28 + 5);
    if (v22)
    {
      id v23 = (const void *)SFCreateCGImageFromData(v22);
      uint64_t v16 = (CGImage *)CFAutorelease(v23);
    }

    else
    {
      uint64_t v16 = 0LL;
    }

    _Block_object_dispose(buf, 8);
  }

  return v16;
}

- (CGImage)CGImgForNearbyBadgeWithCount:(int64_t)a3
{
  uint64_t v5 = sharingXPCHelperLog(self);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)__int128 buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "CGImgForNearbyBadgeWithCount",  "",  buf,  2u);
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "-[SDXPCHelperConnection CGImgForNearbyBadgeWithCount:]"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[SDXPCHelperConnection keyDerivedFromRelevantTraitCollectionProperties]( self,  "keyDerivedFromRelevantTraitCollectionProperties"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingFormat:@"%li,%@", a3, v10]);

  uint64_t v12 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v11,  &__NSArray0__struct,  @"nearbyBadge");
  if (!v12)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    *(void *)__int128 buf = 0LL;
    int64_t v24 = buf;
    uint64_t v25 = 0x3032000000LL;
    BOOL v26 = sub_10012BACC;
    BOOL v27 = sub_10012BADC;
    id v28 = 0LL;
    int8x16_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF2A8));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10012EA28;
    v22[3] = &unk_1005CF220;
    v22[4] = buf;
    [v13 CGImgDataForNearbyBadgeWithCount:a3 replyHandler:v22];

    uint64_t v14 = sharingXPCHelperLog( +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  *((void *)v24 + 5),  v11,  &__NSArray0__struct));
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = v15;
    os_signpost_id_t v17 = self->_intervalID;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)os_signpost_id_t v21 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v16,  OS_SIGNPOST_INTERVAL_END,  v17,  "CGImgForNearbyBadgeWithCount",  "",  v21,  2u);
    }

    uint64_t v18 = *((void *)v24 + 5);
    if (v18)
    {
      uint64_t v19 = (const void *)SFCreateCGImageFromData(v18);
      uint64_t v12 = (CGImage *)CFAutorelease(v19);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    _Block_object_dispose(buf, 8);
  }

  return v12;
}

- (id)loadBatchImageCacheData:(id)a3 cacheKey:(id)a4 mapCacheHitImage:(id)a5 runProxy:(id)a6 type:(id)a7
{
  id v12 = a3;
  int8x16_t v13 = (uint64_t (**)(id, void *))a4;
  id v48 = (uint64_t (**)(id, void *, CGImage *))a5;
  v44 = (uint64_t (**)(id, void *))a6;
  id v49 = a7;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  obuint64_t j = v12;
  id v15 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v55 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        uint64_t v20 = v13[2](v13, v19);
        os_signpost_id_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        [v19 setCacheLookupKey:v21];

        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v19 cacheLookupKey]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v19 contactIDs]);
        int64_t v24 = -[SDXPCHelperConnection CGImageWithCacheKey:contactIDs:type:]( self,  "CGImageWithCacheKey:contactIDs:type:",  v22,  v23,  v49);

        if (v24)
        {
          uint64_t v25 = v48[2](v48, v19, v24);
          BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          [v14 addObject:v26];
        }

        else
        {
          [v46 addObject:v19];
        }
      }

      id v16 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }

    while (v16);
  }

  id v27 = [v46 count];
  if (v27)
  {
    -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
    uint64_t v28 = v44[2](v44, v46);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v45 = (id)objc_claimAutoreleasedReturnValue(v28);
    id v29 = [v45 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v51;
      do
      {
        for (uint64_t j = 0LL; j != v30; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(v45);
          }
          os_signpost_id_t v33 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)j);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageData", v44));

          if (v34)
          {
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v33 imageData]);
            id v36 = (void *)objc_claimAutoreleasedReturnValue([v33 cacheLookupKey]);
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v33 contactIDs]);
            +[SDXPCHelperConnection updateCacheFromSFCGImageData:cacheKey:contactIDs:]( &OBJC_CLASS___SDXPCHelperConnection,  "updateCacheFromSFCGImageData:cacheKey:contactIDs:",  v35,  v36,  v37);
          }

          [v14 addObject:v33];
        }

        id v30 = [v45 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }

      while (v30);
    }
  }

  uint64_t v38 = sharingXPCHelperLog(v27);
  uint64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v40 = [obj count];
    id v41 = [v46 count];
    id v42 = [v14 count];
    *(_DWORD *)__int128 buf = 134218496;
    id v59 = v40;
    __int16 v60 = 2048;
    id v61 = v41;
    __int16 v62 = 2048;
    id v63 = v42;
    _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Need image data for %lu images, %lu are not in cache, return %lu image data.",  buf,  0x20u);
  }

  return v14;
}

+ (id)identifierForColor:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v5 = 0LL;
    [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(UIColor %.1f,%.1f,%.1f,%.1f)",  v8,  v7,  v6,  v5));
  }

  return v3;
}

- (id)keyDerivedFromRelevantTraitCollectionProperties
{
  id v3 = self->_latestHostConfig;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v3, "hostTraitCollection"));
    id v6 = [v5 userInterfaceStyle];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredContentSizeCategory]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @",%li,%@,%li,",  v6,  v8,  [v9 layoutDirection]));
  }

  else
  {
    uint64_t v11 = sharingXPCHelperLog(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10012FFE0((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
    }

    id v10 = @"NULL";
  }

  return v10;
}

- (id)keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle
{
  id v3 = self->_latestHostConfig;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v3, "hostTraitCollection"));
    if ([v5 userInterfaceStyle] == (id)1) {
      uint64_t v6 = 2LL;
    }
    else {
      uint64_t v6 = 1LL;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 preferredContentSizeCategory]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[UISUIActivityViewControllerConfiguration hostTraitCollection](v4, "hostTraitCollection"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @",%li,%@,%li,",  v6,  v8,  [v9 layoutDirection]));
  }

  else
  {
    uint64_t v11 = sharingXPCHelperLog(0LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10012FFE0((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
    }

    id v10 = @"NULL";
  }

  return v10;
}

- (id)perspectiveDataForUIActivityTitle:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_10012BACC;
  uint64_t v16 = sub_10012BADC;
  id v17 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF2C8));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012F200;
  v11[3] = &unk_1005CF2F0;
  v11[4] = &v12;
  [v8 perspectiveDataForUIActivityTitle:v6 textColor:v7 replyHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  os_signpost_id_t v21 = sub_10012BACC;
  uint64_t v22 = sub_10012BADC;
  id v23 = 0LL;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF310));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10012F3A0;
  v17[3] = &unk_1005CF2F0;
  v17[4] = &v18;
  [v14 perspectiveDataForNameLabelWithString:v12 textColor:v13 maxNumberOfLines:a5 isAirDrop:v8 ignoreNameWrapping:v7 replyHandler:v17];

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (id)perspectiveDataForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10012BACC;
  uint64_t v16 = sub_10012BADC;
  id v17 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF330));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10012F518;
  v11[3] = &unk_1005CF2F0;
  v11[4] = &v12;
  [v8 perspectiveDataForActionPlatterWithTitle:v6 tintColor:v7 replyHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  -[SDXPCHelperConnection _updateShareSheetHostConfiguration](self, "_updateShareSheetHostConfiguration");
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_10012BACC;
  uint64_t v18 = sub_10012BADC;
  id v19 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF350));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012F6A0;
  v13[3] = &unk_1005CF2F0;
  v13[4] = &v14;
  [v10 perspectiveDataForActivityMoreListEntryForActivityTitle:v8 labelColor:v9 activityCategory:a5 replyHandler:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)perspectiveDataForNearbyBadgeWithCount:(int64_t)a3
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_10012BACC;
  id v13 = sub_10012BADC;
  id v14 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF370));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10012F7F8;
  v8[3] = &unk_1005CF2F0;
  v8[4] = &v9;
  [v5 perspectiveDataForNearbyBadgeWithCount:a3 replyHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)updateShareSheetHostConfiguration:(id)a3
{
}

- (void)_updateShareSheetHostConfiguration
{
  id v3 = self->_latestHostConfig;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = sharingXPCHelperLog(v3);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v6;
    os_signpost_id_t intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v7,  OS_SIGNPOST_INTERVAL_BEGIN,  intervalID,  "updateShareSheetHostConfiguration",  "",  buf,  2u);
    }

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_1005CF390));
    [v9 updateShareSheetHostConfiguration:v4];

    uint64_t v11 = sharingXPCHelperLog(v10);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    id v13 = v12;
    os_signpost_id_t v14 = self->_intervalID;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_INTERVAL_END,  v14,  "updateShareSheetHostConfiguration",  "",  v16,  2u);
    }
  }

  else
  {
    uint64_t v15 = daemon_log(0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100130260();
    }
  }
}

- (void)setSessionKeepAliveTransactionIdentifier:(id)a3
{
  id v4 = a3;
  self->_needsTransactionRelease = v4 != 0LL;
  id v8 = v4;
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToService,  "remoteObjectProxyWithErrorHandler:",  &stru_1005CF3B0));
  [v7 setSessionKeepAliveTransactionIdentifier:v6];
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSMutableArray)queuedBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setQueuedBlocks:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
}

@end