int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;
  v3 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100001960(uint64_t a1)
{
  id v2 = objc_alloc_init(off_1000098D8());
  [*(id *)(a1 + 32) setHomeManager:v2];

  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 homeManager]);
  [v4 setDelegate:v3];

  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 homeManager]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentHome]);
  [v7 setDelegate:v5];

  v8 = *(void **)(a1 + 32);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 currentHome]);
  [v9 setDelegate:v8];
}

LABEL_32:
          goto LABEL_33;
        }
      }

      v10 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WACEAService homeManager](v43, "homeManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 homes]);

  v42 = [v19 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v42)
  {
    v20 = *(void *)v53;
    obj = v19;
    v41 = *(void *)v53;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v19);
        }
        v44 = v21;
        v22 = *(void **)(*((void *)&v52 + 1) + 8 * v21);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accessories", v41));
        v24 = [v23 countByEnumeratingWithState:&v48 objects:v63 count:16];
        if (v24)
        {
          v25 = v24;
          v26 = *(void *)v49;
          while (2)
          {
            for (j = 0LL; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v49 != v26) {
                objc_enumerationMutation(v23);
              }
              v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 stringByReplacingOccurrencesOfString:@":" withString:&stru_1000041D0]);
              v30 = (void *)objc_claimAutoreleasedReturnValue([v47 uppercaseString]);
              v31 = [v29 isEqualToString:v30];

              if (v31)
              {
                v32 = v45;
                (*((void (**)(id, uint64_t, void))v45 + 2))(v45, 2LL, 0LL);

                goto LABEL_32;
              }
            }

            v25 = [v23 countByEnumeratingWithState:&v48 objects:v63 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        v21 = v44 + 1;
        v19 = obj;
        v20 = v41;
      }

      while ((id)(v44 + 1) != v42);
      v42 = [obj countByEnumeratingWithState:&v52 objects:v64 count:16];
    }

    while (v42);
  }

  v32 = v45;
  (*((void (**)(id, uint64_t, void))v45 + 2))(v45, 3LL, 0LL);
LABEL_33:
}

uint64_t sub_100001EF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100001F14(uint64_t a1)
{
  do
    id result = [*(id *)(a1 + 32) accessoryReprovisionState];
  while (result);
  return result;
}

Class sub_10000218C()
{
  if (qword_100009A78 != -1) {
    dispatch_once(&qword_100009A78, &stru_100004190);
  }
  Class result = objc_getClass("HMHomeManager");
  qword_100009A68 = (uint64_t)result;
  off_1000098D8 = (uint64_t (*)())sub_100002220;
  return result;
}

void sub_1000021E8(id a1)
{
  qword_100009A70 = (uint64_t)dlopen("/System/Library/Framework/HomeKit.framework/HomeKit", 2);
  if (!qword_100009A70) {
    NSLog(@"### Failed to Soft Linked: /System/Library/Framework/HomeKit.framework/HomeKit");
  }
}

id sub_100002220()
{
  return (id)qword_100009A68;
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}
oreleasedReturnValue([v3 currentHome]);
  [v2 startSearchForAccessoriesNeedingReprovisioning];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHome]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHome]);
    -[WACEAService setCurrentHome:](self, "setCurrentHome:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHome]);
    NSLog(@"### WAC XPC: Current Home: %@", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WACEAService currentHome](self, "currentHome"));
    [v8 setDelegate:self];

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[WACEAService homeManager](self, "homeManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 primaryHome]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessories]);

    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setDelegate:self];
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v13);
    }
  }
}

- (void)home:(id)a3 didUpdateReprovisionStateForAccessory:(id)a4
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHome)currentHome
{
  return self->_currentHome;
}

- (void)setCurrentHome:(id)a3
{
}

- (void).cxx_destruct
{
}

@end