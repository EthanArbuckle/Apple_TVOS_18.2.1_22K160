@interface _NSXPCQueryGenerationToken
+ (BOOL)supportsSecureCoding;
- (_NSXPCQueryGenerationToken)initWithCoder:(id)a3;
@end

@implementation _NSXPCQueryGenerationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSXPCQueryGenerationToken)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS____NSXPCQueryGenerationToken;
  v4 = -[_NSQueryGenerationToken initWithCoder:](&v28, sel_initWithCoder_);
  v5 = v4;
  if (!v4) {
    return v5;
  }
  id generationIdentifier = v4->super._generationIdentifier;
  storeIdentifier = v4->super._storeIdentifier;
  v8 = (void *)[a3 delegate];
  if (![a3 requiresSecureCoding])
  {
    if (!v8) {
      goto LABEL_34;
    }
    goto LABEL_12;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)[a3 userInfo];
    if (v9)
    {
      v10 = v9;
      v9 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v9, "valueForKey:", @"NSConnectionContext"),  "managedObjectContext"),  "persistentStoreCoordinator");
      if (v9) {
        goto LABEL_16;
      }
      v9 = (void *)[v10 valueForKey:@"PSCKey"];
    }
  }

  else
  {
    v9 = 0LL;
  }

  if (!v9 && v8)
  {
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    v9 = (void *)[v8 _persistentStoreCoordinator];
  }

  if (v9)
  {
LABEL_16:
    if (generationIdentifier) {
      BOOL v11 = storeIdentifier == 0LL;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      v12 = (void *)[v9 persistentStores];
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0LL; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqual:", storeIdentifier))
            {
              id v18 = v17;
              if (v18)
              {
                v19 = -[_PFWeakReference initWithObject:]( objc_alloc(&OBJC_CLASS____PFWeakReference),  "initWithObject:",  v18);
                store = v5->super._store;
                if (store != v19)
                {

                  v5->super._store = v19;
                }

                *(_WORD *)&v5->super._flags &= ~8u;
                *(_WORD *)&v5->super._flags |= 4u;
              }

              goto LABEL_33;
            }
          }

          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      id v18 = 0LL;
LABEL_33:
    }
  }

@end