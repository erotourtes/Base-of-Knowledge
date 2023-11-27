---
title: "Redux"
date: 2023-11-22T10:24:00+03:00
draft: true
---

## Functional programming
Pure functional programming is hard

-> input -> ... -> output
Pure functions

## Terminology

### Action (event)
action.type

### Store
#### Reducers (event handler)
- **Pure functions**
- Synchronouse Function
- immutable

#### Dispatch
```js
const dis = useDispatch()
... 
dis({type: "..."})
```


## Redux Toolkit
Simplifies development
Makes immutable strcutres internally (using immer)

### configureStore
```js
export default function () {
  const store = configureStore<StoreState>({
    reducer: {
      entities: entitiesReducer,
      middleware: [...getDefaultMiddleware(), ...],
    },
  });

  return store;
}
```

createAction + createReducer = createSlice

```ts
const tempAction = createAction<{ id: number }>('temp');
tempAction.type

dispatch(tempAction({ id: 1 }));
```

```ts

const taskSlice = createSlice({
  name: 'task',
  initialState: {
    tasks: [] as Task[],
    loading: false,
    error: null as string | null,
  },
  reducers: {
    /**
                      state, action with payload
    */
    getTasksSuccess: (state, { payload }: PayloadAction<Task[]>) => { // takes getTaskSuccess as an action name
      state.tasks = payload;
      state.loading = false;
      state.error = null;
    },
  }
});

export const taskActions = taskSlice.actions;
export default taskSlice;
```

### Selectors
Allows to select a value like `(state) => state.entities.tasks`. Importent note it to use memoization not to rerender several itmes with react `useSelect`

### Middleware

Dispatch(action) =Middleware=> Reducer with action => new state

```ts
const logger = store => next => action => {
  console.log(action);

  next();
};
```

Thunk - middleware which is automatically added with @redux/toolkit
It allows to use functions as an action


## Proper API
Thunk Pattern - allows dispatching functions `dispatch((dispatch, getState) => {...})`
```ts
// api.ts
const apiStart = createAction("apiStart");


// middleware.ts
const apiMiddleware = store => next => action => {
  if (action.type !== actions.apiStart)
  ...
  next(action) // to see in the chrome extension
}


// somewhere.ts
// bad design
dispatch(actions.apiStart({ url, success }));

// better design
const getTasksActionCreator = () => apiStart({ url, success })
dispatch(getTasksActionCreator());

```

```ts
const loadTasks = () => {
  actions.GET_TASKS({
    url: "api/tasks"
    success: actions.TASK_RECEIVED.type
  })
}

store.dispatch(loadTasks());

// another e.x.

const serverAddTask = task => actions.apiCall({
  url, method: "POST", data: task, success: actions.addTask.type
});
```

command(addTask) - what needs to be done
event(taskAdded) - what just happened
