@interface CPLCKPhotosSharedLibraryExitResponse
- (CKRecordZoneID)stagingZoneID;
- (CPLCKPhotosSharedLibraryExitResponse)init;
- (NSError)error;
- (NSString)participantUserID;
- (void)setError:(id)a3;
- (void)setParticipantUserID:(id)a3;
- (void)setStagingZoneID:(id)a3;
@end

@implementation CPLCKPhotosSharedLibraryExitResponse

- (NSString)participantUserID
{
  return (NSString *)sub_100116118( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_participantUserID);
}

- (void)setParticipantUserID:(id)a3
{
}

- (CKRecordZoneID)stagingZoneID
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_stagingZoneID);
  swift_beginAccess((char *)self + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_stagingZoneID, v4, 0LL, 0LL);
  return (CKRecordZoneID *)*v2;
}

- (void)setStagingZoneID:(id)a3
{
}

- (NSError)error
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error);
  swift_beginAccess((char *)self + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error, v6, 0LL, 0LL);
  uint64_t v3 = *v2;
  if (!v3) {
    return (NSError *)0LL;
  }
  swift_errorRetain(v3);
  v4 = (void *)_convertErrorToNSError(_:)(v3);
  swift_errorRelease(v3);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error);
  swift_beginAccess((char *)self + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error, v7, 1LL, 0LL);
  id v5 = *v4;
  id *v4 = a3;
  id v6 = a3;
  swift_errorRelease(v5);
}

- (CPLCKPhotosSharedLibraryExitResponse)init
{
  result = (CPLCKPhotosSharedLibraryExitResponse *)_swift_stdlib_reportUnimplementedInitializer( "CloudKitImplementation.CPLCKPhotosSharedLibraryExitResponse",  59LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_errorRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CPLCKPhotosSharedLibraryExitResponse_error));
}

@end