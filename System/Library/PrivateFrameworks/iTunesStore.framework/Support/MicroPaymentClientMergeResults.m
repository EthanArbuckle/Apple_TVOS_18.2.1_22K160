@interface MicroPaymentClientMergeResults
- (BOOL)didChange;
- (NSArray)addedPayments;
- (NSArray)changedPayments;
- (NSArray)removedPayments;
- (NSOrderedSet)removedDownloadIDs;
- (void)dealloc;
- (void)setAddedPayments:(id)a3;
- (void)setChangedPayments:(id)a3;
- (void)setRemovedDownloadIDs:(id)a3;
- (void)setRemovedPayments:(id)a3;
@end

@implementation MicroPaymentClientMergeResults

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPaymentClientMergeResults;
  -[MicroPaymentClientMergeResults dealloc](&v3, "dealloc");
}

- (BOOL)didChange
{
  return -[NSArray count](self->_addedPayments, "count")
      || -[NSArray count](self->_changedPayments, "count")
      || -[NSOrderedSet count](self->_removedDownloadIDs, "count")
      || -[NSArray count](self->_removedPayments, "count") != 0;
}

- (NSArray)addedPayments
{
  return self->_addedPayments;
}

- (void)setAddedPayments:(id)a3
{
}

- (NSArray)changedPayments
{
  return self->_changedPayments;
}

- (void)setChangedPayments:(id)a3
{
}

- (NSOrderedSet)removedDownloadIDs
{
  return self->_removedDownloadIDs;
}

- (void)setRemovedDownloadIDs:(id)a3
{
}

- (NSArray)removedPayments
{
  return self->_removedPayments;
}

- (void)setRemovedPayments:(id)a3
{
}

@end