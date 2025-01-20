@interface NSSetupLibXML
@end

@implementation NSSetupLibXML

void ___NSSetupLibXML_block_invoke()
{
  __originalLoader = (uint64_t (*)(void, void, void))xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)_xmlExternalEntityLoader);
}

@end