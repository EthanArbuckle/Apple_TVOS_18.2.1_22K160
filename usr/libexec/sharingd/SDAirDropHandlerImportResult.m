@interface SDAirDropHandlerImportResult
- (NSArray)importedFiles;
- (NSURL)openAppURL;
- (void)setImportedFiles:(id)a3;
- (void)setOpenAppURL:(id)a3;
@end

@implementation SDAirDropHandlerImportResult

- (NSArray)importedFiles
{
  return self->_importedFiles;
}

- (void)setImportedFiles:(id)a3
{
}

- (NSURL)openAppURL
{
  return self->_openAppURL;
}

- (void)setOpenAppURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end