@interface NSCloudKitMirroringAcceptShareInvitationsRequest
- (NSCloudKitMirroringAcceptShareInvitationsRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringAcceptShareInvitationsRequest

- (NSCloudKitMirroringAcceptShareInvitationsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsRequest;
  v4 = -[NSCloudKitMirroringRequest initWithOptions:completionBlock:](&v6, sel_initWithOptions_completionBlock_, a3, a4);
  if (v4)
  {
    v4->_shareURLsToAccept = (NSArray *)(id)NSArray_EmptyArray;
    v4->_shareMetadatasToAccept = (NSArray *)(id)NSArray_EmptyArray;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsRequest;
  -[NSCloudKitMirroringRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCloudKitMirroringAcceptShareInvitationsRequest;
  objc_super v3 = (void *)objc_msgSend(-[NSCloudKitMirroringRequest description](&v5, sel_description), "mutableCopy");
  [v3 appendFormat:@"\nshareURLs: %@\nshareMetadatas: %@", self->_shareURLsToAccept, self->_shareMetadatasToAccept];
  return v3;
}

@end