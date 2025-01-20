@interface IXPromisedStreamingZipTransferSeed
+ (BOOL)supportsSecureCoding;
- (IXPromisedStreamingZipTransferSeed)initWithCoder:(id)a3;
- (NSDictionary)szOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)archiveBytesConsumed;
- (unint64_t)archiveSizeBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveBytesConsumed:(unint64_t)a3;
- (void)setArchiveSizeBytes:(unint64_t)a3;
- (void)setSzOptions:(id)a3;
@end

@implementation IXPromisedStreamingZipTransferSeed

- (IXPromisedStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IXPromisedStreamingZipTransferSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v13, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"archiveBytesConsumed"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_archiveBytesConsumed = (unint64_t)[v7 unsignedLongLongValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"archiveSizeBytes"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_archiveSizeBytes = (unint64_t)[v9 unsignedLongLongValue];

    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"szOptions"]);
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXPromisedStreamingZipTransferSeed;
  id v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v8, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed]( self,  "archiveBytesConsumed",  v8.receiver,  v8.super_class)));
  [v4 encodeObject:v5 forKey:@"archiveBytesConsumed"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes")));
  [v4 encodeObject:v6 forKey:@"archiveSizeBytes"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedStreamingZipTransferSeed szOptions](self, "szOptions"));
  [v4 encodeObject:v7 forKey:@"szOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXPromisedStreamingZipTransferSeed;
  id v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v7, "copyWithZone:", a3);
  objc_msgSend( v4,  "setArchiveBytesConsumed:",  -[IXPromisedStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend( v4,  "setArchiveSizeBytes:",  -[IXPromisedStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedStreamingZipTransferSeed szOptions](self, "szOptions"));
  [v4 setSzOptions:v5];

  return v4;
}

- (unint64_t)archiveBytesConsumed
{
  return self->_archiveBytesConsumed;
}

- (void)setArchiveBytesConsumed:(unint64_t)a3
{
  self->_archiveBytesConsumed = a3;
}

- (unint64_t)archiveSizeBytes
{
  return self->_archiveSizeBytes;
}

- (void)setArchiveSizeBytes:(unint64_t)a3
{
  self->_archiveSizeBytes = a3;
}

- (NSDictionary)szOptions
{
  return self->_szOptions;
}

- (void)setSzOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end