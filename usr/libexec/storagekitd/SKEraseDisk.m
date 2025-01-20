@interface SKEraseDisk
- (id)createStateMachineWithError:(id *)a3;
@end

@implementation SKEraseDisk

- (id)createStateMachineWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk disk](self, "disk"));

  if (v5) {
    goto LABEL_3;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk diskRepresentation](self, "diskRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 knownDiskForDictionary:v7]);
  -[SKEraseDisk setDisk:](self, "setDisk:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk disk](self, "disk"));
  if (v9)
  {
LABEL_3:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk validateWithError:](self, "validateWithError:", a3));

    if (v10)
    {
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk descriptors](self, "descriptors"));
      id v12 = [v11 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v50;
        while (2)
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v50 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 filesystem]);
            v18 = (void *)objc_claimAutoreleasedReturnValue([v16 name]);
            unsigned int v19 = [v17 isValidName:v18 error:a3];

            if (!v19)
            {

              goto LABEL_14;
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_10000B238;
      v47[3] = &unk_100044C40;
      v47[4] = self;
      v48 = @"done";
      v40 = objc_retainBlock(v47);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10000B4F4;
      v45[3] = &unk_100044C40;
      v45[4] = self;
      v46 = @"done";
      v39 = objc_retainBlock(v45);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10000B88C;
      v43[3] = &unk_100044C40;
      v43[4] = self;
      v44 = @"done";
      v38 = objc_retainBlock(v43);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10000BAA8;
      v41[3] = &unk_100044C40;
      v41[4] = self;
      v42 = @"done";
      v20 = objc_retainBlock(v41);
      v21 = sub_10000C9EC( (uint64_t)@"begin",  (uint64_t)@"begin",  (uint64_t)v40,  (uint64_t)@"repartitioned");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v53[0] = v22;
      v23 = sub_10000C9EC( (uint64_t)@"repartitioned",  (uint64_t)@"done",  (uint64_t)v39,  (uint64_t)@"newfsed");
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v53[1] = v24;
      v25 = sub_10000C9EC((uint64_t)@"newfsed", (uint64_t)@"done", (uint64_t)v38, (uint64_t)@"reprobed");
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v53[2] = v26;
      v27 = v20;
      v28 = sub_10000C9EC( (uint64_t)@"reprobed",  (uint64_t)@"done",  (uint64_t)v20,  (uint64_t)@"unmountedState");
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v53[3] = v29;
      id v30 = sub_10000CA3C((uint64_t)@"unmountedState", (uint64_t)@"done");
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v53[4] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v53, 5LL));
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateTransitionTable tableWithTransitionEntries:]( &OBJC_CLASS___SKStateTransitionTable,  "tableWithTransitionEntries:",  v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[SKStateMachine machineWithStateTransitionTable:startState:startEvent:]( &OBJC_CLASS___SKStateMachine,  "machineWithStateTransitionTable:startState:startEvent:",  v33,  @"begin",  @"begin"));
    }

    else
    {
LABEL_14:
      v34 = 0LL;
    }
  }

  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKEraseDisk diskRepresentation](self, "diskRepresentation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 117LL, v36));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v37, a3));
  }

  return v34;
}

@end