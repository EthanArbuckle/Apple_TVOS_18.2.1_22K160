@interface DownloadError
- (BOOL)canCoalesceWithError:(id)a3;
- (BOOL)isValidError;
- (BOOL)representsDownloadWithIdentifier:(int64_t)a3;
- (NSOrderedSet)downloadIdentifiers;
- (NSString)downloadKind;
- (NSString)downloadTitle;
- (id)_notification;
- (id)copyUserNotification;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setNotification:(id)a3;
- (void)addDownloadIdentifier:(int64_t)a3;
- (void)addDownloadIdentifiers:(id)a3;
- (void)dealloc;
- (void)removeDownloadIdentifier:(int64_t)a3;
- (void)setDownloadKind:(id)a3;
- (void)setDownloadTitle:(id)a3;
@end

@implementation DownloadError

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadError;
  -[DownloadError dealloc](&v3, "dealloc");
}

- (void)addDownloadIdentifier:(int64_t)a3
{
  if (!self->_downloadIdentifiers) {
    self->_downloadIdentifiers = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  }
  v5 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableOrderedSet addObject:](self->_downloadIdentifiers, "addObject:", v5);
}

- (void)addDownloadIdentifiers:(id)a3
{
  downloadIdentifiers = self->_downloadIdentifiers;
  if (!downloadIdentifiers)
  {
    downloadIdentifiers = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    self->_downloadIdentifiers = downloadIdentifiers;
  }

  -[NSMutableOrderedSet unionOrderedSet:](downloadIdentifiers, "unionOrderedSet:", a3);
}

- (BOOL)canCoalesceWithError:(id)a3
{
  return 0;
}

- (id)copyUserNotification
{
  return 0LL;
}

- (NSOrderedSet)downloadIdentifiers
{
  return (NSOrderedSet *)-[NSMutableOrderedSet copy](self->_downloadIdentifiers, "copy");
}

- (BOOL)isValidError
{
  return 1;
}

- (void)removeDownloadIdentifier:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  -[NSMutableOrderedSet removeObject:](self->_downloadIdentifiers, "removeObject:", v4);
}

- (BOOL)representsDownloadWithIdentifier:(int64_t)a3
{
  v4 = -[NSNumber initWithLongLong:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithLongLong:", a3);
  LOBYTE(self) = -[NSMutableOrderedSet containsObject:]( self->_downloadIdentifiers,  "containsObject:",  v4);

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = -[NSMutableOrderedSet mutableCopyWithZone:](self->_downloadIdentifiers, "mutableCopyWithZone:", a3);
  v5[2] = -[NSString copyWithZone:](self->_downloadKind, "copyWithZone:", a3);
  v5[3] = -[NSString copyWithZone:](self->_downloadTitle, "copyWithZone:", a3);
  return v5;
}

- (id)_notification
{
  return self->_notification;
}

- (void)_setNotification:(id)a3
{
}

- (NSString)downloadKind
{
  return self->_downloadKind;
}

- (void)setDownloadKind:(id)a3
{
}

- (NSString)downloadTitle
{
  return self->_downloadTitle;
}

- (void)setDownloadTitle:(id)a3
{
}

@end