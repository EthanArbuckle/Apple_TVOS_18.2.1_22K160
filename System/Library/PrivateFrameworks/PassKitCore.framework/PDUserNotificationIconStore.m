@interface PDUserNotificationIconStore
- (BOOL)_assetExists:(int64_t)a3 identifier:(id)a4;
- (BOOL)_removeAssetsForIdentifier:(id)a3;
- (BOOL)_storeData:(id)a3 assetType:(int64_t)a4 identifier:(id)a5;
- (BOOL)_storeImage:(id)a3 assetType:(int64_t)a4 identifier:(id)a5;
- (BOOL)removeAssetsForIdentifier:(id)a3;
- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3;
- (PDUserNotificationIconStore)initWithDatabaseManager:(id)a3;
- (id)_filePathForAssetType:(int64_t)a3 identifier:(id)a4;
- (id)_imageForAssetType:(int64_t)a3 accountIdentifier:(id)a4;
- (id)_imageForAssetType:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForAsset:(int64_t)a3 accountIdentifier:(id)a4;
- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4;
- (id)fileURLForImage:(id)a3 identifier:(id)a4;
- (void)_migrateAssetsIfNeeded;
@end

@implementation PDUserNotificationIconStore

- (PDUserNotificationIconStore)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDUserNotificationIconStore;
  v6 = -[PDUserNotificationIconStore init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseManager, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    fileManager = v7->_fileManager;
    v7->_fileManager = (NSFileManager *)v8;

    id v10 = PDUtilityQueue();
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002E4F48;
    block[3] = &unk_100639300;
    v14 = v7;
    dispatch_async(v11, block);
  }

  return v7;
}

- (id)fileURLForAsset:(int64_t)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _filePathForAssetType:identifier:]( self,  "_filePathForAssetType:identifier:",  a3,  v6));
  if (-[PDUserNotificationIconStore _assetExists:identifier:](self, "_assetExists:identifier:", a3, v6)) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _imageForAssetType:accountIdentifier:]( self,  "_imageForAssetType:accountIdentifier:",  a3,  v6));
  if (!v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      else {
        uint64_t v12 = (uint64_t)*(&off_100654668 + a3);
      }
      int v17 = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      objc_super v15 = "No image for notification asset %@ for account %@.";
      goto LABEL_16;
    }

- (id)fileURLForAsset:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _filePathForAssetType:identifier:]( self,  "_filePathForAssetType:identifier:",  a3,  v6));
  if (-[PDUserNotificationIconStore _assetExists:identifier:](self, "_assetExists:identifier:", a3, v6)) {
    goto LABEL_5;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _imageForAssetType:passUniqueIdentifier:]( self,  "_imageForAssetType:passUniqueIdentifier:",  a3,  v6));
  if (!v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      else {
        uint64_t v12 = (uint64_t)*(&off_100654668 + a3);
      }
      int v17 = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v6;
      objc_super v15 = "No image for notification asset %@ for pass %@.";
      goto LABEL_16;
    }

- (id)fileURLForImage:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  if (![v6 length] || !-[__CFString length](v7, "length"))
  {
    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      objc_super v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No image for notification asset for identifier %@.",  (uint8_t *)&v14,  0xCu);
    }

    goto LABEL_11;
  }

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _filePathForAssetType:identifier:]( self,  "_filePathForAssetType:identifier:",  3LL,  v7));
  if (!-[PDUserNotificationIconStore _assetExists:identifier:](self, "_assetExists:identifier:", 3LL, v7)
    && !-[PDUserNotificationIconStore _storeData:assetType:identifier:]( self,  "_storeData:assetType:identifier:",  v6,  3LL,  v7))
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(6LL);
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      objc_super v15 = @"PDUserNotificationAssetTypeCustom";
      __int16 v16 = 2112;
      int v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Error storing notification asset %@ for identifier %@.",  (uint8_t *)&v14,  0x16u);
    }

LABEL_11:
    v9 = 0LL;
    goto LABEL_12;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
LABEL_12:

  return v9;
}

- (BOOL)removeAssetsForIdentifier:(id)a3
{
  return -[PDUserNotificationIconStore _removeAssetsForIdentifier:](self, "_removeAssetsForIdentifier:", a3);
}

- (BOOL)updatePassAssetsWithPassUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _imageForAssetType:passUniqueIdentifier:]( self,  "_imageForAssetType:passUniqueIdentifier:",  0LL,  v4));
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _imageForAssetType:passUniqueIdentifier:]( self,  "_imageForAssetType:passUniqueIdentifier:",  0LL,  v4));
    BOOL v7 = -[PDUserNotificationIconStore _storeImage:assetType:identifier:]( self,  "_storeImage:assetType:identifier:",  v6,  0LL,  v4);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_storeImage:(id)a3 assetType:(int64_t)a4 identifier:(id)a5
{
  id v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 imageData]);
  LOBYTE(a4) = -[PDUserNotificationIconStore _storeData:assetType:identifier:]( self,  "_storeData:assetType:identifier:",  v9,  a4,  v8);

  return a4;
}

- (BOOL)_storeData:(id)a3 assetType:(int64_t)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1002E56A0((uint64_t)v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v9]);

  if (-[NSFileManager fileExistsAtPath:isDirectory:](self->_fileManager, "fileExistsAtPath:isDirectory:", v12, 0LL)
    || -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( self->_fileManager,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v12,  1LL,  0LL,  0LL))
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _filePathForAssetType:identifier:]( self,  "_filePathForAssetType:identifier:",  a4,  v9));
    BOOL v14 = -[NSFileManager createFileAtPath:contents:attributes:]( self->_fileManager,  "createFileAtPath:contents:attributes:",  v13,  v8,  0LL);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_assetExists:(int64_t)a3 identifier:(id)a4
{
  fileManager = self->_fileManager;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDUserNotificationIconStore _filePathForAssetType:identifier:]( self,  "_filePathForAssetType:identifier:",  a3,  a4));
  LOBYTE(fileManager) = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v5);

  return (char)fileManager;
}

- (BOOL)_removeAssetsForIdentifier:(id)a3
{
  fileManager = self->_fileManager;
  id v4 = a3;
  id v5 = sub_1002E56A0((uint64_t)v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:v4]);

  LOBYTE(fileManager) = -[NSFileManager removeItemAtPath:error:](fileManager, "removeItemAtPath:error:", v7, 0LL);
  return (char)fileManager;
}

- (id)_imageForAssetType:(int64_t)a3 passUniqueIdentifier:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passWithUniqueIdentifier:](self->_databaseManager, "passWithUniqueIdentifier:", a4));
  BOOL v7 = v5;
  if (a3 == 2)
  {
    uint64_t v9 = PKPassKitUIBundle(v5, v6);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v10 URLForResource:@"CashBackIcon" withExtension:@"pdf"]);

    CGPDFDocumentRef v12 = CGPDFDocumentCreateWithURL(v11);
    if (v12)
    {
      uint64_t v13 = v12;
      double v14 = PKScreenScale(v12);
      uint64_t v15 = PKGetImageFromPDFDocument(v13, 24.0, 24.0, v14);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      CGPDFDocumentRelease(v13);
LABEL_11:

      goto LABEL_12;
    }

- (id)_imageForAssetType:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accountWithIdentifier:](self->_databaseManager, "accountWithIdentifier:", a4));
  uint64_t v6 = v5;
  if (a3 || [v5 type] != (id)4)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v8 = PKPassKitUIBundle(4LL, v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v9 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"]);

    CGPDFDocumentRef v11 = CGPDFDocumentCreateWithURL(v10);
    if (v11)
    {
      CGPDFDocumentRef v12 = v11;
      double v13 = PKScreenScale(v11);
      uint64_t v14 = PKGetImageFromPDFDocument(v12, 24.0, 24.0, v13);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      CGPDFDocumentRelease(v12);
    }

    else
    {
      uint64_t v15 = 0LL;
    }
  }

  return v15;
}

- (id)_filePathForAssetType:(int64_t)a3 identifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  switch(a3)
  {
    case 0LL:
      uint64_t v7 = @"notificationIcon.png";
      goto LABEL_7;
    case 1LL:
      uint64_t v7 = @"frontFace.png";
      goto LABEL_7;
    case 2LL:
      id v8 = sub_1002E56A0((uint64_t)v5);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"notificationIconDailyCash.png"]);
      goto LABEL_8;
    case 3LL:
      uint64_t v7 = @"custom.png";
      goto LABEL_7;
    default:
      uint64_t v7 = 0LL;
LABEL_7:
      id v11 = sub_1002E56A0((uint64_t)v5);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v11);
      CGPDFDocumentRef v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v6]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v7]);

LABEL_8:
      return v10;
  }

- (void)_migrateAssetsIfNeeded
{
  if (PKSharedCacheGetIntegerForKey(@"_PDUserNotificationIconStoreVersionKey") != 1)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(6LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Migrating PDUserNotificationIconStore",  buf,  2u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager passUniqueIDs](self->_databaseManager, "passUniqueIDs"));
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
          if (-[PDUserNotificationIconStore _assetExists:identifier:](self, "_assetExists:identifier:", 0LL, v10)) {
            -[PDUserNotificationIconStore updatePassAssetsWithPassUniqueID:]( self,  "updatePassAssetsWithPassUniqueID:",  v10);
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }

      while (v7);
    }

    PKSharedCacheSetObjectForKey(&off_1006906B0, @"_PDUserNotificationIconStoreVersionKey");
  }

- (void).cxx_destruct
{
}

@end