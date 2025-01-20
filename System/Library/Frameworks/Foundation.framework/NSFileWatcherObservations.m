@interface NSFileWatcherObservations
- (NSFileWatcherObservations)initWithPath:(id)a3;
- (id)description;
- (void)addAnnouncedMoveToPath:(id)a3;
- (void)addAttributeChange;
- (void)addContentsChange;
- (void)addDeletion;
- (void)addDetectedMoveToPath:(id)a3;
- (void)dealloc;
- (void)notifyObserver:(id)a3;
@end

@implementation NSFileWatcherObservations

- (NSFileWatcherObservations)initWithPath:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileWatcherObservations;
  v4 = -[NSFileWatcherObservations init](&v6, sel_init);
  if (v4) {
    v4->_path = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileWatcherObservations;
  -[NSFileWatcherObservations dealloc](&v3, sel_dealloc);
}

- (void)addAttributeChange
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_super v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    int v5 = 138477827;
    objc_super v6 = path;
    _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "Detected attribute change to %{private}@",  (uint8_t *)&v5,  0xCu);
  }

  self->_attributesChanged = 1;
}

- (void)addContentsChange
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_super v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    int v5 = 138477827;
    objc_super v6 = path;
    _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "Detected content change to %{private}@",  (uint8_t *)&v5,  0xCu);
  }

  self->_contentsChanged = 1;
}

- (void)addDeletion
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  objc_super v3 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    int v5 = 138477827;
    objc_super v6 = path;
    _os_log_debug_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEBUG,  "Detected deletion of %{private}@",  (uint8_t *)&v5,  0xCu);
  }

  self->_deleted = 1;
}

- (void)addDetectedMoveToPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int v5 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    int v8 = 138478083;
    v9 = path;
    __int16 v10 = 2113;
    id v11 = a3;
    _os_log_debug_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEBUG,  "Detected move of %{private}@ to %{private}@",  (uint8_t *)&v8,  0x16u);
  }

  self->_moved = 1;
  lastObservedPath = self->_lastObservedPath;
  if (lastObservedPath != a3)
  {

    self->_lastObservedPath = (NSString *)[a3 copy];
  }

- (void)addAnnouncedMoveToPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v5 = (os_log_s *)_NSFCFSEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    int v7 = 138478083;
    int v8 = path;
    __int16 v9 = 2113;
    id v10 = a3;
    _os_log_debug_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEBUG,  "Announced move of %{private}@ to %{private}@",  (uint8_t *)&v7,  0x16u);
  }

  self->_didResetPath = 1;

  self->_path = (NSString *)[a3 copy];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileWatcherObservations;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ attrib: %d cont: %d del: %d mov: %d last-path: %@ res: %d path: %@",  -[NSFileWatcherObservations description](&v3, sel_description),  self->_attributesChanged,  self->_contentsChanged,  self->_deleted,  self->_moved,  self->_lastObservedPath,  self->_didResetPath,  self->_path);
}

- (void)notifyObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!*(_WORD *)&self->_deleted && !self->_didResetPath)
  {
    uint64_t v12 = 0LL;
    if (self->_contentsChanged) {
      uint64_t v11 = 2LL;
    }
    else {
      uint64_t v11 = 4 * self->_attributesChanged;
    }
    goto LABEL_28;
  }

  int v5 = -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation");
  int v6 = open(v5, 2129920);
  if (v6 == -1)
  {
    if (self->_deleted || !self->_moved || self->_didResetPath)
    {
      uint64_t v12 = 0LL;
      if (self->_didResetPath) {
        uint64_t v11 = 24LL;
      }
      else {
        uint64_t v11 = 8LL;
      }
    }

    else
    {
      v15 = (os_log_s *)_NSFCFSEventsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        lastObservedPath = self->_lastObservedPath;
        v21.st_dev = 138477827;
        *(void *)&v21.st_mode = lastObservedPath;
        _os_log_debug_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_DEBUG,  "Reporting non-coordinated move to %{private}@",  (uint8_t *)&v21,  0xCu);
      }

      v16 = self->_lastObservedPath;
      uint64_t v12 = 0LL;
      self->_path = v16;
      uint64_t v11 = 16LL;
    }
  }

  else
  {
    int v7 = v6;
    if (!self->_didResetPath
      || !self->_moved
      || self->_deleted
      || fstat(v6, &v21)
      || lstat(v5, &v20)
      || v21.st_dev != v20.st_dev)
    {
      close(v7);
    }

    else
    {
      __darwin_ino64_t st_ino = v21.st_ino;
      __darwin_ino64_t v9 = v20.st_ino;
      close(v7);
      if (st_ino == v9)
      {
        id v10 = (os_log_s *)_NSFCFSEventsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          path = self->_path;
          v21.st_dev = 138477827;
          *(void *)&v21.st_mode = path;
          _os_log_debug_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEBUG,  "URL %{private}@ reset unnecessarily",  (uint8_t *)&v21,  0xCu);
        }

        uint64_t v11 = 0LL;
        uint64_t v12 = 0LL;
        goto LABEL_28;
      }
    }

    if (self->_contentsChanged || self->_deleted || self->_moved)
    {
      v13 = (os_log_s *)_NSFCFSEventsLog();
      unsigned int v14 = 2;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v17 = self->_path;
        v21.st_dev = 138477827;
        *(void *)&v21.st_mode = v17;
        _os_log_debug_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_DEBUG,  "Change, deletion, or movement of %{private}@ interpreted as change",  (uint8_t *)&v21,  0xCu);
      }
    }

    else
    {
      unsigned int v14 = 4 * self->_attributesChanged;
    }

    if (self->_didResetPath) {
      uint64_t v11 = v14 | 0x10;
    }
    else {
      uint64_t v11 = v14;
    }
    uint64_t v12 = 1LL;
  }

@end