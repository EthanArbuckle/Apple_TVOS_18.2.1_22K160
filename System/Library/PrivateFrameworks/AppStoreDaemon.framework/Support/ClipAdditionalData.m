@interface ClipAdditionalData
- (id)description;
@end

@implementation ClipAdditionalData

- (id)description
{
  archiveSize = self->_archiveSize;
  digestChunk = self->_digestChunk;
  if (!archiveSize) {
    archiveSize = (NSNumber *)@"<null>";
  }
  v19[0] = @"archiveSize";
  v19[1] = @"uncompressedSize";
  uncompressedSize = self->_uncompressedSize;
  if (!uncompressedSize) {
    uncompressedSize = (NSNumber *)@"<null>";
  }
  v20[0] = archiveSize;
  v20[1] = uncompressedSize;
  v19[2] = @"digest";
  if (digestChunk) {
    v6 = (const __CFString *)digestChunk;
  }
  else {
    v6 = @"<null>";
  }
  v17[0] = @"chunk";
  v17[1] = @"hashes";
  digestHashes = self->_digestHashes;
  if (!digestHashes) {
    digestHashes = (NSArray *)@"<null>";
  }
  v18[0] = v6;
  v18[1] = digestHashes;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  v19[3] = @"sinfs";
  v20[2] = v8;
  v15[0] = @"sinf";
  v15[1] = @"dpinfo";
  sinf = self->_sinf;
  if (!sinf) {
    sinf = (NSData *)@"<null>";
  }
  dpInfo = self->_dpInfo;
  if (!dpInfo) {
    dpInfo = (NSData *)@"<null>";
  }
  v16[0] = sinf;
  v16[1] = dpInfo;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);

  return v13;
}

- (void).cxx_destruct
{
}

@end