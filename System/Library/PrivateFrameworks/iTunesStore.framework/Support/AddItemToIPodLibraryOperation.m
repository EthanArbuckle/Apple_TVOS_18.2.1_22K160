@interface AddItemToIPodLibraryOperation
- (AddItemToIPodLibraryOperation)initWithIPodLibraryItem:(id)a3;
- (IPodLibraryItem)IPodLibraryItem;
- (NSNumber)insertedItemPersistentIdentifier;
- (id)_libraryItem;
- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)run;
@end

@implementation AddItemToIPodLibraryOperation

- (AddItemToIPodLibraryOperation)initWithIPodLibraryItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AddItemToIPodLibraryOperation;
  v4 = -[AddItemToIPodLibraryOperation init](&v6, "init");
  if (v4) {
    v4->_libraryItem = (IPodLibraryItem *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AddItemToIPodLibraryOperation;
  -[AddItemToIPodLibraryOperation dealloc](&v3, "dealloc");
}

- (IPodLibraryItem)IPodLibraryItem
{
  objc_super v3 = (IPodLibraryItem *)-[IPodLibraryItem copy](self->_libraryItem, "copy");
  -[AddItemToIPodLibraryOperation unlock](self, "unlock");
  return v3;
}

- (NSNumber)insertedItemPersistentIdentifier
{
  objc_super v3 = self->_insertedItemPersistentIdentifier;
  -[AddItemToIPodLibraryOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  uint64_t v13 = 0LL;
  id v3 = -[AddItemToIPodLibraryOperation _libraryItem](self, "_libraryItem");
  id v4 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  v7 = (os_log_s *)[v4 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if ((_DWORD)v6)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class(self);
    __int16 v16 = 2112;
    id v17 = [v3 itemMediaPath];
    uint64_t v8 = _os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &_mh_execute_header,  v7,  1LL,  "%@: Adding media item to iPod library: %@",  &v14,  22);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v8, 4LL);
      free(v9);
      v12 = v10;
      SSFileLog(v4, @"%@");
    }
  }

  id v11 = objc_msgSend( +[IPodLibrary deviceIPodLibrary](IPodLibrary, "deviceIPodLibrary", v12),  "addLibraryItem:error:",  v3,  &v13);
  -[AddItemToIPodLibraryOperation _setInsertedItemPersistentIdentifier:]( self,  "_setInsertedItemPersistentIdentifier:",  v11);
  -[AddItemToIPodLibraryOperation setError:](self, "setError:", v13);
  -[AddItemToIPodLibraryOperation setSuccess:](self, "setSuccess:", v11 != 0LL);
}

- (id)_libraryItem
{
  id v3 = self->_libraryItem;
  -[AddItemToIPodLibraryOperation unlock](self, "unlock");
  return v3;
}

- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3
{
  self->_insertedItemPersistentIdentifier = -[NSNumber initWithLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithLongLong:",  a3);
  -[AddItemToIPodLibraryOperation unlock](self, "unlock");
}

@end