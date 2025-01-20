@interface StoreDownloadQueueRequest
+ (void)initialize;
- (BOOL)cancelsDuplicateDownloads;
- (BOOL)isEqual:(id)a3;
- (NSNumber)accountIdentifier;
- (NSString)queueContentsURLBagKey;
- (NSString)queueCountURLBagKey;
- (NSString)queueIdentifier;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)purchaseIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAccountIdentifier:(id)a3;
- (void)setCancelsDuplicateDownloads:(BOOL)a3;
- (void)setPurchaseIdentifier:(int64_t)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation StoreDownloadQueueRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreDownloadQueueRequest;
  -[StoreDownloadQueueRequest dealloc](&v3, "dealloc");
}

- (NSString)queueContentsURLBagKey
{
  return (NSString *)[(id)qword_1003A32F0 objectForKey:self->_queueIdentifier];
}

- (NSString)queueCountURLBagKey
{
  return (NSString *)[(id)qword_1003A32F8 objectForKey:self->_queueIdentifier];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___StoreDownloadQueueRequest;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@ / %@",  -[StoreDownloadQueueRequest description](&v3, "description"),  self->_queueIdentifier,  self->_accountIdentifier);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_queueIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(a3)
    && (id v6 = -[StoreDownloadQueueRequest purchaseIdentifier](self, "purchaseIdentifier"),
        v6 == [a3 purchaseIdentifier]))
  {
    v7 = -[StoreDownloadQueueRequest accountIdentifier](self, "accountIdentifier");
    if (v7 == [a3 accountIdentifier]
      || (unsigned int v8 = -[NSNumber isEqual:]( -[StoreDownloadQueueRequest accountIdentifier](self, "accountIdentifier"),  "isEqual:",  [a3 accountIdentifier])) != 0)
    {
      v9 = -[StoreDownloadQueueRequest queueIdentifier](self, "queueIdentifier");
      if (v9 == [a3 queueIdentifier]) {
        LOBYTE(v8) = 1;
      }
      else {
        LOBYTE(v8) = -[NSString isEqual:]( -[StoreDownloadQueueRequest queueIdentifier](self, "queueIdentifier"),  "isEqual:",  [a3 queueIdentifier]);
      }
    }
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  *((_BYTE *)v5 + 16) = self->_cancelsDuplicateDownloads;
  v5[3] = self->_purchaseIdentifier;
  v5[4] = -[NSString copyWithZone:](self->_queueIdentifier, "copyWithZone:", a3);
  v5[5] = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___StoreDownloadQueueRequest) == a1)
  {
    qword_1003A32F0 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"pendingApps",  @"apps",  @"pendingBooks",  @"books",  @"pendingSongs",  @"media",  0LL);
    qword_1003A32F8 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  @"checkAppQueue",  @"apps",  @"checkBookQueue",  @"books",  @"check-download-queue",  @"media",  0LL);
  }

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)cancelsDuplicateDownloads
{
  return self->_cancelsDuplicateDownloads;
}

- (void)setCancelsDuplicateDownloads:(BOOL)a3
{
  self->_cancelsDuplicateDownloads = a3;
}

- (int64_t)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void)setPurchaseIdentifier:(int64_t)a3
{
  self->_purchaseIdentifier = a3;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

@end