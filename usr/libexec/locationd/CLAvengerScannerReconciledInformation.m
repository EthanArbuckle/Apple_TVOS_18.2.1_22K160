@interface CLAvengerScannerReconciledInformation
- (CLAvengerScannerReconciledInformation)initWithNonOwnerInformation:(id)a3;
- (CLAvengerScannerReconciledInformation)initWithOwnerInformation:(id)a3 matchedIndex:(unsigned int)a4 sequence:(unsigned __int8)a5 error:(unsigned __int8)a6;
- (NSUUID)uuid;
- (id)description;
- (id)initUnknown;
- (unint64_t)type;
- (unsigned)error;
- (unsigned)matchedIndex;
- (unsigned)sequence;
- (void)dealloc;
@end

@implementation CLAvengerScannerReconciledInformation

- (CLAvengerScannerReconciledInformation)initWithOwnerInformation:(id)a3 matchedIndex:(unsigned int)a4 sequence:(unsigned __int8)a5 error:(unsigned __int8)a6
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CLAvengerScannerReconciledInformation;
  v10 = -[CLAvengerScannerReconciledInformation init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_type = 1LL;
    v10->_uuid = (NSUUID *)[a3 copy];
    v11->_matchedIndex = a4;
    v11->_sequence = a5;
    v11->_error = a6;
  }

  return v11;
}

- (CLAvengerScannerReconciledInformation)initWithNonOwnerInformation:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLAvengerScannerReconciledInformation;
  v4 = -[CLAvengerScannerReconciledInformation init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_type = 2LL;
    v4->_uuid = (NSUUID *)[a3 copy];
  }

  return v5;
}

- (id)initUnknown
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScannerReconciledInformation;
  id result = -[CLAvengerScannerReconciledInformation init](&v3, "init");
  if (result) {
    *((void *)result + 2) = 0LL;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{'type':%lu, 'uuid':'%s', 'matchedIndex':%u, 'sequence':%u, 'error':%u}",  self->_type,  -[NSString UTF8String](-[NSUUID UUIDString](self->_uuid, "UUIDString"), "UTF8String"),  self->_matchedIndex,  self->_sequence,  self->_error);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAvengerScannerReconciledInformation;
  -[CLAvengerScannerReconciledInformation dealloc](&v3, "dealloc");
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unsigned)matchedIndex
{
  return self->_matchedIndex;
}

- (unsigned)sequence
{
  return self->_sequence;
}

- (unsigned)error
{
  return self->_error;
}

@end