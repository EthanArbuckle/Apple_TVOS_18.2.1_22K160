@interface PDTransactionReceiptFileManager
- (BOOL)_isTransactionReceiptFileURL:(id)a3;
- (BOOL)deleteTransactionReceiptWithUniqueID:(id)a3;
- (NSSet)transactionReceipts;
- (NSSet)uniqueIDs;
- (PDTransactionReceiptFileManager)initWithDirectoryURL:(id)a3 delegate:(id)a4;
- (id)_fileURLForTransactionReceiptUniqueID:(id)a3;
- (id)_transactionReceiptUniqueIDFromFileURL:(id)a3;
- (id)transactionReceiptWithUniqueID:(id)a3;
- (void)_downloadImageURLsForReceipt:(id)a3 atURL:(id)a4 withCompletion:(id)a5;
- (void)registerDatabaseTransactionReceipt:(id)a3;
- (void)writeTransactionReceipt:(id)a3 completion:(id)a4;
@end

@implementation PDTransactionReceiptFileManager

- (PDTransactionReceiptFileManager)initWithDirectoryURL:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PDTransactionReceiptFileManager;
  v9 = -[PDTransactionReceiptFileManager init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_directoryURL, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_fileAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    fileManager = v10->_fileManager;
    v10->_fileManager = (NSFileManager *)v11;

    os_unfair_lock_lock(&v10->_fileAccessLock);
    -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v10->_fileManager,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v10->_directoryURL,  1LL,  0LL,  0LL);
    os_unfair_lock_unlock(&v10->_fileAccessLock);
  }

  return v10;
}

- (NSSet)uniqueIDs
{
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( self->_fileManager,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  self->_directoryURL,  &__NSArray0__struct,  4LL,  0LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[PDTransactionReceiptFileManager _isTransactionReceiptFileURL:]( self,  "_isTransactionReceiptFileURL:",  v10))
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransactionReceiptFileManager _transactionReceiptUniqueIDFromFileURL:]( self,  "_transactionReceiptUniqueIDFromFileURL:",  v10));
          -[NSMutableSet addObject:](v4, "addObject:", v11);
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableSet copy](v4, "copy");
  os_unfair_lock_unlock(p_fileAccessLock);

  return (NSSet *)v12;
}

- (NSSet)transactionReceipts
{
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:]( self->_fileManager,  "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:",  self->_directoryURL,  &__NSArray0__struct,  4LL,  0LL));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        if (-[PDTransactionReceiptFileManager _isTransactionReceiptFileURL:]( self,  "_isTransactionReceiptFileURL:",  v10))
        {
          uint64_t v11 = -[PKTransactionReceipt initWithFileURL:]( objc_alloc(&OBJC_CLASS___PKTransactionReceipt),  "initWithFileURL:",  v10);
          if (v11) {
            -[NSMutableSet addObject:](v4, "addObject:", v11);
          }
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  id v12 = -[NSMutableSet copy](v4, "copy");
  os_unfair_lock_unlock(p_fileAccessLock);

  return (NSSet *)v12;
}

- (id)transactionReceiptWithUniqueID:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransactionReceiptFileManager _fileURLForTransactionReceiptUniqueID:]( self,  "_fileURLForTransactionReceiptUniqueID:",  a3));
  p_fileAccessLock = &self->_fileAccessLock;
  os_unfair_lock_lock(&self->_fileAccessLock);
  if (v4
    && (fileManager = self->_fileManager,
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 path]),
        LODWORD(fileManager) = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v7),
        v7,
        (_DWORD)fileManager))
  {
    uint64_t v8 = -[PKTransactionReceipt initWithFileURL:]( objc_alloc(&OBJC_CLASS___PKTransactionReceipt),  "initWithFileURL:",  v4);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  os_unfair_lock_unlock(p_fileAccessLock);

  return v8;
}

- (void)writeTransactionReceipt:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 uniqueID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 fileURL]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[PDTransactionReceiptFileManager _fileURLForTransactionReceiptUniqueID:]( self,  "_fileURLForTransactionReceiptUniqueID:",  v9));
    id v12 = (void *)v11;
    id v13 = 0LL;
    if (v10 && v11)
    {
      os_unfair_lock_lock(&self->_fileAccessLock);
      __int128 v14 = -[PKTransactionReceipt initWithFileURL:]( objc_alloc(&OBJC_CLASS___PKTransactionReceipt),  "initWithFileURL:",  v12);
      if (v14)
      {
        uint64_t v15 = PKTemporaryItemURLWithExtension(PKRawTransactionReceiptExtension, 1LL);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        PKTemporaryItemPrepareDirectory();
        -[NSFileManager moveItemAtURL:toURL:error:](self->_fileManager, "moveItemAtURL:toURL:error:", v12, v16, 0LL);
      }

      else
      {
        __int128 v16 = 0LL;
      }

      -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v12, 0LL);
      unsigned int v17 = -[NSFileManager copyItemAtURL:toURL:error:](self->_fileManager, "copyItemAtURL:toURL:error:", v10, v12, 0LL);
      if (v17)
      {
        id v13 = [v6 copy];
        uint64_t v19 = PKStoreDemoModeEnabled(v13, v18);
        if ((v19 & 1) == 0 && (PKUIOnlyDemoModeEnabled(v19) & 1) == 0) {
          PKExcludeFileURLFromBackup(v12);
        }
      }

      else
      {
        if (v16) {
          -[NSFileManager moveItemAtURL:toURL:error:](self->_fileManager, "moveItemAtURL:toURL:error:", v16, v12, 0LL);
        }
        id v13 = 0LL;
      }

      os_unfair_lock_unlock(&self->_fileAccessLock);

      if (v17)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained transactionReceiptFileManager:self didWriteTransactionReceipt:v13];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_1003F0FCC;
        v21[3] = &unk_100645D90;
        id v22 = v8;
        char v23 = 1;
        -[PDTransactionReceiptFileManager _downloadImageURLsForReceipt:atURL:withCompletion:]( self,  "_downloadImageURLsForReceipt:atURL:withCompletion:",  v6,  v12,  v21);
      }
    }
  }

  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)_downloadImageURLsForReceipt:(id)a3 atURL:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v23 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](&OBJC_CLASS___NSURLSession, "sharedSession"));
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v24 = v7;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 lineItems]);
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        __int128 v16 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        uint64_t v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "iconImageURL", v23));
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 image]);

          if (!v19)
          {
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472LL;
            v27[2] = sub_1003F1244;
            v27[3] = &unk_10063EC90;
            id v28 = v10;
            v29 = v16;
            id v30 = v8;
            [v9 addOperation:v27];
          }
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1003F14DC;
  v25[3] = &unk_10063F4B8;
  id v26 = v23;
  id v21 = v23;
  id v22 = [v9 evaluateWithInput:v20 completion:v25];
}

- (BOOL)deleteTransactionReceiptWithUniqueID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransactionReceiptFileManager _fileURLForTransactionReceiptUniqueID:]( self,  "_fileURLForTransactionReceiptUniqueID:",  v4));
    if (v5
      && (os_unfair_lock_lock(&self->_fileAccessLock),
          unsigned int v6 = -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v5, 0LL),
          os_unfair_lock_unlock(&self->_fileAccessLock),
          v6))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained transactionReceiptFileManager:self didDeleteTransactionReceiptWithUniqueID:v4];

      BOOL v8 = 1;
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)registerDatabaseTransactionReceipt:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDTransactionReceiptFileManager _fileURLForTransactionReceiptUniqueID:]( self,  "_fileURLForTransactionReceiptUniqueID:",  v5));
    if (v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v6));
      [v8 updateWithBundle:v7];
    }

    id v4 = v8;
  }
}

- (id)_fileURLForTransactionReceiptUniqueID:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathExtension:PKRawTransactionReceiptExtension]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (BOOL)_isTransactionReceiptFileURL:(id)a3
{
  v3 = (void *)PKRawTransactionReceiptExtension;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathExtension]);
  id v6 = v3;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    if (v6) {
      BOOL v9 = v7 == 0LL;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = [v6 isEqualToString:v7];
    }
  }

  return v10;
}

- (id)_transactionReceiptUniqueIDFromFileURL:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lastPathComponent]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByDeletingPathExtension]);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end