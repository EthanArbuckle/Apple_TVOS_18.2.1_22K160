@interface NSPersonNameComponentsStyleFormatter
@end

@implementation NSPersonNameComponentsStyleFormatter

uint64_t __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke( uint64_t a1,  uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "keysOfInterest"), "containsObject:", a2);
}

id __62___NSPersonNameComponentsStyleFormatter_orderedKeysOfInterest__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result = (id)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "orderedTemplate"),  "objectAtIndexedSubscript:",  a2),  "mutableCopy");
  if (result)
  {
    id v4 = result;
    if (*(_BYTE *)(a1 + 48)) {
      [result insertString:@"phoneticRepresentation." atIndex:0];
    }
    return (id)[*(id *)(a1 + 40) addObject:v4];
  }

  return result;
}

uint64_t __76___NSPersonNameComponentsStyleFormatter__orderedNonEmptyKeysFromComponents___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForKeyPath:a2];
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", a2), "length") != 0;
  }
  return result;
}

uint64_t __102___NSPersonNameComponentsStyleFormatter__formattedStringFromOrderedKeys_components_attributesByRange___block_invoke( uint64_t a1,  void *a2,  char *a3)
{
  id v4 = a2;
  id v6 = (id)[*(id *)(a1 + 32) valueForKeyPath:a2];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic")
    && [v4 hasPrefix:@"phoneticRepresentation."])
  {
    id v4 = (void *)objc_msgSend(v4, "substringFromIndex:", objc_msgSend(@"phoneticRepresentation.", "length"));
  }

  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "abbreviatedKeys"), "containsObject:", v4)) {
    id v6 = +[NSPersonNameComponentsFormatter __initialsForString:]( &OBJC_CLASS___NSPersonNameComponentsFormatter,  "__initialsForString:",  v6);
  }
  if (a3)
  {
    v7 = (void *)objc_msgSend( *(id *)(a1 + 32),  "valueForKeyPath:",  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a3 - 1));
    if ([v7 length]) {
      a3 = (char *)objc_msgSend( *(id *)(a1 + 40),  "_delimiterBetweenString:andString:isPhonetic:",  v7,  v6,  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "masterFormatter"), "isPhonetic"));
    }
    else {
      a3 = 0LL;
    }
  }

  uint64_t result = [v6 length];
  if (result)
  {
    v9 = +[NSValue valueWithRange:]( NSValue,  "valueWithRange:",  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length],  objc_msgSend(a3, "length"));
    v10 = (void *)[*(id *)(a1 + 56) objectForKey:v9];
    if (!v10)
    {
      v10 = (void *)[MEMORY[0x189603FC8] dictionary];
      [*(id *)(a1 + 56) setObject:v10 forKey:v9];
    }

    [v10 setObject:@"delimiter" forKey:@"NSPersonNameComponentKey"];
    if (a3) {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) appendString:a3];
    }
    if (*(void *)(a1 + 56))
    {
      v11 = +[NSValue valueWithRange:]( NSValue,  "valueWithRange:",  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length],  objc_msgSend(v6, "length"));
      v12 = (void *)[*(id *)(a1 + 56) objectForKey:v11];
      if (!v12)
      {
        v12 = (void *)[MEMORY[0x189603FC8] dictionary];
        [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v11];
      }

      [v12 setObject:v4 forKeyedSubscript:@"NSPersonNameComponentKey"];
    }

    return [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) appendString:v6];
  }

  return result;
}

uint64_t __81___NSPersonNameComponentsStyleFormatter_annotatedStringFromPersonNameComponents___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v5 = [a2 rangeValue];
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a3, v5, v6);
}

@end