@interface IXPromisedOutOfBandStreamingZipTransferSeed
+ (BOOL)supportsSecureCoding;
- (IXPromisedOutOfBandStreamingZipTransferSeed)initWithCoder:(id)a3;
- (NSDictionary)szOptions;
- (NSURL)extractionPath;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)archiveBytesConsumed;
- (unint64_t)archiveSizeBytes;
- (void)encodeWithCoder:(id)a3;
- (void)setArchiveBytesConsumed:(unint64_t)a3;
- (void)setArchiveSizeBytes:(unint64_t)a3;
- (void)setExtractionPath:(id)a3;
- (void)setSzOptions:(id)a3;
@end

@implementation IXPromisedOutOfBandStreamingZipTransferSeed

- (IXPromisedOutOfBandStreamingZipTransferSeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IXPromisedOutOfBandStreamingZipTransferSeed;
  v5 = -[IXOpaqueDataPromiseSeed initWithCoder:](&v16, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"archiveBytesConsumed"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_archiveBytesConsumed = (unint64_t)[v7 unsignedLongLongValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"archiveSizeBytes"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_archiveSizeBytes = (unint64_t)[v9 unsignedLongLongValue];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"extractionPath"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    extractionPath = v5->_extractionPath;
    v5->_extractionPath = (NSURL *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 decodePropertyListForKey:@"szOptions"]);
    szOptions = v5->_szOptions;
    v5->_szOptions = (NSDictionary *)v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IXPromisedOutOfBandStreamingZipTransferSeed;
  id v4 = a3;
  -[IXOpaqueDataPromiseSeed encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXPromisedOutOfBandStreamingZipTransferSeed archiveBytesConsumed]( self,  "archiveBytesConsumed",  v9.receiver,  v9.super_class)));
  [v4 encodeObject:v5 forKey:@"archiveBytesConsumed"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXPromisedOutOfBandStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes")));
  [v4 encodeObject:v6 forKey:@"archiveSizeBytes"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedOutOfBandStreamingZipTransferSeed extractionPath](self, "extractionPath"));
  [v4 encodeObject:v7 forKey:@"extractionPath"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedOutOfBandStreamingZipTransferSeed szOptions](self, "szOptions"));
  [v4 encodeObject:v8 forKey:@"szOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IXPromisedOutOfBandStreamingZipTransferSeed;
  id v4 = -[IXOpaqueDataPromiseSeed copyWithZone:](&v8, "copyWithZone:", a3);
  objc_msgSend( v4,  "setArchiveBytesConsumed:",  -[IXPromisedOutOfBandStreamingZipTransferSeed archiveBytesConsumed](self, "archiveBytesConsumed"));
  objc_msgSend( v4,  "setArchiveSizeBytes:",  -[IXPromisedOutOfBandStreamingZipTransferSeed archiveSizeBytes](self, "archiveSizeBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedOutOfBandStreamingZipTransferSeed extractionPath](self, "extractionPath"));
  [v4 setExtractionPath:v5];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXPromisedOutOfBandStreamingZipTransferSeed szOptions](self, "szOptions"));
  [v4 setSzOptions:v6];

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

- (NSURL)extractionPath
{
  return self->_extractionPath;
}

- (void)setExtractionPath:(id)a3
{
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