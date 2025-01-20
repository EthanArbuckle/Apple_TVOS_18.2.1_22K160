@interface MBDSMSToSuper_REF_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MBDSMSToSuper_REF_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v10 = a4;
  v12 = MBDIMCopyNormalizedAttributes(a8, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", @"src"));
  -[MBDSMSToSuper_Default_Frame _addAttachmentPartWithSource:toContext:]( self,  "_addAttachmentPartWithSource:toContext:",  v11,  v10);
}

@end