@interface MSDStoreHourRecord
- (NSDate)closedDate;
- (NSDate)openDate;
- (NSDate)revertDate;
- (void)setClosedDate:(id)a3;
- (void)setOpenDate:(id)a3;
- (void)setRevertDate:(id)a3;
@end

@implementation MSDStoreHourRecord

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
}

- (NSDate)closedDate
{
  return self->_closedDate;
}

- (void)setClosedDate:(id)a3
{
}

- (NSDate)revertDate
{
  return self->_revertDate;
}

- (void)setRevertDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end