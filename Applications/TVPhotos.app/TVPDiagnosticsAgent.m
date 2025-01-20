@interface TVPDiagnosticsAgent
+ (PXDiagnosticsAgent)localDiagnosticsAgent;
- (NSFastEnumeration)selectedAssets;
- (PHAsset)currentAsset;
- (PHPhotoLibrary)photoLibrary;
- (TVPDiagnosticsAgent)init;
- (id)_descriptionForUIState:(int64_t)a3;
- (id)_selectedAssetIdentifiersDescription;
- (id)_selectedAssetUUIDsDescription;
- (void)captureDescriptionOfCloudPhotoLibraryWithResultHandler:(id)a3;
- (void)captureDescriptionOfPhotoAnalysisWithResultHandler:(id)a3;
- (void)captureDescriptionOfStatisticsWithResultHandler:(id)a3;
- (void)captureDescriptionOfUIState:(int64_t)a3 resultHandler:(id)a4;
- (void)dumpState:(int64_t)a3 toDirectoryURL:(id)a4 resultHandler:(id)a5;
- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5;
- (void)setContentPrivacyState:(int64_t)a3 resultHandler:(id)a4;
- (void)setPhotoLibrary:(id)a3;
- (void)setSystemAuthenticationType:(int64_t)a3 resultHandler:(id)a4;
- (void)startTungstenRecordingToDirectoryURL:(id)a3 resultHandler:(id)a4;
- (void)stopTungstenRecordingWithResultHandler:(id)a3;
- (void)timelineForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5 resultHandler:(id)a6;
- (void)timelineForWidgetSize:(id)a3 jsonFormat:(BOOL)a4 resultHandler:(id)a5;
@end

@implementation TVPDiagnosticsAgent

- (TVPDiagnosticsAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPDiagnosticsAgent;
  v2 = -[TVPDiagnosticsAgent init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVPPhotoUtilities tvPhotoLibrary](&OBJC_CLASS___TVPPhotoUtilities, "tvPhotoLibrary"));
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;
  }

  return v2;
}

+ (PXDiagnosticsAgent)localDiagnosticsAgent
{
  if (qword_1001032E0 != -1) {
    dispatch_once(&qword_1001032E0, &stru_1000CB5C8);
  }
  return (PXDiagnosticsAgent *)(id)qword_1001032D8;
}

- (void)captureDescriptionOfUIState:(int64_t)a3 resultHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047A6C;
  block[3] = &unk_1000CB5F0;
  block[4] = self;
  id v7 = a4;
  int64_t v8 = a3;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)captureDescriptionOfCloudPhotoLibraryWithResultHandler:(id)a3
{
}

- (void)captureDescriptionOfPhotoAnalysisWithResultHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent photoLibrary](self, "photoLibrary"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 photoAnalysisClient]);

  if (v6)
  {
    id v13 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 dumpAnalysisStatusError:&v13]);
    id v8 = v13;
    v9 = v8;
    if (v7)
    {
      uint64_t v10 = PLPrettyPrintPList(v7);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
    }

    v12 = (void *)v11;
    v4[2](v4, v11);
  }

  else
  {
    v4[2](v4, (uint64_t)&stru_1000CC6C8);
  }
}

- (void)captureDescriptionOfStatisticsWithResultHandler:(id)a3
{
}

- (void)dumpState:(int64_t)a3 toDirectoryURL:(id)a4 resultHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v10 = v9;
  if (v7) {
    id v11 = v7;
  }
  else {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v9 temporaryDirectory]);
  }
  v12 = v11;
  id v22 = 0LL;
  unsigned __int8 v13 = [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v14 = v22;
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100047D14;
    v18[3] = &unk_1000CB640;
    int64_t v21 = a3;
    id v19 = v12;
    id v20 = v8;
    dispatch_async(&_dispatch_main_q, v18);

    v16 = v19;
  }

  else
  {
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
    (*((void (**)(id, uint64_t))v8 + 2))(v8, v17);
    v16 = v15;
    v15 = (void *)v17;
  }
}

- (void)timelineForWidgetSize:(id)a3 jsonFormat:(BOOL)a4 resultHandler:(id)a5
{
}

- (void)timelineForAlbum:(id)a3 widgetSize:(id)a4 jsonFormat:(BOOL)a5 resultHandler:(id)a6
{
}

- (void)setContentPrivacyState:(int64_t)a3 resultHandler:(id)a4
{
}

- (void)startTungstenRecordingToDirectoryURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100047FA4;
  block[3] = &unk_1000CB690;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)stopTungstenRecordingWithResultHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100048408;
  v4[3] = &unk_1000C9EF0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (void)setSystemAuthenticationType:(int64_t)a3 resultHandler:(id)a4
{
}

- (void)postNotificationWithName:(id)a3 userInfo:(id)a4 resultHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  if (!diagnosticsNotificationCenter)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___PXDiagnosticsNotificationCenter);
    id v12 = self->_diagnosticsNotificationCenter;
    self->_diagnosticsNotificationCenter = v11;

    diagnosticsNotificationCenter = self->_diagnosticsNotificationCenter;
  }

  -[PXDiagnosticsNotificationCenter postNotificationWithName:userInfo:resultHandler:]( diagnosticsNotificationCenter,  "postNotificationWithName:userInfo:resultHandler:",  v13,  v8,  v9);
}

- (PHAsset)currentAsset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 topViewController]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___TVPPhotoLibraryOneUpViewController, v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 topViewController]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 focusedAsset]);
  }

  else
  {
    id v11 = 0LL;
  }

  return (PHAsset *)v11;
}

- (NSFastEnumeration)selectedAssets
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
    uint64_t v7 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  }

  else
  {
    id v5 = 0LL;
  }

  return (NSFastEnumeration *)v5;
}

- (id)_selectedAssetIdentifiersDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent selectedAssets](self, "selectedAssets"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___PHAsset, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localIdentifier", (void)v15));
          -[NSMutableArray addObject:](v3, "addObject:", v12);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @","));
  return v13;
}

- (id)_selectedAssetUUIDsDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent selectedAssets](self, "selectedAssets"));
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___PHAsset, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid", (void)v15));
          -[NSMutableArray addObject:](v3, "addObject:", v12);
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v7);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @","));
  return v13;
}

- (id)_descriptionForUIState:(int64_t)a3
{
  id v3 = @"Not implemented on tvOS";
  switch(a3)
  {
    case 0LL:
    case 1LL:
    case 4LL:
    case 9LL:
    case 10LL:
    case 11LL:
    case 12LL:
    case 15LL:
      goto LABEL_14;
    case 2LL:
      id v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableString localIdentifier](v4, "localIdentifier"));
      goto LABEL_7;
    case 3LL:
      id v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableString uuid](v4, "uuid"));
      goto LABEL_7;
    case 5LL:
      id v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString photoLibrary](v4, "photoLibrary"));
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mainQueueConcurrencyPhotoLibrary]);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( -[NSMutableString detailedDebugDescriptionInLibrary:]( v4,  "detailedDebugDescriptionInLibrary:",  v8));

      goto LABEL_11;
    case 6LL:
      id v4 = (NSMutableString *)objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent currentAsset](self, "currentAsset"));
      uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSMutableString metadataDebugDescription](v4, "metadataDebugDescription"));
LABEL_7:
      id v3 = (__CFString *)v5;
      goto LABEL_11;
    case 7LL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent _selectedAssetIdentifiersDescription](self, "_selectedAssetIdentifiersDescription"));
      goto LABEL_13;
    case 8LL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVPDiagnosticsAgent _selectedAssetUUIDsDescription](self, "_selectedAssetUUIDsDescription"));
      goto LABEL_13;
    case 13LL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100048BC8;
      v10[3] = &unk_1000CB6B8;
      uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
      id v4 = v11;
      +[PXGView enumerateAllViewsUsingBlock:](&OBJC_CLASS___PXGView, "enumerateAllViewsUsingBlock:", v10);
      id v3 = (__CFString *)-[NSMutableString copy](v4, "copy");

LABEL_11:
      goto LABEL_14;
    case 14LL:
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[PXStoryView allDiagnosticDescriptions](&OBJC_CLASS___PXStoryView, "allDiagnosticDescriptions"));
LABEL_13:
      id v3 = (__CFString *)v9;
LABEL_14:
      id result = v3;
      break;
    default:
      id result = @"Unknown PLDiagnosticsUIState value.";
      break;
  }

  return result;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end