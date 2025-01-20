@interface SPLoadInfo
- (id)debugDescription;
- (void)dealloc;
@end

@implementation SPLoadInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SPLoadInfo;
  -[SPLoadInfo dealloc](&v3, "dealloc");
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@ @ 0x%llx-0x%llx",  -[SABinary debugDescription](self->_binary, "debugDescription"),  self->_segmentName,  self->_startAddress,  self->_endAddress);
}

@end